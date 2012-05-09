From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 May 2012 08:36:34 -0300
Subject: [Buildroot] [PATCH 2/3] qemu/microblazeel-mmu: update configuration
In-Reply-To: <1336563395-25599-1-git-send-email-gustavo@zacarias.com.ar>
References: <1336563395-25599-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1336563395-25599-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Beautify and lock down kernel version to avoid future issues.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/qemu_microblazeel_mmu_defconfig |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 61420b4..26897b7 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -1,15 +1,25 @@
+# Architecture
 BR2_microblaze=y
 BR2_microblazeel=y
+
+# Toolchain
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="microblazeel-unknown-linux-gnu"
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
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/kernel-3.3.config"
 BR2_LINUX_KERNEL_DTS_FILE="board/qemu/microblazeel-mmu/system.dts"
-- 
1.7.3.4
