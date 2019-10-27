From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 14:09:56 +0100
Subject: [Buildroot] [git commit] configs/stm32mp157_dk: rename to the
 sm32mp157c_dk2
Message-ID: <20191027130458.B0B1289105@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1505ba6d1f1cedc702b4b8a1ad55eba5fac27cce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

That is useful and needed for upcoming introducing stm32mp157a-dk1 board.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                                 |  2 +-
 DEVELOPERS                                                     |  4 ++--
 .../{stm32mp157-dk => stm32mp157c-dk2}/genimage.cfg            |  0
 .../{stm32mp157-dk => stm32mp157c-dk2}/linux.config            |  0
 .../overlay/boot/extlinux/extlinux.conf                        |  0
 ...-stm32mp1-configs-fix-checking-the-presence-of-an-env.patch |  0
 .../{stm32mp157-dk => stm32mp157c-dk2}/readme.txt              |  0
 .../{stm32mp157-dk => stm32mp157c-dk2}/uboot-fragment.config   |  0
 configs/{stm32mp157_dk_defconfig => stm32mp157c_dk2_defconfig} | 10 +++++-----
 9 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e4aa0bea4d..5466c4096d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -315,7 +315,7 @@ solidrun_macchiatobin_mainline_defconfig: { extends: .defconfig }
 solidrun_macchiatobin_marvell_defconfig: { extends: .defconfig }
 stm32f429_disco_defconfig: { extends: .defconfig }
 stm32f469_disco_defconfig: { extends: .defconfig }
-stm32mp157_dk_defconfig: { extends: .defconfig }
+stm32mp157c_dk2_defconfig: { extends: .defconfig }
 toradex_apalis_imx6_defconfig: { extends: .defconfig }
 ts4900_defconfig: { extends: .defconfig }
 ts5500_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 1dacbb6f30..39f238751e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2291,11 +2291,11 @@ F:	package/ascii-invaders/
 
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
-F:	board/stmicroelectronics/stm32mp157-dk/
+F:	board/stmicroelectronics/stm32mp157c-dk2/
 F:	boot/boot-wrapper-aarch64/
 F:	boot/grub2/
 F:	boot/gummiboot/
-F:	configs/stm32mp157_dk_defconfig
+F:	configs/stm32mp157c_dk2_defconfig
 F:	package/android-tools/
 F:	package/b43-firmware/
 F:	package/b43-fwcutter/
diff --git a/board/stmicroelectronics/stm32mp157-dk/genimage.cfg b/board/stmicroelectronics/stm32mp157c-dk2/genimage.cfg
similarity index 100%
rename from board/stmicroelectronics/stm32mp157-dk/genimage.cfg
rename to board/stmicroelectronics/stm32mp157c-dk2/genimage.cfg
diff --git a/board/stmicroelectronics/stm32mp157-dk/linux.config b/board/stmicroelectronics/stm32mp157c-dk2/linux.config
similarity index 100%
rename from board/stmicroelectronics/stm32mp157-dk/linux.config
rename to board/stmicroelectronics/stm32mp157c-dk2/linux.config
diff --git a/board/stmicroelectronics/stm32mp157-dk/overlay/boot/extlinux/extlinux.conf b/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf
similarity index 100%
rename from board/stmicroelectronics/stm32mp157-dk/overlay/boot/extlinux/extlinux.conf
rename to board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf
diff --git a/board/stmicroelectronics/stm32mp157-dk/patches/uboot/0001-stm32mp1-configs-fix-checking-the-presence-of-an-env.patch b/board/stmicroelectronics/stm32mp157c-dk2/patches/uboot/0001-stm32mp1-configs-fix-checking-the-presence-of-an-env.patch
similarity index 100%
rename from board/stmicroelectronics/stm32mp157-dk/patches/uboot/0001-stm32mp1-configs-fix-checking-the-presence-of-an-env.patch
rename to board/stmicroelectronics/stm32mp157c-dk2/patches/uboot/0001-stm32mp1-configs-fix-checking-the-presence-of-an-env.patch
diff --git a/board/stmicroelectronics/stm32mp157-dk/readme.txt b/board/stmicroelectronics/stm32mp157c-dk2/readme.txt
similarity index 100%
rename from board/stmicroelectronics/stm32mp157-dk/readme.txt
rename to board/stmicroelectronics/stm32mp157c-dk2/readme.txt
diff --git a/board/stmicroelectronics/stm32mp157-dk/uboot-fragment.config b/board/stmicroelectronics/stm32mp157c-dk2/uboot-fragment.config
similarity index 100%
rename from board/stmicroelectronics/stm32mp157-dk/uboot-fragment.config
rename to board/stmicroelectronics/stm32mp157c-dk2/uboot-fragment.config
diff --git a/configs/stm32mp157_dk_defconfig b/configs/stm32mp157c_dk2_defconfig
similarity index 82%
rename from configs/stm32mp157_dk_defconfig
rename to configs/stm32mp157c_dk2_defconfig
index 39605262fc..a1e61d752d 100644
--- a/configs/stm32mp157_dk_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -1,15 +1,15 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
-BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32mp157-dk/patches"
-BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157-dk/overlay/"
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32mp157c-dk2/patches"
+BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32mp157-dk/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32mp157c-dk2/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157-dk/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157c-dk2"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
@@ -22,7 +22,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_basic"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32mp157-dk/uboot-fragment.config"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32mp157c-dk2/uboot-fragment.config"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
