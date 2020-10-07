From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 7 Oct 2020 21:23:28 +0200
Subject: [Buildroot] [git commit] defconfigs: use
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_
Message-ID: <20201007191759.E6B288EF6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ea9f662a03e0f4b4a9000a25095b8e6293b07b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For defconfigs that create a boot script, add the host package
uboot-tools and update the script variable names.

Add BR2_PACKAGE_HOST_UBOOT_TOOLS=y just before the existing
BR2_TARGET_UBOOT_BOOT_SCRIPT option. Note that for the defconfigs that
are not manually formatted (i.e. just the result of 'make
savedefconfig'), this puts them in the wrong place. However, it's easier
this way, and it's more consistent in general to have the definition of
the script close to BR2_TARGET_UBOOT itself.

Special cases:
- nanopi_* had the definition of the _SCRIPT variable in a weird place.
  These are moved to close to BR2_TARGET_UBOOT.
- Same for orangepi_plus.
- orangpi_pc_* already had BR2_PACKAGE_HOST_UBOOT_TOOLS=y so it's not
  added there.

Related to db2b6841263c3062fa1661dcfda3110415779fa2

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/bananapi_m1_defconfig                | 5 +++--
 configs/bananapi_m2_plus_defconfig           | 5 +++--
 configs/bananapi_m2_ultra_defconfig          | 5 +++--
 configs/bananapi_m2_zero_defconfig           | 5 +++--
 configs/bananapi_m64_defconfig               | 5 +++--
 configs/cubieboard2_defconfig                | 5 +++--
 configs/friendlyarm_nanopi_a64_defconfig     | 5 +++--
 configs/friendlyarm_nanopi_neo2_defconfig    | 5 +++--
 configs/licheepi_zero_defconfig              | 5 +++--
 configs/nanopi_m1_defconfig                  | 5 +++--
 configs/nanopi_m1_plus_defconfig             | 5 +++--
 configs/nanopi_neo_defconfig                 | 5 +++--
 configs/nanopi_r1_defconfig                  | 5 +++--
 configs/nitrogen6sx_defconfig                | 5 +++--
 configs/nitrogen6x_defconfig                 | 5 +++--
 configs/nitrogen7_defconfig                  | 5 +++--
 configs/odroidc2_defconfig                   | 5 +++--
 configs/olimex_a10_olinuxino_lime_defconfig  | 5 +++--
 configs/olimex_a20_olinuxino_lime2_defconfig | 5 +++--
 configs/olimex_a20_olinuxino_lime_defconfig  | 5 +++--
 configs/olimex_a20_olinuxino_micro_defconfig | 5 +++--
 configs/olimex_a33_olinuxino_defconfig       | 5 +++--
 configs/olimex_a64_olinuxino_defconfig       | 5 +++--
 configs/orangepi_lite_defconfig              | 5 +++--
 configs/orangepi_one_defconfig               | 5 +++--
 configs/orangepi_pc2_defconfig               | 5 +++--
 configs/orangepi_pc_defconfig                | 4 ++--
 configs/orangepi_pc_plus_defconfig           | 4 ++--
 configs/orangepi_plus_defconfig              | 5 +++--
 configs/orangepi_prime_defconfig             | 5 +++--
 configs/orangepi_r1_defconfig                | 5 +++--
 configs/orangepi_win_defconfig               | 5 +++--
 configs/orangepi_zero_defconfig              | 5 +++--
 configs/orangepi_zero_plus2_defconfig        | 5 +++--
 configs/pine64_defconfig                     | 5 +++--
 configs/pine64_sopine_defconfig              | 5 +++--
 36 files changed, 106 insertions(+), 72 deletions(-)

diff --git a/configs/bananapi_m1_defconfig b/configs/bananapi_m1_defconfig
index 558ef3d4ab..23da363345 100644
--- a/configs/bananapi_m1_defconfig
+++ b/configs/bananapi_m1_defconfig
@@ -21,8 +21,9 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m1/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m1/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/bananapi_m2_plus_defconfig b/configs/bananapi_m2_plus_defconfig
index 0e2d91d21b..77a403ce81 100644
--- a/configs/bananapi_m2_plus_defconfig
+++ b/configs/bananapi_m2_plus_defconfig
@@ -22,8 +22,9 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/sinovoip/m2-plus/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/sinovoip/m2-plus/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/bananapi_m2_ultra_defconfig b/configs/bananapi_m2_ultra_defconfig
index bc1d31a60a..22f7974bcb 100644
--- a/configs/bananapi_m2_ultra_defconfig
+++ b/configs/bananapi_m2_ultra_defconfig
@@ -22,8 +22,9 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m2-ultra/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m2-ultra/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/bananapi_m2_zero_defconfig b/configs/bananapi_m2_zero_defconfig
index 64f741d3c7..e82814e336 100644
--- a/configs/bananapi_m2_zero_defconfig
+++ b/configs/bananapi_m2_zero_defconfig
@@ -23,8 +23,9 @@ BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m2-zero/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m2-zero/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/bananapi_m64_defconfig b/configs/bananapi_m64_defconfig
index 5e56eaed85..b93332ed21 100644
--- a/configs/bananapi_m64_defconfig
+++ b/configs/bananapi_m64_defconfig
@@ -26,8 +26,9 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m64/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m64/boot.cmd"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index fd50742d09..8924c88c54 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -24,8 +24,9 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/cubietech/cubieboard2/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/cubietech/cubieboard2/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/friendlyarm_nanopi_a64_defconfig b/configs/friendlyarm_nanopi_a64_defconfig
index 7d9535e6ae..4df22b2a2f 100644
--- a/configs/friendlyarm_nanopi_a64_defconfig
+++ b/configs/friendlyarm_nanopi_a64_defconfig
@@ -26,8 +26,9 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-a64/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-a64/boot.cmd"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/friendlyarm_nanopi_neo2_defconfig b/configs/friendlyarm_nanopi_neo2_defconfig
index e932ae3bb1..9262737b88 100644
--- a/configs/friendlyarm_nanopi_neo2_defconfig
+++ b/configs/friendlyarm_nanopi_neo2_defconfig
@@ -26,8 +26,9 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-neo2/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-neo2/boot.cmd"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/licheepi_zero_defconfig b/configs/licheepi_zero_defconfig
index fd875d5f4c..2e1a413988 100644
--- a/configs/licheepi_zero_defconfig
+++ b/configs/licheepi_zero_defconfig
@@ -42,8 +42,9 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/licheepi/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/licheepi/boot.cmd"
 
 # Required host utilities for building an SDCard image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/nanopi_m1_defconfig b/configs/nanopi_m1_defconfig
index cf9521a3ad..18cfcb261e 100644
--- a/configs/nanopi_m1_defconfig
+++ b/configs/nanopi_m1_defconfig
@@ -20,6 +20,9 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-m1/boot.cmd"
 
 # Kernel
 BR2_LINUX_KERNEL=y
@@ -32,8 +35,6 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-m1"
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-m1/boot.cmd"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-m1/genimage.cfg"
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/nanopi_m1_plus_defconfig b/configs/nanopi_m1_plus_defconfig
index 2f9d14f104..06adc54b15 100644
--- a/configs/nanopi_m1_plus_defconfig
+++ b/configs/nanopi_m1_plus_defconfig
@@ -20,6 +20,9 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-m1-plus/boot.cmd"
 
 # Kernel
 BR2_LINUX_KERNEL=y
@@ -32,8 +35,6 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-m1-plus"
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-m1-plus/boot.cmd"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-m1-plus/genimage.cfg"
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/nanopi_neo_defconfig b/configs/nanopi_neo_defconfig
index be98918c62..1519d828d6 100644
--- a/configs/nanopi_neo_defconfig
+++ b/configs/nanopi_neo_defconfig
@@ -26,12 +26,13 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-neo/boot.cmd"
 
 # Build an sdcard image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-neo/boot.cmd"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo/genimage.cfg"
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/nanopi_r1_defconfig b/configs/nanopi_r1_defconfig
index 4c45110bd2..8b03f6dd00 100644
--- a/configs/nanopi_r1_defconfig
+++ b/configs/nanopi_r1_defconfig
@@ -22,6 +22,9 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE="board/friendlyarm/nanopi-r1/uboot/nanopi_r1_defconfig"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-r1/boot.cmd"
 
 # Kernel
 BR2_LINUX_KERNEL=y
@@ -36,8 +39,6 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-r1"
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-r1/boot.cmd"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-r1/genimage.cfg"
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index d5bf87b086..d51ebcd108 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -28,8 +28,9 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/f9c6c45b.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen6sx"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/boot.cmd"
 
 # kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 01d49bb09c..5353b38fd5 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -28,8 +28,9 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/f9c6c45b.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen6q"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/boot.cmd"
 
 # kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index 4178ca9787..ddefe7cd0f 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -27,8 +27,9 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/f9c6c45b.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen7"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/boot.cmd"
 
 # kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index c15df8f252..3ed08710e9 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -25,8 +25,9 @@ BR2_TARGET_UBOOT_BOARDNAME="odroid-c2"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/hardkernel/odroidc2/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/hardkernel/odroidc2/boot.cmd"
 
 # Firmware
 BR2_PACKAGE_ODROIDC2_FIRMWARE=y
diff --git a/configs/olimex_a10_olinuxino_lime_defconfig b/configs/olimex_a10_olinuxino_lime_defconfig
index 8248daf92c..0896a66dda 100644
--- a/configs/olimex_a10_olinuxino_lime_defconfig
+++ b/configs/olimex_a10_olinuxino_lime_defconfig
@@ -40,8 +40,9 @@ BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/olimex/a10_olinuxino/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a10_olinuxino/boot.cmd"
 
 # Additional tools
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 40c6dc1129..ca8a319e68 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -51,8 +51,9 @@ BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot.cmd"
 
 # Additional tools
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 753d3aa7cb..9de6de77f3 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -51,8 +51,9 @@ BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot.cmd"
 
 # Additional tools
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/olimex_a20_olinuxino_micro_defconfig b/configs/olimex_a20_olinuxino_micro_defconfig
index a2aff0ca33..4a2a8a4ba7 100644
--- a/configs/olimex_a20_olinuxino_micro_defconfig
+++ b/configs/olimex_a20_olinuxino_micro_defconfig
@@ -38,8 +38,9 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino_MICRO"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot.cmd"
 
 # Additional tools
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/olimex_a33_olinuxino_defconfig b/configs/olimex_a33_olinuxino_defconfig
index 71b1669b27..7c691ab20d 100644
--- a/configs/olimex_a33_olinuxino_defconfig
+++ b/configs/olimex_a33_olinuxino_defconfig
@@ -22,8 +22,9 @@ BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/olimex/a33_olinuxino/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a33_olinuxino/boot.cmd"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/olimex_a64_olinuxino_defconfig b/configs/olimex_a64_olinuxino_defconfig
index d5b2d3530a..e35c6014bd 100644
--- a/configs/olimex_a64_olinuxino_defconfig
+++ b/configs/olimex_a64_olinuxino_defconfig
@@ -26,8 +26,9 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/olimex/a64-olinuxino/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a64-olinuxino/boot.cmd"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/orangepi_lite_defconfig b/configs/orangepi_lite_defconfig
index 249224ed35..e75943c986 100644
--- a/configs/orangepi_lite_defconfig
+++ b/configs/orangepi_lite_defconfig
@@ -28,8 +28,9 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-lite/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-lite/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/orangepi_one_defconfig b/configs/orangepi_one_defconfig
index 4863eebff3..20b78fe7c8 100644
--- a/configs/orangepi_one_defconfig
+++ b/configs/orangepi_one_defconfig
@@ -23,8 +23,9 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-one/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-one/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
index 864f8bb8a2..c7e17c8eb1 100644
--- a/configs/orangepi_pc2_defconfig
+++ b/configs/orangepi_pc2_defconfig
@@ -26,8 +26,9 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-pc2/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-pc2/boot.cmd"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/orangepi_pc_defconfig b/configs/orangepi_pc_defconfig
index 4b885d2189..90ad50b783 100644
--- a/configs/orangepi_pc_defconfig
+++ b/configs/orangepi_pc_defconfig
@@ -26,8 +26,8 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-pc/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-pc/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/orangepi_pc_plus_defconfig b/configs/orangepi_pc_plus_defconfig
index 4d22e7840b..a42b380f60 100644
--- a/configs/orangepi_pc_plus_defconfig
+++ b/configs/orangepi_pc_plus_defconfig
@@ -26,8 +26,8 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-pc-plus/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-pc-plus/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/orangepi_plus_defconfig b/configs/orangepi_plus_defconfig
index be3eba51fe..11d7486486 100644
--- a/configs/orangepi_plus_defconfig
+++ b/configs/orangepi_plus_defconfig
@@ -20,6 +20,9 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-plus/boot.cmd"
 
 # Kernel
 BR2_LINUX_KERNEL=y
@@ -32,8 +35,6 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-plus"
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-plus/boot.cmd"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-plus/genimage.cfg"
 
diff --git a/configs/orangepi_prime_defconfig b/configs/orangepi_prime_defconfig
index f78711ce4f..f8f958c67b 100644
--- a/configs/orangepi_prime_defconfig
+++ b/configs/orangepi_prime_defconfig
@@ -26,8 +26,9 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-prime/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-prime/boot.cmd"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/orangepi_r1_defconfig b/configs/orangepi_r1_defconfig
index b1d35f2998..7c3ec637e5 100644
--- a/configs/orangepi_r1_defconfig
+++ b/configs/orangepi_r1_defconfig
@@ -25,8 +25,9 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-r1/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-r1/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/orangepi_win_defconfig b/configs/orangepi_win_defconfig
index 8aae602458..715ff3b711 100644
--- a/configs/orangepi_win_defconfig
+++ b/configs/orangepi_win_defconfig
@@ -25,8 +25,9 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-win/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-win/boot.cmd"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index f674ceaa24..37d3d8dc72 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -28,8 +28,9 @@ BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index a0183714a4..222736423c 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -27,8 +27,9 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero-plus2/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero-plus2/boot.cmd"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
index d2e3a360fa..2bdb6f6ae1 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_defconfig
@@ -26,8 +26,9 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/pine64/pine64/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/pine64/pine64/boot.cmd"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/pine64_sopine_defconfig b/configs/pine64_sopine_defconfig
index 3007d5a643..6fa511477c 100644
--- a/configs/pine64_sopine_defconfig
+++ b/configs/pine64_sopine_defconfig
@@ -26,8 +26,9 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/pine64/sopine/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/pine64/sopine/boot.cmd"
 
 # Kernel
 BR2_LINUX_KERNEL=y
