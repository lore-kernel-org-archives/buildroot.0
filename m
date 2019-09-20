From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Date: Fri, 20 Sep 2019 21:08:12 +0200
Subject: [Buildroot] [PATCH 2/3] [DO NOT MERGE] board/beelink_gs1: enable
 mdev, dropbear and auto-ssh
In-Reply-To: <20190920190813.21516-1-peron.clem@gmail.com>
References: <20190920190813.21516-1-peron.clem@gmail.com>
Message-ID: <20190920190813.21516-3-peron.clem@gmail.com>
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
index d1a21a4a6d..ccf4771cc7 100644
--- a/configs/beelink_gs1_defconfig
+++ b/configs/beelink_gs1_defconfig
@@ -2,6 +2,7 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Beelink GS1"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/beelink/gs1/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beelink/gs1/genimage.cfg"
@@ -13,6 +14,8 @@ BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h6-beelink-gs1"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_AUTOSSH=y
+BR2_PACKAGE_DROPBEAR=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-- 
2.20.1
