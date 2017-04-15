From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Apr 2017 10:35:50 +0200
Subject: [Buildroot] [git commit] firefly_rk3288_demo_defconfig: increase
	ext2 filesystem size
Message-ID: <20170415084110.EEF74802A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3497b929674d0197c47c9c72110c7f2d8cace5de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit c6bca8cef0 removed autocalculation of the ext2 filesystem
size, the default size is now set to 60MB. However, this is too small
for firefly_rk3288_demo_defconfig. Indeed, the ext2 filesystem contains
the mali blob (90MB) and Qt5 (14MB), totalling to 125MB.

This is a bit too small to fit comfortably on a 128M flash driver, so
increase the size to 250000K (245MB).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/firefly_rk3288_demo_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/firefly_rk3288_demo_defconfig b/configs/firefly_rk3288_demo_defconfig
index 7dadc6b..c2de701 100644
--- a/configs/firefly_rk3288_demo_defconfig
+++ b/configs/firefly_rk3288_demo_defconfig
@@ -26,6 +26,7 @@ BR2_PACKAGE_QT5BASE_EGLFS=y
 BR2_PACKAGE_MALI_T76X=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_BLOCKS=250000
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
