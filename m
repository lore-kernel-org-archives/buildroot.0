From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat,  9 Dec 2017 22:29:58 +0100
Subject: [Buildroot] [PATCH 0/9] zynq boards: use genimage and update kernel
 + u-boot
Message-ID: <1512855007-1834-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patchest switches the zynq-based boards to using genimage and
updates U-Boot and the kernel to the latest Xilinx releases.

The first patch is a minor improvement to the genimage.sh script and
is not strictly related to the rest of the series.

Luca

Luca Ceresoli (9):
  support/scripts/genimage.sh: show usage when invoked incorrectly
  zynq_zed: linux: bump to xilinx-v2017.3 (based on 4.9)
  zynq_zed: u-boot: bump to xilinx-v2017.3
  zynq_microzed: linux: bump to xilinx-v2017.3 (based on 4.9)
  zynq_microzed: u-boot: bump to xilinx-v2017.3
  zynq_zc706: linux: bump to xilinx-v2017.3 (based on 4.9)
  zynq_zc706: u-boot: bump to xilinx-v2017.3
  boards/zynq: rename the DTB to be loaded by U-Boot
  boards/zynq: use genimage to generate a bootable SD card image

 board/zynq/genimage.cfg         | 25 +++++++++++++++++++++++++
 board/zynq/post-image.sh        | 13 +++++++++++++
 board/zynq/readme.txt           | 14 +++++++-------
 configs/zynq_microzed_defconfig |  8 +++++---
 configs/zynq_zc706_defconfig    |  8 +++++---
 configs/zynq_zed_defconfig      |  8 +++++---
 support/scripts/genimage.sh     |  6 +++++-
 7 files changed, 65 insertions(+), 17 deletions(-)
 create mode 100644 board/zynq/genimage.cfg
 create mode 100755 board/zynq/post-image.sh

-- 
2.7.4
