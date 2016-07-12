From: Lothar Felten <lothar.felten@gmail.com>
Date: Tue, 12 Jul 2016 10:26:44 +0200
Subject: [Buildroot] [PATCH 0/5] new target config for am335x-evm
Message-ID: <1468312009-22124-1-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a target config for the ti am335x-evm based on the 
ti-processor-sdk 02.00.00.00. 
It also supports the beaglebone and beagleboneblack. By default SGX and Qt5 are
selected, demos for SGX and Qt5 are built.
Patches allow the use of old am335x evm revisions (1 bit sd card) and JTAG 
debugging. 


Lothar Felten (5):
  add kernel configuration for ti am335x-evm
  patch to enable the use of a JTAG debugger
  force 1 bit communication with SD card
  add files required to build sd card image and doc
  add defconfig for am335x-evm target

 board/ti/am335x-evm/genimage.cfg                   |   29 +
 board/ti/am335x-evm/kernel.config                  | 4887 ++++++++++++++++++++
 .../0004-keep-jtag-clock-alive-for-debugger.patch  |   10 +
 .../uboot/0001-mmc-force-1bit-bus-width.patch      |   29 +
 board/ti/am335x-evm/post-image.sh                  |   22 +
 board/ti/am335x-evm/readme.txt                     |   63 +
 board/ti/am335x-evm/uEnv.txt                       |    3 +
 configs/am335x-evm_defconfig                       |   40 +
 8 files changed, 5083 insertions(+)
 create mode 100644 board/ti/am335x-evm/genimage.cfg
 create mode 100644 board/ti/am335x-evm/kernel.config
 create mode 100644 board/ti/am335x-evm/patches/linux/0004-keep-jtag-clock-alive-for-debugger.patch
 create mode 100644 board/ti/am335x-evm/patches/uboot/0001-mmc-force-1bit-bus-width.patch
 create mode 100755 board/ti/am335x-evm/post-image.sh
 create mode 100644 board/ti/am335x-evm/readme.txt
 create mode 100644 board/ti/am335x-evm/uEnv.txt
 create mode 100644 configs/am335x-evm_defconfig

-- 
1.9.1
