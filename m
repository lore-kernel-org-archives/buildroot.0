From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2020 20:58:16 +0100
Subject: [Buildroot] [git commit] Revert
 "configs/qemu_arm_versatile_defconfig: increase SD card image size to
 64MiB"
Message-ID: <20201110200457.30D2C81E74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80cbc2922ab95980b7cffac077d58ce43bdfba8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qemu_arm_versatile doesn't use SD card interface but SCSI, so there is no
need to increase the image size.
The change was for qemu_arm_vexpress_defconfig instead (notice the
name of the defconfig used in gitlab).

This reverts commit cb62a8e0a2b88b6c1b3ffe74e9eb370bf686fa62.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_arm_versatile_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 280c313407..6dc212397c 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -13,8 +13,6 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Image
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
-# Qemu >= 5.1 requires SD card size to be a power of 2, e.g. 64 MiB.
-BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
 
 # Linux headers same as kernel, a 5.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
