From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  1 Jan 2017 14:34:08 +0200
Subject: [Buildroot] [PATCH] firmware-imx: remove Makefile from target
Message-ID: <da4f2968d62c1c828196982058b05fdcb72b7cab.1483274048.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 1893929ed1f6..08fb4636a099 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -26,6 +26,7 @@ define FIRMWARE_IMX_INSTALL_TARGET_CMDS
 	cp -r $(@D)/firmware/epdc $(TARGET_DIR)/lib/firmware/imx
 	mv $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
 		$(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw
+	rm $(TARGET_DIR)/lib/firmware/imx/epdc/fsl-epdc.mk
 endef
 
 $(eval $(generic-package))
-- 
2.11.0
