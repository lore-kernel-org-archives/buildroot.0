From: Romain Naour <romain.naour@smile.fr>
Date: Fri,  2 Aug 2019 15:09:34 +0200
Subject: [Buildroot] [PATCH 4/6] configs/odroidc2: remove the defconfig
In-Reply-To: <20190802130937.12591-1-romain.naour@smile.fr>
References: <20190802130937.12591-1-romain.naour@smile.fr>
Message-ID: <20190802130937.12591-4-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The odroidc2 defconfig is using gcc 4.9 version in order to build
uboot (2015.01) and kernel (3.14.79) for the board.

We are going to remove gcc 4.9 version in Buildroot and this
defconfig is the only remaining one using this version.

Since we don't have the board, we can't update the defconfig with
newer bootloader and kernel version.

A new defconfig for the odroidc2 board are welcome as soon as
it use a newer uboot and kernel version.

Remove the defconfig from the gitlab yaml.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Dagg Stompler <daggs@gmx.com>
---
 .gitlab-ci.yml             |  1 -
 configs/odroidc2_defconfig | 36 ------------------------------------
 2 files changed, 37 deletions(-)
 delete mode 100644 configs/odroidc2_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index dd351fc545..5fdc4c03a6 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -218,7 +218,6 @@ nitrogen6sx_defconfig: { extends: .defconfig }
 nitrogen6x_defconfig: { extends: .defconfig }
 nitrogen7_defconfig: { extends: .defconfig }
 nitrogen8m_defconfig: { extends: .defconfig }
-odroidc2_defconfig: { extends: .defconfig }
 odroidxu4_defconfig: { extends: .defconfig }
 olimex_a10_olinuxino_lime_defconfig: { extends: .defconfig }
 olimex_a13_olinuxino_defconfig: { extends: .defconfig }
diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
deleted file mode 100644
index 63c5d2edc1..0000000000
--- a/configs/odroidc2_defconfig
+++ /dev/null
@@ -1,36 +0,0 @@
-# Architecture
-BR2_aarch64=y
-
-# System
-BR2_TARGET_GENERIC_HOSTNAME="odroidc2"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/hardkernel/odroidc2/post-image.sh"
-BR2_PACKAGE_ODROID_SCRIPTS=y
-BR2_GCC_VERSION_4_9_X=y
-
-# Kernel
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.14.79"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,hardkernel,linux,f966ebfc0e8dc88c7931b4640b8a1b4bc2e13faa)/linux-f966ebfc0e8dc88c7931b4640b8a1b4bc2e13faa.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="odroidc2"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_BUILD_DEFAULT_DTS=y
-BR2_LINUX_KERNEL_USE_INTREE_DTS=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="meson64_odroidc2"
-BR2_LINUX_KERNEL_IMAGE=y
-
-# U-Boot
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/hardkernel/u-boot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="cff3edb675933ea2e2ecd659eab127a42f3777df"
-BR2_TARGET_UBOOT_BOARDNAME="odroidc2"
-
-# Required tools to create the SD image
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.20.1
