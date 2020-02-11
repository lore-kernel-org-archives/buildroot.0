From: Gervais, Francois <FGervais@distech-controls.com>
Date: Tue, 11 Feb 2020 20:22:00 +0000
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: add missing
 qstrip
Message-ID: <DM6PR01MB584983C3A449D028309B3DACF3180@DM6PR01MB5849.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add missing qstrip wrapping to the new
BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS option.

Signed-off-by: Francois Gervais <fgervais@distech-controls.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index bf1ac46cf6..34737018aa 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -140,7 +140,7 @@ endef
 endif

 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += \
-       $(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS)
+       $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS))

 define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
        $(ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL)
-- 
2.20.1
