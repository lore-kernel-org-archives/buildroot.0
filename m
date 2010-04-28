From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Apr 2010 23:40:41 +0200
Subject: [Buildroot] [pull request] Pull request for branch misc-fixes
Message-ID: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of patches, some of them are important fixes that should
really be merged before 2010.05, some other are improvements and
cleanups that can be postponed if needed.

The important ones are :

      libxslt: fix host compilation
      uClibc: add UCLIBC_HAS_NFTW to default configuration
      uclibc: make sure the default configuration doesn't ask questions
      Fix autotools configuration cache handling

Best regards,

Thomas

The following changes since commit 671ec3917b7b8d9e6a22c1f881ff46808e3d8806:
  Peter Korsgaard (1):
        alsa-utils: alsamixer needs WCHAR

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot misc-fixes

Thomas Petazzoni (19):
      autotools: fix autoreconf check
      libxslt: fix host compilation
      openssl: convert to the generic infrastructure
      autotools: inherit LIBTOOL_PATCH for host packages
      packages: remove useless HOST_*_LIBTOOL_PATCH
      autotools: fix referencing to LIBTOOL_PATCH variable
      freetype: disable autoreconf
      packages: handle interrupted downloads
      uClibc: add UCLIBC_HAS_NFTW to default configuration
      uclibc: make sure the default configuration doesn't ask questions
      Commonalize the definition of TOOLCHAIN_DIR
      Get rid of KERNEL_CROSS
      Remove latest users of the ROOTFS_SUFFIX thing
      Get rid of the code computing ROOTFS_SUFFIX
      Update defconfigs after BR2_ROOTFS_SUFFIX removal
      Remove BR2_GNU_TARGET_SUFFIX and compute GNU_TARGET_NAME
      Update defconfigs after BR2_GNU_TARGET_SUFFIX removal
      Unverbosify autoreconf output
      Fix autotools configuration cache handling

 Config.in                                        |   18 -----
 Makefile                                         |    2 +
 configs/arm_toolchain_defconfig                  |    2 -
 configs/at91rm9200df_defconfig                   |    2 -
 configs/at91rm9200df_ext_bare_defconfig          |    2 -
 configs/at91rm9200df_ext_defconfig               |    2 -
 configs/at91sam9260dfc_defconfig                 |    2 -
 configs/at91sam9260dfc_ext_bare_defconfig        |    2 -
 configs/at91sam9260dfc_ext_defconfig             |    2 -
 configs/at91sam9260pf_defconfig                  |    1 -
 configs/at91sam9261ek_defconfig                  |    2 -
 configs/at91sam9261ek_ext_bare_defconfig         |    2 -
 configs/at91sam9261ek_ext_defconfig              |    2 -
 configs/at91sam9263ek_defconfig                  |    2 -
 configs/at91sam9263ek_ext_bare_defconfig         |    2 -
 configs/at91sam9263ek_ext_defconfig              |    2 -
 configs/at91sam9g20dfc_defconfig                 |    2 -
 configs/at91sam9g20dfc_ext_bare_defconfig        |    2 -
 configs/at91sam9g20dfc_ext_defconfig             |    2 -
 configs/atngw100-base_defconfig                  |    2 -
 configs/atngw100_defconfig                       |    2 -
 configs/atstk1005_defconfig                      |    2 -
 configs/atstk100x_defconfig                      |    2 -
 configs/i386_defconfig                           |    2 -
 configs/i686_defconfig                           |    2 -
 configs/integrator926_defconfig                  |    2 -
 configs/integrator926_huge_defconfig             |    2 -
 configs/kb9202_defconfig                         |    2 -
 configs/v100sc2_defconfig                        |    2 -
 package/Makefile.autotools.in                    |   15 +++-
 package/Makefile.in                              |   29 ++++----
 package/Makefile.package.in                      |    8 ++-
 package/autoconf/autoconf.mk                     |    2 +-
 package/dbus/dbus.mk                             |    1 -
 package/directfb/directfb.mk                     |    1 -
 package/expat/expat.mk                           |    1 -
 package/fakeroot/fakeroot.mk                     |    1 -
 package/freetype/freetype.mk                     |    2 +-
 package/libglib2/libglib2.mk                     |    1 -
 package/libpng/libpng.mk                         |    1 -
 package/libxml2/libxml2.mk                       |    2 -
 package/libxslt/libxslt.mk                       |    3 +-
 package/openssl/openssl.mk                       |   85 +++++++++++++---------
 package/pcmcia/pcmcia.mk                         |    2 +-
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk |    1 -
 target/linux/Makefile.in                         |    5 +-
 target/linux/Makefile.in.advanced                |    5 +-
 toolchain/uClibc/uClibc-0.9.31.config            |    2 +-
 toolchain/uClibc/uclibc.mk                       |    4 +-
 49 files changed, 98 insertions(+), 146 deletions(-)

Thanks,
-- 
Thomas Petazzoni
