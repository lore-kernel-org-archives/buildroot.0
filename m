From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 11 Aug 2019 22:41:31 +0200
Subject: [Buildroot] [PATCH/next v9 11/12] package/mesa3d: add support
 for gallium lima driver
In-Reply-To: <20190811131755.30840-11-bernd.kuhls@t-online.de>
References: <20190811131755.30840-1-bernd.kuhls@t-online.de>
 <20190811131755.30840-11-bernd.kuhls@t-online.de>
Message-ID: <cfe3018a-dfff-5644-e856-5598dfb93a50@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 11/08/2019 ? 15:17, Bernd Kuhls a ?crit?:
> More infos can be found here:
> https://gitlab.freedesktop.org/lima/web/wikis/home
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I'm testing on Potato Board with Lima DRM driver and a kernel 5.2.

Reviewed-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> ---
>  package/mesa3d/Config.in | 7 +++++++
>  package/mesa3d/mesa3d.mk | 3 +++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 3631e22cc3..1cf241e552 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -103,6 +103,13 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
>  comment "Gallium KMSRO needs one or more renderonly drivers"
>  	depends on !BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
>  
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
> +	bool "Gallium lima driver"
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
> +	help
> +	  Mesa driver for ARM Mali Utgard GPUs.
> +
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
>  	bool "Gallium nouveau driver"
>  	depends on BR2_i386 || BR2_x86_64
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 1497659202..80abd392ba 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -86,6 +86,7 @@ endif
>  #Gallium Drivers
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  += etnaviv
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO)    += kmsro
> +MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA)     += lima
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) += radeonsi
> @@ -172,6 +173,8 @@ else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4),y)
>  MESA3D_PLATFORMS = drm
>  else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV),y)
>  MESA3D_PLATFORMS = drm
> +else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA),y)
> +MESA3D_PLATFORMS = drm
>  else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL),y)
>  MESA3D_PLATFORMS = drm
>  else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI),y)
> 
