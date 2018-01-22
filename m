From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jan 2018 22:30:25 +0100
Subject: [Buildroot] [git commit] firmware-imx: bump to version 7.2
Message-ID: <20180122213643.2BED17FB66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ce0b7d66c114a06ef6008c920f37f22c3f58633
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fsl-epdc.mk file is no longer shipped with the package.

Add license files hashes.

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 5 ++++-
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 3 +--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index f45b35a..ca8556f 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1 +1,4 @@
-sha256 9fa7c204a6ff8a30f2b5e8f9002d8c5736791e455dc137b952fa725dc0c3aeb8  firmware-imx-6.0.bin
+# Locally calculated
+sha256 3e107d83ed2367c9565250d6ff3903cc604bf4d9aa505391260ead0f51ceb8d9  firmware-imx-7.2.bin
+sha256 faf01d10e484879247963eb97d96622a980232e22a35e487dfe53b13708b686a  EULA
+sha256 0f34f6175247762e2e1c38319aadf657a53f00ce124e569dfc61b30451549e7a  COPYING
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 736ff89..630afca 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 6.0
+FIRMWARE_IMX_VERSION = 7.2
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
@@ -26,7 +26,6 @@ define FIRMWARE_IMX_INSTALL_TARGET_CMDS
 	cp -r $(@D)/firmware/epdc $(TARGET_DIR)/lib/firmware/imx
 	mv $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
 		$(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw
-	rm $(TARGET_DIR)/lib/firmware/imx/epdc/fsl-epdc.mk
 endef
 
 $(eval $(generic-package))
