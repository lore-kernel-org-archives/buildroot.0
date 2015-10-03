From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Oct 2015 14:50:47 +0100
Subject: [Buildroot] [git commit] olimex_a20_olinuxino_lime2: new board
Message-ID: <20151003135240.DA27280794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa8c11105dde6c34f4b52ea9146521af6fea8901
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is based on olimex_a20_olinuxino_lime configuration. Tested on the mainline
kernel 4.1.4. It boots and the Ethernet is working at speed 1 Gbps.

[Thomas: remove ccache and optimize 2 options.]

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/olimex/a20_olinuxino/readme.txt        |    3 ++
 configs/olimex_a20_olinuxino_lime2_defconfig |   29 ++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/board/olimex/a20_olinuxino/readme.txt b/board/olimex/a20_olinuxino/readme.txt
index 7e9af84..7998aa1 100644
--- a/board/olimex/a20_olinuxino/readme.txt
+++ b/board/olimex/a20_olinuxino/readme.txt
@@ -17,6 +17,8 @@ The following defconfigs are available:
    for the A20-OLinuXino-LIME board using mainline kernel
  - olimex_a20_olinuxino_lime_mali_defconfig
    for the A20-OLinuXino-LIME board using legacy linux-sunxi kernel
+ - olimex_a20_olinuxino_lime2_defconfig
+   for the A20-OLinuXino-LIME2 board using mainline kernel
 
 The legacy linux-sunxi kernels are based on the vendor code drops.
 They are only useful when accelerated 3D graphics and multimedia support
@@ -50,6 +52,7 @@ After building, you should get a tree like this:
     +-- rootfs.ext4 -> rootfs.ext2
     +-- script.bin (lime_mali)
     +-- sun7i-a20-olinuxino-lime.dtb (lime, mainline)
+    +-- sun7i-a20-olinuxino-lime2.dtb (lime2, mainline)
     +-- sun7i-a20-olinuxino-micro.dtb (micro, mainline)
     +-- u-boot.bin
     +-- u-boot-sunxi-with-spl.bin
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
new file mode 100644
index 0000000..7580ce0
--- /dev/null
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -0,0 +1,29 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_EABIHF=y
+BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
+BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino/boot.cmd $(TARGET_DIR)/boot"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.4"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-olinuxino-lime2"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_SUNXI_TOOLS=y
+BR2_PACKAGE_SUNXI_BOARDS=y
+BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a20/a20-olinuxino_lime.fex"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="A20-OLinuXino-Lime2"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.01"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
