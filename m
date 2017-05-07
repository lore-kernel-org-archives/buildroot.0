From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 13:46:44 +0200
Subject: [Buildroot] [git commit] configs/pc_x86_64_efi_defconfig: increase
	ext2 filesystem size
Message-ID: <20170507114753.A6FC38281D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4b8342bbe4761b5e9e5306ff549f0ca8bc166bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit c6bca8cef0 removed autocalculation of the ext2 filesystem
size, the default size is now set to 60MB. However, this is too small
for pc_x86_64_efi_defconfig. Indeed, the ext2 filesystem contains the
kernel (4MB), the wireless modules (4MB), all firmware for wireless
modules (40MB), and the wifi userspace (9MB) and the udev hwdb (5MB)
which brings the total to 70MB.

Increase the filesystem size to 120000K, which is a nice and round
number and leaves enough space for overhead on a 128MB flash drive.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/builds/15762234

This commit is identical to 9c393ad2fdd2bb6a0955d91bc3d72741b9487b78
from Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>, except it
is done for pc_x86_64_efi_defconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/pc_x86_64_efi_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index 136b711..57b3ec2 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -20,6 +20,7 @@ BR2_TARGET_GRUB2_X86_64_EFI=y
 # Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_BLOCKS=120000
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh"
 
