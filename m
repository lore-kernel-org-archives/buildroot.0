From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 23 Oct 2018 22:43:11 -0400
Subject: [Buildroot] [PATCH 2/3] arm-trusted-firmware: replace mkimage
 invocation with MKIMAGE
Message-ID: <1540348992-3846-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We already use $(MKIMAGE) instead of $(HOST_DIR)/bin/mkimage in xvisor, linux,
and cpio; use it here too.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 19f7c4c..f353d56 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -80,7 +80,7 @@ define ARM_TRUSTED_FIRMWARE_BL31_UBOOT_BUILD
 # Get the entry point address from the elf.
 	BASE_ADDR=$$($(TARGET_READELF) -h $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/bl31/bl31.elf | \
 	             sed -r '/^  Entry point address:\s*(.*)/!d; s//\1/') && \
-	$(HOST_DIR)/bin/mkimage \
+	$(MKIMAGE) \
 		-A arm64 -O arm-trusted-firmware -C none \
 		-a $${BASE_ADDR} -e $${BASE_ADDR} \
 		-d $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/bl31.bin \
-- 
2.7.4
