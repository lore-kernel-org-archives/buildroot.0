From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  8 Mar 2015 12:26:00 +0100
Subject: [Buildroot] [PATCH v2 0/4] libftdi{0,1} related work
Message-ID: <1425813964-5295-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

The short series does:
- bump libftdi and add libftdi1
- use libftdi1 for the 2 packages explicitly dependending on libftdi (only
  build tests, runtime test feedback is welcome).
  It seems ola also depends on libftdi, but does not support libftdi1. Who
  knows how many other packages silently depend on libftdi depending on the
  buildroot configuration...

Regards,

Samuel
--

Daniel Sangue (1):
  package/libftdi1: new package

Samuel Martin (3):
  package/libftdi: bump to version 0.20
  package/avrdude: depends on libftdi1 instead of libftdi
  package/openocd: depends on libftdi1 instead of libftdi

 package/Config.in                                  |  1 +
 package/avrdude/avrdude.mk                         |  4 +-
 package/libftdi/libftdi.hash                       |  2 +
 package/libftdi/libftdi.mk                         |  2 +-
 ...he-standard-CMake-flag-to-drive-the-share.patch | 96 ++++++++++++++++++++++
 .../libftdi1/0002-cmake-fix-FindUSB1.cmake.patch   | 34 ++++++++
 ...o-not-check-for-g-when-FTDIPP-is-disabled.patch | 46 +++++++++++
 package/libftdi1/Config.in                         | 37 +++++++++
 package/libftdi1/libftdi1.hash                     |  2 +
 package/libftdi1/libftdi1.mk                       | 37 +++++++++
 package/openocd/Config.in                          |  8 +-
 package/openocd/openocd.mk                         |  2 +-
 12 files changed, 263 insertions(+), 8 deletions(-)
 create mode 100644 package/libftdi/libftdi.hash
 create mode 100644 package/libftdi1/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
 create mode 100644 package/libftdi1/0002-cmake-fix-FindUSB1.cmake.patch
 create mode 100644 package/libftdi1/0003-cmake-do-not-check-for-g-when-FTDIPP-is-disabled.patch
 create mode 100644 package/libftdi1/Config.in
 create mode 100644 package/libftdi1/libftdi1.hash
 create mode 100644 package/libftdi1/libftdi1.mk

--
2.3.2
