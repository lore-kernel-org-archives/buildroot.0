From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Feb 2021 18:40:07 +0100
Subject: [Buildroot] [RFC v1 0/6] towards buildroot Qt6 support
Message-ID: <20210213174013.32584-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A very preliminary/early draft of a patchset to add Qt6 (qt6base
only until now) support do buildroot.

The main change (from a package point of view) is the change to
the cmake build system (with ninja preferred over makefile) and
separate host/target compiles.

The qt6base config/make is still (very) work in progress...and
needs a lot more fixes, adjustments and testing...

Regards,
Peter

Peter Seiderer (6):
  package/libb2: new package
  package/libb2/libb2.mk: fix cross-compile/runtime detection
  package/double-conversion: new package
  package/double-conversion: bump version to 3c6d2c2
  package/pkg-cmake: add _INSTALL_STAGING_ENV/_INSTALL_TARGET_ENV
  package/qt6: new package

 package/Config.in                             |   3 +
 package/double-conversion/Config.in           |  12 +
 .../double-conversion/double-conversion.hash  |   3 +
 .../double-conversion/double-conversion.mk    |  15 +
 package/libb2/Config.in                       |   6 +
 package/libb2/libb2.hash                      |   3 +
 package/libb2/libb2.mk                        |  18 +
 package/pkg-cmake.mk                          |   7 +-
 package/qt6/Config.in                         |  75 +++
 package/qt6/qt6.mk                            |  12 +
 ...disable-global-minimum-linux-support.patch |  55 ++
 ...-failure-with-multiline-toolchain-fi.patch |  48 ++
 package/qt6/qt6base/Config.in                 | 311 +++++++++++
 package/qt6/qt6base/qt6base.hash              |  10 +
 package/qt6/qt6base/qt6base.mk                | 496 ++++++++++++++++++
 15 files changed, 1072 insertions(+), 2 deletions(-)
 create mode 100644 package/double-conversion/Config.in
 create mode 100644 package/double-conversion/double-conversion.hash
 create mode 100644 package/double-conversion/double-conversion.mk
 create mode 100644 package/libb2/Config.in
 create mode 100644 package/libb2/libb2.hash
 create mode 100644 package/libb2/libb2.mk
 create mode 100644 package/qt6/Config.in
 create mode 100644 package/qt6/qt6.mk
 create mode 100644 package/qt6/qt6base/0001-src-corelib-disable-global-minimum-linux-support.patch
 create mode 100644 package/qt6/qt6base/0002-QtAutoDetect-fix-failure-with-multiline-toolchain-fi.patch
 create mode 100644 package/qt6/qt6base/Config.in
 create mode 100644 package/qt6/qt6base/qt6base.hash
 create mode 100644 package/qt6/qt6base/qt6base.mk

-- 
2.30.0
