From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 31 Jul 2012 18:13:13 -0300
Subject: [Buildroot] [PATCH 09/11] qemu/microblaze: update to use kernel
	3.4.7
In-Reply-To: <1343769195-25220-1-git-send-email-gustavo@zacarias.com.ar>
References: <1343769195-25220-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1343769195-25220-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../{kernel-3.3.config => kernel-3.4.config}       |    0
 board/qemu/microblazebe-mmu/readme.txt             |    1 +
 .../{kernel-3.3.config => kernel-3.4.config}       |    0
 board/qemu/microblazeel-mmu/readme.txt             |    1 +
 configs/qemu_microblazebe_mmu_defconfig            |    4 ++--
 configs/qemu_microblazeel_mmu_defconfig            |    4 ++--
 6 files changed, 6 insertions(+), 4 deletions(-)
 rename board/qemu/microblazebe-mmu/{kernel-3.3.config => kernel-3.4.config} (100%)
 rename board/qemu/microblazeel-mmu/{kernel-3.3.config => kernel-3.4.config} (100%)

diff --git a/board/qemu/microblazebe-mmu/kernel-3.3.config b/board/qemu/microblazebe-mmu/kernel-3.4.config
similarity index 100%
rename from board/qemu/microblazebe-mmu/kernel-3.3.config
rename to board/qemu/microblazebe-mmu/kernel-3.4.config
diff --git a/board/qemu/microblazebe-mmu/readme.txt b/board/qemu/microblazebe-mmu/readme.txt
index c59c0bd..5281a0f 100644
--- a/board/qemu/microblazebe-mmu/readme.txt
+++ b/board/qemu/microblazebe-mmu/readme.txt
@@ -4,3 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
+Tested with QEMU 1.1.1
diff --git a/board/qemu/microblazeel-mmu/kernel-3.3.config b/board/qemu/microblazeel-mmu/kernel-3.4.config
similarity index 100%
rename from board/qemu/microblazeel-mmu/kernel-3.3.config
rename to board/qemu/microblazeel-mmu/kernel-3.4.config
diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
index 43a40e8..003d2a8 100644
--- a/board/qemu/microblazeel-mmu/readme.txt
+++ b/board/qemu/microblazeel-mmu/readme.txt
@@ -4,3 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
+Tested with QEMU 1.1.1
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 387466b..0f66adf 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -19,9 +19,9 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.4.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/kernel-3.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/kernel-3.4.config"
 BR2_LINUX_KERNEL_DTS_FILE="board/qemu/microblazebe-mmu/system.dts"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="linux.bin"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 7034447..766fbf2 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -19,9 +19,9 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.4.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/kernel-3.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/kernel-3.4.config"
 BR2_LINUX_KERNEL_DTS_FILE="board/qemu/microblazeel-mmu/system.dts"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="linux.bin"
-- 
1.7.8.6
