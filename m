From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:43:51 +0200
Subject: [Buildroot] [git commit branch/2019.02.x]
 configs/atmel_sama5d3_xplained_mmc_dev: increase ext4 image size
Message-ID: <20190426130223.538DE80163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22104c11df204e21e3c25ee905dc1da5794f4d28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The default of 60 MB is no longer sufficient to contain all the tools
enabled in this "development" defconfig, so let's increase the ext4
image size to 120 MB.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339421

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d9273b22e9c822d6302038a09b4b6767d51ab6ae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/atmel_sama5d3_xplained_mmc_dev_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
index a1e34ab810..da1c4eb73e 100644
--- a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
@@ -82,6 +82,7 @@ BR2_PACKAGE_VIM=y
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
