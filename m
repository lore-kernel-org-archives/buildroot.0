From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 14 Apr 2017 23:26:05 +0200
Subject: [Buildroot] [PATCH 2/3] firefly_rk3288_demo_defconfig: increase
	ext2 filesystem size
In-Reply-To: <20170414212606.13819-1-arnout@mind.be>
References: <20170414212606.13819-1-arnout@mind.be>
Message-ID: <20170414212606.13819-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit c6bca8cef0 removed autocalculation of the ext2 filesystem
size, the default size is now set to 60MB. However, this is too small
for firefly_rk3288_demo_defconfig. Indeed, the ext2 filesystem contains
the mali blobk (90MB) and Qt5 (14MB), totalling to 125MB.

This is a bit too small to fit comfortably on a 128M flash driver, so
increase the size to 250000K (245MB).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/firefly_rk3288_demo_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/firefly_rk3288_demo_defconfig b/configs/firefly_rk3288_demo_defconfig
index 7dadc6bc9a..c2de701934 100644
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
-- 
2.11.0
