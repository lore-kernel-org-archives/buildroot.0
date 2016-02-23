From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 23 Feb 2016 01:24:24 +0100
Subject: [Buildroot] [PATCH 0/9] Olimex A20 OlinuXino updates
Message-ID: <1456187073-2876-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

here's a series of updates to the Olimex OlinuXino A20 board support
in Buildroot.

Patches 1 and 5 are just cleanups.

Patches 2-4 revive the -MICRO board by upgrading the kernel and U-Boot
and enabling DHCP autoconfiguration.

Patch 6 enables genimage to generate an SD card image. It also
documents how to write the SD, but the old, manual SD writing
instructions are not removed since they are still needed for the -LIME
and -LIME2 boards.

Everything up to here is build- and run-time tested. Following patches
are build-tested only since I don't own these boards.

Patches 7 and 8 enable genimage for the other two boards, and patch 9
removes the manual SD card writing instructions.

Francois, Jan, or anybody having acces to these boards, if you could
test patches 7 and 8 report whether they work, you would help in
making simpler and more uniform the support for the whole family of
boards. Thanks!

Luca


Luca Ceresoli (9):
  olimex/a20_olinuxino: update readme.txt with lime2 info
  olimex_a20_olinuxino_micro: bump linux to 4.4.2
  olimex_a20_olinuxino_micro: bump u-boot to 2016.01
  olimex_a20_olinuxino_micro: initialize the network with DHCP
  olimex_a20_olinuxino_micro: remove redundant defconfig lines
  olimex_a20_olinuxino_micro: update to use genimage
  olimex_a20_olinuxino_lime: update to use genimage
  olimex_a20_olinuxino_lime2: update to use genimage
  olimex_a20_olinuxino_*: remove old SD writing instructions

 board/olimex/a20_olinuxino/genimage.cfg          | 16 +++++++
 board/olimex/a20_olinuxino/post-image.sh         | 16 +++++++
 board/olimex/a20_olinuxino/readme.txt            | 56 ++++--------------------
 configs/olimex_a20_olinuxino_lime2_defconfig     |  2 +
 configs/olimex_a20_olinuxino_lime_defconfig      |  2 +
 configs/olimex_a20_olinuxino_lime_mali_defconfig |  2 +
 configs/olimex_a20_olinuxino_micro_defconfig     | 16 +++----
 7 files changed, 54 insertions(+), 56 deletions(-)
 create mode 100644 board/olimex/a20_olinuxino/genimage.cfg
 create mode 100755 board/olimex/a20_olinuxino/post-image.sh

-- 
1.9.1
