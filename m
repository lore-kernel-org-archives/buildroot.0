From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 21:50:58 +0100
Subject: [Buildroot] [PATCH 06/16] xdriver_xf86-video-imx-viv: bump to
 version 6.2.2.p0
In-Reply-To: <20180103183842.10182-7-gary.bisson@boundarydevices.com>
References: <20180103183842.10182-1-gary.bisson@boundarydevices.com>
 <20180103183842.10182-7-gary.bisson@boundarydevices.com>
Message-ID: <20180103215058.6ec3d6b6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 Jan 2018 19:38:32 +0100, Gary Bisson wrote:
> The following xorg.conf was used in order to force the use of the
> vivante module:
> https://github.com/Freescale/meta-freescale/blob/master/recipes-graphics/xorg-xserver/xserver-xf86-config/mx6/xorg.conf
> 
> Note that the X server must be started with the "noreset" option to
> avoid crashes when closing X apps.
> Tested with:
>  # X -noreset &
>  # cd /usr/share/examples/viv_samples/vdk/
>  # DISPLAY=:0 ./tutorial7
> 
> Cc: J?r?me Pouiller <jezz@sysmic.org>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  ...001-Stop-using-Git-to-write-local-version.patch | 90 ----------------------

Explaining in the commit log why the patch is removed would be nice.

> diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
> index c3746a100f..5a0257305c 100644
> --- a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
>  	bool "xf86-video-imx-viv"
>  	depends on BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
> +	depends on BR2_PACKAGE_IMX_GPU_G2D

Perhaps a "select BR2_PACKAGE_IMX_GPU_G2D" would be better.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
