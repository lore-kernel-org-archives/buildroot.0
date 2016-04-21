From: Damien Riegel <damien.riegel@savoirfairelinux.com>
Date: Thu, 21 Apr 2016 12:21:11 -0400
Subject: [Buildroot] [PATCH 0/2] add support for TS-4800
Message-ID: <1461255673-11443-1-git-send-email-damien.riegel@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset brings the support for the TS-4800 manufactured by Technologic
Systems. While we're at it, rename the ts directory to technologic to be
consistent with Linux and U-Boot.

Damien Riegel (2):
  board: rename ts to technologic
  configs: add defconfig for TS-4800

 board/technologic/ts4800/genimage.cfg              |  37 ++++++++++++++
 board/technologic/ts4800/linux.fragment            |   3 ++
 board/technologic/ts4800/mbrboot.bin               | Bin 0 -> 446 bytes
 ...800-add-CONFIG_SYS_FSL_ERRATUM_ESDHC_A001.patch |  36 ++++++++++++++
 .../uboot/ts4800-patch-env-to-boot-dts.patch       |  55 +++++++++++++++++++++
 board/technologic/ts4800/post-image.sh             |  25 ++++++++++
 .../ts5x00/fs-overlay/boot/syslinux/syslinux.cfg   |   0
 board/{ts => technologic}/ts5x00/linux-3.17.config |   0
 board/{ts => technologic}/ts5x00/readme.txt        |   0
 configs/ts4800_defconfig                           |  27 ++++++++++
 configs/ts5x00_defconfig                           |   4 +-
 11 files changed, 185 insertions(+), 2 deletions(-)
 create mode 100644 board/technologic/ts4800/genimage.cfg
 create mode 100644 board/technologic/ts4800/linux.fragment
 create mode 100644 board/technologic/ts4800/mbrboot.bin
 create mode 100644 board/technologic/ts4800/patches/uboot/ts4800-add-CONFIG_SYS_FSL_ERRATUM_ESDHC_A001.patch
 create mode 100644 board/technologic/ts4800/patches/uboot/ts4800-patch-env-to-boot-dts.patch
 create mode 100755 board/technologic/ts4800/post-image.sh
 rename board/{ts => technologic}/ts5x00/fs-overlay/boot/syslinux/syslinux.cfg (100%)
 rename board/{ts => technologic}/ts5x00/linux-3.17.config (100%)
 rename board/{ts => technologic}/ts5x00/readme.txt (100%)
 create mode 100644 configs/ts4800_defconfig

-- 
2.5.0
