From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 16:11:24 +0200
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-imx: fix
 sdma/vpu firmware install path
Message-ID: <20200711140759.71B3A866EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa0c1e050635738be069814ac402168a591a8c00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In a patch set that did not get in for other reasons, Sebastien proposed
to fix the install path directory of the sdma and vpu firmware code [1]:

	"Mainline and NXP kernels expect the sdma firmware to be in
	/lib/firmware/imx/sdma so fix the install path [...]"

By looking at the code, I believe this is correct even though I have no
means to test it.

[1] http://lists.busybox.net/pipermail/buildroot/2020-June/284875.html

Suggested-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 6beacc0913..beaf6ef779 100644
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
