From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Feb 2020 09:43:09 +0100
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-imx:
 install video encode decode firwmare to target for imx8x
Message-ID: <20200204083212.840338A30D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=229d9054237e47c48116d3da187d2cbc4f2c1239
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Refik Tuzakli <tuzakli.refik@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index c9040e1853..b251fcda2a 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -53,6 +53,12 @@ define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
 	cp $(@D)/firmware/seco/mx8qx-ahab-container.img \
 		$(BINARIES_DIR)/ahab-container.img
 endef
+define FIRMWARE_IMX_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/firmware/vpu/vpu_fw_imx8_dec.bin \
+		$(TARGET_DIR)/lib/firmware/vpu/vpu_fw_imx8_dec.bin
+	$(INSTALL) -D -m 0644 $(@D)/firmware/vpu/vpu_fw_imx8_enc.bin \
+		$(TARGET_DIR)/lib/firmware/vpu/vpu_fw_imx8_enc.bin
+endef
 else
 define FIRMWARE_IMX_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/lib/firmware/imx
