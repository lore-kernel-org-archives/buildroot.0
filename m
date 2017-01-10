From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Tue, 10 Jan 2017 13:06:31 -0200
Subject: [Buildroot] [PATCH] configs/mx6sx_udoo_neo: Bump to U-Boot 2017.01
Message-ID: <1484060791-32174-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to U-Boot 2017.01, which supports mx6sx_udoo_neo by default.

Remove the U-Boot patch that we used for the previous version.

Also adjust the 'fdtfile' name as it has been changed in U-Boot
mainline.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 board/udoo/neo/boot.scr.txt                  |   2 +-
 board/udoo/neo/patches/uboot/0001-udoo.patch | 691 ---------------------------
 configs/mx6sx_udoo_neo_defconfig             |   2 +-
 3 files changed, 2 insertions(+), 693 deletions(-)
 delete mode 100644 board/udoo/neo/patches/uboot/0001-udoo.patch

diff --git a/board/udoo/neo/boot.scr.txt b/board/udoo/neo/boot.scr.txt
index f647db3..7a8aa4b 100644
--- a/board/udoo/neo/boot.scr.txt
+++ b/board/udoo/neo/boot.scr.txt
@@ -2,6 +2,6 @@ setenv finduuid "part uuid mmc 0:1 uuid"
 run finduuid
 run findfdt
 setenv bootargs "console=ttymxc0,115200 root=PARTUUID=${uuid} rootwait rootfstype=ext4"
-load mmc 0:1 ${fdt_addr} boot/${fdt_file}
+load mmc 0:1 ${fdt_addr} boot/${fdtfile}
 load mmc 0:1 ${loadaddr} boot/zImage
 bootz ${loadaddr} - ${fdt_addr}
diff --git a/board/udoo/neo/patches/uboot/0001-udoo.patch b/board/udoo/neo/patches/uboot/0001-udoo.patch
deleted file mode 100644
index ec1e00d..0000000
diff --git a/configs/mx6sx_udoo_neo_defconfig b/configs/mx6sx_udoo_neo_defconfig
index 1de19c0..a465eb9 100644
--- a/configs/mx6sx_udoo_neo_defconfig
+++ b/configs/mx6sx_udoo_neo_defconfig
@@ -13,7 +13,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="udoo_neo"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.01"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
-- 
2.7.4
