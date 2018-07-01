From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Jul 2018 10:59:20 +0200
Subject: [Buildroot] [PATCH] vim: bump version to v8.1.0133
In-Reply-To: <1530434386-12447-1-git-send-email-leon.anavi@konsulko.com>
References: <1530434386-12447-1-git-send-email-leon.anavi@konsulko.com>
Message-ID: <20180701085920.GD2381@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-07-01 11:39 +0300, Leon Anavi spake thusly:
> A few new features have been add and a lot of bugs have been fixed in
> minor release Vim 8.1.
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  package/vim/vim.hash | 2 +-
>  package/vim/vim.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/vim/vim.hash b/package/vim/vim.hash
> index 28c6b97..bfbd55d 100644
> --- a/package/vim/vim.hash
> +++ b/package/vim/vim.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 6fbe0ec1228f951ba598b48ac8033f41ca4934cc34689a6008685e7c26477ae2  vim-v8.0.0329.tar.gz
> +sha256 a6dab137949097fbe0b67aafedf4c24a3b0d9c41716db35f5beb4834924d7b00  vim-v8.1.0133.tar.gz
> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
> index 5ee8898..706e09e 100644
> --- a/package/vim/vim.mk
> +++ b/package/vim/vim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -VIM_VERSION = v8.0.0329
> +VIM_VERSION = v8.1.0133
>  VIM_SITE = $(call github,vim,vim,$(VIM_VERSION))
>  # Win over busybox vi since vim is more feature-rich
>  VIM_DEPENDENCIES = \
> @@ -14,6 +14,7 @@ VIM_SUBDIR = src
>  VIM_CONF_ENV = \
>  	vim_cv_toupper_broken=no \
>  	vim_cv_terminfo=yes \
> +        vim_cv_tgetent=zero \

Use a TAB for indentation here.

Regards,
Yann E. MORIN.

>  	vim_cv_tty_group=world \
>  	vim_cv_tty_mode=0620 \
>  	vim_cv_getcwd_broken=no \
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
