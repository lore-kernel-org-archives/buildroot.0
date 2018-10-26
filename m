From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Oct 2018 21:26:27 +0200
Subject: [Buildroot] [git commit] arm-trusted-firmware: replace mkimage
 invocation with MKIMAGE
Message-ID: <20181026192512.22DF98911F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22ea9d5a87254555f985c10a7702dd752f3dc8b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We already use $(MKIMAGE) instead of $(HOST_DIR)/bin/mkimage in xvisor, linux,
and cpio; use it here too.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 19f7c4c80a..f353d56448 100644
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
