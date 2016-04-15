From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 23:02:16 +0200
Subject: [Buildroot] [PATCH v4 0/4] ARM Cortex-M support and STM32 defconfigs
Message-ID: <1460754140-24255-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Yet another version of the ARM Cortex-M support and STM32 defconfigs.

Changes since v3:

 - Rebased on top of master, dropping all patches that have been
   merged. We're down to four patches, yeah!

 - Changed the elf2flt package to use the latest upstream version,
   which allows to remove the patch that was needed until now to
   support ARM noMMU (it has been merged upstream).

This new version has been runtime tested on STM32F429 Discovery.

Thanks!

Thomas

Lee Jones (2):
  configs/stm32f429_disco: new configuration for STM32F429 Discovery
    board
  configs/stm32f469_disco: new configuration for STM32F469 Discovery
    board

Thomas Petazzoni (2):
  elf2flt: use new upstream site and bump version
  afboot-stm32: use the Buildroot toolchain

 board/stmicroelectronics/busybox-minimal.config    | 1057 ++++++++++++++++++++
 board/stmicroelectronics/stm32-post-build.sh       |    8 +
 board/stmicroelectronics/stm32f429-disco/flash.sh  |   20 +
 ...49-disco-don-t-force-init-in-chosen-boota.patch |   32 +
 .../stmicroelectronics/stm32f429-disco/readme.txt  |   30 +
 board/stmicroelectronics/stm32f469-disco/flash.sh  |   20 +
 ...-ARM-stm32-Identify-a-new-board-STM32F469.patch |   25 +
 ...upply-a-DTS-file-for-the-STM32F469-Discov.patch |  101 ++
 ...-Add-new-config-fragment-to-change-RAM-st.patch |   28 +
 .../patches/openocd/0001-add-config.patch          |   37 +
 .../patches/openocd/0002-flash-nor.patch           |   37 +
 .../stmicroelectronics/stm32f469-disco/readme.txt  |   19 +
 .../0001-Use-ld-instead-of-gcc-for-linking.patch   |   61 ++
 boot/afboot-stm32/afboot-stm32.mk                  |    2 +-
 configs/stm32f429_disco_defconfig                  |   18 +
 configs/stm32f469_disco_defconfig                  |   19 +
 package/elf2flt/elf2flt.hash                       |    2 +
 package/elf2flt/elf2flt.mk                         |    8 +-
 18 files changed, 1519 insertions(+), 5 deletions(-)
 create mode 100644 board/stmicroelectronics/busybox-minimal.config
 create mode 100755 board/stmicroelectronics/stm32-post-build.sh
 create mode 100755 board/stmicroelectronics/stm32f429-disco/flash.sh
 create mode 100644 board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch
 create mode 100644 board/stmicroelectronics/stm32f429-disco/readme.txt
 create mode 100755 board/stmicroelectronics/stm32f469-disco/flash.sh
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/0001-ARM-stm32-Identify-a-new-board-STM32F469.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/0002-ARM-stm32-Supply-a-DTS-file-for-the-STM32F469-Discov.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/0003-ARM-configs-Add-new-config-fragment-to-change-RAM-st.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/openocd/0001-add-config.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/openocd/0002-flash-nor.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/readme.txt
 create mode 100644 boot/afboot-stm32/0001-Use-ld-instead-of-gcc-for-linking.patch
 create mode 100644 configs/stm32f429_disco_defconfig
 create mode 100644 configs/stm32f469_disco_defconfig
 create mode 100644 package/elf2flt/elf2flt.hash

-- 
2.6.4
