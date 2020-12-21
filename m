From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 12:36:53 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/qt5sensors: drop
 qt 5.6 support
Message-ID: <20201221124322.68E2188314@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=844ce63431f4b4ee160d73556b464e5bf1c65765
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e4b6e4198aedae38da0e72f82b843cd6c63ea7a1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5sensors/qt5sensors.hash | 8 --------
 package/qt5/qt5sensors/qt5sensors.mk   | 6 ------
 2 files changed, 14 deletions(-)

diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index a2fe83cb74..2b04fb9d51 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,6 +1,3 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsensors-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 7502d4dc5571865a7eea2a4180c3be396dfb8ce22df4c4f3d7e9ff32ab334973 qtsensors-opensource-src-5.6.3.tar.xz
-
 # Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtsensors-everywhere-src-5.12.8.tar.xz.sha256
 sha256  48f3c25e32a6b19a203188d7e52ad257b3ac23781ee80bea933d721e270d297a  qtsensors-everywhere-src-5.12.8.tar.xz
 
@@ -10,8 +7,3 @@ sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.
 sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
 sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE.LGPL3
 sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
-sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
-sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
-sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8 LICENSE.LGPLv21
-sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084 LGPL_EXCEPTION.txt
-sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index 10498a4970..21fc3203b2 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -9,14 +9,8 @@ QT5SENSORS_SITE = $(QT5_SITE)
 QT5SENSORS_SOURCE = qtsensors-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SENSORS_VERSION).tar.xz
 QT5SENSORS_DEPENDENCIES = qt5base
 QT5SENSORS_INSTALL_STAGING = YES
-
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5SENSORS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5SENSORS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
-else
-QT5SENSORS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
-QT5SENSORS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
-endif
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5SENSORS_DEPENDENCIES += qt5declarative
