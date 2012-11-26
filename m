From: Gregory Hermant <gregory.hermant@calao-systems.com>
Date: Mon, 26 Nov 2012 12:05:13 +0100
Subject: [Buildroot] [PATCH v4 0/6] Add support for the snowball board
Message-ID: <1353927919-7250-1-git-send-email-gregory.hermant@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Snowball board is a low power, low cost Single Board Computer based
on the ST-Ericsson Nova A9500 processor (Dual Cortex-A9 + MALI 400 GPU).
More info at www.igloocommunity.org

The snowball board boots from eMMC, loads the linux kernel and mounts
its root filesystem either from eMMC or from a microSD card.
The user should prepare a microSD card with two partitions.
On the fist partition he will install the kernel image and on the second
one the root filesystem.

TO DO:

* Add the GPS support.
* Add the possibility to build an eMMC image directly from buildroot.
* Add the riff tool package

Gregory Hermant (6):
  snowball-hdmiservice: new package
  ux500-firmware: new package
  Add board files for snowball
  Add init script files for snowball board
  bluez-utils: add support for the ST-Ericsson cg2900 combo controller
  Add config file for the snowball board

 board/calao/snowball/linux-3.4.patch               |   45 +++++++++
 configs/calao_snowball_defconfig                   |   28 ++++++
 package/Config.in                                  |    3 +
 ...tils-4.101-enable_cg2900_on_upstream_4.91.patch |  106 ++++++++++++++++++++
 package/snowball-hdmiservice/Config.in             |   10 ++
 .../snowball-hdmiservice/snowball-hdmiservice.mk   |   41 ++++++++
 package/snowball-init/Config.in                    |   10 ++
 package/snowball-init/snowball-init.mk             |   15 +++
 package/ux500-firmware/Config.in                   |    7 ++
 package/ux500-firmware/ux500-firmware.mk           |   22 ++++
 10 files changed, 287 insertions(+)
 create mode 100644 board/calao/snowball/linux-3.4.patch
 create mode 100644 configs/calao_snowball_defconfig
 create mode 100644 package/bluez_utils/bluez_utils-4.101-enable_cg2900_on_upstream_4.91.patch
 create mode 100644 package/snowball-hdmiservice/Config.in
 create mode 100644 package/snowball-hdmiservice/snowball-hdmiservice.mk
 create mode 100644 package/snowball-init/Config.in
 create mode 100644 package/snowball-init/snowball-init.mk
 create mode 100644 package/ux500-firmware/Config.in
 create mode 100644 package/ux500-firmware/ux500-firmware.mk

-- 
1.7.9.5
