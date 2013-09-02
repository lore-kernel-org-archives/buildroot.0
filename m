From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 02 Sep 2013 22:07:49 +0200
Subject: [Buildroot] [PATCH 0 of 9 v4] linux/uboot: add support for custom
 Mercurial repositories
Message-ID: <patchbomb.1378152469@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

This series adds support for custom Mercurial repositories in uboot and linux
packages.

This version is rebased with the 2013.08 master, there are only a few
real changes.

Best regards, 
Thomas

 Config.in.legacy                       |  139 +++++++++++++++++++++++++++++++--
 boot/barebox/Config.in                 |    4 +-
 boot/uboot/Config.in                   |   37 +++++---
 boot/uboot/uboot.mk                    |    5 +-
 configs/arm_foundationv8_defconfig     |    4 +-
 configs/beaglebone_defconfig           |    4 +-
 configs/calao_snowball_defconfig       |    4 +-
 configs/cubieboard_defconfig           |    8 +-
 configs/ea3250_defconfig               |    8 +-
 configs/fdi3250_defconfig              |    8 +-
 configs/gnublin_defconfig              |    8 +-
 configs/mx53loco_defconfig             |    8 +-
 configs/phy3250_defconfig              |    8 +-
 configs/rpi_defconfig                  |    4 +-
 fs/jffs2/Config.in                     |    4 +-
 linux/Config.in                        |   38 ++++++--
 linux/linux.mk                         |    5 +-
 package/gcc/Config.in.host             |    2 +-
 package/linux-headers/Config.in.host   |    2 +-
 package/uclibc/Config.in               |    2 +-
 toolchain/toolchain-external/Config.in |    2 +-
 21 files changed, 225 insertions(+), 79 deletions(-)
