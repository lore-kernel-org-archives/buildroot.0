From: Romain Naour <romain.naour@smile.fr>
Date: Fri,  2 Aug 2019 15:09:33 +0200
Subject: [Buildroot] [PATCH 3/6] confis/qemu_mips64r6*_malta: use the
 default compiler version (gcc 8.x)
In-Reply-To: <20190802130937.12591-1-romain.naour@smile.fr>
References: <20190802130937.12591-1-romain.naour@smile.fr>
Message-ID: <20190802130937.12591-3-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Theses defconfig was added at the when gcc 6 was not the default version
used by Buildroot, so the gcc version was explicitely set.

Since then, gcc 8.x is used as the default. So drop BR2_GCC_VERSION_6_X.

Tested with Qemu 2.8.1 (Debian 1:2.8+dfsg-6+deb9u7)
qemu_mips32r6_malta_defconfig
qemu_mips32r6el_malta_defconfig
qemu_mips64r6_malta_defconfig
qemu_mips64r6el_malta_defconfig

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/qemu_mips32r6_malta_defconfig   | 4 ----
 configs/qemu_mips32r6el_malta_defconfig | 4 ----
 configs/qemu_mips64r6_malta_defconfig   | 4 ----
 configs/qemu_mips64r6el_malta_defconfig | 4 ----
 4 files changed, 16 deletions(-)

diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
index b0bf94ce7b..52a29f110c 100644
--- a/configs/qemu_mips32r6_malta_defconfig
+++ b/configs/qemu_mips32r6_malta_defconfig
@@ -20,10 +20,6 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
-# Compiler
-# linux >= 4.4 uses -mcompact-branches which is only available since gcc-6
-BR2_GCC_VERSION_6_X=y
-
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
index 077d836da3..7d08430f3e 100644
--- a/configs/qemu_mips32r6el_malta_defconfig
+++ b/configs/qemu_mips32r6el_malta_defconfig
@@ -20,10 +20,6 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
-# Compiler
-# linux >= 4.4 uses -mcompact-branches which is only available since GCC 6.x
-BR2_GCC_VERSION_6_X=y
-
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
index bfa32f657e..3b01799839 100644
--- a/configs/qemu_mips64r6_malta_defconfig
+++ b/configs/qemu_mips64r6_malta_defconfig
@@ -21,10 +21,6 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
-# Compiler
-# linux >= 4.4 uses -mcompact-branches which is only available since gcc-6
-BR2_GCC_VERSION_6_X=y
-
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
index 2fd855d79b..f5fecc5642 100644
--- a/configs/qemu_mips64r6el_malta_defconfig
+++ b/configs/qemu_mips64r6el_malta_defconfig
@@ -21,10 +21,6 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
-# Compiler
-# linux >= 4.4 uses -mcompact-branches which is only available since gcc-6
-BR2_GCC_VERSION_6_X=y
-
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-- 
2.20.1
