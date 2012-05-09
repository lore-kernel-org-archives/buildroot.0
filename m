From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 May 2012 08:36:33 -0300
Subject: [Buildroot] [PATCH 1/3] qemu/microblazebe-mmu: update configuration
Message-ID: <1336563395-25599-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Beautify and lock down kernel version to avoid future issues.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/qemu_microblazebe_mmu_defconfig |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 378e972..156e264 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -1,14 +1,25 @@
+# Architecture
 BR2_microblaze=y
 BR2_microblazebe=y
+
+# Special toolchain
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
+
+# System
 BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
+
+# Filesystem
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Kernel
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/kernel-3.3.config"
 BR2_LINUX_KERNEL_DTS_FILE="board/qemu/microblazebe-mmu/system.dts"
-- 
1.7.3.4
