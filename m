From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 25 Jan 2015 22:13:47 +0100
Subject: [Buildroot] [PATCH 0/8] Misc. fixes around libftdi
Message-ID: <1422220435-18689-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,


The series includes a number of fixes/updates:

Patch 1/8: 2nd version of pending fix for libftdi (which fixes openocd failures)

Patch 2/8: a random libiio cmake fix

Patches 3-4/8: bump libftdi and add libftdi1

Patches 5-6/8: [RFC] use libftdi1 for the 2 packages explicitly dependending on
libftdi (only build tests, runtime test feedback is welcome).
It seems ola also depends on libftdi, but does not support libftdi1. Who knows
how many other packages silently depend on libftdi depending on the buildroot
configuration...

Patch 7/8: bump CMake

Patch 8/8: [RFC] add a patch to finely enable/disable CMake tools being built,
allowing to cut down ~25% of the buildtime of the cmake package.


Regards,


Daniel Sangue (1):
  package/libftdi1: new package

Samuel Martin (7):
  package/libftdi: fix libftdi.pc
  package/libiio: update cmake code for libxml2 detection
  package/libftdi: bump to version 0.20
  package/avrdude: depends on libftdi1 instead of libftdi
  package/openocd: depends on libftdi1 instead of libftdi
  package/cmake: bump to version 3.1.1
  package/cmake: only build what is necessary

 package/Config.in                                  |   1 +
 package/avrdude/avrdude.mk                         |   4 +-
 ...-allow-to-select-what-program-to-be-built.patch | 231 +++++++++++++++++++++
 package/cmake/cmake.hash                           |   2 +
 package/cmake/cmake.mk                             |   8 +-
 ...bftdi.pc-requires-libusb-fix-static-build.patch |  27 +++
 package/libftdi/libftdi.hash                       |   2 +
 package/libftdi/libftdi.mk                         |   2 +-
 ...he-standard-CMake-flag-to-drive-the-share.patch |  96 +++++++++
 .../libftdi1/0002-cmake-fix-FindUSB1.cmake.patch   |  34 +++
 ...o-not-check-for-g-when-FTDIPP-is-disabled.patch |  46 ++++
 package/libftdi1/Config.in                         |  37 ++++
 package/libftdi1/libftdi1.hash                     |   2 +
 package/libftdi1/libftdi1.mk                       |  38 ++++
 ...l2-detection-try-first-the-CMake-module-f.patch |  40 ++--
 package/openocd/Config.in                          |   8 +-
 package/openocd/openocd.mk                         |   2 +-
 17 files changed, 553 insertions(+), 27 deletions(-)
 create mode 100644 package/cmake/0001-CMake-allow-to-select-what-program-to-be-built.patch
 create mode 100644 package/cmake/cmake.hash
 create mode 100644 package/libftdi/0002-libftdi.pc-requires-libusb-fix-static-build.patch
 create mode 100644 package/libftdi/libftdi.hash
 create mode 100644 package/libftdi1/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
 create mode 100644 package/libftdi1/0002-cmake-fix-FindUSB1.cmake.patch
 create mode 100644 package/libftdi1/0003-cmake-do-not-check-for-g-when-FTDIPP-is-disabled.patch
 create mode 100644 package/libftdi1/Config.in
 create mode 100644 package/libftdi1/libftdi1.hash
 create mode 100644 package/libftdi1/libftdi1.mk

--
2.2.2
