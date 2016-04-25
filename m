From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Apr 2016 14:07:58 +0200
Subject: [Buildroot] [git commit] configs/*: drop explicit
	BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
Message-ID: <20160425120824.1A8A580304@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fac78c51e0cc010a8dd8bc49824a5b1bcd52129
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 7f1f9185e (system: default to devtmpfs for /dev) changed our default
for /dev handling, but didn't remove the explicit selection of devtmpfs from
a number of defconfigs.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/armadeus_apf27_defconfig      | 1 -
 configs/armadeus_apf28_defconfig      | 1 -
 configs/armadeus_apf9328_defconfig    | 1 -
 configs/at91sam9260eknf_defconfig     | 3 ---
 configs/beaglebone_defconfig          | 1 -
 configs/calao_tny_a9g20_lpw_defconfig | 1 -
 configs/openblocks_a6_defconfig       | 1 -
 configs/telit_evk_pro3_defconfig      | 3 ---
 8 files changed, 12 deletions(-)

diff --git a/configs/armadeus_apf27_defconfig b/configs/armadeus_apf27_defconfig
index 69c6c01..fd0ba50 100644
--- a/configs/armadeus_apf27_defconfig
+++ b/configs/armadeus_apf27_defconfig
@@ -8,7 +8,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf27"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Armadeus development platform !"
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 
 # Filesystem
diff --git a/configs/armadeus_apf28_defconfig b/configs/armadeus_apf28_defconfig
index 965f3c2..3032906 100644
--- a/configs/armadeus_apf28_defconfig
+++ b/configs/armadeus_apf28_defconfig
@@ -8,7 +8,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf28"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Armadeus development platform !"
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 
 # Kernel
diff --git a/configs/armadeus_apf9328_defconfig b/configs/armadeus_apf9328_defconfig
index 324a7dc..d83ed71 100644
--- a/configs/armadeus_apf9328_defconfig
+++ b/configs/armadeus_apf9328_defconfig
@@ -16,7 +16,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf9328"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Armadeus development platform !"
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 
 # Filesystem
diff --git a/configs/at91sam9260eknf_defconfig b/configs/at91sam9260eknf_defconfig
index f0d1d74..92bb071 100644
--- a/configs/at91sam9260eknf_defconfig
+++ b/configs/at91sam9260eknf_defconfig
@@ -5,9 +5,6 @@ BR2_arm926t=y
 # Linux headers same as kernel, a 3.9 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_9=y
 
-# System
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
-
 # Packages
 BR2_PACKAGE_HOST_SAM_BA=y
 
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 839c1a9..3e3281e 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -5,7 +5,6 @@ BR2_ARM_EABIHF=y
 
 # system
 BR2_TARGET_GENERIC_HOSTNAME="beaglebone"
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
 # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
diff --git a/configs/calao_tny_a9g20_lpw_defconfig b/configs/calao_tny_a9g20_lpw_defconfig
index 0f5d723..d9c6ba6 100644
--- a/configs/calao_tny_a9g20_lpw_defconfig
+++ b/configs/calao_tny_a9g20_lpw_defconfig
@@ -4,7 +4,6 @@ BR2_arm926t=y
 
 # system
 BR2_PACKAGE_HOST_SAM_BA=y
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
 
 # filesystem
 BR2_TARGET_ROOTFS_UBIFS=y
diff --git a/configs/openblocks_a6_defconfig b/configs/openblocks_a6_defconfig
index c0d529c..c0522da 100644
--- a/configs/openblocks_a6_defconfig
+++ b/configs/openblocks_a6_defconfig
@@ -4,7 +4,6 @@ BR2_arm926t=y
 
 # system
 BR2_TARGET_GENERIC_HOSTNAME="openblocks-a6"
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
 # filesystem
diff --git a/configs/telit_evk_pro3_defconfig b/configs/telit_evk_pro3_defconfig
index 195f36a..946c2f0 100644
--- a/configs/telit_evk_pro3_defconfig
+++ b/configs/telit_evk_pro3_defconfig
@@ -5,9 +5,6 @@ BR2_arm926t=y
 # Linux headers same as kernel, a 3.9 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_9=y
 
-# System
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
-
 # Watchdog is armed by the first stage bootloader
 BR2_PACKAGE_BUSYBOX_WATCHDOG=y
 
