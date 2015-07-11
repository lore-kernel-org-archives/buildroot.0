From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 13:03:47 +0200
Subject: [Buildroot] [git commit] xdriver_xf86-video-imx-viv: bump to
	version 3.10.53-1.1.0 GA
Message-ID: <20150711112619.BA68780831@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73930a6bb02a2f6a77beba4ffd760096007ed526
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previous patch for the LoadExtension call isn't needed any more.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/f0440193ddb3eafa1b00aed294ed6dbd3e4d604d

Switched back to use FREESCALE_IMX_VERSION.

The following xorg.conf was used in order to force the use of the
vivante module:
https://github.com/Freescale/meta-fsl-arm/blob/master/recipes-graphics/xorg-xserver/xserver-xf86-config/mx6/xorg.conf

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Fix-LoadExtenions.patch                   |   15 ---------------
 .../xdriver_xf86-video-imx-viv.mk                  |    2 +-
 2 files changed, 1 insertions(+), 16 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/0001-Fix-LoadExtenions.patch b/package/x11r7/xdriver_xf86-video-imx-viv/0001-Fix-LoadExtenions.patch
deleted file mode 100644
index 3e2d47c..0000000
--- a/package/x11r7/xdriver_xf86-video-imx-viv/0001-Fix-LoadExtenions.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Fix compilation with Xorg xserver 1.16.
-
-Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
-
---- a/EXA/src/vivante_fbdev/vivante_fbdev_driver.c	2014-07-25 15:38:24.000000000 +0200
-+++ b/EXA/src/vivante_fbdev/vivante_fbdev_driver.c	2014-10-02 21:00:58.755409342 +0200
-@@ -261,7 +261,7 @@
-         setupDone = TRUE;
-         xf86AddDriver(&FBDEV, module, HaveDriverFuncs);
-         if(gVivFb)
--            LoadExtension(&VIVExt, FALSE);
-+            LoadExtensionList(&VIVExt, 1, FALSE);
- 		return (pointer)1;
-     } else {
-         if (errmaj) *errmaj = LDR_ONCEONLY;
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
index fbd7325..f5cb946 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = 3.10.17-1.0.1
+XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = $(FREESCALE_IMX_VERSION)
 XDRIVER_XF86_VIDEO_IMX_VIV_SITE = $(FREESCALE_IMX_SITE)
 XDRIVER_XF86_VIDEO_IMX_VIV_SOURCE = xserver-xorg-video-imx-viv-$(XDRIVER_XF86_VIDEO_IMX_VIV_VERSION).tar.gz
 XDRIVER_XF86_VIDEO_IMX_VIV_DEPENDENCIES = imx-gpu-viv xserver_xorg-server \
