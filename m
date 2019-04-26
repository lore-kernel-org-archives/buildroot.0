From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:43:42 +0200
Subject: [Buildroot] [git commit branch/2019.02.x]
 configs/atmel_sama5d2_xplained_mmc_dev: increase ext4 image size
Message-ID: <20190426130223.4C19980163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e716e612cd66260c6698c1783c1124dd14d19f00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The default of 60 MB is no longer sufficient to contain all the tools
enabled in this "development" defconfig, so let's increase the ext4
image size to 120 MB.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339417

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit df9f18907203d2910eb8acdc262fcb583446a8ad)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
index bc5414c4f4..e140a44e45 100644
--- a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
@@ -83,6 +83,7 @@ BR2_PACKAGE_VIM=y
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
