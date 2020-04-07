From: Laurent Gauthier (OSS) <laurent.gauthier_1@oss.nxp.com>
Date: Tue,  7 Apr 2020 22:20:43 +0200
Subject: [Buildroot] [PATCH 2/2] package/freescale-imx/imx-vpuwrap: bump
 version to 4.5.1
In-Reply-To: <20200407202044.9924-1-laurent.gauthier_1@oss.nxp.com>
References: <20200407202044.9924-1-laurent.gauthier_1@oss.nxp.com>
Message-ID: <20200407202044.9924-3-laurent.gauthier_1@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Laurent GAUTHIER <laurent.gauthier_1@oss.nxp.com>

To match NXP BSP 4.19.35_1.1.0 release:
https://source.codeaurora.org/external/imx/meta-fsl-bsp-release/tree/imx/meta-bsp/recipes-multimedia/imx-vpuwrap?h=warrior-4.19.35-1.1.0

Reviewed-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
Reviewed-by: Julien Olivain <julien.olivain@oss.nxp.com>
Signed-off-by: Laurent GAUTHIER <laurent.gauthier_1@oss.nxp.com>
Signed-off-by: Laurent Gauthier <laurent.gauthier_1@oss.nxp.com>
---
 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash | 6 +++---
 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk   | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash
index 7a640374d7..80eaff6047 100644
--- a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash
+++ b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  5c08b4b7c771404c998779f0e27a75564b57958d463e2df152c910d76cca9e44  imx-vpuwrap-4.3.5.bin
-sha256  78696664f7afe7f2b081c99af60082d6403fab935b1b10056ed41aec123ff7fa  COPYING
-sha256  fc93f26e4197b9240c327ce26ae6e02123f022423d4704c7b0448a37372cf2a2  EULA
+sha256  a3b05081be1e078dbe589bac1c51d02a00ce591e13693fea8eb695f46fc5eb46  imx-vpuwrap-4.5.1.bin
+sha256  d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
+sha256  9665930f69c0b6f4a4c055d7fe2b8ee563e771efbc83892abb1955e61492cdf7  EULA
diff --git a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
index fdad3a5f2b..cb3da9f9c3 100644
--- a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
+++ b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
@@ -4,17 +4,19 @@
 #
 ################################################################################
 
-IMX_VPUWRAP_VERSION = 4.3.5
+IMX_VPUWRAP_VERSION = 4.5.1
 IMX_VPUWRAP_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPUWRAP_SOURCE = imx-vpuwrap-$(IMX_VPUWRAP_VERSION).bin
 IMX_VPUWRAP_INSTALL_STAGING = YES
+IMX_VPUWRAP_AUTORECONF = YES
+IMX_VPUWRAP_MAKE_ENV = PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"
 
 ifeq ($(BR2_PACKAGE_IMX_VPU),y)
-IMX_VPUWRAP_DEPENDENCIES = imx-vpu
+IMX_VPUWRAP_DEPENDENCIES = host-pkgconf imx-vpu
 endif
 
 ifeq ($(BR2_PACKAGE_IMX_VPU_HANTRO),y)
-IMX_VPUWRAP_DEPENDENCIES = imx-vpu-hantro
+IMX_VPUWRAP_DEPENDENCIES = host-pkgconf imx-vpu-hantro
 endif
 
 IMX_VPUWRAP_LICENSE = NXP Semiconductor Software License Agreement
-- 
2.17.1
