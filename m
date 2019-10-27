From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Date: Sun, 27 Oct 2019 20:21:30 +0100
Subject: [Buildroot] [PATCH v2 2/3] board/beelink_gs1: enable mdev and dhcp
 on eth0
In-Reply-To: <20191027192131.6813-1-peron.clem@gmail.com>
References: <20191027192131.6813-1-peron.clem@gmail.com>
Message-ID: <20191027192131.6813-2-peron.clem@gmail.com>
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
index b3004ffe7a..b5b4238791 100644
--- a/configs/beelink_gs1_defconfig
+++ b/configs/beelink_gs1_defconfig
@@ -2,6 +2,9 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Beelink GS1"
+# MDEV is required to autoload the ethernet driver module
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/beelink/gs1/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beelink/gs1/genimage.cfg"
-- 
2.20.1
