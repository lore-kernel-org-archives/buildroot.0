From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 23:52:07 +0100
Subject: [Buildroot] [git commit] package/qt5imageformats: drop qt 5.6
 support
Message-ID: <20200309140907.5DDE7821F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fce260c8c00c6fc3b77f47f61381ed329fbe2ccb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5imageformats/qt5imageformats.hash | 5 -----
 package/qt5/qt5imageformats/qt5imageformats.mk   | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index de977f15ba..3358b6d79c 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,6 +1,3 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtimageformats-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 efe4da3c90c976c9b9a2eb6b081d2b8e1435935695104456276ce98e8a5848c3 qtimageformats-opensource-src-5.6.3.tar.xz
-
 # Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtimageformats-everywhere-src-5.12.7.tar.xz.sha256
 sha256 9bd19ee24fb85f249d01c78e637c95377dd738feb61da0deeee6b770fa62f70b qtimageformats-everywhere-src-5.12.7.tar.xz
 
@@ -10,5 +7,3 @@ sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.
 sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
 sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
 sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
-sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8 LICENSE.LGPLv21
-sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084 LGPL_EXCEPTION.txt
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index fa13ebedaf..b8e581c489 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -10,13 +10,8 @@ QT5IMAGEFORMATS_SOURCE = qtimageformats-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5IMAGEF
 QT5IMAGEFORMATS_DEPENDENCIES = qt5base
 QT5IMAGEFORMATS_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5IMAGEFORMATS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
-else
-QT5IMAGEFORMATS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
-QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
-endif
 
 define QT5IMAGEFORMATS_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
