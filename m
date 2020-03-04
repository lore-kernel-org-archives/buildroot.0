From: Maeva Manuel <maeva.manuel@oss.nxp.com>
Date: Wed,  4 Mar 2020 17:14:26 +0100
Subject: [Buildroot] [PATCH 1/2] package/freescale-imx/firmware-imx: add
 support for i.MX8QM
Message-ID: <20200304161427.8180-1-maeva.manuel@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
Tested-by: Julien Olivain <julien.olivain@oss.nxp.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index b251fcda2a..7f14062f89 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -45,6 +45,14 @@ define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
 	cp $(@D)/firmware/hdmi/cadence/signed_hdmi_imx8m.bin \
 		$(BINARIES_DIR)/signed_hdmi_imx8m.bin
 endef
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8),y)
+FIRMWARE_IMX_INSTALL_IMAGES = YES
+define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
+	# SECO firmware is needed when generating imx8-boot-sd.bin which
+	# is done in post-image script.
+	cp $(@D)/firmware/seco/mx8qm-ahab-container.img \
+		$(BINARIES_DIR)/ahab-container.img
+endef
 else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
 FIRMWARE_IMX_INSTALL_IMAGES = YES
 define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
-- 
2.17.1
