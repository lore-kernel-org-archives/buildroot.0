From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 20:33:12 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2010.11/remove-deprecated-packages
Message-ID: <cover.1284316268.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of patches removes five packages that were marked as
deprecated and to be removed in the release notes of 2010.08 :

 * The GTK 1.x stack, and its only user in Buildroot, the Dillo web
   browser. Newer versions of Dillo use FLTK 2, if someone needs it,
   we can package it.

 * The pcmcia-cs package, which is useless with 2.6 kernels.

Peter: the libgtk12 removal contains a patch that has a line longer
than 998, so if you apply the patch using the e-mail sent to the list,
it may not work. Instead, could you pull the branch directly from
git.busybox.net ?

Thanks,

Thomas

The following changes since commit 33070528796dafe90ebab836356fea03f2dc24f9:
  Marcus Osdoba (1):
        usbutils: bump to 0.90

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2010.11/remove-deprecated-packages

Thomas Petazzoni (5):
      pcmcia: remove deprecated package
      dillo: remove deprecated package
      libgtk12: Remove deprecated package
      libglib12: remove deprecated package
      microwin: remove deprecated package

 configs/arm_nptl_toolchain_defconfig          |    1 -
 configs/arm_toolchain_defconfig               |    1 -
 configs/at91rm9200df_defconfig                |    2 -
 configs/at91rm9200df_ext_bare_defconfig       |    1 -
 configs/at91rm9200df_ext_defconfig            |    2 -
 configs/at91sam9260dfc_defconfig              |    2 -
 configs/at91sam9260dfc_ext_bare_defconfig     |    1 -
 configs/at91sam9260dfc_ext_defconfig          |    2 -
 configs/at91sam9260pf_defconfig               |    2 -
 configs/at91sam9261ek_defconfig               |    2 -
 configs/at91sam9261ek_ext_bare_defconfig      |    1 -
 configs/at91sam9261ek_ext_defconfig           |    2 -
 configs/at91sam9263ek_defconfig               |    2 -
 configs/at91sam9263ek_ext_bare_defconfig      |    1 -
 configs/at91sam9263ek_ext_defconfig           |    2 -
 configs/at91sam9g20dfc_defconfig              |    2 -
 configs/at91sam9g20dfc_ext_bare_defconfig     |    1 -
 configs/at91sam9g20dfc_ext_defconfig          |    2 -
 configs/atngw100-base_defconfig               |    2 -
 configs/atngw100_defconfig                    |    2 -
 configs/atstk1005_defconfig                   |    2 -
 configs/atstk100x_defconfig                   |    2 -
 configs/i386_defconfig                        |    2 -
 configs/i686_defconfig                        |    2 -
 configs/integrator926_defconfig               |    2 -
 configs/integrator926_huge_defconfig          |    2 -
 configs/kb9202_defconfig                      |    2 -
 configs/v100sc2_defconfig                     |    1 -
 package/Config.in                             |    7 -
 package/dillo/Config.in                       |   13 -
 package/dillo/dillo.mk                        |   58 -
 package/libglib12/Config.in                   |    7 -
 package/libglib12/glib-1.2.10-gcc34-fix.patch |   41 -
 package/libglib12/libglib-libtool.patch       |   88 -
 package/libglib12/libglib12.mk                |   97 -
 package/libglib12/libglib_configure.patch     | 1800 -
 package/libgtk12/Config.in                    |    9 -
 package/libgtk12/gtk+1.2-reconf.patch         |  643 -
 package/libgtk12/libgtk12.mk                  |  105 -
 package/libgtk12/no-xwc.patch                 |  267 -
 package/libgtk12/timezone-fix.patch           |   15 -
 package/libgtk12/update-libtool.patch         |50327 -------------------------
 package/microwin/Config.in                    |    9 -
 package/microwin/microwin.mk                  |   61 -
 package/pcmcia/Config.in                      |    9 -
 package/pcmcia/pcmcia.mk                      |  114 -
 package/pcmcia/pcmcia.patch                   |  123 -
 47 files changed, 0 insertions(+), 53841 deletions(-)
 delete mode 100644 package/dillo/Config.in
 delete mode 100644 package/dillo/dillo.mk
 delete mode 100644 package/libglib12/Config.in
 delete mode 100644 package/libglib12/glib-1.2.10-gcc34-fix.patch
 delete mode 100644 package/libglib12/libglib-libtool.patch
 delete mode 100644 package/libglib12/libglib12.mk
 delete mode 100644 package/libglib12/libglib_configure.patch
 delete mode 100644 package/libgtk12/Config.in
 delete mode 100644 package/libgtk12/gtk+1.2-reconf.patch
 delete mode 100644 package/libgtk12/libgtk12.mk
 delete mode 100644 package/libgtk12/no-xwc.patch
 delete mode 100644 package/libgtk12/timezone-fix.patch
 delete mode 100644 package/libgtk12/update-libtool.patch
 delete mode 100644 package/microwin/Config.in
 delete mode 100644 package/microwin/microwin.mk
 delete mode 100644 package/pcmcia/Config.in
 delete mode 100644 package/pcmcia/pcmcia.mk
 delete mode 100644 package/pcmcia/pcmcia.patch

Thanks,
-- 
Thomas Petazzoni
