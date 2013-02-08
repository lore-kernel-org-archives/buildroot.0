From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Feb 2013 09:46:49 -0300
Subject: [Buildroot] [PATCH] configs/beaglebone_defconfig: lock down kernel
	headers version
Message-ID: <1360327609-16507-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/beaglebone_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index f78a400..e19cdcb 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -8,6 +8,9 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
 # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
+# Lock down headers to avoid breaking with new defaults
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.2.9"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="am335x_evm"
 BR2_TARGET_UBOOT_2012_10=y
-- 
1.7.12.4
