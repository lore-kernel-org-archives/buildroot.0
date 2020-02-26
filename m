From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2020 15:46:01 +0100
Subject: [Buildroot] [PATCH v2 30/37] package/qt5x11extras: drop qt 5.6
 support
In-Reply-To: <20200226144608.12529-1-peter@korsgaard.com>
References: <20200226144608.12529-1-peter@korsgaard.com>
Message-ID: <20200226144608.12529-30-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And get rid of the 5.12.7 subdir now that the version selection is gone.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5x11extras/5.6.3/qt5x11extras.hash       | 10 ----------
 .../qt5/qt5x11extras/{5.12.7 => }/qt5x11extras.hash    |  0
 package/qt5/qt5x11extras/qt5x11extras.mk               |  6 ------
 3 files changed, 16 deletions(-)
 delete mode 100644 package/qt5/qt5x11extras/5.6.3/qt5x11extras.hash
 rename package/qt5/qt5x11extras/{5.12.7 => }/qt5x11extras.hash (100%)

diff --git a/package/qt5/qt5x11extras/5.6.3/qt5x11extras.hash b/package/qt5/qt5x11extras/5.6.3/qt5x11extras.hash
deleted file mode 100644
index b34c059983..0000000000
--- a/package/qt5/qt5x11extras/5.6.3/qt5x11extras.hash
+++ /dev/null
@@ -1,10 +0,0 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtx11extras-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 1e7a8e96e0629f2b2b78de684b156b357210cf5df6b42f30789423f2cb07677f qtx11extras-opensource-src-5.6.3.tar.xz
-
-# Hashes for license files:
-sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
-sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
-sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8 LICENSE.LGPLv21
-sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084 LGPL_EXCEPTION.txt
-sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
-sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5x11extras/5.12.7/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
similarity index 100%
rename from package/qt5/qt5x11extras/5.12.7/qt5x11extras.hash
rename to package/qt5/qt5x11extras/qt5x11extras.hash
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 6acc9462c1..5d6e564c05 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -9,14 +9,8 @@ QT5X11EXTRAS_SITE = $(QT5_SITE)
 QT5X11EXTRAS_SOURCE = qtx11extras-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5X11EXTRAS_VERSION).tar.xz
 QT5X11EXTRAS_DEPENDENCIES = qt5base
 QT5X11EXTRAS_INSTALL_STAGING = YES
-
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5X11EXTRAS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
-else
-QT5X11EXTRAS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
-QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
-endif
 
 define QT5X11EXTRAS_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-- 
2.20.1
