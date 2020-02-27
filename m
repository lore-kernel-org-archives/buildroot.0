From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 23:51:13 +0100
Subject: [Buildroot] [git commit] package/qt5connectivity: drop qt 5.6
 support
Message-ID: <20200309140907.3DC3D7FB4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29469b645288580aafc3fc35cdf90cae6f29a818
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5connectivity/5.12.7/qt5connectivity.hash |  9 ---------
 package/qt5/qt5connectivity/5.6.3/qt5connectivity.hash  | 10 ----------
 package/qt5/qt5connectivity/qt5connectivity.hash        | 11 +++++++++--
 package/qt5/qt5connectivity/qt5connectivity.mk          |  6 +-----
 4 files changed, 10 insertions(+), 26 deletions(-)

diff --git a/package/qt5/qt5connectivity/5.12.7/qt5connectivity.hash b/package/qt5/qt5connectivity/5.12.7/qt5connectivity.hash
deleted file mode 100644
index 9af3a57c12..0000000000
--- a/package/qt5/qt5connectivity/5.12.7/qt5connectivity.hash
+++ /dev/null
@@ -1,9 +0,0 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtconnectivity-everywhere-src-5.12.7.tar.xz.sha256
-sha256 647148b9b1a0d3e54f788b66797b81bb87434faf6fb12ac481f9165eda0d071a qtconnectivity-everywhere-src-5.12.7.tar.xz
-
-# Hashes for license files:
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
-sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
-sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE.LGPL3
-sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5connectivity/5.6.3/qt5connectivity.hash b/package/qt5/qt5connectivity/5.6.3/qt5connectivity.hash
deleted file mode 100644
index c1a03c5e00..0000000000
--- a/package/qt5/qt5connectivity/5.6.3/qt5connectivity.hash
+++ /dev/null
@@ -1,10 +0,0 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtconnectivity-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 fa406e3d63fa4a2acc8ecae6d110f20c766f19a21c7061a12f3c167deb07ccde qtconnectivity-opensource-src-5.6.3.tar.xz
-
-# Hashes for license files:
-sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
-sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
-sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
-sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8 LICENSE.LGPLv21
-sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
-sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084 LGPL_EXCEPTION.txt
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index 5316f03b10..9af3a57c12 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,2 +1,9 @@
-# This hash file is not used; instead, update the
-# hash files in the per-version sub-directories.
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtconnectivity-everywhere-src-5.12.7.tar.xz.sha256
+sha256 647148b9b1a0d3e54f788b66797b81bb87434faf6fb12ac481f9165eda0d071a qtconnectivity-everywhere-src-5.12.7.tar.xz
+
+# Hashes for license files:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE.LGPL3
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 0ade9876de..eb9f0141c3 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -10,13 +10,9 @@ QT5CONNECTIVITY_SOURCE = qtconnectivity-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5CONNEC
 QT5CONNECTIVITY_DEPENDENCIES = qt5base
 QT5CONNECTIVITY_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5CONNECTIVITY_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
-else
-QT5CONNECTIVITY_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
-QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
-endif
+
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5CONNECTIVITY_LICENSE += , BSD-3-Clause (examples)
 endif
