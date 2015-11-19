From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Nov 2015 21:38:31 -0300
Subject: [Buildroot] [PATCH 2/2] configs/qemu: enable dhcp on network
	interfaces
In-Reply-To: <1447893511-14876-1-git-send-email-gustavo@zacarias.com.ar>
References: <1447893511-14876-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1447893511-14876-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable dhcp networking for qemu configs considered good enough for
testing purposes.

This excludes:
arm_nuri - emulation doesn't seem 100% correct for networking.
ppc_virtex_ml507 - doesn't emulate networking.
sh4eb - emulation doesn't seem 100% correct for the NIC.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/qemu_aarch64_virt_defconfig     | 1 +
 configs/qemu_arm_versatile_defconfig    | 1 +
 configs/qemu_arm_vexpress_defconfig     | 1 +
 configs/qemu_microblazebe_mmu_defconfig | 1 +
 configs/qemu_microblazeel_mmu_defconfig | 1 +
 configs/qemu_mips64_malta_defconfig     | 3 +++
 configs/qemu_mips64el_malta_defconfig   | 3 +++
 configs/qemu_mips_malta_defconfig       | 3 +++
 configs/qemu_mipsel_malta_defconfig     | 3 +++
 configs/qemu_ppc64_pseries_defconfig    | 1 +
 configs/qemu_ppc_g3beige_defconfig      | 3 +++
 configs/qemu_ppc_mpc8544ds_defconfig    | 3 +++
 configs/qemu_sh4_r2d_defconfig          | 1 +
 configs/qemu_sparc64_sun4u_defconfig    | 3 +++
 configs/qemu_sparc_ss10_defconfig       | 3 +++
 configs/qemu_x86_64_defconfig           | 1 +
 configs/qemu_x86_defconfig              | 1 +
 configs/qemu_xtensa_lx60_defconfig      | 1 +
 18 files changed, 34 insertions(+)

diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index c39fd81..a695afb 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -2,6 +2,7 @@
 BR2_aarch64=y
 
 # System
+BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 
 # Filesystem
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 7d5888a..1ac59fd 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -3,6 +3,7 @@ BR2_arm=y
 BR2_arm926t=y
 
 # System
+BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 
 # Filesystem
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index ec9e2fb..5f1a997 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -5,6 +5,7 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_FPU_VFPV3D16=y
 
 # System
+BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 
 # Filesystem
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 5730e4c..e8fcaec 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -3,6 +3,7 @@ BR2_microblaze=y
 BR2_microblazebe=y
 
 # System
+BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 
 # Filesystem
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 8f95c82..01a423b 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -3,6 +3,7 @@ BR2_microblaze=y
 BR2_microblazeel=y
 
 # System
+BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 
 # Filesystem
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 94dfb54..736ca70 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -2,6 +2,9 @@
 BR2_mips64=y
 BR2_MIPS_NABI64=y
 
+# System
+BR2_SYSTEM_DHCP="eth0"
+
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 88828fe..4c29ed5 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -2,6 +2,9 @@
 BR2_mips64el=y
 BR2_MIPS_NABI64=y
 
+# System
+BR2_SYSTEM_DHCP="eth0"
+
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index 3100d52..4913490 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -2,6 +2,9 @@
 BR2_mips=y
 BR2_mips_32r2=y
 
+# System
+BR2_SYSTEM_DHCP="eth0"
+
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index dad1db0..f3f513b 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -2,6 +2,9 @@
 BR2_mipsel=y
 BR2_mips_32r2=y
 
+# System
+BR2_SYSTEM_DHCP="eth0"
+
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index 5f7a013..08d6cbb 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -3,6 +3,7 @@ BR2_powerpc64=y
 BR2_powerpc_power7=y
 
 # System
+BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 
 # Filesystem
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index fb6c52a..a344f53 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -2,6 +2,9 @@
 BR2_powerpc=y
 BR2_powerpc_750=y
 
+# System
+BR2_SYSTEM_DHCP="eth0"
+
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index b022139..f89fcca 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -2,6 +2,9 @@
 BR2_powerpc=y
 BR2_powerpc_8548=y
 
+# System
+BR2_SYSTEM_DHCP="eth0"
+
 # Filesystem
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 4366ab1..8197738 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -3,6 +3,7 @@ BR2_sh=y
 BR2_sh4=y
 
 # System
+BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 
 # Filesystem
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index 8b47526..00ceb89 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -2,6 +2,9 @@
 BR2_sparc64=y
 BR2_sparc_v9=y
 
+# System
+BR2_SYSTEM_DHCP="eth0"
+
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index cb0eb8f..6bb1c81 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -2,6 +2,9 @@
 BR2_sparc=y
 BR2_sparc_v8=y
 
+# System
+BR2_SYSTEM_DHCP="eth0"
+
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index d350926..22983bf 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -2,6 +2,7 @@
 BR2_x86_64=y
 
 # System
+BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 
 # Filesystem
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 3517b66..0e1316d 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -3,6 +3,7 @@ BR2_i386=y
 BR2_x86_pentiumpro=y
 
 # System
+BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 
 # Filesystem
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 8a42106..42b844c 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -9,6 +9,7 @@ BR2_XTENSA_OVERLAY_DIR="board/qemu/xtensa-lx60"
 BR2_GLOBAL_PATCH_DIR="board/qemu/xtensa-lx60"
 
 # System
+BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
 # Filesystem
-- 
2.4.10
