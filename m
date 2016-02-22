From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 22 Feb 2016 18:59:14 +0000
Subject: [Buildroot] [PATCH v2 00/15] Add support for STM32F469-DISCO &
	STM32F469-DISCO boards
Message-ID: <1456167569-8713-1-git-send-email-lee.jones@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After this set is applied and you have the correct toolchain installed it
should be trivial to configure, build and flash the; bootloader, DTB and
kernel (with CPIO rootfs attached) to the board(s).

Lee Jones (15):
  boot: Add new bootloader afboot-stm32
  boards: stm32f469-disco: Add kernel patch to provide top compatible
    string
  boards: stm32f469-disco: Add kernel patch to provide top compatible
    string
  boards: stm32f469-disco: Add kernel patch to provide DTS file
  boards: stm32f469-disco: Add kernel patch to provide DTS file
  boards: stm32f469-disco: Add kernel patch to set RAM address to 0
  boards: stm32f469-disco: Add kernel patch to set RAM address to 0
  boards: stm32f469-disco: Add OpenOCD patch to supply a new config
  boards: stm32f469-disco: Add OpenOCD patch to support on-board flash
    chip
  boards: stm32f469-disco: Add a helper script to flash images
  boards: stm32f429-disco: Add a readme.txt
  boards: stm32f429-disco: Add a helper script to flash images
  boards: stm32f469-disco: Add a readme.txt
  configs: Add a tested working STM32F469-DISCO defconfig
  configs: Add a tested working STM32F429-DISCO defconfig

 .../stm32/stm32f429-disco/flash.sh                 |  12 +++
 .../stm32/stm32f429-disco/readme.txt               |  10 ++
 .../stm32/stm32f469-disco/flash.sh                 |  12 +++
 .../linux/0001-kernel-add-top-compatible.patch     |  25 +++++
 .../patches/linux/0002-kernel-new-dts-file.patch   | 112 +++++++++++++++++++++
 .../linux/0003-kernel-config-frag-ram.patch        |  28 ++++++
 .../patches/openocd/0.9.0/0001-add-config.patch    |  37 +++++++
 .../patches/openocd/0.9.0/0002-flash-nor.patch     |  37 +++++++
 .../stm32/stm32f469-disco/readme.txt               |  10 ++
 boot/Config.in                                     |   1 +
 boot/afboot-stm32/Config.in                        |   6 ++
 boot/afboot-stm32/afboot-stm32.hash                |   2 +
 boot/afboot-stm32/afboot-stm32.mk                  |  18 ++++
 configs/stm32f429_disco_defconfig                  |  16 +++
 configs/stm32f469_disco_defconfig                  |  18 ++++
 15 files changed, 344 insertions(+)
 create mode 100755 board/stmicroelectronics/stm32/stm32f429-disco/flash.sh
 create mode 100644 board/stmicroelectronics/stm32/stm32f429-disco/readme.txt
 create mode 100755 board/stmicroelectronics/stm32/stm32f469-disco/flash.sh
 create mode 100644 board/stmicroelectronics/stm32/stm32f469-disco/patches/linux/0001-kernel-add-top-compatible.patch
 create mode 100644 board/stmicroelectronics/stm32/stm32f469-disco/patches/linux/0002-kernel-new-dts-file.patch
 create mode 100644 board/stmicroelectronics/stm32/stm32f469-disco/patches/linux/0003-kernel-config-frag-ram.patch
 create mode 100644 board/stmicroelectronics/stm32/stm32f469-disco/patches/openocd/0.9.0/0001-add-config.patch
 create mode 100644 board/stmicroelectronics/stm32/stm32f469-disco/patches/openocd/0.9.0/0002-flash-nor.patch
 create mode 100644 board/stmicroelectronics/stm32/stm32f469-disco/readme.txt
 create mode 100644 boot/afboot-stm32/Config.in
 create mode 100644 boot/afboot-stm32/afboot-stm32.hash
 create mode 100644 boot/afboot-stm32/afboot-stm32.mk
 create mode 100644 configs/stm32f429_disco_defconfig
 create mode 100644 configs/stm32f469_disco_defconfig

-- 
1.9.1
