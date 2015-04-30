From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 30 Apr 2015 10:57:50 +0200
Subject: [Buildroot] [v6,
	11/15] Vivante drivers: bump to version 3.10.17-1.0.1
In-Reply-To: <1421451251-23366-12-git-send-email-jezz@sysmic.org>
References: <1421451251-23366-12-git-send-email-jezz@sysmic.org>
Message-ID: <20150430085750.GK24549@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sat, Jan 17, 2015 at 12:34:07AM +0100, J?r?me Pouiller wrote:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           | 5 +++--
>  .../x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk   | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> index 501b124..e07e5ca 100644
> --- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> @@ -4,10 +4,11 @@
>  #
>  ################################################################################
>  
> +GPU_VIV_BIN_MX6Q_BASE_VERSION = 3.10.17-1.0.1
>  ifeq ($(BR2_ARM_EABIHF),y)
> -GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)-hfp
> +GPU_VIV_BIN_MX6Q_VERSION = $(GPU_VIV_BIN_MX6Q_BASE_VERSION)-hfp
>  else
> -GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)-sfp
> +GPU_VIV_BIN_MX6Q_VERSION = $(GPU_VIV_BIN_MX6Q_BASE_VERSION)-sfp
>  endif
>  GPU_VIV_BIN_MX6Q_SITE = $(FREESCALE_IMX_SITE)
>  GPU_VIV_BIN_MX6Q_SOURCE = gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION).bin
> diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
> index 44d98d5..eab7edf 100644
> --- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
> +++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = $(FREESCALE_IMX_VERSION)
> +XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = 3.10.17-1.0.1
>  XDRIVER_XF86_VIDEO_IMX_VIV_SITE = $(FREESCALE_IMX_SITE)
>  XDRIVER_XF86_VIDEO_IMX_VIV_SOURCE = xserver-xorg-video-imx-viv-$(XDRIVER_XF86_VIDEO_IMX_VIV_VERSION).tar.gz
>  XDRIVER_XF86_VIDEO_IMX_VIV_DEPENDENCIES = gpu-viv-bin-mx6q xserver_xorg-server \

As explained in my answer to the cover letter, this series of patch has
been successfully tested on a Nitrogen6x board.
http://lists.busybox.net/pipermail/buildroot/2015-April/124739.html

Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

Also reviewed the versioning changes at the V1 of the series.

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
