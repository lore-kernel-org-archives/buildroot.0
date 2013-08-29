From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 29 Aug 2013 14:59:15 +0200
Subject: [Buildroot] [PATCH 0 of 9 v3] linux/uboot: add support for custom
 Mercurial repositories
Message-ID: <patchbomb.1377781155@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This series adds support for custom Mercurial repositories in uboot and linux
packages.
After the second version of this series, there has been some discussion between
Arnout and myself regarding the automatic propagation of old values into the new
symbols. In this version, the automatic propagation is taken into account.

Additionally, there are some extra patches:
- update comments in Config.in.legacy, both for the user as developer
- updated defconfigs after renaming of config options
- remove redundant $ signs in Config.in files

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Note: as I didn't expect this to be applied still in 2013.08, I updated
Config.in.legacy to already add a 2013.11 comment. However, this series
currently does not cleanly apply on next, because one patch was already applied
on master but not in next, and also because the version of some packages
(barebox and linux) are different between both branches, causing conflicts.
I would apply this after next has been merged into master. The remaining
conflicts should only be the versions of barebox and linux, but I'm willing to
send a new version after rebasing. In the mean time, review can already happen.


 Config.in.legacy                       |  134 +++++++++++++++++++++++++++++++--
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
 linux/Config.in                        |   38 ++++++---
 linux/linux.mk                         |    5 +-
 package/uclibc/Config.in               |    2 +-
 toolchain/toolchain-external/Config.in |    2 +-
 19 files changed, 218 insertions(+), 77 deletions(-)
