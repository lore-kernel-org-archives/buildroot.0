From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  2 May 2020 23:28:06 +0200
Subject: [Buildroot] [PATCH 0/6] Support Python 3.x in U-Boot
Message-ID: <20200502212812.51219-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Since 2020.01, U-Boot now uses python3 for its scripts, but our uboot
package only supports adding a dependency on host-python, which causes
a number of build failures of our defconfigs.

To fix this, this series introduces additional U-Boot options with
appropriate dependencies, and fixes the problematic defconfigs.

Thomas

Thomas Petazzoni (6):
  package/python3-pyelftools: new package
  boot/uboot: support building U-Boot with Python 3.x
  configs/olimex_a20_olinuxino_lime{,2}: use Python 3.x
  configs/beelink_gs1: use Python 3.x
  configs/roc_pc_rk3399: fix U-Boot dependencies
  configs/nanopi_neo4: fix U-Boot dependencies

 boot/uboot/Config.in                          | 29 +++++++++++++++++++
 boot/uboot/uboot.mk                           | 12 +++++++-
 configs/beelink_gs1_defconfig                 |  2 ++
 configs/nanopi_neo4_defconfig                 |  4 +--
 configs/olimex_a20_olinuxino_lime2_defconfig  |  2 ++
 configs/olimex_a20_olinuxino_lime_defconfig   |  2 ++
 configs/roc_pc_rk3399_defconfig               |  4 +--
 .../python-pyelftools/python-pyelftools.mk    |  1 +
 .../python3-pyelftools.hash                   |  1 +
 .../python3-pyelftools/python3-pyelftools.mk  | 17 +++++++++++
 10 files changed, 69 insertions(+), 5 deletions(-)
 create mode 120000 package/python3-pyelftools/python3-pyelftools.hash
 create mode 100644 package/python3-pyelftools/python3-pyelftools.mk

-- 
2.26.2
