From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Jun 2017 23:24:04 +0200
Subject: [Buildroot] [PATCH] pandaboard_defconfig: bump u-boot to 2017.05 to
	fix build with gcc 6
Message-ID: <20170616212404.18424-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The recent change to default to gcc 6 for the internal toolchain broke this
defconfig as the u-boot doesn't contain commit 9b2c282b34 (compiler*.h: sync
include/linux/compiler*.h with Linux 4.5-rc6) which was added during the
2016.03 cycle.

Fix the build by bumping u-boot to 2017.05.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/pandaboard_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
index 49747e070f..9b7c962de2 100644
--- a/configs/pandaboard_defconfig
+++ b/configs/pandaboard_defconfig
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.05"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="omap4_panda"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.11.0
