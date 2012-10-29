From: Gregory Hermant <gregory.hermant@calao-systems.com>
Date: Mon, 29 Oct 2012 09:41:07 +0100
Subject: [Buildroot] [PATCH 0/6] Add support for the snowball board.
Message-ID: <1351500073-4351-1-git-send-email-gregory.hermant@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Snowball board is a low power, low cost Single Board Computer based
on the ST-Ericsson Nova A9500 processor (Dual Cortex-A9 + MALI 400 GPU).
More info at www.igloocommunity.org

The snowball board boots from eMMC and then load the linux kernel
and mount its root filesystem either from eMMC or from a microSD card.
Actually this patch serie with QT support enabled in the default 
config file allows to prepare a microSD.
About the installation, the user will have to create a microSD with two 
partitions.A "boot" partition with the linux kernel and a "rootfs" partition 
with the root filesystem.


TO DO:

* Add the GPS support.
* Add the possibility to build an eMMC image directly from buildroot.



Gregory Hermant (6):
  Add config file for the snowball board
  Add hdmiservice package for the snowball board
  Add firmware for the AW-NH580 connectivity module of the snowball
  Add board files for snowball
  Add init script files for snowball board
  bluez-utils: add cg2900 support for snowball board

 board/calao/snowball/busybox-1.20.x.config         | 1024 ++++++++++++++++++++
 board/calao/snowball/linux-3.4.config              |  311 ++++++
 board/calao/snowball/linux-3.4.patch               |  126 +++
 configs/calao_snowball_defconfig                   |   52 +
 package/Config.in                                  |    3 +
 ...an_patches_enable_cg2900_on_upstream_4.91.patch |   88 ++
 package/hdmiservice/Config.in                      |   10 +
 package/hdmiservice/hdmiservice.mk                 |   19 +
 package/snowball-firmware/Config.in                |    8 +
 package/snowball-firmware/snowball-firmware.mk     |   17 +
 package/snowball-init/Config.in                    |    7 +
 package/snowball-init/snowball-init.mk             |   13 +
 12 files changed, 1678 insertions(+)
 create mode 100644 board/calao/snowball/busybox-1.20.x.config
 create mode 100644 board/calao/snowball/linux-3.4.config
 create mode 100644 board/calao/snowball/linux-3.4.patch
 create mode 100644 configs/calao_snowball_defconfig
 create mode 100644 package/bluez_utils/bluez_utils-4.101-debian_patches_enable_cg2900_on_upstream_4.91.patch
 create mode 100644 package/hdmiservice/Config.in
 create mode 100644 package/hdmiservice/hdmiservice.mk
 create mode 100644 package/snowball-firmware/Config.in
 create mode 100644 package/snowball-firmware/snowball-firmware.mk
 create mode 100644 package/snowball-init/Config.in
 create mode 100644 package/snowball-init/snowball-init.mk

-- 
1.7.9.5
