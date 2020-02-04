From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Feb 2020 22:03:00 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/mesa3d: update vc4 help text
In-Reply-To: <20200204144412.6666-3-ps.report@gmx.net>
References: <20200204144412.6666-1-ps.report@gmx.net>
 <20200204144412.6666-3-ps.report@gmx.net>
Message-ID: <20200204210300.GC6335@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-02-04 15:44 +0100, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/mesa3d/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 1351d1cd97..9389a6132e 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -244,8 +244,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
>  	select BR2_PACKAGE_LIBDRM_VC4
>  	select BR2_PACKAGE_MESA3D_OPENGL_EGL
>  	help
> -	  Driver for Broadcom VC4 (rpi2/3) GPUs.
> -	  It requires a vanilla 4.5+ kernel with drm vc4 (open) support.
> +	  Driver for Broadcom VC4 (rpi2/3/4) GPUs (needs kmsro).
> +	  It requires a recent enough mainline/raspberrypi kernel with
> +	  drm vc4 (CONFIG_DRM_VC4) support enabled, for rpi4 additional
> +	  v3d support is required.

This is all very confusing...

First, you add rpi4 as supported by the vc4 driver, but the v3d driver
is also supposed to cover the rpi4. Are both needed? Is the v3d driver
a supperset, a subset, a complement to vc4? If so, why doesn't the v3d
driver select the vc4 driver (although it selects the vc4 drm backend)?
Or is it possible to use just the vc4 driver on rpi4?

Then, you drop the 4.5+ version with this hazy "recent enough"
categorisation. For the same reason as I explained in the previous
patch, this is not nice.

So, please explain in the commit log what is going on here...

In the meantime, I marked the patch as rejected in patchwork.

Regards,
Yann E. MORIN.

>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL
>  	bool "Gallium virgl driver"
> -- 
> 2.25.0
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
