From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Date: Sun, 16 Feb 2020 22:19:34 +0100
Subject: [Buildroot] [PATCH 1/4] configs/beeelink_gs1: bump to ATF v2.2
Message-ID: <20200216211937.27200-1-peron.clem@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The WDT workaround patch has been upstreamed.

Bump to the new ATF version and drop the patch.

Signed-off-by: Cl?ment P?ron <peron.clem@gmail.com>
---
 ...er-common-use-r_wdog-instead-of-wdog.patch | 39 -------------------
 configs/beelink_gs1_defconfig                 |  2 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 board/beelink/gs1/patches/arm-trusted-firmware/0001-plat-allwinner-common-use-r_wdog-instead-of-wdog.patch

diff --git a/board/beelink/gs1/patches/arm-trusted-firmware/0001-plat-allwinner-common-use-r_wdog-instead-of-wdog.patch b/board/beelink/gs1/patches/arm-trusted-firmware/0001-plat-allwinner-common-use-r_wdog-instead-of-wdog.patch
deleted file mode 100644
index 9443fdd56837..000000000000
--- a/board/beelink/gs1/patches/arm-trusted-firmware/0001-plat-allwinner-common-use-r_wdog-instead-of-wdog.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 523ab5be1a84e9aa15fb62c3a15a6338b01d3961 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
-Date: Tue, 9 Apr 2019 00:15:06 +0200
-Subject: [PATCH] plat: allwinner: common: use r_wdog instead of wdog
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Some Allwinner H6 has a broken watchdog that doesn't
-make the soc reboot.
-
-Use the R_WATCHDOG instead.
-
-Signed-off-by: Cl?ment P?ron <peron.clem@gmail.com>
-Change-Id: Ie95cc30a80ed517b60b30d6bc2e655a1b53f18ba
----
- plat/allwinner/common/sunxi_pm.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/plat/allwinner/common/sunxi_pm.c b/plat/allwinner/common/sunxi_pm.c
-index 1d2dc938..13e13532 100644
---- a/plat/allwinner/common/sunxi_pm.c
-+++ b/plat/allwinner/common/sunxi_pm.c
-@@ -20,9 +20,9 @@
- #include <sunxi_mmap.h>
- #include <sunxi_private.h>
- 
--#define SUNXI_WDOG0_CTRL_REG		(SUNXI_WDOG_BASE + 0x0010)
--#define SUNXI_WDOG0_CFG_REG		(SUNXI_WDOG_BASE + 0x0014)
--#define SUNXI_WDOG0_MODE_REG		(SUNXI_WDOG_BASE + 0x0018)
-+#define SUNXI_WDOG0_CTRL_REG		(SUNXI_R_WDOG_BASE + 0x0010)
-+#define SUNXI_WDOG0_CFG_REG		(SUNXI_R_WDOG_BASE + 0x0014)
-+#define SUNXI_WDOG0_MODE_REG		(SUNXI_R_WDOG_BASE + 0x0018)
- 
- #define mpidr_is_valid(mpidr) ( \
- 	MPIDR_AFFLVL3_VAL(mpidr) == 0 && \
--- 
-2.20.1
-
diff --git a/configs/beelink_gs1_defconfig b/configs/beelink_gs1_defconfig
index 80b111aee730..e5354168db5c 100644
--- a/configs/beelink_gs1_defconfig
+++ b/configs/beelink_gs1_defconfig
@@ -25,7 +25,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.2"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_h6"
 
 # Bootloader
-- 
2.20.1
