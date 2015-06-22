From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 22 Jun 2015 16:39:10 +0200
Subject: [Buildroot] [V3 0/2] Subject: [V3 0/2] A20-OLinuXino-Lime: new board
Message-ID: <1434983952-7662-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This set adds the board A20-OLinuXino-Lime, with 2 flavors:
    - kernel mainline
    - linux-sunxi (3.4.x)

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
 configs/olimex_a20_olinuxino_lime_defconfig      |  42 ++++++++++
 configs/olimex_a20_olinuxino_lime_mali_defconfig |  47 +++++++++++
 6 files changed, 211 insertions(+)
 create mode 100644 board/olimex/a20_olinuxino_lime/boot-mali.cmd
 create mode 100644 board/olimex/a20_olinuxino_lime/boot.cmd
 create mode 100755 board/olimex/a20_olinuxino_lime/post-build.sh
 create mode 100644 board/olimex/a20_olinuxino_lime/readme.txt
 create mode 100644 configs/olimex_a20_olinuxino_lime_defconfig
 create mode 100644 configs/olimex_a20_olinuxino_lime_mali_defconfig

-- 
2.1.4
