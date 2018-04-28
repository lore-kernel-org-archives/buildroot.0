From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 22:04:03 +0200
Subject: [Buildroot] [PATCH 2/4] package/mesa3d: RadeonSI needs
 libdrm-radeon and libdrm-amdgpu
In-Reply-To: <20180428172803.11179-2-romain.naour@gmail.com>
References: <20180428172803.11179-1-romain.naour@gmail.com>
 <20180428172803.11179-2-romain.naour@gmail.com>
Message-ID: <20180428220403.208e1cf4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Apr 2018 19:28:01 +0200, Romain Naour wrote:
> Fixes:
> checking for EXPAT... yes
> checking for RADEON... no
> configure: error: Package requirements (libdrm >= 2.4.71 libdrm_radeon >= 2.4.71)
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Micha? Kalbarczyk <michal@gamecodehq.com>
> ---
>  package/mesa3d/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 1984e4f11c..32337a36a4 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -122,6 +122,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
>  			BR2_TOOLCHAIN_USES_GLIBC)) # elfutils
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>  	select BR2_PACKAGE_LIBDRM_AMDGPU
> +	select BR2_PACKAGE_LIBDRM_RADEON

So it needs both libdrm_radeon and libdrm_amdgpu ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
