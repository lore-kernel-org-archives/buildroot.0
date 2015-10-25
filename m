From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 17:56:27 +0100
Subject: [Buildroot] [PATCH v5 35/36] package/efl/libeina: remove package
In-Reply-To: <1445720476-21517-36-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-36-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151025165627.GG11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-24 23:01 +0200, Romain Naour spake thusly:
> Libeina is now available in efl package.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Oh... Comment...

/me is feeling like a grumpy old chap, always rehashing the same litany
again and again...

Regards,
Yann E. MORIN.

> ---
> v5: remove libeina directory
> v4: update Config.in to use libefl
> v3: update legacy option for 2015.11
>     update help text
> ---
>  Config.in.legacy               |  7 +++++++
>  package/efl/Config.in          |  1 -
>  package/efl/libeina/Config.in  |  6 ------
>  package/efl/libeina/libeina.mk | 18 ------------------
>  4 files changed, 7 insertions(+), 25 deletions(-)
>  delete mode 100644 package/efl/libeina/Config.in
>  delete mode 100644 package/efl/libeina/libeina.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 14da2f2..d6cb451 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -107,6 +107,13 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2015.11"
>  
> +config BR2_PACKAGE_LIBEINA
> +	bool "libeina package has been removed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_EFL
> +	help
> +	  The libeina package has been removed with the efl bump to 1.15.
> +
>  config BR2_PACKAGE_LIBEET
>  	bool "libeet package has been removed"
>  	select BR2_LEGACY
> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index 9e92a6e..bddff8c 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -14,7 +14,6 @@ menuconfig BR2_PACKAGE_EFL
>  
>  if BR2_PACKAGE_EFL
>  
> -source "package/efl/libeina/Config.in"
>  source "package/efl/libefl/Config.in"
>  source "package/efl/libelementary/Config.in"
>  
> diff --git a/package/efl/libeina/Config.in b/package/efl/libeina/Config.in
> deleted file mode 100644
> index 80600ad..0000000
> --- a/package/efl/libeina/Config.in
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -config BR2_PACKAGE_LIBEINA
> -	bool "libeina"
> -	help
> -	  Eina is a tiny library to handle data types (list, hash, etc.)
> -
> -	  http://trac.enlightenment.org/e/wiki/Eina
> diff --git a/package/efl/libeina/libeina.mk b/package/efl/libeina/libeina.mk
> deleted file mode 100644
> index ae9f1c6..0000000
> --- a/package/efl/libeina/libeina.mk
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -################################################################################
> -#
> -# libeina
> -#
> -################################################################################
> -
> -LIBEINA_VERSION = 1.7.10
> -LIBEINA_SOURCE = eina-$(LIBEINA_VERSION).tar.bz2
> -LIBEINA_SITE = http://download.enlightenment.org/releases
> -LIBEINA_LICENSE = LGPLv2.1+
> -LIBEINA_LICENSE_FILES = COPYING
> -
> -LIBEINA_INSTALL_STAGING = YES
> -
> -LIBEINA_DEPENDENCIES = host-pkgconf
> -
> -$(eval $(autotools-package))
> -$(eval $(host-autotools-package))
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
