From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 14:40:47 +0200
Subject: [Buildroot] [git commit] configs/atmel_sama5d27_som1_ek_mmc_dev:
 increase rootfs image size
Message-ID: <20190421123714.A6C9C81453@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce751fad37b78bb658ea6532bee3b49ea523aa73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default rootfs image size is too small, causing the following
build failure:

Copying files into the device: __populate_fs: Could not allocate block in ext2 filesystem while writing file "udevd"
mkfs.ext4: Could not allocate block in ext2 filesystem while populating file system
*** Maybe you need to increase the filesystem size (BR2_TARGET_ROOTFS_EXT2_SIZE)

So we increase it to 120 MB.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339415

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
index 9985b64727..1ae4b853da 100644
--- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
+++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
@@ -67,6 +67,7 @@ BR2_PACKAGE_HTOP=y
 BR2_PACKAGE_VIM=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
