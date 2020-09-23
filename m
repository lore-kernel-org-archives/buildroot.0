From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 23 Sep 2020 07:26:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: add missing depends and
 driver name to r100 driver
References: <20200209183441.130187-1-james.hilliard1@gmail.com>
Message-ID: <1t2r3hxkiu.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James,

Am Sun, 09 Feb 2020 11:34:41 -0700 schrieb James Hilliard:

> Propagate libdrm dependencies.
> 
> Add r100 to menu name to differentiate from r200 dri driver.
> 
> Signed-off-by: James Hilliard <james.hilliard1-
Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  package/mesa3d/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index ff39652508..788705544d 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -355,7 +355,9 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
>  	  Support for Nvidia-based GPUs.
>  
>  config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
> -	bool "DRI radeon driver"
> +	bool "DRI radeon r100 driver"

ok.

> +	depends on BR2_i386 || BR2_x86_64

Ok, the build system of mesa3d limits the driver to these archs:
https://cgit.freedesktop.org/mesa/mesa/tree/meson.build?h=20.1#n141

> +	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC

ok.

Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Regards, Bernd
