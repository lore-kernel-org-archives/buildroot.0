From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Apr 2010 06:02:52 +0200
Subject: [Buildroot] [pull request] Pull request for branch fs-fixes
Message-ID: <cover.1271476803.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is the fix for bug #1537, i.e "device entries no longer
created". It is a severe regression introduced by my filesystem
cleanup code. The problem was that the TARGET_DEVICE_TABLE variable
was no longer defined.

To fix it, I took the approach I intend to take to cleanup the rest of
target/, i.e use normal configuration options instead of variables
defined in board-specific Makefiles.

Therefore, I've added a new BR2_ROOTFS_DEVICE_TABLE option, which
contains the path to the device table that should be used.

Regards,

Thomas

The following changes since commit 65e209ca07416bc040fe98d16b60b6cb4304987f:
  Peter Korsgaard (1):
        openssl: fix build without ipv6 support

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot fs-fixes

Thomas Petazzoni (6):
      cramfs: fix installation
      fs: change the way the device table is configured
      cramfs/jffs2: use the new ROOTFS_DEVICE_TABLE variable
      documentation: update after TARGET_DEVICE_TABLE removal
      Remove all TARGET_DEVICE_TABLE definitions
      Update defconfigs to include BR2_ROOTFS_DEVICE_TABLE definition

 configs/arm_toolchain_defconfig               |    1 +
 configs/at91rm9200df_defconfig                |    1 +
 configs/at91rm9200df_ext_bare_defconfig       |    1 +
 configs/at91rm9200df_ext_defconfig            |    1 +
 configs/at91sam9260dfc_defconfig              |    1 +
 configs/at91sam9260dfc_ext_bare_defconfig     |    1 +
 configs/at91sam9260dfc_ext_defconfig          |    1 +
 configs/at91sam9260pf_defconfig               |    1 +
 configs/at91sam9261ek_defconfig               |    1 +
 configs/at91sam9261ek_ext_bare_defconfig      |    1 +
 configs/at91sam9261ek_ext_defconfig           |    1 +
 configs/at91sam9263ek_defconfig               |    1 +
 configs/at91sam9263ek_ext_bare_defconfig      |    1 +
 configs/at91sam9263ek_ext_defconfig           |    1 +
 configs/at91sam9g20dfc_defconfig              |    1 +
 configs/at91sam9g20dfc_ext_bare_defconfig     |    1 +
 configs/at91sam9g20dfc_ext_defconfig          |    1 +
 configs/atngw100-base_defconfig               |    1 +
 configs/atngw100_defconfig                    |    1 +
 configs/atstk1005_defconfig                   |    1 +
 configs/atstk100x_defconfig                   |    1 +
 configs/kb9202_defconfig                      |    1 +
 configs/v100sc2_defconfig                     |    1 +
 docs/buildroot.html                           |   10 --
 fs/Config.in                                  |    8 +
 fs/common.mk                                  |    5 +-
 fs/cramfs/cramfs.mk                           |    4 +-
 fs/jffs2/jffs2.mk                             |    4 +-
 package/cramfs/cramfs.mk                      |    8 +-
 target/device/Atmel/Makefile.in               |    1 -
 target/device/Atmel/atngw100-base/Makefile.in |    1 -
 target/device/Atmel/atngw100/Makefile.in      |    1 -
 target/device/Atmel/atstk1005/Makefile.in     |    1 -
 target/device/Atmel/atstk100x/Makefile.in     |    1 -
 target/device/KwikByte/kb9202/Makefile.in     |    1 -
 target/device/valka/Makefile.in               |    2 -
 target/device/xtensa/Makefile.in              |    8 -
 target/device/xtensa/device_table.diff        |   10 --
 target/device/xtensa/device_table.txt         |  189 +++++++++++++++++++++++++
 target/generic/Makefile.in                    |    2 -
 target/xtensa/defconfig                       |    1 +
 41 files changed, 232 insertions(+), 48 deletions(-)
 delete mode 100644 target/device/xtensa/device_table.diff
 create mode 100644 target/device/xtensa/device_table.txt

Thanks,
-- 
Thomas Petazzoni
