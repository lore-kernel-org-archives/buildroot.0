From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 22:57:19 +0200
Subject: [Buildroot] [git commit] Vivante drivers: bump to version
	3.10.17-1.0.1
Message-ID: <20150501205734.77C4C81DED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=04249c64fc409b46ac4d524a4f8dcaad7b1e0634
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |    5 +++--
 .../xdriver_xf86-video-imx-viv.mk                  |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
index 4884616..ec779a4 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
+GPU_VIV_BIN_MX6Q_BASE_VERSION = 3.10.17-1.0.1
 ifeq ($(BR2_ARM_EABIHF),y)
-GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)-hfp
+GPU_VIV_BIN_MX6Q_VERSION = $(GPU_VIV_BIN_MX6Q_BASE_VERSION)-hfp
 else
-GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)-sfp
+GPU_VIV_BIN_MX6Q_VERSION = $(GPU_VIV_BIN_MX6Q_BASE_VERSION)-sfp
 endif
 GPU_VIV_BIN_MX6Q_SITE = $(FREESCALE_IMX_SITE)
 GPU_VIV_BIN_MX6Q_SOURCE = gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION).bin
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
index 06ea815..1e9a665 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = $(FREESCALE_IMX_VERSION)
+XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = 3.10.17-1.0.1
 XDRIVER_XF86_VIDEO_IMX_VIV_SITE = $(FREESCALE_IMX_SITE)
 XDRIVER_XF86_VIDEO_IMX_VIV_SOURCE = xserver-xorg-video-imx-viv-$(XDRIVER_XF86_VIDEO_IMX_VIV_VERSION).tar.gz
 XDRIVER_XF86_VIDEO_IMX_VIV_DEPENDENCIES = gpu-viv-bin-mx6q xserver_xorg-server \
