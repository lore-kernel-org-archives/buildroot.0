From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Tue, 27 May 2014 09:24:04 +0300
Subject: [Buildroot] [PATCH v2 0/3] Qt 5.3.0
Message-ID: <1401171847-1719-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to the latest stable release.

Changes v1 -> v2:
  - fix build with uClibc
  - add openssl dependency also in makefile (Suggested by Peter Korsgaard)
  - remove redundant sql dependency of websockets module

Fatih A??c? (3):
  qt5: bump to 5.3.0
  qt5enginio: new package
  qt5websockets: new package

 package/qt5/Config.in                              |  2 +
 package/qt5/qt5.mk                                 |  4 +-
 ...ase-0004-QDnsLookup-Fix-build-with-uClibc.patch | 35 +++++++++++
 package/qt5/qt5base/qt5base-0004-qatomic-ppc.patch | 29 ----------
 .../qt5base-0005-uclibc-no-gnu-lib-names.patch     | 44 --------------
 ...not-check-feature-macros-for-posix_falloc.patch | 41 -------------
 ...qt5base-0007-Fix-no-opengl-build-with-egl.patch | 65 ---------------------
 ...on-t-require-GL-when-build-with-no-opengl.patch | 28 ---------
 ...5base-Fix-linuxfb-argument-mmsize-parsing.patch | 38 ------------
 ...n_t-build-scanner-example-without-qtquick.patch | 30 ----------
 ...ample-needs-no-widgets-but-it-needs-quick.patch | 67 ----------------------
 package/qt5/qt5enginio/Config.in                   | 13 +++++
 package/qt5/qt5enginio/qt5enginio.mk               | 56 ++++++++++++++++++
 package/qt5/qt5websockets/Config.in                | 11 ++++
 ...01-Remove-dependency-on-unused-sql-module.patch | 28 +++++++++
 package/qt5/qt5websockets/qt5websockets.mk         | 55 ++++++++++++++++++
 16 files changed, 202 insertions(+), 344 deletions(-)
 create mode 100644 package/qt5/qt5base/qt5base-0004-QDnsLookup-Fix-build-with-uClibc.patch
 delete mode 100644 package/qt5/qt5base/qt5base-0004-qatomic-ppc.patch
 delete mode 100644 package/qt5/qt5base/qt5base-0005-uclibc-no-gnu-lib-names.patch
 delete mode 100644 package/qt5/qt5base/qt5base-0006-sqlite3-Do-not-check-feature-macros-for-posix_falloc.patch
 delete mode 100644 package/qt5/qt5base/qt5base-0007-Fix-no-opengl-build-with-egl.patch
 delete mode 100644 package/qt5/qt5base/qt5base-CMake-don-t-require-GL-when-build-with-no-opengl.patch
 delete mode 100644 package/qt5/qt5base/qt5base-Fix-linuxfb-argument-mmsize-parsing.patch
 delete mode 100644 package/qt5/qt5connectivity/qt5connectivity-0001-don_t-build-scanner-example-without-qtquick.patch
 delete mode 100644 package/qt5/qt5connectivity/qt5connectivity-0002-the-poster-example-needs-no-widgets-but-it-needs-quick.patch
 create mode 100644 package/qt5/qt5enginio/Config.in
 create mode 100644 package/qt5/qt5enginio/qt5enginio.mk
 create mode 100644 package/qt5/qt5websockets/Config.in
 create mode 100644 package/qt5/qt5websockets/qt5websockets-0001-Remove-dependency-on-unused-sql-module.patch
 create mode 100644 package/qt5/qt5websockets/qt5websockets.mk

-- 
1.9.1
