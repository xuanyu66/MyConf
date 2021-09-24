
set shiftwidth=4
set nocompatible        " 不要vim模仿vi模式，建议设置，否则会有很多不兼容的问题
set softtabstop=4
set tabstop=4
set expandtab
set autoindent
set tw =100 ts=4 sts=4 sw=4 ai " set tabwidth, tabstop, softtabstop, shfitwidth, autoindent
set enc=utf8 fenc=utf8 ff=unix " set encoding, fileencoding, fileformat
set fencs=utf8,cp936,cp18030,big5,latin1
set clipboard=unnamed

set ls=2 " set lastline=2  show statusline
set hls " set highlightsearch
set t_Co=256 " export TERM=xterm-256color before
set et
highlight cursorline ctermbg=gray ctermfg=white

set nu rnu " set number  and relativenumber on
"set listchars=tab:>-,trail:-,eol:$,extends:>,precedes:<,nbsp:. " set list chars
"set list

syntax enable
syntax on         " 开启语法高亮
" "colorscheme solarized
"set bg=dark
" " change hilight search color
hi Search cterm=NONE ctermfg=grey ctermbg=blue

set incsearch         " 在输入要搜索的文字时，实时匹配
set hlsearch          " 对被搜索的表达式显示高亮

if has('python3')
    silent! python3 1
endif

let g:airline_theme='one'
colorscheme one
set background=dark " for the dark version
" set background=light " for the light version
"--------------------------------------------------------------------------
"" tmux configs 
"--------------------------------------------------------------------------
" change cursor shape in tmux
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" display background color in tmux
if exists('$TMUX')
    set term=screen-256color
endif

"--------------------------------------------------------------------------
""  Vundle Plugin Manager
"   1、git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"   "   2、copy config from ~/.vim/bundle/Vundle.vim/README.md
"   "   3、open a empty file with vim
"   "   4、run :BundleClean
"   "   5、run :BundleInstall
"   "   6、run :BundleUpdate
"   "   7、run :PluginInstall
"   "   8、run :GoInstallBinaries
"   "--------------------------------------------------------------------------

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
    Plugin 'scrooloose/nerdtree'
    Plugin 'gmarik/Vundle.vim'
    Plugin 'itchyny/lightline.vim'
    Plugin 'Tagbar'
    Plugin 'rakr/vim-one'
    Plugin 'dense-analysis/ale'

    Plugin 'Lokaltog/vim-powerline'
    let g:Powerline_symbols = 'fancy'
    set encoding=utf-8 
    set laststatus=2

call vundle#end()            " required

filetype plugin indent on    " required

"--------------------------------------------------------------------------
""  NERDTree
"--------------------------------------------------------------------------
""""将F2设置为开关NERDTree的快捷键
map <F2> :NERDTreeToggle<cr>
" 修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
" 窗口位置
let g:NERDTreeWinPos='left'
" 窗口尺寸
let g:NERDTreeSize=30
" 窗口宽度
let NERDTreeWinSize=30
" 不显示隐藏文件
let g:NERDTreeHidden=0
" 打开vim时如果没有文件自动打开NERDTree
"autocmd vimenter * if !argc()|NERDTree|endif
" 当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 打开vim时自动打开NERDTree
"autocmd vimenter * NERDTree</cr></F2>
" 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']

let NERDTreeHighlightCursorline = 1       " 高亮当前行
let g:solarized_visibility = "high"   " 使用 :set list 显示特殊字符时的高亮级别

"--------------------------------------------------------------------------
""  Tagbar
"--------------------------------------------------------------------------
""文件侦查启动,用以检测文件的后缀
filetype on
"打开文件自动 打开tagbar
""autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.go call tagbar#autoopen()
"映射tagbar的快捷键
map <F3> :Tagbar<CR>
""设置tagbar的窗口宽度
let g:tagbar_width=30
"设置tagbar的窗口显示的位置,为左边
"let g:tagbar_left=1
""关闭排序,即按标签本身在文件中的位置排序
let g:tagbar_sort = 0
"开启自动预览(随着光标在标签上的移动，顶部会出现一个实时的预览窗口)
"let g:tagbar_autopreview = 0
