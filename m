From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 11:39:28 +0200
Subject: [Buildroot] [PATCH 0/4] Add defconfig for STM32MP157 Discovery Kit
Message-ID: <20190424093933.6212-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of patches add a defconfig for the STM32MP157 Discovery Kit
platform. The first three patches are preparation patches and the last
one adds the defconfig itself and its related files.

Thanks!

Thomas

Thomas Petazzoni (4):
  package/genimage: bump version
  package/genimage: add patch to support bootable flag in GPT tables
  boot/uboot: add option to pass custom variables to U-Boot build
  configs/stm32mp157_dk: new defconfig

 .gitlab-ci.yml                                |   1 +
 DEVELOPERS                                    |   2 +
 .../stm32mp157-dk/genimage.cfg                |  24 +++
 .../stm32mp157-dk/linux.config                | 182 ++++++++++++++++++
 .../overlay/boot/extlinux/extlinux.conf       |   4 +
 .../stm32mp157-dk/readme.txt                  |  38 ++++
 .../stm32mp157-dk/uboot-fragment.config       |   1 +
 boot/uboot/Config.in                          |   6 +
 boot/uboot/uboot.mk                           |   3 +-
 configs/stm32mp157_dk_defconfig               |  30 +++
 ...dd-support-for-bootable-flags-on-GPT.patch |  45 +++++
 package/genimage/genimage.hash                |   2 +-
 package/genimage/genimage.mk                  |   7 +-
 13 files changed, 340 insertions(+), 5 deletions(-)
 create mode 100644 board/stmicroelectronics/stm32mp157-dk/genimage.cfg
 create mode 100644 board/stmicroelectronics/stm32mp157-dk/linux.config
 create mode 100644 board/stmicroelectronics/stm32mp157-dk/overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/stmicroelectronics/stm32mp157-dk/readme.txt
 create mode 100644 board/stmicroelectronics/stm32mp157-dk/uboot-fragment.config
 create mode 100644 configs/stm32mp157_dk_defconfig
 create mode 100644 package/genimage/0001-image-hd-add-support-for-bootable-flags-on-GPT.patch

-- 
2.20.1
