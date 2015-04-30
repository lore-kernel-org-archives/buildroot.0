From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 30 Apr 2015 10:32:39 +0200
Subject: [Buildroot] [v6,
	04/15] gpu-viv-bin-mx6q: remove useless build time deps
In-Reply-To: <1421451251-23366-5-git-send-email-jezz@sysmic.org>
References: <1421451251-23366-5-git-send-email-jezz@sysmic.org>
Message-ID: <20150430083239.GD24549@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sat, Jan 17, 2015 at 12:34:00AM +0100, J?r?me Pouiller wrote:
> Since gpu-viv-bin-mx6q is provided as binary package, there is no build
> time dependencies.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/freescale-imx/gpu-viv-bin-mx6q/Config.in           | 4 ++--
>  package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk | 1 -
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> index 0947f17..7fbddbf 100644
> --- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> @@ -32,8 +32,8 @@ choice
>  
>  config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11
>  	depends on BR2_PACKAGE_XORG7
> -	select BR2_PACKAGE_XLIB_LIBXDAMAGE
> -	select BR2_PACKAGE_XLIB_LIBXEXT
> +	select BR2_PACKAGE_XLIB_LIBXDAMAGE # Runtime dependency
> +	select BR2_PACKAGE_XLIB_LIBXEXT # Runtime dependency
>  	bool "X11"
>  
>  comment "X11 backend needs Xorg package"
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> index 7895023..35ba1c6 100644
> --- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> @@ -22,7 +22,6 @@ GPU_VIV_BIN_MX6Q_PROVIDES = libegl libgles libopenvg
>  
>  # DirectFB is not supported (wrong version)
>  ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11),y)
> -GPU_VIV_BIN_MX6Q_DEPENDENCIES = xlib_libXdamage xlib_libXext
>  GPU_VIV_BIN_MX6Q_LIB_TARGET = x11
>  else
>  GPU_VIV_BIN_MX6Q_LIB_TARGET = fb

As explained in my answer to the cover letter, this series of patch has
been successfully tested on a Nitrogen6x board.
http://lists.busybox.net/pipermail/buildroot/2015-April/124739.html

Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

Also, those dependencies clearly shouldn't exist.

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
