From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed,  3 Jan 2018 19:38:32 +0100
Subject: [Buildroot] [PATCH 06/16] xdriver_xf86-video-imx-viv: bump to
 version 6.2.2.p0
In-Reply-To: <20180103183842.10182-1-gary.bisson@boundarydevices.com>
References: <20180103183842.10182-1-gary.bisson@boundarydevices.com>
Message-ID: <20180103183842.10182-7-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following xorg.conf was used in order to force the use of the
vivante module:
https://github.com/Freescale/meta-freescale/blob/master/recipes-graphics/xorg-xserver/xserver-xf86-config/mx6/xorg.conf

Note that the X server must be started with the "noreset" option to
avoid crashes when closing X apps.
Tested with:
 # X -noreset &
 # cd /usr/share/examples/viv_samples/vdk/
 # DISPLAY=:0 ./tutorial7

Cc: J?r?me Pouiller <jezz@sysmic.org>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 ...001-Stop-using-Git-to-write-local-version.patch | 90 ----------------------
 package/x11r7/xdriver_xf86-video-imx-viv/Config.in |  7 ++
 .../xdriver_xf86-video-imx-viv.hash                |  2 +-
 .../xdriver_xf86-video-imx-viv.mk                  | 10 +--
 4 files changed, 13 insertions(+), 96 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/0001-Stop-using-Git-to-write-local-version.patch

diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/0001-Stop-using-Git-to-write-local-version.patch b/package/x11r7/xdriver_xf86-video-imx-viv/0001-Stop-using-Git-to-write-local-version.patch
deleted file mode 100644
index 2117e725cd..0000000000
--- a/package/x11r7/xdriver_xf86-video-imx-viv/0001-Stop-using-Git-to-write-local-version.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 69a92f4576a1e789ba2fcf957164d2c4013020c5 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Wed, 2 Dec 2015 13:36:25 +0000
-Subject: [PATCH] Stop using Git to write local version
-Organization: O.S. Systems Software LTDA.
-
-The standard version does not use a Git repository so we should not
-use Git to identify the commit of the build as it can end getting the
-version from a wrong repository and can be misleading.
-
-Upstream-Status: Pending
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-[Downloaded from
-https://github.com/Freescale/meta-fsl-arm/blob/master/recipes-graphics/xorg-driver/xf86-video-imxfb-vivante/Stop-using-Git-to-write-local-version.patch]
-Signed-off-by: Andrew Webster <awebster@arcx.com>
----
- EXA/src/makefile.tc         | 6 +++---
- FslExt/src/makefile.tc      | 6 +++---
- util/autohdmi/makefile.tc   | 6 +++---
- util/pandisplay/makefile.tc | 6 +++---
- 4 files changed, 12 insertions(+), 12 deletions(-)
-
-diff --git a/EXA/src/makefile.tc b/EXA/src/makefile.tc
-index 0b9a9e6..ec6e68d 100644
---- a/EXA/src/makefile.tc
-+++ b/EXA/src/makefile.tc
-@@ -52,8 +52,8 @@ prefix ?= /usr
- sysroot ?= /
- 
- # get git commit number
--COMMITNR := `git log -n 1 --format=%H`
--DIRTY := `git diff-index --quiet HEAD || echo '-dirty'`
--LOCAL_CFLAGS += -DCOMMIT="${COMMITNR}${DIRTY}"
-+#COMMITNR := `git log -n 1 --format=%H`
-+#DIRTY := `git diff-index --quiet HEAD || echo '-dirty'`
-+#LOCAL_CFLAGS += -DCOMMIT="${COMMITNR}${DIRTY}"
- 
- 
-diff --git a/FslExt/src/makefile.tc b/FslExt/src/makefile.tc
-index 0b9a9e6..ec6e68d 100644
---- a/FslExt/src/makefile.tc
-+++ b/FslExt/src/makefile.tc
-@@ -52,8 +52,8 @@ prefix ?= /usr
- sysroot ?= /
- 
- # get git commit number
--COMMITNR := `git log -n 1 --format=%H`
--DIRTY := `git diff-index --quiet HEAD || echo '-dirty'`
--LOCAL_CFLAGS += -DCOMMIT="${COMMITNR}${DIRTY}"
-+#COMMITNR := `git log -n 1 --format=%H`
-+#DIRTY := `git diff-index --quiet HEAD || echo '-dirty'`
-+#LOCAL_CFLAGS += -DCOMMIT="${COMMITNR}${DIRTY}"
- 
- 
-diff --git a/util/autohdmi/makefile.tc b/util/autohdmi/makefile.tc
-index c9de0a6..d0a468c 100644
---- a/util/autohdmi/makefile.tc
-+++ b/util/autohdmi/makefile.tc
-@@ -64,8 +64,8 @@ prefix ?= /usr
- sysroot ?= /
- 
- # get git commit number
--COMMITNR := `git log -n 1 --format=%H`
--DIRTY := `git diff-index --quiet HEAD || echo '-dirty'`
--LOCAL_CFLAGS += -DCOMMIT="${COMMITNR}${DIRTY}"
-+#COMMITNR := `git log -n 1 --format=%H`
-+#DIRTY := `git diff-index --quiet HEAD || echo '-dirty'`
-+#LOCAL_CFLAGS += -DCOMMIT="${COMMITNR}${DIRTY}"
- 
- 
-diff --git a/util/pandisplay/makefile.tc b/util/pandisplay/makefile.tc
-index 28732b9..bf54c20 100644
---- a/util/pandisplay/makefile.tc
-+++ b/util/pandisplay/makefile.tc
-@@ -64,8 +64,8 @@ prefix ?= /usr
- sysroot ?= /
- 
- # get git commit number
--COMMITNR := `git log -n 1 --format=%H`
--DIRTY := `git diff-index --quiet HEAD || echo '-dirty'`
--LOCAL_CFLAGS += -DCOMMIT="${COMMITNR}${DIRTY}"
-+#COMMITNR := `git log -n 1 --format=%H`
-+#DIRTY := `git diff-index --quiet HEAD || echo '-dirty'`
-+#LOCAL_CFLAGS += -DCOMMIT="${COMMITNR}${DIRTY}"
- 
- 
--- 
-2.1.4
-
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
index c3746a100f..5a0257305c 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
 	bool "xf86-video-imx-viv"
 	depends on BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
+	depends on BR2_PACKAGE_IMX_GPU_G2D
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3d
 	select BR2_PACKAGE_MESA3D # Needed in order to compile xorg with glx/dri
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
@@ -32,3 +33,9 @@ comment "xf86-video-imx-viv depends on imx-gpu-viv with X11 output"
 	depends on BR2_arm
 	depends on !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1
+
+comment "xf86-video-imx-viv depends on imx-gpu-g2d"
+	depends on BR2_arm
+	depends on !BR2_PACKAGE_IMX_GPU_G2D
+	depends on BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
index 7d7da84e6b..be41cb091b 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
@@ -1 +1 @@
-sha256	3eed38193e31bb5ba8d2c817bd9b4f6e2fe7540d2cab36de9098cb4f11946a9f  xserver-xorg-video-imx-viv-5.0.11.p8.6.tar.gz
+sha256	61b3a7a22f80d1cbc797c329615e1699f3906c9261de7eabcf0de2bf2399de55  xdriver_xf86-video-imx-viv-rel_imx_4.9.x_1.0.0_ga.tar.gz
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
index b31d98fbf4..222d74ac4b 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = 5.0.11.p8.6
-XDRIVER_XF86_VIDEO_IMX_VIV_SITE = $(FREESCALE_IMX_SITE)
-XDRIVER_XF86_VIDEO_IMX_VIV_SOURCE = xserver-xorg-video-imx-viv-$(XDRIVER_XF86_VIDEO_IMX_VIV_VERSION).tar.gz
-XDRIVER_XF86_VIDEO_IMX_VIV_DEPENDENCIES = imx-gpu-viv xserver_xorg-server \
+XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = rel_imx_4.9.x_1.0.0_ga
+XDRIVER_XF86_VIDEO_IMX_VIV_SITE = https://source.codeaurora.org/external/imx/xf86-video-imx-vivante
+XDRIVER_XF86_VIDEO_IMX_VIV_SITE_METHOD = git
+XDRIVER_XF86_VIDEO_IMX_VIV_DEPENDENCIES = imx-gpu-viv imx-gpu-g2d xserver_xorg-server \
 	xproto_xproto xproto_xf86driproto libdrm
 XDRIVER_XF86_VIDEO_IMX_VIV_LICENSE = MIT
 XDRIVER_XF86_VIDEO_IMX_VIV_LICENSE_FILES = COPYING-MIT
@@ -17,7 +17,7 @@ XDRIVER_XF86_VIDEO_IMX_VIV_MAKE_CMD = $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)
 define XDRIVER_XF86_VIDEO_IMX_VIV_BUILD_CMDS
 	$(XDRIVER_XF86_VIDEO_IMX_VIV_MAKE_CMD) sysroot=$(STAGING_DIR) \
 		BUSID_HAS_NUMBER=1 BUILD_IN_YOCTO=1 XSERVER_GREATER_THAN_13=1 \
-		CFLAGS="$(TARGET_CFLAGS) -I$(@D)/DRI_1.10.4/src"
+		CFLAGS="$(TARGET_CFLAGS)"
 endef
 
 define XDRIVER_XF86_VIDEO_IMX_VIV_INSTALL_STAGING_CMDS
-- 
2.15.1
