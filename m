From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 26 May 2015 10:19:38 +0200
Subject: [Buildroot] [PATCH v2 09/13] xdriver_xf86-video-imx-viv: bump to
	version 3.10.53-1.1.0 GA
In-Reply-To: <1432628382-16799-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1432628382-16799-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1432628382-16799-10-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previous patch for the LoadExtension call isn't needed any more.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/f0440193ddb3eafa1b00aed294ed6dbd3e4d604d

I do not really remember why we switched the FREESCALE_IMX_VERSION to a
specific version but decided but put it back in place in order to follow the
rest of the packages.

I have used the following xorg.conf in order to force the use of the vivante
module:
https://github.com/Freescale/meta-fsl-arm/blob/master/recipes-graphics/xorg-xserver/xserver-xf86-config/mx6/xorg.conf

Regards,
Gary
---
 .../0001-Fix-LoadExtenions.patch                          | 15 ---------------
 .../xdriver_xf86-video-imx-viv.mk                         |  2 +-
 2 files changed, 1 insertion(+), 16 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/0001-Fix-LoadExtenions.patch

diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/0001-Fix-LoadExtenions.patch b/package/x11r7/xdriver_xf86-video-imx-viv/0001-Fix-LoadExtenions.patch
deleted file mode 100644
index 3e2d47c..0000000
--- a/package/x11r7/xdriver_xf86-video-imx-viv/0001-Fix-LoadExtenions.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Fix compilation with Xorg xserver 1.16.
-
-Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
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
-- 
2.1.4
