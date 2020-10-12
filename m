From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Oct 2020 22:33:11 +0200
Subject: [Buildroot] [git commit] configs/mx6cubox: bump U-Boot version
Message-ID: <20201012202210.5D8DA814CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a59973f116c6a360ed787ae9e7a00fc54a3df20a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 2020.04 version, the enumeration of MMC has changed, so the boot
script must be updated

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/solidrun/mx6cubox/boot.scr.txt | 6 +++---
 configs/mx6cubox_defconfig           | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/solidrun/mx6cubox/boot.scr.txt b/board/solidrun/mx6cubox/boot.scr.txt
index 7a8aa4bd54..e4cf814783 100644
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
index dc26758efb..2d711dc568 100644
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
