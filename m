From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Wed,  7 Mar 2018 19:52:14 +0100
Subject: [Buildroot] [PATCH v5 0/4] Initial support for NXP iMX8 (imx8mq-evk)
Message-ID: <1520448738-5794-1-git-send-email-karl.erik.larsson@gmail.com>
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

Changes since v4
================
  - Build kernel, u-boot, atf from tag rel_imx_4.9.51_8mq_beta_patch.
  - Add board readme.txt.
  - Update imx-mkimage package to use host mkimage

Changes since v3
================
  - Use Buildroot toolchain instead of external Linareo toolchain.
  - Changed title on patch number 2

Changes since v2
================
  - Build kernel, u-boot, atf based on tags instead of branches.
  - Make sure to assign BR2_PACKAGE_FREESCALE_IMX_PLATFORM to IMX8M.
  - Remove kernel defconfig from board folder and use arch default in kernel tree.
  - Split third commit into two commits.

Changes since v1
================
  - Removed new imx-atf package, use boot/arm-trusted-firmware.
  - Move imx-mkimage from package/freescale-imx to package.
  - Add upstream URL for imx-mkimage in Config.in.host.
  - Fix install command syntax for imx-mkimage package.
  - Use Makefile in imx-mkimage to build imx-boot-imx8mqevk-sd.bin instead of doing that in the post-script.sh
  - Split third commit into two, one for firmware-img package and one for iMX8 board.

Erik Larsson (4):
  imx-mkimage: new package
  freescale-imx: add config option for i.MX8M
  firmware-imx: add support for iMX8M firmware
  configs/freescale_imx8mqevk: new defconfig

 .../common/imx/genimage.cfg.template_imx8          | 40 +++++++++++
 board/freescale/common/imx/post-image.sh           | 10 ++-
 board/freescale/imx8mqevk/readme.txt               | 83 ++++++++++++++++++++++
 configs/freescale_imx8mqevk_defconfig              | 39 ++++++++++
 package/Config.in.host                             |  1 +
 package/freescale-imx/Config.in                    |  5 +-
 package/freescale-imx/firmware-imx/Config.in       |  2 +-
 package/freescale-imx/firmware-imx/firmware-imx.mk |  8 +++
 .../imx-mkimage/0001-remove-git-build-info.patch   | 29 ++++++++
 .../0002-add-ldflags-to-link-step.patch            | 26 +++++++
 .../0003-remove-use-of-mkimage_uboot.patch         | 26 +++++++
 package/imx-mkimage/Config.in.host                 | 12 ++++
 package/imx-mkimage/imx-mkimage.hash               |  3 +
 package/imx-mkimage/imx-mkimage.mk                 | 36 ++++++++++
 14 files changed, 315 insertions(+), 5 deletions(-)
 create mode 100644 board/freescale/common/imx/genimage.cfg.template_imx8
 create mode 100644 board/freescale/imx8mqevk/readme.txt
 create mode 100644 configs/freescale_imx8mqevk_defconfig
 create mode 100644 package/imx-mkimage/0001-remove-git-build-info.patch
 create mode 100644 package/imx-mkimage/0002-add-ldflags-to-link-step.patch
 create mode 100644 package/imx-mkimage/0003-remove-use-of-mkimage_uboot.patch
 create mode 100644 package/imx-mkimage/Config.in.host
 create mode 100644 package/imx-mkimage/imx-mkimage.hash
 create mode 100644 package/imx-mkimage/imx-mkimage.mk

-- 
2.7.4
