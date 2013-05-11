From: Anders Darander <anders@chargestorm.se>
Date: Sat, 11 May 2013 14:57:27 +0200
Subject: [Buildroot] [PATCH v2 3/4] beaglebone: add am33x-cm3 to the build
In-Reply-To: <1368277048-17340-1-git-send-email-anders@chargestorm.se>
References: <1368277048-17340-1-git-send-email-anders@chargestorm.se>
Message-ID: <1368277048-17340-4-git-send-email-anders@chargestorm.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the FW needed for the Cortex M3 on the beaglebone. This is required for
a working power management.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 configs/beaglebone_defconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 38a63a1..a141320 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -11,6 +11,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
 # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
 
 # filesystem
+BR2_PACKAGE_AM33X_CM3=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-- 
1.7.10.4
