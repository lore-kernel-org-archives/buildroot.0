From: sunil at amarulasolutions.com <sunil@amarulasolutions.com>
Date: Thu, 13 Feb 2020 16:14:44 +0530
Subject: [Buildroot] [PATCH v2 3/4] boot/arm-trusted-firmware: add support
 for rockchip rk3399
In-Reply-To: <1581590685-31680-1-git-send-email-sunil@amarulasolutions.com>
References: <1581590685-31680-1-git-send-email-sunil@amarulasolutions.com>
Message-ID: <1581590685-31680-4-git-send-email-sunil@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Suniel Mahesh <sunil@amarulasolutions.com>

Add support for TF-A image builds for Rockchip rk3399 chip.

Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
---
Changes for v2:
- no changes
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 3473701..cc757b5 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -90,6 +90,10 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += MV_DDR_PATH=$(MV_DDR_MARVELL_DIR)
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mv-ddr-marvell
 endif
 
+ifeq ($(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM)),rk3399)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-arm-gnu-a-toolchain
+endif
+
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
-- 
2.7.4
