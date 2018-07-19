From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 19 Jul 2018 12:31:02 +0200
Subject: [Buildroot] [PATCH v2 0/7] Add Boundary Devices Nitrogen8M support
Message-ID: <20180719103109.19887-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This series adds support for our i.MX8MQ based Nitrogen8M platform.

Since this is our first ARM64 design, our boot scripts and post-build
script needed to be updated. Doing so, it became clear that it was time
to remove obsolete boot scripts so it is part of the series as well.

Also, the freescale imx8-bootloader-prepare script hardcoded the evk
device tree which means it could only be used for 1 board. Therefore it
was also modified to accept any device tree as a script argument (using
BR2_ROOTFS_POST_SCRIPT_ARGS).

Changes in v2:
- Add script parameter to evk defconfig to specify dtb
- Remove fallback to evk dtb in imx8-bootloader-prepare
- Split post-build.sh patch
- Add missing .gitlab-ci.yml reference to nitrogen8m_defconfig

Regards,
Gary

Gary Bisson (7):
  configs/freescale_imx8mqevk: add script arg to specify U-Boot dtb
  board/freescale/common/imx: make imx8-bootloader-prepare more generic
  board/boundarydevices/common/post-build.sh: fix U-Boot naming
  board/boundarydevices: remove obsolete u-boot scripts
  board/boundarydevices: add i.MX8MQ support to post-build.sh
  board/boundarydevices: add i.MX8MQ support to u-boot scripts
  configs/nitrogen8m: Add new defconfig

 .gitlab-ci.yml                                |   1 +
 .../boundarydevices/common/6x_bootscript.txt  | 131 ------------------
 board/boundarydevices/common/6x_upgrade.txt   |  69 ---------
 board/boundarydevices/common/boot.cmd         |  40 +++---
 board/boundarydevices/common/post-build.sh    |  28 ++--
 board/boundarydevices/common/upgrade.cmd      |  69 ++++++++-
 .../common/imx/imx8-bootloader-prepare.sh     |   8 +-
 configs/freescale_imx8mqevk_defconfig         |   1 +
 configs/nitrogen8m_defconfig                  |  54 ++++++++
 9 files changed, 159 insertions(+), 242 deletions(-)
 delete mode 100644 board/boundarydevices/common/6x_bootscript.txt
 delete mode 100644 board/boundarydevices/common/6x_upgrade.txt
 create mode 100644 configs/nitrogen8m_defconfig

-- 
2.18.0
