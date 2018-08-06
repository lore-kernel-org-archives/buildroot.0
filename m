From: Neil Armstrong <narmstrong@baylibre.com>
Date: Mon,  6 Aug 2018 08:50:06 +0000
Subject: [Buildroot] [PATCH 0/2] Add support for Libre Computer AML-S905X-CC
 board
Message-ID: <1533545408-11248-1-git-send-email-narmstrong@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for the Libre Computer AML-S905X-CC based
on an Amlogic S905X SoC.

The board features :
- 4xCortex-A53 Cores
- 1 or 2Gib or DDR4
- RS232 TTL Header
- MicroUSB for Power Only
- HDMI 2.0b output + CEC
- CVBS + Audio Jack
- 10/100 Ethernet
- 4xUSB2.0
- IR Receiver
- SDCard
- eMMC optional slot
- 40pin connector partially RPi compatible
- 8Pin I2S 7.1 connector
- 3Pin SPDIF connector

The board is entirely supported since U-boot 2018.01 and Linux 4.14.

In order the generate a valid bootable SDCard image, the "aml-s905x-cc-fip"
is also part of this patchset.

Neil Armstrong (2):
  boot: aml-s905x-cc-fip: new package for Libre Computer AML-S905X-CC
    boot firmwares
  board: Add Libre Computer AML-S905X-CC board support

 DEVELOPERS                                     |  5 ++
 board/librecomputer/aml-s905x-cc/extlinux.conf |  6 +++
 board/librecomputer/aml-s905x-cc/genimage.cfg  | 11 +++++
 board/librecomputer/aml-s905x-cc/post-build.sh |  5 ++
 board/librecomputer/aml-s905x-cc/post-image.sh | 64 ++++++++++++++++++++++++++
 board/librecomputer/aml-s905x-cc/readme.txt    | 50 ++++++++++++++++++++
 boot/Config.in                                 |  1 +
 boot/aml-s905x-cc-fip/Config.in                |  5 ++
 boot/aml-s905x-cc-fip/aml-s905x-cc-fip.hash    |  2 +
 boot/aml-s905x-cc-fip/aml-s905x-cc-fip.mk      | 26 +++++++++++
 configs/aml-s905x-cc_defconfig                 | 30 ++++++++++++
 11 files changed, 205 insertions(+)
 create mode 100644 board/librecomputer/aml-s905x-cc/extlinux.conf
 create mode 100644 board/librecomputer/aml-s905x-cc/genimage.cfg
 create mode 100755 board/librecomputer/aml-s905x-cc/post-build.sh
 create mode 100755 board/librecomputer/aml-s905x-cc/post-image.sh
 create mode 100644 board/librecomputer/aml-s905x-cc/readme.txt
 create mode 100644 boot/aml-s905x-cc-fip/Config.in
 create mode 100644 boot/aml-s905x-cc-fip/aml-s905x-cc-fip.hash
 create mode 100644 boot/aml-s905x-cc-fip/aml-s905x-cc-fip.mk
 create mode 100644 configs/aml-s905x-cc_defconfig

-- 
2.7.4
