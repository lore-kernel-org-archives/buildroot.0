From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Oct 2015 23:04:22 +0100
Subject: [Buildroot] [PATCH v3 1/4] package/kodi-pvr-stalker: Needs
 jsoncpp
In-Reply-To: <1443803497-9936-1-git-send-email-bernd.kuhls@t-online.de>
References: <1443803497-9936-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151002220422.GB4284@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-10-02 18:31 +0200, Bernd Kuhls spake thusly:
> Fixes
> http://autobuild.buildroot.net/results/56f/56fb98da27495f6a461bfdc7aa8c2de4d86dfdb8/
> http://autobuild.buildroot.net/results/f98/f982b437935cf1f921559f5388fd4146eb9241bd/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v3: removed reference to c++ from comment (Baruch)
> v2: add jsoncpp reverse dependency (Baruch)
> 
>  package/kodi-pvr-stalker/Config.in           | 5 +++++
>  package/kodi-pvr-stalker/kodi-pvr-stalker.mk | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/kodi-pvr-stalker/Config.in b/package/kodi-pvr-stalker/Config.in
> index b327fd8..26a8c3f 100644
> --- a/package/kodi-pvr-stalker/Config.in
> +++ b/package/kodi-pvr-stalker/Config.in
> @@ -1,7 +1,12 @@
>  config BR2_PACKAGE_KODI_PVR_STALKER
>  	bool "kodi-pvr-stalker"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
> +	select BR2_PACKAGE_JSONCPP
>  	select BR2_PACKAGE_KODI_PLATFORM
>  	help
>  	  A PVR Client that connects Kodi to Stalker Middleware
>  
>  	  https://github.com/kodi-pvr/pvr.stalker
> +
> +comment "kodi-pvr-stalker needs a toolchain w/ gcc >= 4.7"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
> index 589cf7d..c1baa8d 100644
> --- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
> +++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
> @@ -8,6 +8,6 @@ KODI_PVR_STALKER_VERSION = 5f6eb1992ffd45a075ebb7bc4253c4a88bf65c80
>  KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
>  KODI_PVR_STALKER_LICENSE = GPLv2+
>  KODI_PVR_STALKER_LICENSE_FILES = src/client.h
> -KODI_PVR_STALKER_DEPENDENCIES = kodi-platform
> +KODI_PVR_STALKER_DEPENDENCIES = jsoncpp kodi-platform
>  
>  $(eval $(cmake-package))
> -- 
> 2.5.3
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
