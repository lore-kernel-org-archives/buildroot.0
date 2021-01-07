From: Romain Naour <romain.naour@gmail.com>
Date: Thu,  7 Jan 2021 12:04:49 +0100
Subject: [Buildroot] [RFC: 3/4] package/x11r7/xdriver_xf86-video-imx-viv:
 bump to version rel_imx_5.4.24_2.1.0
In-Reply-To: <20210107110450.4031102-1-romain.naour@gmail.com>
References: <20210107110450.4031102-1-romain.naour@gmail.com>
Message-ID: <20210107110450.4031102-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package needs to be updated to build with the NXP imx_5.4.x_2.1.0 release.

Don't override CFLAGS on the command line otherwise we loose some include paths
(ex: -I./vivante_gal).
CFLAGS is already provided by TARGET_CONFIGURE_OPTS in make environment.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: J?r?me Pouiller <jezz@sysmic.org>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
---

Note: xdriinfo report a too old libGL library
 # xdriinfo
 libGL is too old.
---
 .../xdriver_xf86-video-imx-viv.hash                           | 2 +-
 .../xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
index e5d46c86f3..7295061d36 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	61b3a7a22f80d1cbc797c329615e1699f3906c9261de7eabcf0de2bf2399de55  xdriver_xf86-video-imx-viv-rel_imx_4.9.x_1.0.0_ga.tar.gz
+sha256  2f927114e8b888237f1a15830ff5dbde3990fc737227b7a2b94dc6fdbcd7fe19  xdriver_xf86-video-imx-viv-rel_imx_5.4.24_2.1.0.tar.gz
 sha256  9d3e373f0440cc0c58853e963636a7c1ffda9308ec5f30ebe9adfb9c16a8a1e4  COPYING-MIT
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
index 0913427542..9aa2b50cad 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = rel_imx_4.9.x_1.0.0_ga
+XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = rel_imx_5.4.24_2.1.0
 XDRIVER_XF86_VIDEO_IMX_VIV_SITE = https://source.codeaurora.org/external/imx/xf86-video-imx-vivante
 XDRIVER_XF86_VIDEO_IMX_VIV_SITE_METHOD = git
 XDRIVER_XF86_VIDEO_IMX_VIV_DEPENDENCIES = imx-gpu-viv imx-gpu-g2d xserver_xorg-server \
@@ -17,7 +17,7 @@ XDRIVER_XF86_VIDEO_IMX_VIV_MAKE_CMD = $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)
 define XDRIVER_XF86_VIDEO_IMX_VIV_BUILD_CMDS
 	$(XDRIVER_XF86_VIDEO_IMX_VIV_MAKE_CMD) sysroot=$(STAGING_DIR) \
 		BUSID_HAS_NUMBER=1 BUILD_IN_YOCTO=1 XSERVER_GREATER_THAN_13=1 \
-		CFLAGS="$(TARGET_CFLAGS)"
+		SDKTARGETSYSROOT="$(STAGING_DIR)"
 endef
 
 define XDRIVER_XF86_VIDEO_IMX_VIV_INSTALL_STAGING_CMDS
-- 
2.25.4
