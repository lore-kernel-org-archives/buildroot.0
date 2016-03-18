From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 23:15:50 +0100
Subject: [Buildroot] [git commit] imx-gpu-viv: add apitrace dependency on
	libpng
Message-ID: <20160318223205.40FA280800@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88d244a0ebdf260cdcf3d13e2eb540e3d5a8d557
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/ce73c200

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-gpu-viv/Config.in      | 1 +
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index c386765..20759b1 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -62,6 +62,7 @@ config BR2_PACKAGE_PROVIDES_LIBOPENVG
 config BR2_PACKAGE_IMX_GPU_VIV_APITRACE
 	bool "install apitrace tools"
 	select BR2_PACKAGE_IMX_GPU_VIV_G2D
+	select BR2_PACKAGE_LIBPNG
 	help
 	  Copy the apitrace tool to the target. Apitrace consists
 	  of a set of tools to trace, replay and/or inspect OpenGL,
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 84ac53f..b51a7af 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -80,6 +80,7 @@ define IMX_GPU_VIV_INSTALL_STAGING_CMDS
 endef
 
 ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_APITRACE),y)
+IMX_GPU_VIV_DEPENDENCIES += libpng
 ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
 define IMX_GPU_VIV_INSTALL_APITRACE
 	cp -dpfr $(@D)/apitrace/x11/usr/bin/* $(TARGET_DIR)/usr/bin/
