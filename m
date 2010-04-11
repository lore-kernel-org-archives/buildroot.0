From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Apr 2010 06:04:56 +0200
Subject: [Buildroot] [pull request] Pull request for branch various-fixes
Message-ID: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

During the flight to San Francisco today (to go to the Embedded Linux
Conference), I had the time to work on a few Buildroot cleanups. Most
of them have been discussed during the Buildroot Working Day that took
place in February 2010, right after FOSDEM, in Brussels.

Enjoy :-)

Thomas

The following changes since commit e7b72e11dc2fb7d15440dca32cff59869dc1c2c3:
  Peter Korsgaard (1):
        cramfs: fix help text typo

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot various-fixes

Thomas Petazzoni (25):
      Remove BR2_PREFER_IMA
      Update defconfig after BR2_PREFER_IMA removal
      Update config.{guess,sub} unconditionally
      Update defconfigs after BR2_UPDATE_CONFIG removal
      Do not let packages remove man pages, info pages and documentation
      Remove all documentation when BR2_HAVE_DOCUMENTATION is not set
      Do not remove documentation on a per-package basis
      Use BR2_HAVE_DOCUMENTATION instead of BR2_HAVE_{MANPAGES,INFOPAGES}
      Get rid of BR2_HAVE_{MANPAGES,INFOPAGES} config options
      Update defconfigs after BR2_HAVE_{INFOPAGES,MANPAGES} removal
      Get rid of all usages of BR2_RECENT
      Remove the BR2_RECENT option
      Update defconfigs after BR2_RECENT removal
      Move the command-related options to a submenu
      Bring the three path-related options together
      Move the global config cache option to an Advanced submenu
      Guess build system and remove BR2_GNU_BUILD_SUFFIX
      Update defconfigs after BR2_GNU_BUILD_SUFFIX removal
      Get rid of now unused HOST_ARCH computation code
      Remove BR2_ENABLE_LOCALE_PREGENERATED
      Update defconfigs after BR2_ENABLE_LOCALE_PREGENERATED removal
      Get rid of unused variables
      Remove variables useless after BR2_PREFER_IMA removal
      Get rid of useless OpenMP related code
      Get rid of the OPTIMIZE_FOR_CPU variable

 Config.in                                 |   73 +++++++----------------------
 Makefile                                  |   22 +++------
 configs/arm_toolchain_defconfig           |    7 ---
 configs/at91rm9200df_defconfig            |    7 ---
 configs/at91rm9200df_ext_bare_defconfig   |    6 --
 configs/at91rm9200df_ext_defconfig        |    6 --
 configs/at91sam9260dfc_defconfig          |    7 ---
 configs/at91sam9260dfc_ext_bare_defconfig |    6 --
 configs/at91sam9260dfc_ext_defconfig      |    6 --
 configs/at91sam9260pf_defconfig           |    3 -
 configs/at91sam9261ek_defconfig           |    7 ---
 configs/at91sam9261ek_ext_bare_defconfig  |    6 --
 configs/at91sam9261ek_ext_defconfig       |    6 --
 configs/at91sam9263ek_defconfig           |    7 ---
 configs/at91sam9263ek_ext_bare_defconfig  |    6 --
 configs/at91sam9263ek_ext_defconfig       |    6 --
 configs/at91sam9g20dfc_defconfig          |    7 ---
 configs/at91sam9g20dfc_ext_bare_defconfig |    6 --
 configs/at91sam9g20dfc_ext_defconfig      |    6 --
 configs/atngw100-base_defconfig           |    6 --
 configs/atngw100_defconfig                |    7 ---
 configs/atstk1005_defconfig               |    7 ---
 configs/atstk100x_defconfig               |    7 ---
 configs/i386_defconfig                    |    7 ---
 configs/i686_defconfig                    |    7 ---
 configs/integrator926_defconfig           |    6 --
 configs/integrator926_huge_defconfig      |    6 --
 configs/kb9202_defconfig                  |    6 --
 configs/v100sc2_defconfig                 |    6 --
 package/Makefile.autotools.in             |    2 -
 package/Makefile.in                       |   19 +-------
 package/Makefile.package.in               |    9 ----
 package/avahi/avahi.mk                    |    2 +-
 package/axel/axel.mk                      |    2 +-
 package/bash/bash.mk                      |    7 ---
 package/berkeleydb/berkeleydb.mk          |    7 ---
 package/bison/bison.mk                    |    7 ---
 package/busybox/Config.in                 |    4 +-
 package/busybox/busybox.mk                |    8 ---
 package/busybox/initramfs.mk              |    8 ---
 package/coreutils/coreutils.mk            |    7 ---
 package/dhcp/dhcp.mk                      |   25 ----------
 package/dialog/dialog.mk                  |    3 -
 package/diffutils/diffutils.mk            |    6 --
 package/file/file.mk                      |    7 ---
 package/findutils/findutils.mk            |    7 ---
 package/gawk/gawk.mk                      |    7 ---
 package/gettext/gettext.mk                |   11 +----
 package/gnuconfig/Config.in               |    8 ---
 package/gzip/gzip.mk                      |    6 --
 package/hdparm/hdparm.mk                  |    2 +-
 package/ipsec-tools/ipsec-tools.mk        |    7 ---
 package/liblockfile/liblockfile.mk        |    3 -
 package/ltrace/ltrace.mk                  |    2 +-
 package/microcom/microcom.mk              |    7 ---
 package/netsnmp/netsnmp.mk                |    9 +---
 package/pppd/pppd.mk                      |    2 +-
 package/pptp-linux/pptp-linux.mk          |    2 +-
 package/qt/qt.mk                          |    2 +-
 package/quagga/quagga.mk                  |    6 --
 package/rp-pppoe/rp-pppoe.mk              |    2 +-
 package/sed/sed.mk                        |   12 -----
 package/setserial/setserial.mk            |    4 --
 package/udpcast/udpcast.mk                |    4 --
 target/u-boot/Config.in                   |    4 +-
 target/xtensa/defconfig                   |    1 -
 toolchain/Config.in.2                     |   10 ----
 toolchain/Makefile.in                     |   14 ------
 toolchain/binutils/Config.in              |    2 +-
 toolchain/binutils/binutils.mk            |    8 +---
 toolchain/gcc/Config.in                   |    4 +-
 toolchain/gcc/Makefile.in                 |    4 --
 toolchain/kernel-headers/Config.in        |    2 +-
 toolchain/uClibc/Config.in                |    2 +-
 toolchain/uClibc/uclibc.mk                |   21 +--------
 75 files changed, 50 insertions(+), 513 deletions(-)
 delete mode 100644 package/gnuconfig/Config.in

Thanks,
-- 
Thomas Petazzoni
