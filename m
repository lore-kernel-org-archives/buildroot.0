From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  4 Jul 2017 16:47:24 +0200
Subject: [Buildroot] [PATCH v5 0/5] fs/ext2: cleanup and improvement
Message-ID: <20170704144729.19753-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is anothe respin of the remaining patchs of (so even shorter)
series based on 2 series initially sent early last May by S?bastien
Szymanski and Yann E. Morin, refactoring and improving the ext2/3/4
image support.

Regards,


Samuel Martin (2):
  fs/ext2: deprecate BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES option
  fs/ext2: rename BR2_TARGET_ROOTFS_EXT2_BLOCKS ->
    BR2_TARGET_ROOTFS_EXT2_SIZE

S?bastien Szymanski (3):
  fs/ext2: use mkfs to generate rootfs image
  fs/ext2: Add BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS option
  package/mke2img: remove package

 Config.in.legacy                            |  32 +++++
 DEVELOPERS                                  |   1 -
 configs/at91sam9x5ek_mmc_dev_defconfig      |   2 +-
 configs/beaglebone_qt5_defconfig            |   2 +-
 configs/firefly_rk3288_demo_defconfig       |   2 +-
 configs/minnowboard_max-graphical_defconfig |   2 +-
 configs/nanopi_neo_defconfig                |   2 +-
 configs/pc_x86_64_bios_defconfig            |   2 +-
 configs/pc_x86_64_efi_defconfig             |   2 +-
 configs/raspberrypi3_64_defconfig           |   2 +-
 fs/ext2/Config.in                           |  40 ++++--
 fs/ext2/ext2.mk                             |  26 ++--
 package/Config.in.host                      |   1 -
 package/mke2img/Config.in.host              |  11 --
 package/mke2img/mke2img                     | 205 ----------------------------
 package/mke2img/mke2img.mk                  |  13 --
 16 files changed, 82 insertions(+), 263 deletions(-)
 delete mode 100644 package/mke2img/Config.in.host
 delete mode 100755 package/mke2img/mke2img
 delete mode 100644 package/mke2img/mke2img.mk

--
2.13.2
