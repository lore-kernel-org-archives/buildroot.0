From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Oct 2012 23:26:49 +0200
Subject: [Buildroot] [PATCH 04/10] util-linux: only needs gettext if
	locale is selected
In-Reply-To: <20121014211009.17845.14535.stgit@localhost>
References: <20121014210734.17845.64519.stgit@localhost>
 <20121014211009.17845.14535.stgit@localhost>
Message-ID: <201210142326.49586.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Sunday 14 October 2012 Arnout Vandecappelle (Essensium/Mind) wrote:
> Also add missing select in Config.in.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  package/util-linux/Config.in     |    1 +
>  package/util-linux/util-linux.mk |    2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> index 43a8444..88d08e7 100644
> --- a/package/util-linux/Config.in
> +++ b/package/util-linux/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_UTIL_LINUX
>  	bool "util-linux"
>  	depends on BR2_LARGEFILE
>  	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
>  	help
>  	  Various useful/essential Linux utilities.
>  
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 71a6c53..a6abbf5 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -29,7 +29,7 @@ else
>  UTIL_LINUX_CONF_OPT += --without-ncurses
>  endif
>  
> -ifeq ($(BR2_PACKAGE_GETTEXT),y)
> +ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
>  UTIL_LINUX_DEPENDENCIES += gettext
>  UTIL_LINUX_MAKE_OPT += LIBS=-lintl
>  endif
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
