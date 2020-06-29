From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Mon, 29 Jun 2020 10:25:48 +0200
Subject: [Buildroot] [PATCH v2 4/4] package/freescale-imx/firmware-imx: Fix
 sdma/vpu firmware install path
In-Reply-To: <1593419148-26821-1-git-send-email-stephane.viau@oss.nxp.com>
References: <1593419148-26821-1-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <1593419148-26821-5-git-send-email-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In a patch set that did not get in for other reasons, Sebastien proposed
to fix the install path directory of the sdma and vpu firmware code [1]:

	"Mainline and NXP kernels expect the sdma firmware to be in
	/lib/firmware/imx/sdma so fix the install path [...]"

By looking at the code, I believe this is correct even though I have no
means to test it.

[1] http://lists.busybox.net/pipermail/buildroot/2020-June/284875.html

Suggested-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index d227eb2..ac22d2c 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -97,7 +97,7 @@ FIRMWARE_IMX_INSTALL_TARGET = YES
 
 define FIRMWARE_IMX_INSTALL_TARGET_SDMA_FW
 	mkdir -p $(TARGET_DIR)/lib/firmware/imx
-	cp -r $(@D)/firmware/vpu $(TARGET_DIR)/lib/firmware
+	cp -r $(@D)/firmware/vpu $(TARGET_DIR)/lib/firmware/imx
 endef
 endif
 
@@ -106,7 +106,7 @@ FIRMWARE_IMX_INSTALL_TARGET = YES
 
 define FIRMWARE_IMX_INSTALL_TARGET_VPU_FW
 	mkdir -p $(TARGET_DIR)/lib/firmware/imx
-	cp -r $(@D)/firmware/vpu $(TARGET_DIR)/lib/firmware
+	cp -r $(@D)/firmware/vpu $(TARGET_DIR)/lib/firmware/imx
 endef
 endif
 
-- 
2.7.4
