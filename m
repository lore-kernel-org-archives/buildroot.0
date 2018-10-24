From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 23 Oct 2018 22:43:12 -0400
Subject: [Buildroot] [PATCH 3/3] arm-trusted-firmware: replace hard-coded
 arm64 with MKIMAGE_ARCH
In-Reply-To: <1540348992-3846-1-git-send-email-danomimanchego123@gmail.com>
References: <1540348992-3846-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1540348992-3846-2-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We already use $(MKIMAGE_ARCH) in lots of places; use it here too.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index f353d56..23f4936 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -81,7 +81,7 @@ define ARM_TRUSTED_FIRMWARE_BL31_UBOOT_BUILD
 	BASE_ADDR=$$($(TARGET_READELF) -h $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/bl31/bl31.elf | \
 	             sed -r '/^  Entry point address:\s*(.*)/!d; s//\1/') && \
 	$(MKIMAGE) \
-		-A arm64 -O arm-trusted-firmware -C none \
+		-A $(MKIMAGE_ARCH) -O arm-trusted-firmware -C none \
 		-a $${BASE_ADDR} -e $${BASE_ADDR} \
 		-d $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/bl31.bin \
 		$(ARM_TRUSTED_FIRMWARE_IMG_DIR)/atf-uboot.ub
-- 
2.7.4
