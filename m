From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Oct 2018 00:39:59 +0200
Subject: [Buildroot] [git commit] qt5x11extras: fix license information
Message-ID: <20181021223959.7B8F088553@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6c2f6a61a471774a6b0b296e40b0be9c4997cab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes several problems with the license information of
qt5x11extras:

 - With the latest version update the legacy version files
   LICENSE.GPLv2 LICENSE.GPLv3 and LICENSE.LGPLv3 were removed, use
   the new ones LICENSE.GPL2 LICENSE.GPL3 and LICENSE.LGPL3 instead.

   Fixes:

   http://autobuild.buildroot.net/results/238bb74f23d7a11516eac088da3188d463abac5a

 - Hashes for some licenses files for the 5.6.3 version were missing.

As part of this, we switch to using per-version hash files entirely.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5x11extras/5.11.2/qt5x11extras.hash      | 9 +++++++++
 package/qt5/qt5x11extras/{ => 5.6.3}/qt5x11extras.hash | 6 ++----
 package/qt5/qt5x11extras/qt5x11extras.mk               | 2 +-
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/qt5/qt5x11extras/5.11.2/qt5x11extras.hash b/package/qt5/qt5x11extras/5.11.2/qt5x11extras.hash
new file mode 100644
index 0000000000..21702b91fb
--- /dev/null
+++ b/package/qt5/qt5x11extras/5.11.2/qt5x11extras.hash
@@ -0,0 +1,9 @@
+# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtx11extras-everywhere-src-5.11.2.tar.xz.mirrorlist
+sha256 f407ca61052d44bfb06e831fc6db7595bb2b64882b1f0af23f5db2d1ee519089 qtx11extras-everywhere-src-5.11.2.tar.xz
+
+# Hashes for license files:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE.LGPL3
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/5.6.3/qt5x11extras.hash
similarity index 64%
rename from package/qt5/qt5x11extras/qt5x11extras.hash
rename to package/qt5/qt5x11extras/5.6.3/qt5x11extras.hash
index da7057c5af..b34c059983 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/5.6.3/qt5x11extras.hash
@@ -1,12 +1,10 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtx11extras-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1e7a8e96e0629f2b2b78de684b156b357210cf5df6b42f30789423f2cb07677f qtx11extras-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtx11extras-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 f407ca61052d44bfb06e831fc6db7595bb2b64882b1f0af23f5db2d1ee519089 qtx11extras-everywhere-src-5.11.2.tar.xz
-
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
 sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
-sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
+sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8 LICENSE.LGPLv21
+sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084 LGPL_EXCEPTION.txt
 sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
 sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index c439e2d31d..9d54c11061 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -12,7 +12,7 @@ QT5X11EXTRAS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5X11EXTRAS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
-QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
 else
 QT5X11EXTRAS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
 QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
