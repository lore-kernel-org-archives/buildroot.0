From: Maeva Manuel <maeva.manuel@oss.nxp.com>
Date: Fri, 20 Mar 2020 17:31:55 +0100
Subject: [Buildroot] [PATCH 2/5] package/freescale-imx/firmware-imx: bump
 version to 8.5
In-Reply-To: <20200320163158.18341-1-maeva.manuel@oss.nxp.com>
References: <20200320163158.18341-1-maeva.manuel@oss.nxp.com>
Message-ID: <20200320163158.18341-3-maeva.manuel@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package needed to be updated to be aligned with NXP
BSP 4.19.35_1.1.0

This newer 8.5 version no longer include ahab-container images.
Those images are now in a separate imx-seco package.

Signed-off-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
Reviewed-by: Julien Olivain <julien.olivain@oss.nxp.com>
---
 .../freescale-imx/firmware-imx/firmware-imx.hash |  2 +-
 .../freescale-imx/firmware-imx/firmware-imx.mk   | 16 +---------------
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index 85f203311f..7b9f722881 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 c115d5d0d115fc14754671bd2428f672f9f99677988588accef2fbca2c3f749c  firmware-imx-8.1.1.bin
+sha256 45b0a7392e7a4b2e6c7e1cb988dd660ff3f8cd465afdf796ff840a00db08389d  firmware-imx-8.5.bin
 sha256 69d19847bac9af7f9e832170a15138f5ef144d8064413434114d75a68982cc9c  EULA
 sha256 6467f2e81d06b19fe541de49bdba32a9a205e8d1c230220fe24247b48672cb46  COPYING
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 7f14062f89..963120fa9a 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 8.1.1
+FIRMWARE_IMX_VERSION = 8.5
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
@@ -45,22 +45,8 @@ define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
 	cp $(@D)/firmware/hdmi/cadence/signed_hdmi_imx8m.bin \
 		$(BINARIES_DIR)/signed_hdmi_imx8m.bin
 endef
-else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8),y)
-FIRMWARE_IMX_INSTALL_IMAGES = YES
-define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
-	# SECO firmware is needed when generating imx8-boot-sd.bin which
-	# is done in post-image script.
-	cp $(@D)/firmware/seco/mx8qm-ahab-container.img \
-		$(BINARIES_DIR)/ahab-container.img
-endef
 else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
 FIRMWARE_IMX_INSTALL_IMAGES = YES
-define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
-	# SECO firmware is needed when generating imx8-boot-sd.bin which
-	# is done in post-image script.
-	cp $(@D)/firmware/seco/mx8qx-ahab-container.img \
-		$(BINARIES_DIR)/ahab-container.img
-endef
 define FIRMWARE_IMX_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/firmware/vpu/vpu_fw_imx8_dec.bin \
 		$(TARGET_DIR)/lib/firmware/vpu/vpu_fw_imx8_dec.bin
-- 
2.17.1
