From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Oct 2014 19:08:40 +0200
Subject: [Buildroot] [PATCH 03/11] gpu-viv-bin-mx6q: provide libopenvg
In-Reply-To: <1412340212-3089-4-git-send-email-jezz@sysmic.org>
References: <1412340212-3089-1-git-send-email-jezz@sysmic.org>
 <1412340212-3089-4-git-send-email-jezz@sysmic.org>
Message-ID: <20141012170840.GD27528@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2014-10-03 14:43 +0200, J?r?me Pouiller spake thusly:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/freescale-imx/gpu-viv-bin-mx6q/Config.in           | 4 ++++
>  package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> index 864c605..4e83dd3 100644
> --- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
>  	bool "gpu-viv-bin-mx6q"
>  	select BR2_PACKAGE_HAS_LIBEGL
>  	select BR2_PACKAGE_HAS_LIBGLES
> +	select BR2_PACKAGE_HAS_LIBOPENVG
>  	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
>  	depends on BR2_arm # Only relevant for i.MX6
> @@ -30,6 +31,9 @@ config BR2_PACKAGE_PROVIDES_LIBEGL
>  config BR2_PACKAGE_PROVIDES_LIBGLES
>  	default "gpu-viv-bin-mx6q"
>  
> +config BR2_PACKAGE_PROVIDES_LIBOPENVG
> +	default "gpu-viv-bin-mx6q"
> +
>  config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_EXAMPLES
>  	bool "install examples"
>  	help
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> index 49a8287..93cc74f 100644
> --- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> @@ -23,7 +23,7 @@ GPU_VIV_BIN_MX6Q_LICENSE = Freescale Semiconductor Software License Agreement
>  # for which a separate license is needed...
>  GPU_VIV_BIN_MX6Q_REDISTRIBUTE = NO
>  
> -GPU_VIV_BIN_MX6Q_PROVIDES = libegl libgles
> +GPU_VIV_BIN_MX6Q_PROVIDES = libegl libgles libopenvg
>  
>  # DirectFB is not supported (wrong version)
>  ifeq ($(BR2_PACKAGE_XORG7),y)
> -- 
> 2.1.0
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
