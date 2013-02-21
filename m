From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 21 Feb 2013 15:58:30 +0100
Subject: [Buildroot] [pull request] Pull request for branch xbmc
Message-ID: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces a number of packages that are necessary to push XBMC
later on.
The main reason to push this series without XBMC patch is to lighten the
maintenance on my branch.

The patch introducing XBMC still need some works, I'm currently unable to
dedicate all the time I would like to it, but I hope to push it in 2/3 weeks.

Thanks

The following changes since commit 54d68be3072fbb8306e217b203e3197c9cc66f6f:

  jasper: new package (2013-02-20 10:06:33 +0100)

are available in the git repository at:

  git://github.com/maximeh/buildroot.git xbmc

for you to fetch changes up to ba6371a6ed52c760f18dbf14b662f6310b29f776:

  Install libfribidi to staging (2013-02-20 10:08:03 +0100)

----------------------------------------------------------------
Maxime Hadjinlian (13):
      libenca: new package
      libass: new package
      libbluray: new package
      libcdio: new package
      lockdev: new package
      libcec: new package
      libmodplug: new package
      libnfs: new package
      libplist: new package
      librtmp: new package
      libshairport: new package
      tinyxml: new package
      Install libfribidi to staging

 package/Config.in                                  |   12 +
 package/libass/Config.in                           |   10 +
 package/libass/libass.mk                           |   14 +
 package/libbluray/Config.in                        |    6 +
 package/libbluray/libbluray.mk                     |   14 +
 package/libcdio/Config.in                          |   11 +
 package/libcdio/libcdio.mk                         |   18 +
 package/libcec/Config.in                           |   30 +
 package/libcec/libcec.mk                           |   22 +
 package/libenca/Config.in                          |    6 +
 package/libenca/libenca-1.9-dont-build-tools.patch |   33 +
 package/libenca/libenca-1.9-fix-clean.patch        |   22 +
 package/libenca/libenca-1.9-fix-prefix.patch       |   19 +
 package/libenca/libenca.mk                         |   26 +
 package/libfribidi/libfribidi.mk                   |    1 +
 package/libmodplug/Config.in                       |   11 +
 package/libmodplug/libmodplug.mk                   |   11 +
 package/libnfs/Config.in                           |   11 +
 package/libnfs/libnfs.mk                           |   16 +
 package/libplist/Config.in                         |   12 +
 package/libplist/libplist.mk                       |   15 +
 package/librtmp/Config.in                          |    8 +
 package/librtmp/librtmp.mk                         |   27 +
 package/libshairport/Config.in                     |   12 +
 .../libshairport-1.2.0.20310_lib-001_add_ao.patch  |  270 +++++++
 ...rt-1.2.0.20310_lib-002_fix_install_header.patch |   12 +
 ...hairport-1.2.0.20310_lib-003_fix_deadlock.patch |   10 +
 ...irport-1.2.0.20310_lib-004_fix_bad_access.patch |   22 +
 ...hairport-1.2.0.20310_lib-005_fix_shutdown.patch |   10 +
 ...ibshairport-1.2.0.20310_lib-006_no_printf.patch |  843 ++++++++++++++++++++
 ...rt-1.2.0.20310_lib-007_fix_syslog_defines.patch |   24 +
 ...port-1.2.0.20310_lib-008-add-missing-libs.patch |   21 +
 ...libshairport-1.2.0.20310_lib-009_fix_ipv6.patch |   22 +
 package/libshairport/libshairport.mk               |   13 +
 package/lockdev/Config.in                          |    6 +
 package/lockdev/lockdev.mk                         |   30 +
 package/tinyxml/Config.in                          |   12 +
 package/tinyxml/tinyxml.mk                         |   12 +
 38 files changed, 1674 insertions(+)
 create mode 100644 package/libass/Config.in
 create mode 100644 package/libass/libass.mk
 create mode 100644 package/libbluray/Config.in
 create mode 100644 package/libbluray/libbluray.mk
 create mode 100644 package/libcdio/Config.in
 create mode 100644 package/libcdio/libcdio.mk
 create mode 100644 package/libcec/Config.in
 create mode 100644 package/libcec/libcec.mk
 create mode 100644 package/libenca/Config.in
 create mode 100644 package/libenca/libenca-1.9-dont-build-tools.patch
 create mode 100644 package/libenca/libenca-1.9-fix-clean.patch
 create mode 100644 package/libenca/libenca-1.9-fix-prefix.patch
 create mode 100644 package/libenca/libenca.mk
 create mode 100644 package/libmodplug/Config.in
 create mode 100644 package/libmodplug/libmodplug.mk
 create mode 100644 package/libnfs/Config.in
 create mode 100644 package/libnfs/libnfs.mk
 create mode 100644 package/libplist/Config.in
 create mode 100644 package/libplist/libplist.mk
 create mode 100644 package/librtmp/Config.in
 create mode 100644 package/librtmp/librtmp.mk
 create mode 100644 package/libshairport/Config.in
 create mode 100644 package/libshairport/libshairport-1.2.0.20310_lib-001_add_ao.patch
 create mode 100644 package/libshairport/libshairport-1.2.0.20310_lib-002_fix_install_header.patch
 create mode 100644 package/libshairport/libshairport-1.2.0.20310_lib-003_fix_deadlock.patch
 create mode 100644 package/libshairport/libshairport-1.2.0.20310_lib-004_fix_bad_access.patch
 create mode 100644 package/libshairport/libshairport-1.2.0.20310_lib-005_fix_shutdown.patch
 create mode 100644 package/libshairport/libshairport-1.2.0.20310_lib-006_no_printf.patch
 create mode 100644 package/libshairport/libshairport-1.2.0.20310_lib-007_fix_syslog_defines.patch
 create mode 100644 package/libshairport/libshairport-1.2.0.20310_lib-008-add-missing-libs.patch
 create mode 100644 package/libshairport/libshairport-1.2.0.20310_lib-009_fix_ipv6.patch
 create mode 100644 package/libshairport/libshairport.mk
 create mode 100644 package/lockdev/Config.in
 create mode 100644 package/lockdev/lockdev.mk
 create mode 100644 package/tinyxml/Config.in
 create mode 100644 package/tinyxml/tinyxml.mk

Regards,
Maxime Hadjinlian

--
