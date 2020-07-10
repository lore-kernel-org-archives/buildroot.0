From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Fri, 10 Jul 2020 14:00:43 +0200
Subject: [Buildroot] [PATCH v3 2/4] package/freescale-imx/firmware-imx: Fix
 sdma/vpu firmware install path
In-Reply-To: <1594382445-4464-1-git-send-email-stephane.viau@oss.nxp.com>
References: <1594382445-4464-1-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <1594382445-4464-3-git-send-email-stephane.viau@oss.nxp.com>
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
 package/freescale-imx/firmware-imx/firmware-imx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 55ca6fc..c4ac5f7 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -95,7 +95,7 @@ else
 define FIRMWARE_IMX_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/lib/firmware/imx
 	for blobdir in $(FIRMWARE_IMX_BLOBS); do \
-		cp -r $(@D)/firmware/$${blobdir} $(TARGET_DIR)/lib/firmware; \
+		cp -r $(@D)/firmware/$${blobdir} $(TARGET_DIR)/lib/firmware/imx; \
 	done
 	cp -r $(@D)/firmware/epdc $(TARGET_DIR)/lib/firmware/imx
 	mv $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
-- 
2.7.4
