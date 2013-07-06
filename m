From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  6 Jul 2013 17:08:11 +0200
Subject: [Buildroot] [PATCH 7/8] configs: update defconfigs after VFP option
	changes
In-Reply-To: <1373123292-15085-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1373123292-15085-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1373123292-15085-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/calao_snowball_defconfig    | 3 +--
 configs/mx53loco_defconfig          | 3 +--
 configs/qemu_arm_nuri_defconfig     | 3 +--
 configs/qemu_arm_vexpress_defconfig | 3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/configs/calao_snowball_defconfig b/configs/calao_snowball_defconfig
index 360ed51..fd9e1b6 100644
--- a/configs/calao_snowball_defconfig
+++ b/configs/calao_snowball_defconfig
@@ -1,10 +1,9 @@
 BR2_arm=y
 BR2_cortex_a9=y
 BR2_GCC_VERSION_4_7_X=y
-# BR2_SOFT_FLOAT is not set
+BR2_ARM_FPU_VFPV3D16=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
-BR2_VFP_FLOAT=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA2"
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index ff3948b..08de3da 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -1,8 +1,7 @@
 # Architecture
 BR2_arm=y
 BR2_cortex_a8=y
-# BR2_SOFT_FLOAT is not set
-BR2_VFP_FLOAT=y
+BR2_ARM_FPU_VFPV3D16=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index 27dac27..57c0470 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -2,8 +2,7 @@
 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
-BR2_VFP_FLOAT=y
-# BR2_SOFT_FLOAT is not set
+BR2_ARM_FPU_VFPV3D16=y
 
 # System
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 07b629e..4184da4 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -2,8 +2,7 @@
 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
-BR2_VFP_FLOAT=y
-# BR2_SOFT_FLOAT is not set
+BR2_ARM_FPU_VFPV3D16=y
 
 # System
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-- 
1.8.1.2
