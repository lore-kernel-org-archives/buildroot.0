From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jan 2010 00:27:19 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	toolchain-config-improvements
Message-ID: <cover.1263338839.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 6327fbc8b62a7728f9ba546eb04046c0adc4112f:
  Peter Korsgaard (1):
        kernel-headers: bump 2.6.27.x / 2.6.31.x / 2.6.32.x stable versions

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot toolchain-config-improvements

Thomas Petazzoni (6):
      Move locale purge option to a more logical location
      lzma: Use BR2_INSTALL_LIBSTDCPP instead of BR2_GCC_CROSS_CXX like in other packages
      Move BR2_SOFT_FLOAT and BR2_VFP_FLOAT to Build options
      Move BR2_TARGET_OPTIMIZATION to Build Options and rename it
      Update defconfigs after BR2_TARGET_OPTIMIZATION rename
      toolchain: Clarify configuration option files organization

 Config.in                                      |   54 ++++++++++
 configs/arm_toolchain_defconfig                |    2 +-
 configs/at91rm9200df_defconfig                 |    2 +-
 configs/at91rm9200df_ext_bare_defconfig        |    2 +-
 configs/at91rm9200df_ext_defconfig             |    2 +-
 configs/at91sam9260dfc_defconfig               |    2 +-
 configs/at91sam9260dfc_ext_bare_defconfig      |    2 +-
 configs/at91sam9260dfc_ext_defconfig           |    2 +-
 configs/at91sam9260pf_defconfig                |    2 +-
 configs/at91sam9261ek_defconfig                |    2 +-
 configs/at91sam9261ek_ext_bare_defconfig       |    2 +-
 configs/at91sam9261ek_ext_defconfig            |    2 +-
 configs/at91sam9263ek_defconfig                |    2 +-
 configs/at91sam9263ek_ext_bare_defconfig       |    2 +-
 configs/at91sam9263ek_ext_defconfig            |    2 +-
 configs/at91sam9g20dfc_defconfig               |    2 +-
 configs/at91sam9g20dfc_ext_bare_defconfig      |    2 +-
 configs/at91sam9g20dfc_ext_defconfig           |    2 +-
 configs/atngw100-base_defconfig                |    2 +-
 configs/atngw100_defconfig                     |    2 +-
 configs/atstk1005_defconfig                    |    2 +-
 configs/atstk100x_defconfig                    |    2 +-
 configs/i386_defconfig                         |    2 +-
 configs/i686_defconfig                         |    2 +-
 configs/integrator926_defconfig                |    2 +-
 configs/integrator926_huge_defconfig           |    2 +-
 configs/kb9202_defconfig                       |    2 +-
 configs/v100sc2_defconfig                      |    2 +-
 package/Makefile.in                            |    5 +-
 package/lzma/Config.in                         |    4 +-
 toolchain/Config.in                            |   16 +--
 toolchain/Config.in.1                          |    9 --
 toolchain/{Config.in.2 => Config.in.buildroot} |  113 ++++++---------------
 toolchain/Config.in.external                   |  128 ++++++++++++++++++++++++
 toolchain/external-toolchain/Config.in         |   22 ----
 toolchain/external-toolchain/Config.in.2       |   17 ---
 toolchain/gcc/Makefile.in                      |    1 -
 37 files changed, 251 insertions(+), 172 deletions(-)
 delete mode 100644 toolchain/Config.in.1
 rename toolchain/{Config.in.2 => Config.in.buildroot} (57%)
 create mode 100644 toolchain/Config.in.external
 delete mode 100644 toolchain/external-toolchain/Config.in
 delete mode 100644 toolchain/external-toolchain/Config.in.2

Thanks,
-- 
Thomas Petazzoni
