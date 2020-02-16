From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Date: Sun, 16 Feb 2020 22:19:37 +0100
Subject: [Buildroot] [PATCH 4/4] [DO NOT MERGE] boards/beelink_gs1: autossh
 with trivial root password
In-Reply-To: <20200216211937.27200-1-peron.clem@gmail.com>
References: <20200216211937.27200-1-peron.clem@gmail.com>
Message-ID: <20200216211937.27200-4-peron.clem@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Cl?ment P?ron <peron.clem@gmail.com>
---
 configs/beelink_gs1_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/beelink_gs1_defconfig b/configs/beelink_gs1_defconfig
index 04c8b544eafb..3a5f7bc057ec 100644
--- a/configs/beelink_gs1_defconfig
+++ b/configs/beelink_gs1_defconfig
@@ -4,6 +4,7 @@ BR2_ARM_FPU_VFPV4=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Beelink GS1"
 # MDEV is required to autoload the ethernet driver module
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_TARGET_GENERIC_ROOT_PASSWD="admin"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/beelink/gs1/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
@@ -18,6 +19,8 @@ BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h6-beelink-gs1"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_AUTOSSH=y
+BR2_PACKAGE_DROPBEAR=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-- 
2.20.1
