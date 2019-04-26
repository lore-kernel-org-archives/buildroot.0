From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:43:36 +0200
Subject: [Buildroot] [git commit branch/2019.02.x]
 configs/atmel_sama5d4_xplained_mmc_dev: increase ext4 image size
Message-ID: <20190426130223.4592680163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff101a6dabf0c2871922dc04fd40ea21b915fb9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The default of 60 MB is no longer sufficient to contain all the tools
enabled in this "development" defconfig, so let's increase the ext4
image size to 120 MB.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339426

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 18a4d559061ab3d00f7e39c963d86ee5ff794d4c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/atmel_sama5d4_xplained_mmc_dev_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
index f20e114ff1..cfac503fa4 100644
--- a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
@@ -83,6 +83,7 @@ BR2_PACKAGE_VIM=y
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
