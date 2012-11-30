From: Gregory Hermant <gregory.hermant@calao-systems.com>
Date: Fri, 30 Nov 2012 13:39:16 +0100
Subject: [Buildroot] [PATCH v5 6/6] Add config file for the snowball board
In-Reply-To: <1354279156-20649-1-git-send-email-gregory.hermant@calao-systems.com>
References: <1354279156-20649-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <1354279156-20649-7-git-send-email-gregory.hermant@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
---
 configs/calao_snowball_defconfig |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 configs/calao_snowball_defconfig

diff --git a/configs/calao_snowball_defconfig b/configs/calao_snowball_defconfig
new file mode 100644
index 0000000..360ed51
--- /dev/null
+++ b/configs/calao_snowball_defconfig
@@ -0,0 +1,24 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_GCC_VERSION_4_7_X=y
+# BR2_SOFT_FLOAT is not set
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_VFP_FLOAT=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA2"
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_SNOWBALL_HDMISERVICE=y
+BR2_PACKAGE_LIBNL=y
+BR2_PACKAGE_SNOWBALL_INIT=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_TARGET_ROOTFS_TAR_GZIP=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="snowball"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://igloocommunity.org/git/kernel/igloo-kernel.git"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="stable-linux-ux500-3.4"
+BR2_LINUX_KERNEL_PATCH="board/calao/snowball/"
+BR2_LINUX_KERNEL_DEFCONFIG="u8500"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
1.7.9.5
