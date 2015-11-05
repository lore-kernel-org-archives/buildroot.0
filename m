From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 22:42:26 +0100
Subject: [Buildroot] [git commit] configs: remove calao_snowball_defconfig
Message-ID: <20151105214448.C53877FBE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b3fa8e24defb20e1734e7e75f432090fe83c0dd8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig has not been updated since a long time, and it now
fails to build because the latest version of U-Boot has removed for
the Snowball because nobody converted it to the new U-Boot
standards. And our defconfig was not specifying an explicit U-Boot
version for it.

On the kernel side, the Git repository has not seen any commits since
3 years, and generally speaking, the Snowball project and the SoC it
is based on are no longer being developed.

Consequently, let's get rid of this defconfig altogether.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/calao_snowball_defconfig |   23 -----------------------
 1 files changed, 0 insertions(+), 23 deletions(-)

diff --git a/configs/calao_snowball_defconfig b/configs/calao_snowball_defconfig
deleted file mode 100644
index 4c30a6b..0000000
--- a/configs/calao_snowball_defconfig
+++ /dev/null
@@ -1,23 +0,0 @@
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_KERNEL_HEADERS_3_4=y
-BR2_ARM_FPU_VFPV3D16=y
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA2"
-BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
-BR2_PACKAGE_SNOWBALL_HDMISERVICE=y
-BR2_PACKAGE_LIBNL=y
-BR2_PACKAGE_SNOWBALL_INIT=y
-BR2_PACKAGE_WPA_SUPPLICANT=y
-BR2_TARGET_ROOTFS_TAR_GZIP=y
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="snowball"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/igloocommunity/igloo-kernel"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="stable-linux-ux500-3.4"
-BR2_LINUX_KERNEL_PATCH="board/calao/snowball/"
-BR2_LINUX_KERNEL_DEFCONFIG="u8500"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
