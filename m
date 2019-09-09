From: Maeva Manuel <maeva.manuel@nxp.com>
Date: Mon, 9 Sep 2019 12:15:00 +0000
Subject: [Buildroot] [PATCH 3/7] package/freescale-imx/imx-sc-firmware: bump
 to version 1.1 to support i.MX8QM
In-Reply-To: <20190909121525.13935-1-maeva.manuel@nxp.com>
References: <20190909121525.13935-1-maeva.manuel@nxp.com>
Message-ID: <20190909121525.13935-3-maeva.manuel@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maeva Manuel <maeva.manuel@nxp.com>
---
 package/freescale-imx/imx-sc-firmware/Config.in    |  2 +-
 .../imx-sc-firmware/imx-sc-firmware.mk             | 14 +++++++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-sc-firmware/Config.in b/package/freescale-imx/imx-sc-firmware/Config.in
index 4a22f72b1f..93dfeb1a68 100644
--- a/package/freescale-imx/imx-sc-firmware/Config.in
+++ b/package/freescale-imx/imx-sc-firmware/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_IMX_SC_FIRMWARE
 	bool "imx-sc-firmware"
-	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
 	help
 	  System Control Unit Firmware blobs for the Freescale i.MX8
 	  SoCs.
diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
index fac20d0c6f..08b562a054 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_SC_FIRMWARE_VERSION = 1.0
+IMX_SC_FIRMWARE_VERSION = 1.1
 IMX_SC_FIRMWARE_SITE = $(FREESCALE_IMX_SITE)
 IMX_SC_FIRMWARE_SOURCE = imx-sc-firmware-$(IMX_SC_FIRMWARE_VERSION).bin
 
@@ -18,10 +18,14 @@ endef
 
 IMX_SC_FIRMWARE_INSTALL_IMAGES = YES
 define IMX_SC_FIRMWARE_INSTALL_IMAGES_CMDS
-	# SCFW firmware is needed when generating imx8-boot-sd.bin which
-	# is done in post-image script.
-	cp $(@D)/mx8qx-mek-scfw-tcm.bin $(BINARIES_DIR)/mx8qx-mek-scfw-tcm.bin
-	cp $(@D)/mx8qx-val-scfw-tcm.bin $(BINARIES_DIR)/mx8qx-val-scfw-tcm.bin
+# SCFW firmware is needed when generating imx8-boot-sd.bin which
+# is done in post-image script.
+
+# For i.MX8QM support the SCFW needed is mx8qm-mek-scfw-tcm.bin
+# and mx8qm-val-scfw-tcm.bin
+# For i.MX8QXP support the SCFW needed is mx8qx-mek-scfw-tcm.bin
+# and mx8qx-val-scfw-tcm.bin
+cp $(@D)/*-scfw-tcm.bin $(BINARIES_DIR)/*-scfw-tcm.bin
 endef
 
 $(eval $(generic-package))
-- 
2.17.1
