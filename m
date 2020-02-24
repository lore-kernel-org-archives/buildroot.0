From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Feb 2020 23:20:36 +0100
Subject: [Buildroot] [PATCH 19/36] package/qt5serialport: drop qt 5.6 support
In-Reply-To: <20200224222054.2686-1-peter@korsgaard.com>
References: <20200224222054.2686-1-peter@korsgaard.com>
Message-ID: <20200224222054.2686-19-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And get rid of the 5.12.7 subdir now that the version selection is gone.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5serialport/5.12.7/qt5serialport.hash |  9 ---------
 package/qt5/qt5serialport/5.6.3/qt5serialport.hash  | 10 ----------
 package/qt5/qt5serialport/qt5serialport.hash        | 11 +++++++++--
 package/qt5/qt5serialport/qt5serialport.mk          |  6 ------
 4 files changed, 9 insertions(+), 27 deletions(-)
 delete mode 100644 package/qt5/qt5serialport/5.12.7/qt5serialport.hash
 delete mode 100644 package/qt5/qt5serialport/5.6.3/qt5serialport.hash

diff --git a/package/qt5/qt5serialport/5.12.7/qt5serialport.hash b/package/qt5/qt5serialport/5.12.7/qt5serialport.hash
deleted file mode 100644
index 43136542d8..0000000000
--- a/package/qt5/qt5serialport/5.12.7/qt5serialport.hash
+++ /dev/null
@@ -1,9 +0,0 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtserialport-everywhere-src-5.12.7.tar.xz.sha256
-sha256 224c282ebed750f46b72dfe18260c3d26fbb74e928dec64bd8c51e7beed8721f qtserialport-everywhere-src-5.12.7.tar.xz
-
-# Hashes for license files:
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
-sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
-sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE.LGPL3
-sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5serialport/5.6.3/qt5serialport.hash b/package/qt5/qt5serialport/5.6.3/qt5serialport.hash
deleted file mode 100644
index e6f46c1c57..0000000000
--- a/package/qt5/qt5serialport/5.6.3/qt5serialport.hash
+++ /dev/null
@@ -1,10 +0,0 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialport-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 082d1fee2703aed19f840c4e4031e37c9b929e5bd8ebef2ebac4b28c509bae1a qtserialport-opensource-src-5.6.3.tar.xz
-
-# Hashes for license files:
-sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
-sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
-sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8 LICENSE.LGPLv21
-sha256 79949ee74297883df6e4e7c4bfe1e75a6e7695376b4a87ffc013e27bda509cb2 LGPL_EXCEPTION.txt
-sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
-sha256 e1251235ce9853eecfecfa905da9ee29e9b76e4db2a1c9c4a20699f460419b08 LICENSE.FDL
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 5316f03b10..43136542d8 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,2 +1,9 @@
-# This hash file is not used; instead, update the
-# hash files in the per-version sub-directories.
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtserialport-everywhere-src-5.12.7.tar.xz.sha256
+sha256 224c282ebed750f46b72dfe18260c3d26fbb74e928dec64bd8c51e7beed8721f qtserialport-everywhere-src-5.12.7.tar.xz
+
+# Hashes for license files:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE.LGPL3
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 5c2abd82da..3f88ebf58e 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -9,14 +9,8 @@ QT5SERIALPORT_SITE = $(QT5_SITE)
 QT5SERIALPORT_SOURCE = qtserialport-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SERIALPORT_VERSION).tar.xz
 QT5SERIALPORT_DEPENDENCIES = qt5base
 QT5SERIALPORT_INSTALL_STAGING = YES
-
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5SERIALPORT_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
-else
-QT5SERIALPORT_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
-QT5SERIALPORT_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
-endif
 
 define QT5SERIALPORT_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-- 
2.20.1
