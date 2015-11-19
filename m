From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Nov 2015 21:38:30 -0300
Subject: [Buildroot] [PATCH 1/2] configs/qemu: cleanup and capitalization
Message-ID: <1447893511-14876-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Capitalize comments in a consistent way.
Cleanup redundant entries.
Drop global patch dir for sparc ss10 since it's not required any more.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/qemu_arm_nuri_defconfig      | 2 --
 configs/qemu_arm_versatile_defconfig | 5 ++---
 configs/qemu_arm_vexpress_defconfig  | 2 --
 configs/qemu_mips_malta_defconfig    | 2 +-
 configs/qemu_mipsel_malta_defconfig  | 2 +-
 configs/qemu_ppc64_pseries_defconfig | 1 -
 configs/qemu_ppc_g3beige_defconfig   | 2 +-
 configs/qemu_ppc_mpc8544ds_defconfig | 2 +-
 configs/qemu_sh4_r2d_defconfig       | 5 ++---
 configs/qemu_sh4eb_r2d_defconfig     | 5 ++---
 configs/qemu_sparc64_sun4u_defconfig | 2 +-
 configs/qemu_sparc_ss10_defconfig    | 4 +---
 configs/qemu_x86_64_defconfig        | 5 ++---
 configs/qemu_x86_defconfig           | 5 ++---
 configs/qemu_xtensa_lx60_defconfig   | 1 +
 15 files changed, 17 insertions(+), 28 deletions(-)

diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index d2e522f..0854ae0 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -5,8 +5,6 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_FPU_VFPV3D16=y
 
 # System
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttySAC1"
 
 # Filesystem
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 1ce55d0..7d5888a 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -2,11 +2,10 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# system
-BR2_TARGET_GENERIC_GETTY=y
+# System
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 
-# filesystem
+# Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index b036c6b..ec9e2fb 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -5,8 +5,6 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_FPU_VFPV3D16=y
 
 # System
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 
 # Filesystem
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index e6f6a95..3100d52 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -2,7 +2,7 @@
 BR2_mips=y
 BR2_mips_32r2=y
 
-# filesystem
+# Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index b14e70c..dad1db0 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -2,7 +2,7 @@
 BR2_mipsel=y
 BR2_mips_32r2=y
 
-# filesystem
+# Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index 97e53b4..5f7a013 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -3,7 +3,6 @@ BR2_powerpc64=y
 BR2_powerpc_power7=y
 
 # System
-BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 
 # Filesystem
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index ae2ddcc..fb6c52a 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -2,7 +2,7 @@
 BR2_powerpc=y
 BR2_powerpc_750=y
 
-# filesystem
+# Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 198f5cd..b022139 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -2,7 +2,7 @@
 BR2_powerpc=y
 BR2_powerpc_8548=y
 
-# filesystem
+# Filesystem
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 0666ed4..4366ab1 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -2,11 +2,10 @@
 BR2_sh=y
 BR2_sh4=y
 
-# system
-BR2_TARGET_GENERIC_GETTY=y
+# System
 BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 
-# filesystem
+# Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index 6680ee3..1417699 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -2,11 +2,10 @@
 BR2_sh=y
 BR2_sh4eb=y
 
-# system
-BR2_TARGET_GENERIC_GETTY=y
+# System
 BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 
-# filesystem
+# Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index 828b437..8b47526 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -2,7 +2,7 @@
 BR2_sparc64=y
 BR2_sparc_v9=y
 
-# filesystem
+# Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 3e6d7b1..cb0eb8f 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -2,9 +2,7 @@
 BR2_sparc=y
 BR2_sparc_v8=y
 
-BR2_GLOBAL_PATCH_DIR="board/qemu/sparc-ss10"
-
-# filesystem
+# Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index daf32cd..d350926 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -1,11 +1,10 @@
 # Architecture
 BR2_x86_64=y
 
-# system
-BR2_TARGET_GENERIC_GETTY=y
+# System
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 
-# filesystem
+# Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 9fd1fe9..3517b66 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -2,11 +2,10 @@
 BR2_i386=y
 BR2_x86_pentiumpro=y
 
-# system
-BR2_TARGET_GENERIC_GETTY=y
+# System
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 
-# filesystem
+# Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 526a111..8a42106 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -5,6 +5,7 @@ BR2_XTENSA_CUSTOM_NAME="dc232b"
 BR2_XTENSA_CORE_NAME="lx60"
 BR2_XTENSA_OVERLAY_DIR="board/qemu/xtensa-lx60"
 
+# Patches
 BR2_GLOBAL_PATCH_DIR="board/qemu/xtensa-lx60"
 
 # System
-- 
2.4.10
