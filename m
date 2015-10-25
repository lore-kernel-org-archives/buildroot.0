From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 17:45:30 +0100
Subject: [Buildroot] [PATCH v5 30/36] package/efl/libefreet: remove
 package
In-Reply-To: <1445720476-21517-31-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-31-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151025164530.GB11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-24 23:01 +0200, Romain Naour spake thusly:
> Libefreet is now available in efl package.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Still the same comment as for previous removals. ;-)

Regards,
Yann E. MORIN.

> ---
> v5: remove libefreet directory
> v4: update Config.in to use libefl
> v3: update legacy option for 2015.11
>     update help text
> ---
>  Config.in.legacy                   |  7 +++++++
>  package/efl/Config.in              |  1 -
>  package/efl/libefreet/Config.in    | 10 ----------
>  package/efl/libefreet/libefreet.mk | 17 -----------------
>  4 files changed, 7 insertions(+), 28 deletions(-)
>  delete mode 100644 package/efl/libefreet/Config.in
>  delete mode 100644 package/efl/libefreet/libefreet.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index feda47b..e8b6579 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -107,6 +107,13 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2015.11"
>  
> +config BR2_PACKAGE_LIBEFREET
> +	bool "libefreet package has been removed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_EFL
> +	help
> +	  The libefreet package has been removed with the efl bump to 1.15.
> +
>  config BR2_PACKAGE_LIBEIO
>  	bool "libeio package has been removed"
>  	select BR2_LEGACY
> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index 9d258eb..ba71705 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -18,7 +18,6 @@ source "package/efl/libeina/Config.in"
>  source "package/efl/libecore/Config.in"
>  source "package/efl/libeet/Config.in"
>  source "package/efl/libefl/Config.in"
> -source "package/efl/libefreet/Config.in"
>  source "package/efl/libevas/Config.in"
>  source "package/efl/libelementary/Config.in"
>  source "package/efl/libedbus/Config.in"
> diff --git a/package/efl/libefreet/Config.in b/package/efl/libefreet/Config.in
> deleted file mode 100644
> index 8687db4..0000000
> --- a/package/efl/libefreet/Config.in
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -config BR2_PACKAGE_LIBEFREET
> -	bool "libefreet"
> -	select BR2_PACKAGE_LIBEINA
> -	select BR2_PACKAGE_LIBEET
> -	select BR2_PACKAGE_LIBECORE
> -	help
> -	  Efreet is a library designed to help apps work with several of the
> -	  Freedesktop.org standards regarding Icons, Desktop files and Menus.
> -
> -	  http://trac.enlightenment.org/e/wiki/Efreet
> diff --git a/package/efl/libefreet/libefreet.mk b/package/efl/libefreet/libefreet.mk
> deleted file mode 100644
> index 65dbd12..0000000
> --- a/package/efl/libefreet/libefreet.mk
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -################################################################################
> -#
> -# libefreet
> -#
> -################################################################################
> -
> -LIBEFREET_VERSION = 1.7.10
> -LIBEFREET_SOURCE = efreet-$(LIBEFREET_VERSION).tar.bz2
> -LIBEFREET_SITE = http://download.enlightenment.org/releases
> -LIBEFREET_LICENSE = BSD-2c
> -LIBEFREET_LICENSE_FILES = COPYING
> -
> -LIBEFREET_INSTALL_STAGING = YES
> -
> -LIBEFREET_DEPENDENCIES = libeina libeet libecore
> -
> -$(eval $(autotools-package))
> -- 
> 2.4.3
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
