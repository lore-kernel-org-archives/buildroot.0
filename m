From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2016 22:59:41 +0100
Subject: [Buildroot] [git commit] configs: add Boundary Devices i.MX7
	Nitrogen7 support
Message-ID: <20160302202756.C5D7780203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c49ae49d9cf42d29b31505054b79ea414c33480
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This board is using a different kernel and u-boot branch than the
other Boundary Devices platforms since NXP forked the 3.14 kernel to add
i.MX7 support (see imx_3.14.38_6ul7d_beta branch).
Next kernel version, 3.14.52, will be the same for all i.MX platforms.

https://boundarydevices.com/product/nitrogen7/

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/nitrogen7_defconfig | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
new file mode 100644
index 0000000..91529e8
--- /dev/null
+++ b/configs/nitrogen7_defconfig
@@ -0,0 +1,36 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a7=y
+
+# system
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/nitrogen6x/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/nitrogen6x/post-image.sh"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+
+# filesystem
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Linux headers same as kernel, a 3.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="nitrogen7"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/b2e1315/u-boot-b2e1315.tar.gz"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/20cee23/linux-imx6-20cee23.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="boundary"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-nitrogen7"
