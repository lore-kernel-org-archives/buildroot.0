From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 17:12:01 +0200
Subject: [Buildroot] [PATCH v13 04/13] package/mesa3d: Only one swrast
 provider can be built
In-Reply-To: <20190920163849.8124-5-bernd.kuhls@t-online.de>
References: <20190920163849.8124-1-bernd.kuhls@t-online.de>
 <20190920163849.8124-5-bernd.kuhls@t-online.de>
Message-ID: <a37f7964-aced-dfc9-fdd2-a22c9071453a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/09/2019 18:38, Bernd Kuhls wrote:
> From: Romain Naour <romain.naour@smile.fr>
> 
> https://cgit.freedesktop.org/mesa/mesa/commit/?id=de24d61765011ed4bfc169b8ad8cf67e86b1f3bd
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 77ac0469e9..1f5f221337 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -173,11 +173,15 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
>  
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
>  	bool "Gallium swrast driver"
> +	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST

 IMO it would have made a little more sense to put this on the DRI side instead
of the Gallium side, but it's not so important, so applied to master, thanks.

 Regards,
 Arnout

>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>  	help
>  	  This is a software opengl implementation using the Gallium3D
>  	  infrastructure.
>  
> +comment "Gallium swrast: Only one swrast provider can be built"
> +	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
> +
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
>  	bool "Gallium vc4 driver"
>  	depends on BR2_arm || BR2_aarch64
> 
