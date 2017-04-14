From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 14 Apr 2017 23:26:06 +0200
Subject: [Buildroot] [PATCH 3/3] at91sam9x5ek_mmc_dev_defconfig: increase
	ext2 filesystem size
In-Reply-To: <20170414212606.13819-1-arnout@mind.be>
References: <20170414212606.13819-1-arnout@mind.be>
Message-ID: <20170414212606.13819-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit c6bca8cef0 removed autocalculation of the ext2 filesystem
size, the default size is now set to 60MB. However, this is just too
small for at91sam9x5ek_mmc_dev_defconfig, which has a lot of extra
packages for development.

Increase the filesystem size to 120000K, which is a nice and round
number and leaves enough space for overhead on a 128MB flash drive.
Only 65MB is used.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/at91sam9x5ek_mmc_dev_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
index 103b457d93..09482d2295 100644
--- a/configs/at91sam9x5ek_mmc_dev_defconfig
+++ b/configs/at91sam9x5ek_mmc_dev_defconfig
@@ -81,6 +81,7 @@ BR2_PACKAGE_VIM=y
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_BLOCKS=120000
 
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
-- 
2.11.0
