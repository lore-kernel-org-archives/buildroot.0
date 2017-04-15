From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Apr 2017 10:35:59 +0200
Subject: [Buildroot] [git commit] at91sam9x5ek_mmc_dev_defconfig: increase
	ext2 filesystem size
Message-ID: <20170415084111.0981A802A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d713de5e94b10983122811ef562d524088b9deb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit c6bca8cef0 removed autocalculation of the ext2 filesystem
size, the default size is now set to 60MB. However, this is just too
small for at91sam9x5ek_mmc_dev_defconfig, which has a lot of extra
packages for development.

Increase the filesystem size to 120000K, which is a nice and round
number and leaves enough space for overhead on a 128MB flash drive.
Only 65MB is used.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/at91sam9x5ek_mmc_dev_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
index 103b457..09482d2 100644
--- a/configs/at91sam9x5ek_mmc_dev_defconfig
+++ b/configs/at91sam9x5ek_mmc_dev_defconfig
@@ -81,6 +81,7 @@ BR2_PACKAGE_VIM=y
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_BLOCKS=120000
 
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
