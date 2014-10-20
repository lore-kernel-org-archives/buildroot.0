From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Oct 2014 19:46:42 +0200
Subject: [Buildroot] [PATCH 2/2] package/upmpdcli: bump to version 0.8.5
In-Reply-To: <1413813009-20149-2-git-send-email-jkrause@posteo.de>
References: <1413813009-20149-1-git-send-email-jkrause@posteo.de>
 <1413813009-20149-2-git-send-email-jkrause@posteo.de>
Message-ID: <20141020174642.GH3742@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2014-10-20 15:50 +0200, J?rg Krause spake thusly:
> New version of upmpdcli now depends on libupnpp, which was ectracted from the
> source and now exists in its own package.
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>  package/upmpdcli/Config.in   | 8 +++-----
>  package/upmpdcli/upmpdcli.mk | 4 ++--
>  2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
> index f28c775..84649d2 100644
> --- a/package/upmpdcli/Config.in
> +++ b/package/upmpdcli/Config.in
> @@ -1,12 +1,10 @@
>  config BR2_PACKAGE_UPMPDCLI
>  	bool "upmpdcli"
> -	select BR2_PACKAGE_EXPAT
> -	select BR2_PACKAGE_LIBCURL
> -	select BR2_PACKAGE_LIBUPNP
>  	select BR2_PACKAGE_LIBMPDCLIENT
> +	select BR2_PACKAGE_LIBUPNPP
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_LARGEFILE # libupnp
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
> +	depends on BR2_LARGEFILE # libupnpp -> libupnp
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnpp -> libupnp
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto

Ah, the dependencies in libupnpp comes from here...
Are you sure they are still needed in libupnpp?

For this patch:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
> index 547752a..a47c456 100644
> --- a/package/upmpdcli/upmpdcli.mk
> +++ b/package/upmpdcli/upmpdcli.mk
> @@ -4,11 +4,11 @@
>  #
>  ################################################################################
>  
> -UPMPDCLI_VERSION = 0.8.3
> +UPMPDCLI_VERSION = 0.8.5
>  UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
>  UPMPDCLI_LICENSE = GPLv2+
>  UPMPDCLI_LICENSE_FILES = COPYING
> -UPMPDCLI_DEPENDENCIES = expat libcurl libupnp libmpdclient
> +UPMPDCLI_DEPENDENCIES = libmpdclient libupnpp
>  
>  # Upmpdcli only runs if user upmpdcli exists
>  define UPMPDCLI_USERS
> -- 
> 2.1.2
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
