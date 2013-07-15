From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 16:44:17 -0500
Subject: [Buildroot] [PATCH v6 0/3] TI Graphics SDK
Message-ID: <1373924660-1391-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These patches integrate the TI Graphics SDK.

v6:
 - Fix whitespace errors
 - Minor bug fixes
 - Fix typo in qt patch
v5:
 - Fixed build issues on hard float (and non-CS toolchains)
 - added powervr virtual package
v4:
 - Fix header issue with qt.
 - Add eglimage version installation.
v3:
 - integrate reviews from thomas.
 - Add qt patch
v2:
 - Take into account reviews.
 - Simplfy init script.
 - Fix header installation.
v1:
 - Added .pc files
 - all review issues addressed
RFC v3:
 - all reviews addressed
 - added demos
 - added hard float (not runtime tested)
 - added init script
 - added SGX detection script (untested)
 - tested on beaglexm using demos
RFC v2:
 - basic working with minor issues during tests
RFC v1:
 - inital revision

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Sundareson, Prabindh <prabu@ti.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Sinan Akpolat <sinan@linkas.com.tr>

Spenser Gilliland (3):
  powervr: add powervr virtual package
  ti-gfx: add new package
  qt: add powervr and opengl

 package/Config.in                              |   2 +
 package/opengl/libegl/libegl.mk                |   4 +
 package/opengl/libgles/libgles.mk              |   4 +
 package/powervr/Config.in                      |   2 +
 package/powervr/powervr.mk                     |  20 +
 package/qt/Config.gfx.in                       |   5 +
 package/qt/Config.in                           |   8 +
 package/qt/powervr.ini                         |   2 +
 package/qt/qt-eglwsegl-use-system.patch        | 802 +++++++++++++++++++++++++
 package/qt/qt.mk                               |  29 +-
 package/ti-gfx/Config.in                       |  69 +++
 package/ti-gfx/S80ti-gfx                       |  53 ++
 package/ti-gfx/egl.pc                          |  11 +
 package/ti-gfx/esrev.sh                        |  59 ++
 package/ti-gfx/glesv2.pc                       |  11 +
 package/ti-gfx/powervr.ini                     |   2 +
 package/ti-gfx/ti-gfx-km_install_modules.patch |  19 +
 package/ti-gfx/ti-gfx-newclkapi.patch          | 143 +++++
 package/ti-gfx/ti-gfx.mk                       | 197 ++++++
 19 files changed, 1441 insertions(+), 1 deletion(-)
 create mode 100644 package/powervr/Config.in
 create mode 100644 package/powervr/powervr.mk
 create mode 100644 package/qt/powervr.ini
 create mode 100644 package/qt/qt-eglwsegl-use-system.patch
 create mode 100644 package/ti-gfx/Config.in
 create mode 100644 package/ti-gfx/S80ti-gfx
 create mode 100644 package/ti-gfx/egl.pc
 create mode 100644 package/ti-gfx/esrev.sh
 create mode 100644 package/ti-gfx/glesv2.pc
 create mode 100644 package/ti-gfx/powervr.ini
 create mode 100644 package/ti-gfx/ti-gfx-km_install_modules.patch
 create mode 100644 package/ti-gfx/ti-gfx-newclkapi.patch
 create mode 100644 package/ti-gfx/ti-gfx.mk

-- 
1.8.1.2
