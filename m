From: Michael Trimarchi <michael@amarulasolutions.com>
Date: Fri,  7 Apr 2017 12:03:23 +0200
Subject: [Buildroot] [PATCH 2/2] beaglebone: increase size of ext4 more then
	60MB
In-Reply-To: <20170407100323.6871-1-michael@amarulasolutions.com>
References: <20170407100323.6871-1-michael@amarulasolutions.com>
Message-ID: <20170407100323.6871-2-michael@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is due to the fact that we removed auto-calculation of the ext4
filesystem size in
https://git.buildroot.org/buildroot/commit/?id=c6bca8cef0310bc649240b451989457ce94a8358,
and we default to 60 MB for the filesystem size, which is not enough
for this demo

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 configs/beaglebone_qt5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index 78dc10973..cdf8b96c1 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -26,6 +26,7 @@ BR2_PACKAGE_TI_SGX_KM=y
 BR2_PACKAGE_TI_SGX_UM=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_BLOCKS=126976
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-- 
2.11.0
