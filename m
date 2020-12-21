From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 12:39:39 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/qt5svg: drop qt
 5.6 support
Message-ID: <20201221124322.9380288314@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55e1da2290b5760bcb70d1f22ebcb914322cf48d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c99c2f7e6af0a37fb6156d24884656e70e24e212)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5svg/qt5svg.hash | 5 -----
 package/qt5/qt5svg/qt5svg.mk   | 6 ------
 2 files changed, 11 deletions(-)

diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index a3af0a4646..ffb4fe4199 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,6 +1,3 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsvg-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 100f183517b46554079beabd8d2cabe3070a74dd0a2e64b6a304eac71cfadcec qtsvg-opensource-src-5.6.3.tar.xz
-
 # Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtsvg-everywhere-src-5.12.8.tar.xz.sha256
 sha256  af2aad75a48c2e4ad70aa298decceb5afc41d499aec119ad72635363a2dfbb5d  qtsvg-everywhere-src-5.12.8.tar.xz
 
@@ -9,5 +6,3 @@ sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.
 sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
 sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
 sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
-sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8 LICENSE.LGPLv21
-sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084 LGPL_EXCEPTION.txt
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index cb91844efd..f91c75694e 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -9,14 +9,8 @@ QT5SVG_SITE = $(QT5_SITE)
 QT5SVG_SOURCE = qtsvg-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SVG_VERSION).tar.xz
 QT5SVG_DEPENDENCIES = qt5base
 QT5SVG_INSTALL_STAGING = YES
-
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5SVG_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5SVG_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
-else
-QT5SVG_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
-QT5SVG_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
-endif
 
 define QT5SVG_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
