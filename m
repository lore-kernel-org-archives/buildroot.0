From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 30 Jul 2012 15:55:56 +0200
Subject: [Buildroot] [PATCH 2/2] Update qemu microblazebe default
	configuration
In-Reply-To: <1343656556-8500-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1343651569-6450-1-git-send-email-maxime.ripard@free-electrons.com>
 <1343656556-8500-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1343656556-8500-2-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 configs/qemu_microblazebe_mmu_defconfig |   19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 387466b..e8978c9 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -1,27 +1,14 @@
-# Architecture
-BR2_microblaze=y
 BR2_microblazebe=y
-
-# Special toolchain
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
-
-# System
 BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
-
-# Filesystem
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
-
-# Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/kernel-3.3.config"
-BR2_LINUX_KERNEL_DTS_FILE="board/qemu/microblazebe-mmu/system.dts"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="linux.bin"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/qemu/microblazebe-mmu/system.dts"
-- 
1.7.9.5
