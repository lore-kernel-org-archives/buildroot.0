From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Jan 2017 17:46:09 +0100
Subject: [Buildroot] [git commit] firmware-imx: remove Makefile from target
Message-ID: <20170104164617.86AA98005A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8872a5873e2c1e0afbc559ecdb2074cdf5bd23a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 1893929..08fb463 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -26,6 +26,7 @@ define FIRMWARE_IMX_INSTALL_TARGET_CMDS
 	cp -r $(@D)/firmware/epdc $(TARGET_DIR)/lib/firmware/imx
 	mv $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
 		$(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw
+	rm $(TARGET_DIR)/lib/firmware/imx/epdc/fsl-epdc.mk
 endef
 
 $(eval $(generic-package))
