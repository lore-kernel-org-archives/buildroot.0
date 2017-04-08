From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 16:06:27 +0200
Subject: [Buildroot] [git commit] configs/beaglebone_qt5: increase size of
	ext4 filesystem image
Message-ID: <20170408140717.AA477819DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4d8252ee940bfcf2ad3261ea9f9a87e99d0056f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit c6bca8cef0310bc649240b451989457ce94a8358, the
auto-calculation logic of the ext4 filesystem size was removed. The
default size of 60MB is too small for the beaglebone_qt5_defconfig,
should it should be increased.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/beaglebone_qt5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index 78dc109..cdf8b96 100644
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
