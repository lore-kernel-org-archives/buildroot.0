From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Apr 2010 15:31:36 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	br2-recent-removal
Message-ID: <cover.1271078939.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a new try for the BR2_RECENT configuration option
removal. Instead of converting all entries marked BR2_RECENT into
BR2_DEPRECATED entries (which would make them disappear in the default
Buildroot configuration), we just get rid of BR2_RECENT *and*
BR2_DEPRECATED on these entries. Therefore, they still appear in the
default Buildroot configuration, and we can then later decide, on a
per-entry basis, whether they should be marked BR2_DEPRECATED or not.

Thomas

The following changes since commit 04ba0089a672863e333a2de6b19d9b77fd0b26c1:
  Thomas Petazzoni (1):
        Get rid of the OPTIMIZE_FOR_CPU variable

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot br2-recent-removal

Thomas Petazzoni (3):
      Get rid of all usages of BR2_RECENT
      Remove the BR2_RECENT option
      Update defconfigs after BR2_RECENT removal

 Config.in                                 |    6 ------
 configs/arm_toolchain_defconfig           |    1 -
 configs/at91rm9200df_defconfig            |    1 -
 configs/at91rm9200df_ext_bare_defconfig   |    1 -
 configs/at91rm9200df_ext_defconfig        |    1 -
 configs/at91sam9260dfc_defconfig          |    1 -
 configs/at91sam9260dfc_ext_bare_defconfig |    1 -
 configs/at91sam9260dfc_ext_defconfig      |    1 -
 configs/at91sam9261ek_defconfig           |    1 -
 configs/at91sam9261ek_ext_bare_defconfig  |    1 -
 configs/at91sam9261ek_ext_defconfig       |    1 -
 configs/at91sam9263ek_defconfig           |    1 -
 configs/at91sam9263ek_ext_bare_defconfig  |    1 -
 configs/at91sam9263ek_ext_defconfig       |    1 -
 configs/at91sam9g20dfc_defconfig          |    1 -
 configs/at91sam9g20dfc_ext_bare_defconfig |    1 -
 configs/at91sam9g20dfc_ext_defconfig      |    1 -
 configs/atngw100-base_defconfig           |    1 -
 configs/atngw100_defconfig                |    1 -
 configs/atstk1005_defconfig               |    1 -
 configs/atstk100x_defconfig               |    1 -
 configs/i386_defconfig                    |    1 -
 configs/i686_defconfig                    |    1 -
 configs/integrator926_defconfig           |    1 -
 configs/integrator926_huge_defconfig      |    1 -
 configs/kb9202_defconfig                  |    1 -
 configs/v100sc2_defconfig                 |    1 -
 package/busybox/Config.in                 |    2 --
 target/u-boot/Config.in                   |    2 --
 toolchain/binutils/Config.in              |    1 -
 toolchain/gcc/Config.in                   |    2 --
 toolchain/kernel-headers/Config.in        |    1 -
 toolchain/uClibc/Config.in                |    1 -
 33 files changed, 0 insertions(+), 41 deletions(-)

Thanks,
-- 
Thomas Petazzoni
