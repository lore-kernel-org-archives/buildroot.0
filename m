From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 10:27:35 +0200
Subject: [Buildroot] [PATCH 1/1]
 package/kodi-peripheral-steamcontroller: remove package
In-Reply-To: <20200614073300.503435-1-bernd.kuhls@t-online.de>
References: <20200614073300.503435-1-bernd.kuhls@t-online.de>
Message-ID: <20200614082735.GF2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-06-14 09:33 +0200, Bernd Kuhls spake thusly:
> The package is broken:
> https://github.com/kodi-game/peripheral.steamcontroller/pull/8#issuecomment-441469406
> https://github.com/kodi-game/peripheral.steamcontroller/issues/10#issuecomment-467551856
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy                                    |  8 ++++++++
>  package/kodi-peripheral-steamcontroller/Config.in   |  8 --------
>  .../kodi-peripheral-steamcontroller.hash            |  3 ---
>  .../kodi-peripheral-steamcontroller.mk              | 13 -------------
>  package/kodi/Config.in                              |  1 -
>  5 files changed, 8 insertions(+), 25 deletions(-)
>  delete mode 100644 package/kodi-peripheral-steamcontroller/Config.in
>  delete mode 100644 package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash
>  delete mode 100644 package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index d65d963d45..4074c34c56 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -144,6 +144,14 @@ endif
>  
>  ###############################################################################
>  
> +comment "Legacy options removed in 2020.08"
> +
> +config BR2_PACKAGE_KODI_PERIPHERAL_STEAMCONTROLLER
> +	bool "kodi-peripheral-steamcontroller package was removed"
> +	select BR2_LEGACY
> +	help
> +	  This package is broken.
> +
>  comment "Legacy options removed in 2020.05"
>  
>  config BR2_PACKAGE_WIRINGPI
> diff --git a/package/kodi-peripheral-steamcontroller/Config.in b/package/kodi-peripheral-steamcontroller/Config.in
> deleted file mode 100644
> index a994f4c9fb..0000000000
> --- a/package/kodi-peripheral-steamcontroller/Config.in
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -config BR2_PACKAGE_KODI_PERIPHERAL_STEAMCONTROLLER
> -	bool "kodi-peripheral-steamcontroller"
> -	select BR2_PACKAGE_KODI_PLATFORM
> -	select BR2_PACKAGE_LIBUSB
> -	help
> -	  Steam controller driver for Kodi
> -
> -	  https://github.com/kodi-game/peripheral.steamcontroller
> diff --git a/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash b/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash
> deleted file mode 100644
> index 15706cb043..0000000000
> --- a/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally computed
> -sha256 aece8f4b4c4360ae6b8007c9a1d1ee39d90808053bc5b2e3e08e4c5c70a7f8db  kodi-peripheral-steamcontroller-702fea828f9c5c94d0bd77dbb5fe78451edfa2ea.tar.gz
> -sha256 243622a4e1a2ba091ae1d433483ad8b34a7cc337048d5bef8072fbb324fbc79a  debian/copyright
> diff --git a/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.mk b/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.mk
> deleted file mode 100644
> index 15607145b8..0000000000
> --- a/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.mk
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -################################################################################
> -#
> -# kodi-peripheral-steamcontroller
> -#
> -################################################################################
> -
> -KODI_PERIPHERAL_STEAMCONTROLLER_VERSION = 702fea828f9c5c94d0bd77dbb5fe78451edfa2ea
> -KODI_PERIPHERAL_STEAMCONTROLLER_SITE = $(call github,kodi-game,peripheral.steamcontroller,$(KODI_PERIPHERAL_STEAMCONTROLLER_VERSION))
> -KODI_PERIPHERAL_STEAMCONTROLLER_LICENSE = GPL-2.0+
> -KODI_PERIPHERAL_STEAMCONTROLLER_LICENSE_FILES = debian/copyright
> -KODI_PERIPHERAL_STEAMCONTROLLER_DEPENDENCIES = kodi-platform libusb
> -
> -$(eval $(cmake-package))
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 4d0a8364c2..5e4c7ca099 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -358,7 +358,6 @@ endmenu
>  
>  menu "Peripheral addons"
>  	source "package/kodi-peripheral-joystick/Config.in"
> -	source "package/kodi-peripheral-steamcontroller/Config.in"
>  	source "package/kodi-peripheral-xarcade/Config.in"
>  endmenu
>  
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
