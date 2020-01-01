From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Jan 2020 17:17:18 +0100
Subject: [Buildroot] [git commit] configs/stm32mp157c_dk2: disable ext4
 metadata_csum option
Message-ID: <20200101161033.E81C78EA65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=659ff49e51e64e72e033376abeb92204b29f53f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The U-Boot ext4 write support doesn't work with the metadata_csum
option, and the stm32mp157 U-Boot defconfig uses an environment stored
in an ext4 filesystem, so we must create the ext4 root filesystem
without the metadata_csum option enabled.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
[Thomas: only disable the metadata_csum option, the 64bit and
dir_index options can be kept enabled]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/stm32mp157c_dk2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index a1e61d752d..7e5db3caa9 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O ^metadata_csum"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
