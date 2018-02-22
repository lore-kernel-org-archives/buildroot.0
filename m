From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Thu, 22 Feb 2018 11:02:55 +0100
Subject: [Buildroot] [PATCH v2 0/3] Initial support for NXP iMX8 (imx8mq-evk)
Message-ID: <1519293778-5185-1-git-send-email-karl.erik.larsson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series provides initial support for NXP iMX8 (imx8mq-evk).

This series of patches are tested against NXP imx8mq-evk.
It only handles basic support for iIMX8M, currently no
support for GPU, VPU and other HW features. This series
makes it possible to build a minimal system for imx8mq-evk.

Changes since v1
================
  - Removed new imx-atf package, use boot/arm-trusted-firmware.
  - Move imx-mkimage from package/freescale-imx to package.
  - Add upstream URL for imx-mkimage in Config.in.host.
  - Fix install command syntax for imx-mkimage package.
  - Use Makefile in imx-mkimage to build imx-boot-imx8mqevk-sd.bin instead of doing that in the post-script.sh
  - Split third commit into two, one for firmware-img package and one for iMX8 board.

Erik Larsson (3):
  imx-mkimage: new package
  firmware-imx: add support for iMX8M firmware
  add support iMX8MQ-evk board

 .../common/imx/genimage.cfg.template_imx8          |  40 ++
 board/freescale/common/imx/post-image.sh           |  10 +-
 board/freescale/imx8mqevk/linux-4.9.config         | 625 +++++++++++++++++++++
 configs/freescale_imx8mqevk_defconfig              |  37 ++
 package/Config.in.host                             |   1 +
 package/freescale-imx/Config.in                    |   4 +-
 package/freescale-imx/firmware-imx/Config.in       |   2 +-
 package/freescale-imx/firmware-imx/firmware-imx.mk |   8 +
 .../imx-mkimage/0001-remove-git-build-info.patch   |  28 +
 package/imx-mkimage/Config.in.host                 |  11 +
 package/imx-mkimage/imx-mkimage.hash               |   3 +
 package/imx-mkimage/imx-mkimage.mk                 |  41 ++
 12 files changed, 805 insertions(+), 5 deletions(-)
 create mode 100644 board/freescale/common/imx/genimage.cfg.template_imx8
 create mode 100644 board/freescale/imx8mqevk/linux-4.9.config
 create mode 100644 configs/freescale_imx8mqevk_defconfig
 create mode 100644 package/imx-mkimage/0001-remove-git-build-info.patch
 create mode 100644 package/imx-mkimage/Config.in.host
 create mode 100644 package/imx-mkimage/imx-mkimage.hash
 create mode 100644 package/imx-mkimage/imx-mkimage.mk

-- 
2.7.4
