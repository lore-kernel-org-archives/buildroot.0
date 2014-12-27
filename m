From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 27 Dec 2014 22:58:18 +0100
Subject: [Buildroot] [PATCH 00/10] Misc shared only build fixes
Message-ID: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series aims to disable static libraries and enable shared
libraries when it's possible for shared only build.

Romain Naour (10):
  package/lm-sensors: disable static library for shared-only build
  package/libnspr: disable static library for shared only build
  package/libsvgtiny: enable shared library build
  package/keyutils: disable static library for shared only build
  package/lockdev: handle static/shared only build
  package/libxmlrpc: fix shared libraries build for uClibc
  package/libxmlrpc: handle static/shared only install
  package/dvb-apps: rename patches to follow the new name convention
  package/dvb-app: handle static/shared only build
  package/dvb-app: remove tests

 package/dvb-apps/0001-Fix-generate-keynames.patch  | 30 +++++++++++++++++++
 .../dvb-apps/0002-Fix-compiler-warning-flags.patch | 25 ++++++++++++++++
 .../0003-handle-static-shared-only-build.patch     | 35 ++++++++++++++++++++++
 package/dvb-apps/0004-Makefile-remove-test.patch   | 27 +++++++++++++++++
 .../dvb-apps-0001-Fix-generate-keynames.patch      | 30 -------------------
 .../dvb-apps-0002-Fix-compiler-warning-flags.patch | 25 ----------------
 .../dvb-apps-0003-support-static-only-build.patch  | 20 -------------
 package/dvb-apps/dvb-apps.mk                       |  6 +++-
 package/keyutils/keyutils.mk                       |  4 +++
 package/libnspr/libnspr.mk                         |  6 ++++
 package/libsvgtiny/libsvgtiny.mk                   | 16 ++++++++--
 ....in-fix-shared-libraries-build-for-uClibc.patch | 27 +++++++++++++++++
 package/libxmlrpc/libxmlrpc.mk                     | 11 +++++++
 package/lm-sensors/lm-sensors.mk                   |  6 ++++
 package/lockdev/lockdev.mk                         | 35 ++++++++++++++--------
 15 files changed, 211 insertions(+), 92 deletions(-)
 create mode 100644 package/dvb-apps/0001-Fix-generate-keynames.patch
 create mode 100644 package/dvb-apps/0002-Fix-compiler-warning-flags.patch
 create mode 100644 package/dvb-apps/0003-handle-static-shared-only-build.patch
 create mode 100644 package/dvb-apps/0004-Makefile-remove-test.patch
 delete mode 100644 package/dvb-apps/dvb-apps-0001-Fix-generate-keynames.patch
 delete mode 100644 package/dvb-apps/dvb-apps-0002-Fix-compiler-warning-flags.patch
 delete mode 100644 package/dvb-apps/dvb-apps-0003-support-static-only-build.patch
 create mode 100644 package/libxmlrpc/0005-config.mk.in-fix-shared-libraries-build-for-uClibc.patch

-- 
1.9.3
