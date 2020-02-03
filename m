From: Refik Tuzakli <tuzakli.refik@gmail.com>
Date: Mon,  3 Feb 2020 22:31:52 +0300
Subject: [Buildroot] [PATCH v2 4/7] install video encode decode firwmare
 into target for imx8x
In-Reply-To: <20200203193155.12657-1-tuzakli.refik@gmail.com>
References: <20200203193155.12657-1-tuzakli.refik@gmail.com>
Message-ID: <20200203193155.12657-4-tuzakli.refik@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Refik Tuzakli <tuzakli.refik@gmail.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index c9040e1853..f8d5c51bfe 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -53,6 +53,11 @@ define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
 	cp $(@D)/firmware/seco/mx8qx-ahab-container.img \
 		$(BINARIES_DIR)/ahab-container.img
 endef
+define FIRMWARE_IMX_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/lib/firmware/vpu
+	cp -r $(@D)/firmware/vpu/vpu_fw_imx8_dec.bin $(TARGET_DIR)/lib/firmware/vpu
+	cp -r $(@D)/firmware/vpu/vpu_fw_imx8_enc.bin $(TARGET_DIR)/lib/firmware/vpu
+endef
 else
 define FIRMWARE_IMX_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/lib/firmware/imx
-- 
2.17.1
