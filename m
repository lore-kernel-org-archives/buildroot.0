From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 26 Jun 2015 12:06:55 +0200
Subject: [Buildroot] [V4 0/2] A20-OLinuXino-Lime: new board
Message-ID: <1435313217-12871-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This set adds the board A20-OLinuXino-Lime, with 2 flavors:
    - kernel mainline
    - linux-sunxi (3.4.x)

Changes V3 -> V4
  - mainline:
    - set BR2_ARM_EABIHF=y
    - set BR2_KERNEL_HEADERS_VERSION, BR2_DEFAULT_KERNEL_VERSION, BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0
    - boot.cmd: use ${fdtfile}, now this script could be used with the LIME, LIME2 & Micro boards
  - mali:
    - set BR2_ARM_EABIHF=y (required by BR2_PACKAGE_SUNXI_MALI_R3P0)
    - set BR2_KERNEL_HEADERS_VERSION, BR2_DEFAULT_KERNEL_VERSION, BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_4
    - set BR2_PACKAGE_SUNXI_MALI=y which is the purpose of this config
    - remove BR2_LINUX_KERNEL_CUSTOM_GIT
    - remove BR2_LINUX_KERNEL_VERSION="sunxi-3.4"
    - boot.cmd: add some specific sunxi variables in bootargs

Changes V2 -> V3
  - rename defconfig in order to avoid conflict between LIME, LIME2 and Micro boards
  - mainline:
    - some minor documentation fixes
    - fix BR2_TARGET_GENERIC_ISSUE
    - set BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.04"
  - mali:
    - switch to mainline U-Boot
    - merge readme.txt
    - refactor with github helper
    - fix BR2_TARGET_GENERIC_ISSUE

Changes V1 -> V2: review/comments by Arnout Vandecappelle
  - mainline:
    - set BR2_KERNEL_HEADERS_4_0=y
    - set BR2_LINUX_KERNEL_INSTALL_TARGET=y
    - set BR2_TARGET_ROOTFS_EXT2_4=y
    - refactor post-build with arguments from BR2_ROOTFS_POST_SCRIPT_ARGS
  - rename of board/cubietech/cubieboard/mkcubiecard.sh
    - patch removed
  - legacy renamed to mali:
    - refactor post-build with arguments from BR2_ROOTFS_POST_SCRIPT_ARGS
    - readme-mali.txt:
      - include text from https://linux-sunxi.org/Linux_Kernel
      - fix a typo

Francois Perrad (2):
  A20-OLinuXino-Lime: new board (mainline)
  A20-OLinuXino-Lime: new board (mali)

 board/olimex/a20_olinuxino_lime/boot-mali.cmd    |   5 ++
 board/olimex/a20_olinuxino_lime/boot.cmd         |   5 ++
 board/olimex/a20_olinuxino_lime/post-build.sh    |  12 +++
 board/olimex/a20_olinuxino_lime/readme.txt       | 100 +++++++++++++++++++++++
 configs/olimex_a20_olinuxino_lime_defconfig      |  45 ++++++++++
 configs/olimex_a20_olinuxino_lime_mali_defconfig |  50 ++++++++++++
 6 files changed, 217 insertions(+)
 create mode 100644 board/olimex/a20_olinuxino_lime/boot-mali.cmd
 create mode 100644 board/olimex/a20_olinuxino_lime/boot.cmd
 create mode 100755 board/olimex/a20_olinuxino_lime/post-build.sh
 create mode 100644 board/olimex/a20_olinuxino_lime/readme.txt
 create mode 100644 configs/olimex_a20_olinuxino_lime_defconfig
 create mode 100644 configs/olimex_a20_olinuxino_lime_mali_defconfig

-- 
2.1.4
