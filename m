From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 26 Jan 2018 22:30:30 +0100
Subject: [Buildroot] [PATCH 1/5] arm-trusted-firmware: simplify release dir
 path
In-Reply-To: <1517002234-17608-1-git-send-email-luca@lucaceresoli.net>
References: <1517002234-17608-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1517002234-17608-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The path to the binary images is very long. Since we are about to make
a larger use of it, let's use a variable to make it somewhat shorter.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 4bac916e3108..212bb5049f2b 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -25,6 +25,7 @@ endif
 ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES = YES
 
 ARM_TRUSTED_FIRMWARE_PLATFORM = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM))
+ARM_TRUSTED_FIRMWARE_IMG_DIR = $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/release
 
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
@@ -82,7 +83,7 @@ define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 endef
 
 define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
-	cp -dpf $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/release/*.bin $(BINARIES_DIR)/
+	cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/*.bin $(BINARIES_DIR)/
 endef
 
 # Configuration check
-- 
2.7.4
