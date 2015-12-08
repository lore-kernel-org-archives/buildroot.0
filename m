From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Dec 2015 12:18:31 +0100
Subject: [Buildroot] [PATCH v7 23/33] package/efl/libethumb: remove
 package
In-Reply-To: <1449523775-6582-24-git-send-email-romain.naour@openwide.fr>
References: <1449523775-6582-1-git-send-email-romain.naour@openwide.fr>
 <1449523775-6582-24-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151208111831.GJ4188@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-12-07 22:29 +0100, Romain Naour spake thusly:
> Libethumb is now available in efl package.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> v6: Improve lecacy help text (Yann E.Morin)
> v4: remove libethumb from package/efl/
> v3: update legacy option for 2015.11
>     update help text
> ---
>  Config.in.legacy                   |  7 +++++++
>  package/efl/Config.in              |  1 -
>  package/efl/libethumb/Config.in    | 15 ---------------
>  package/efl/libethumb/libethumb.mk | 27 ---------------------------

You forgot to remove the patch that was added by Peter in a36d751 after
you initially did your series, and after I provided my review.

Remove the patch, and my review stands. ;-)

Regards,
Yann E. MORIN.

>  4 files changed, 7 insertions(+), 43 deletions(-)
>  delete mode 100644 package/efl/libethumb/Config.in
>  delete mode 100644 package/efl/libethumb/libethumb.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 2bbf2ed..92dc3ac 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -107,6 +107,13 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2016.02"
>  
> +config BR2_PACKAGE_LIBETHUMB
> +	bool "libethumb package has been removed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_EFL
> +	help
> +	  With EFL 1.15, libethumb is now provided by the libefl package.
> +
>  config BR2_PACKAGE_INFOZIP
>  	bool "infozip option has been renamed to zip"
>  	select BR2_LEGACY
> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index 1c6f9e5..ff8ba83 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -24,7 +24,6 @@ source "package/efl/libeio/Config.in"
>  source "package/efl/libevas/Config.in"
>  source "package/efl/libembryo/Config.in"
>  source "package/efl/libedje/Config.in"
> -source "package/efl/libethumb/Config.in"
>  source "package/efl/libelementary/Config.in"
>  source "package/efl/libedbus/Config.in"
>  
> diff --git a/package/efl/libethumb/Config.in b/package/efl/libethumb/Config.in
> deleted file mode 100644
> index 3e9cbde..0000000
> --- a/package/efl/libethumb/Config.in
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -comment "libethumb needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> -
> -config BR2_PACKAGE_LIBETHUMB
> -	bool "libethumb"
> -	select BR2_PACKAGE_LIBEINA
> -	select BR2_PACKAGE_LIBEVAS
> -	select BR2_PACKAGE_LIBECORE
> -	select BR2_PACKAGE_LIBECORE_EVAS
> -	select BR2_PACKAGE_LIBEDJE
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
> -	help
> -	  Ethumb is a library for generating thumbnail images of documents.
> -
> -	  http://trac.enlightenment.org/e/wiki/Ethumb
> diff --git a/package/efl/libethumb/libethumb.mk b/package/efl/libethumb/libethumb.mk
> deleted file mode 100644
> index 314ddf9..0000000
> --- a/package/efl/libethumb/libethumb.mk
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -################################################################################
> -#
> -# libethumb
> -#
> -################################################################################
> -
> -LIBETHUMB_VERSION = 1.7.10
> -LIBETHUMB_SOURCE = ethumb-$(LIBETHUMB_VERSION).tar.bz2
> -LIBETHUMB_SITE = http://download.enlightenment.org/releases
> -LIBETHUMB_LICENSE = LGPLv2.1+
> -LIBETHUMB_LICENSE_FILES = COPYING
> -
> -LIBETHUMB_INSTALL_STAGING = YES
> -
> -LIBETHUMB_DEPENDENCIES = libeina libevas libecore libedje host-libedje
> -
> -LIBETHUMB_CONF_OPTS = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc
> -
> -ifeq ($(BR2_PACKAGE_LIBEXIF),y)
> -LIBETHUMB_DEPENDENCIES += libexif
> -endif
> -
> -ifeq ($(BR2_PACKAGE_LIBEDBUS),y)
> -LIBETHUMB_DEPENDENCIES += libedbus
> -endif
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
