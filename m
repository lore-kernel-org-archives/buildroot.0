From: Lee Jones <lee.jones@linaro.org>
Date: Fri, 19 Feb 2016 17:08:56 +0000
Subject: [Buildroot] [PATCH 0/9] Add support for STM32F469-DISCO board
Message-ID: <1455901745-18486-1-git-send-email-lee.jones@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After this set is applied and you have the correct toolchain installed it
should be trivial to configure, build and flash the; bootloader, DTB and
kernel (with CPIO rootfs attached) to the board.

Yay for tools!

Lee Jones (9):
  boot: Add new bootloader afboot-stm32
  configs: Add a tested working STM32F469-DISCO defconfig
  boards: stm32f469-disco: Add a post-image script
  boards: stm32f469-disco: Add kernel patch to provide top compatible
    string
  boards: stm32f469-disco: Add kernel patch to provide DTS file
  boards: stm32f469-disco: Add kernel patch to set RAM address to 0
  boards: stm32f469-disco: Add kernel patch to set RAM address to 0
  boards: stm32f469-disco: Add OpenOCD patch to supply a new config
  boards: stm32f469-disco: Add OpenOCD patch to support on-board flash
    chip

 .../kernel/0001-kernel-add-top-compatible.patch    |  25 +++++
 .../patches/kernel/0002-kernel-new-dts-file.patch  | 112 +++++++++++++++++++++
 .../kernel/0003-kernel-config-frag-ram.patch       |  28 ++++++
 .../patches/kernel/0004-enable-cpio-rootfs.patch   |  26 +++++
 .../patches/openocd/0.9.0/0001-add-config.patch    |  37 +++++++
 .../patches/openocd/0.9.0/0002-flash-nor.patch     |  37 +++++++
 .../stm32/stm32f469-disco/post-image.sh            |  12 +++
 boot/Config.in                                     |   1 +
 boot/afboot-stm32/Config.in                        |   7 ++
 boot/afboot-stm32/afboot-stm32.mk                  |  18 ++++
 configs/stm32f469_disco_defconfig                  |  29 ++++++
 11 files changed, 332 insertions(+)
 create mode 100644 board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0001-kernel-add-top-compatible.patch
 create mode 100644 board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0002-kernel-new-dts-file.patch
 create mode 100644 board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0003-kernel-config-frag-ram.patch
 create mode 100644 board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0004-enable-cpio-rootfs.patch
 create mode 100644 board/stmicroelectronics/stm32/stm32f469-disco/patches/openocd/0.9.0/0001-add-config.patch
 create mode 100644 board/stmicroelectronics/stm32/stm32f469-disco/patches/openocd/0.9.0/0002-flash-nor.patch
 create mode 100755 board/stmicroelectronics/stm32/stm32f469-disco/post-image.sh
 create mode 100644 boot/afboot-stm32/Config.in
 create mode 100644 boot/afboot-stm32/afboot-stm32.mk
 create mode 100644 configs/stm32f469_disco_defconfig

-- 
1.9.1
