From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 11 Oct 2020 17:32:51 +0200
Subject: [Buildroot] [PATCH] configs/mx6cubox: bump U-Boot version
Message-ID: <20201011153251.660778-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

since 2020.04 version, the enumeration of MMC has changed,
so the boot script must be updated

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 board/solidrun/mx6cubox/boot.scr.txt | 6 +++---
 configs/mx6cubox_defconfig           | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/solidrun/mx6cubox/boot.scr.txt b/board/solidrun/mx6cubox/boot.scr.txt
index 7a8aa4bd5..e4cf81478 100644
--- a/board/solidrun/mx6cubox/boot.scr.txt
+++ b/board/solidrun/mx6cubox/boot.scr.txt
@@ -1,7 +1,7 @@
-setenv finduuid "part uuid mmc 0:1 uuid"
+setenv finduuid "part uuid mmc 1:1 uuid"
 run finduuid
 run findfdt
 setenv bootargs "console=ttymxc0,115200 root=PARTUUID=${uuid} rootwait rootfstype=ext4"
-load mmc 0:1 ${fdt_addr} boot/${fdtfile}
-load mmc 0:1 ${loadaddr} boot/zImage
+load mmc 1:1 ${fdt_addr} boot/${fdtfile}
+load mmc 1:1 ${loadaddr} boot/zImage
 bootz ${loadaddr} - ${fdt_addr}
diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
index dc26758ef..2d711dc56 100644
--- a/configs/mx6cubox_defconfig
+++ b/configs/mx6cubox_defconfig
@@ -32,7 +32,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx6cuboxi"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.25.1
