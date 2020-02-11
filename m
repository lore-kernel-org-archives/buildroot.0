From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2020 23:37:31 +0100
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: add missing
 qstrip
Message-ID: <20200211223133.ED8478DB67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a621c9b6c80df0bb222a1cd9adcf5ab85cc66a75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing qstrip wrapping to the new
BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS option.

Signed-off-by: Francois Gervais <fgervais@distech-controls.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
-	$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS)
+	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS))
 
 define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 	$(ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL)
