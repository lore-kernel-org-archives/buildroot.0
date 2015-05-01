From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 16:48:20 +0200
Subject: [Buildroot] [PATCH v7 07/13] xdriver_xf86-video-imx-viv: new
 package
In-Reply-To: <1430406748-8493-8-git-send-email-jezz@sysmic.org>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
 <1430406748-8493-8-git-send-email-jezz@sysmic.org>
Message-ID: <20150501164820.311f339e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Thu, 30 Apr 2015 17:12:22 +0200, J?r?me Pouiller wrote:
> Xorg driver for imx6. Inspired from Yocto project.
> 
> I did not find any problem, but notice Yocto project force Xorg xserver
> 1.14.4 while we use 1.16.

We're actually using 1.17 now. Did you retest with 1.17 ? Otherwise,
I've merged a series from Yann E. Morin a few days ago, which allows to
use either X.org server 1.17 or 1.14.

> +XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = $(FREESCALE_IMX_VERSION)
> +XDRIVER_XF86_VIDEO_IMX_VIV_SITE = $(FREESCALE_IMX_SITE)
> +XDRIVER_XF86_VIDEO_IMX_VIV_SOURCE = xserver-xorg-video-imx-viv-$(XDRIVER_XF86_VIDEO_IMX_VIV_VERSION).tar.gz
> +XDRIVER_XF86_VIDEO_IMX_VIV_DEPENDENCIES = gpu-viv-bin-mx6q xserver_xorg-server \
> +	xproto_xproto xproto_xf86driproto libdrm
> +XDRIVER_XF86_VIDEO_IMX_VIV_LICENSE = GPLv2

License is really GPLv2+.

> +define XDRIVER_XF86_VIDEO_IMX_VIV_INSTALL_STAGING_CMDS
> +	$(XDRIVER_XF86_VIDEO_IMX_VIV_MAKE_CMD) prefix=$(STAGING_DIR)/usr install
> +	$(INSTALL) -m 644 $(@D)/EXA/src/vivante_gal/vivante_priv.h $(STAGING_DIR)/usr/include
> +	$(INSTALL) -m 644 $(@D)/EXA/src/vivante_gal/vivante_gal.h $(STAGING_DIR)/usr/include

-D and full destination paths should be used.

Committed with those issues fixed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
