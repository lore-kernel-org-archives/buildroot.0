From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Oct 2018 21:26:33 +0200
Subject: [Buildroot] [git commit] arm-trusted-firmware: replace hard-coded
 arm64 with MKIMAGE_ARCH
Message-ID: <20181026192512.2F7778911F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a216a344c4bd3efdf2aa5c22b126d5bb759242de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We already use $(MKIMAGE_ARCH) in lots of places; use it here too.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index f353d56448..23f493653d 100644
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
