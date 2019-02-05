From: kostap at marvell.com <kostap@marvell.com>
Date: Tue, 5 Feb 2019 09:40:31 +0200
Subject: [Buildroot] [PATCH 3/3] boot: arm-trusted-firmware: add support for
 Marvell Armada 3700
In-Reply-To: <20190205074031.7989-1-kostap@marvell.com>
References: <20190205074031.7989-1-kostap@marvell.com>
Message-ID: <20190205074031.7989-4-kostap@marvell.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Konstantin Porotchkin <kostap@marvell.com>

Add support for TF-A image builds for Marvell Armada 3700 family

Signed-off-by: Konstantin Porotchkin <kostap@marvell.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 23f493653d..8d074dd87f 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -52,6 +52,13 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += MV_DDR_PATH=$(MV_DDR_MARVELL_DIR)
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mv-ddr-marvell
 endif
 
+ifeq ($(BR2_TARGET_A3700_UTILS_MARVELL),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += WTP=$(A3700_UTILS_MARVELL_DIR)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += CROSS_CM3=$(HOST_DIR)/opt/gcc-arm-none-eabi/bin/arm-none-eabi-
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += a3700-utils-marvell
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-arm-gnu-rm-toolchain
+endif
+
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
-- 
2.17.1
