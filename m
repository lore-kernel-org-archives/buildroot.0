From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 15 Apr 2020 18:18:26 +0200
Subject: [Buildroot] [PATCH 2/7] package/freescale-imx/firmware-imx: add
 support for i.MX8M Nano
In-Reply-To: <20200415161831.2093348-1-gary.bisson@boundarydevices.com>
References: <20200415161831.2093348-1-gary.bisson@boundarydevices.com>
Message-ID: <20200415161831.2093348-3-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This CPU requires the same (LP)DDR training binaries as i.MX8M Mini.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 246bfdfaa1..cd0dafb3de 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -18,7 +18,7 @@ define FIRMWARE_IMX_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
 endef
 
-ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM),y)
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN),y)
 FIRMWARE_IMX_INSTALL_IMAGES = YES
 FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
 define FIRMWARE_IMX_PREPARE_LPDDR4_FW
-- 
2.25.1
