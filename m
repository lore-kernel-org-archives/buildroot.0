From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Sun, 18 Feb 2018 14:28:28 +0100
Subject: [Buildroot] [PATCH 0/3] Initial support for NXP iMX8 (imx8mq-evk)
Message-ID: <1518960511-4823-1-git-send-email-karl.erik.larsson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series provides initial support for NXP iMX8.

This series of patches are tested against NXP imx8mq-evk.
It only handles basic support for iIMX8, currently no
support for GPU, VPU and other HW features. This series
makes it possible to build a minimal system for imx8mq-evk.

Erik Larsson (3):
  imx-mkimage: new package
  imx-atf: new package
  add support for iMX8MQ-evk board

 .../common/imx/genimage.cfg.template_imx8          |  40 ++
 board/freescale/common/imx/post-image.sh           |  33 +-
 board/freescale/imx8mqevk/linux-4.9.config         | 625 +++++++++++++++++++++
 configs/freescale_imx8mqevk_defconfig              |  35 ++
 package/Config.in.host                             |   1 +
 package/freescale-imx/Config.in                    |   8 +-
 package/freescale-imx/firmware-imx/Config.in       |   2 +-
 package/freescale-imx/firmware-imx/firmware-imx.mk |   8 +
 package/freescale-imx/imx-atf/Config.in            |   5 +
 package/freescale-imx/imx-atf/imx-atf.hash         |   3 +
 package/freescale-imx/imx-atf/imx-atf.mk           |  23 +
 .../0001-make-bl33-read-env-variables.patch        |  37 ++
 package/freescale-imx/imx-mkimage/Config.in.host   |   5 +
 package/freescale-imx/imx-mkimage/imx-mkimage.hash |   3 +
 package/freescale-imx/imx-mkimage/imx-mkimage.mk   |  23 +
 15 files changed, 846 insertions(+), 5 deletions(-)
 create mode 100644 board/freescale/common/imx/genimage.cfg.template_imx8
 create mode 100644 board/freescale/imx8mqevk/linux-4.9.config
 create mode 100644 configs/freescale_imx8mqevk_defconfig
 create mode 100644 package/freescale-imx/imx-atf/Config.in
 create mode 100644 package/freescale-imx/imx-atf/imx-atf.hash
 create mode 100644 package/freescale-imx/imx-atf/imx-atf.mk
 create mode 100644 package/freescale-imx/imx-mkimage/0001-make-bl33-read-env-variables.patch
 create mode 100644 package/freescale-imx/imx-mkimage/Config.in.host
 create mode 100644 package/freescale-imx/imx-mkimage/imx-mkimage.hash
 create mode 100644 package/freescale-imx/imx-mkimage/imx-mkimage.mk

-- 
2.7.4
