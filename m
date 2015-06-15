From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 15 Jun 2015 20:45:59 +0200
Subject: [Buildroot] [PATCH 0/5] A20-OLinuXino-Lime: new board
Message-ID: <1434393964-20355-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This set adds the board A20-OLinuXino-Lime, with 2 flavors:
    - kernel mainline + uboot mainline
    - linux-sunxi (3.4.x) + uboot-sunxi

And also updates two sunxi related packages (sunxi-board & a10disp).

Francois Perrad (5):
  sunxi-board: bump to version a6a4e94066f4ec6b26fc7060dc453a6bcf26a504
  a10disp: bump to version v0.6.1
  A20-OLinuXino-Lime: new board (mainline)
  cubieboard: rename script to mksunxicard.sh
  A20-OLinuXino-Lime: new board (legacy)

 board/cubietech/cubieboard/mkcubiecard.sh         | 124 ----------------------
 board/cubietech/cubieboard/mksunxicard.sh         | 124 ++++++++++++++++++++++
 board/cubietech/cubieboard/readme.txt             |   4 +-
 board/olimex/a20_olinuxino_lime/boot-legacy.cmd   |   4 +
 board/olimex/a20_olinuxino_lime/boot.cmd          |   5 +
 board/olimex/a20_olinuxino_lime/mksunxicard.sh    |   1 +
 board/olimex/a20_olinuxino_lime/post-build.sh     |  16 +++
 board/olimex/a20_olinuxino_lime/readme-legacy.txt |  60 +++++++++++
 board/olimex/a20_olinuxino_lime/readme.txt        |  89 ++++++++++++++++
 configs/olimex_a20_olinuxino_defconfig            |  35 ++++++
 configs/olimex_a20_olinuxino_legacy_defconfig     |  43 ++++++++
 package/a10disp/a10disp.mk                        |   2 +-
 package/sunxi-boards/sunxi-boards.mk              |   2 +-
 13 files changed, 381 insertions(+), 128 deletions(-)
 delete mode 100755 board/cubietech/cubieboard/mkcubiecard.sh
 create mode 100755 board/cubietech/cubieboard/mksunxicard.sh
 create mode 100644 board/olimex/a20_olinuxino_lime/boot-legacy.cmd
 create mode 100644 board/olimex/a20_olinuxino_lime/boot.cmd
 create mode 120000 board/olimex/a20_olinuxino_lime/mksunxicard.sh
 create mode 100755 board/olimex/a20_olinuxino_lime/post-build.sh
 create mode 100644 board/olimex/a20_olinuxino_lime/readme-legacy.txt
 create mode 100644 board/olimex/a20_olinuxino_lime/readme.txt
 create mode 100644 configs/olimex_a20_olinuxino_defconfig
 create mode 100644 configs/olimex_a20_olinuxino_legacy_defconfig

-- 
2.1.4
