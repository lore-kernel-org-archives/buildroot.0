From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 19 Jun 2015 21:13:20 +0200
Subject: [Buildroot] [V2 0/4] A20-OLinuXino-Lime: new board
Message-ID: <1434741204-3988-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This set adds the board A20-OLinuXino-Lime, with 2 flavors:
    - kernel mainline + uboot mainline
    - linux-sunxi (3.4.x) + uboot-sunxi

And also updates two sunxi related packages (sunxi-board & a10disp).

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


Francois Perrad (4):
  sunxi-board: bump to version a6a4e94066f4ec6b26fc7060dc453a6bcf26a504
  a10disp: bump to version v0.6.1
  A20-OLinuXino-Lime: new board (mainline)
  A20-OLinuXino-Lime: new board (mali)

 board/olimex/a20_olinuxino_lime/boot-mali.cmd   |  4 ++
 board/olimex/a20_olinuxino_lime/boot.cmd        |  5 ++
 board/olimex/a20_olinuxino_lime/mksunxicard.sh  |  1 +
 board/olimex/a20_olinuxino_lime/post-build.sh   |  8 +++
 board/olimex/a20_olinuxino_lime/readme-mali.txt | 65 +++++++++++++++++++
 board/olimex/a20_olinuxino_lime/readme.txt      | 86 +++++++++++++++++++++++++
 configs/olimex_a20_olinuxino_defconfig          | 41 ++++++++++++
 configs/olimex_a20_olinuxino_mali_defconfig     | 44 +++++++++++++
 package/a10disp/a10disp.mk                      |  2 +-
 package/sunxi-boards/sunxi-boards.mk            |  2 +-
 10 files changed, 256 insertions(+), 2 deletions(-)
 create mode 100644 board/olimex/a20_olinuxino_lime/boot-mali.cmd
 create mode 100644 board/olimex/a20_olinuxino_lime/boot.cmd
 create mode 120000 board/olimex/a20_olinuxino_lime/mksunxicard.sh
 create mode 100755 board/olimex/a20_olinuxino_lime/post-build.sh
 create mode 100644 board/olimex/a20_olinuxino_lime/readme-mali.txt
 create mode 100644 board/olimex/a20_olinuxino_lime/readme.txt
 create mode 100644 configs/olimex_a20_olinuxino_defconfig
 create mode 100644 configs/olimex_a20_olinuxino_mali_defconfig

-- 
2.1.4
