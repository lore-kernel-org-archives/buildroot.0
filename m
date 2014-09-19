From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 19 Sep 2014 16:12:48 +0200
Subject: [Buildroot] [PATCH v4 0/4] Improvements to i.MX6 SABRESD boards
	support
Message-ID: <1411135972-14968-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patchset adds support to the DualLite versions of the i.MX6 SABRESD board
in addition to the Quad variant that is already supported. It also documentats
how to generate a bootable SD.

Patch 4 by Vincent makes it possible to boot from USB without having to
manually modify the target rootfs during the build process.

Changes since v3:
 - rebased on current master;
 - added Vincent patch for USB boot.

Luca Ceresoli (3):
  configs/freescale_imx6qsabresd: rename imx6 to imx6q
  configs/freescale_imx6dlsabresd: add defconfig for iMX6DL SabreSD
  freescale/imx6-sabresd: document how to create a bootable SD

Vincent Stehl? (1):
  imx6sabresd: boot to /init in mfgtools mode

 board/freescale/imx6sabresd/create-boot-sd.sh      | 95 ++++++++++++++++++++++
 board/freescale/imx6sabresd/readme.txt             | 67 +++++++++++++++
 ...ommon-boot-Linux-to-init-in-mfgtools-mode.patch | 36 ++++++++
 configs/freescale_imx6dlsabresd_defconfig          | 28 +++++++
 configs/freescale_imx6qsabresd_defconfig           | 28 +++++++
 configs/freescale_imx6sabresd_defconfig            | 27 ------
 6 files changed, 254 insertions(+), 27 deletions(-)
 create mode 100755 board/freescale/imx6sabresd/create-boot-sd.sh
 create mode 100644 board/freescale/imx6sabresd/readme.txt
 create mode 100644 board/freescale/imx6sabresd/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
 create mode 100644 configs/freescale_imx6dlsabresd_defconfig
 create mode 100644 configs/freescale_imx6qsabresd_defconfig
 delete mode 100644 configs/freescale_imx6sabresd_defconfig

-- 
Luca

-- 
1.9.1
