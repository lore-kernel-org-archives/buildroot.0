From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 12:40:12 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/qt5tools: drop qt
 5.6 support
Message-ID: <20201221124322.9F9EC88314@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bf9a0325214a1de2830978996a45ccfc872779f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 86940ea633cfde1e5513bd3e2d20cbcb45d303e3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5tools/qt5tools.hash | 7 -------
 package/qt5/qt5tools/qt5tools.mk   | 7 +------
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 12531a6372..ba880076a5 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,6 +1,3 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qttools-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 1a63ba838058d73cb540040589b235ded77f76402693decfd6d4d3c75ea67926 qttools-opensource-src-5.6.3.tar.xz
-
 # Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qttools-everywhere-src-5.12.8.tar.xz.sha256
 sha256  21347e8e2422689d63a08195e27c637983c0d4261d5205ce6b493a2adfe826b4  qttools-everywhere-src-5.12.8.tar.xz
 
@@ -10,7 +7,3 @@ sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.
 sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
 sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE.LGPL3
 sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
-sha256 8ab0b8fe7c8e580e8c571b8fa455baf307e9394d4b3ac53ce50d8e960a8934c5 LICENSE.GPLv3
-sha256 66f6bb53f6d985a4d651bf1ecfe8bbcbe32b0f744708d588f047580ee85d8ec8 LICENSE.LGPLv21
-sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084 LGPL_EXCEPTION.txt
-sha256 68afaf3392f8c04218fbf29db43cc0b18bf651c1db086556aa584046de9f3e35 LICENSE.LGPLv3
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index 0d00022998..401b57a211 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -19,13 +19,8 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5TOOLS_DEPENDENCIES += qt5declarative
 endif
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5TOOLS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5TOOLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
-else
-QT5TOOLS_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
-QT5TOOLS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
-endif
 
 QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS) += \
 	linguist/lconvert linguist/lrelease linguist/lupdate
@@ -35,7 +30,7 @@ QT5TOOLS_INSTALL_STAGING_DIR_$(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS) += \
 ifeq ($(BR2_PACKAGE_QT5TOOLS_QDOC_TOOL),y)
 QT5TOOLS_BUILD_DIRS_y += qdoc
 QT5TOOLS_INSTALL_STAGING_DIR_y += qdoc
-QT5TOOLS_DEPENDENCIES += $(if $(BR2_PACKAGE_QT5_VERSION_LATEST),host-clang)
+QT5TOOLS_DEPENDENCIES += host-clang
 endif
 
 QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_PIXELTOOL) += pixeltool
