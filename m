From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 12:10:45 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/qt5charts: drop
 qt 5.6 support
Message-ID: <20201221124320.0F57388314@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e0af84a27995dadbb3d5e7d208f2491dfd246df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4ccf0f8360a74905c3e6e7f69f451c1915dc92e8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5charts/qt5charts.hash | 3 ---
 package/qt5/qt5charts/qt5charts.mk   | 7 -------
 2 files changed, 10 deletions(-)

diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index 0010d1b9f7..57c53b1f74 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,6 +1,3 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcharts-opensource-src-2.1.3.tar.xz.mirrorlist
-sha256 f636a9b1c255f678f11b36cd73abc807d16dae0c31ecbc75c09524703aae7d2f  qtcharts-opensource-src-2.1.3.tar.xz
-
 # Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtcharts-everywhere-src-5.12.8.tar.xz.sha256
 sha256  ded463b3f99bf5cc5fe39ed2d70183948c6e955430ce0b21eb235b5c13bc9d16  qtcharts-everywhere-src-5.12.8.tar.xz
 
diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
index e359747503..f7adcc1cd5 100644
--- a/package/qt5/qt5charts/qt5charts.mk
+++ b/package/qt5/qt5charts/qt5charts.mk
@@ -4,21 +4,14 @@
 #
 ################################################################################
 
-# Qt5Charts does not follow Qt versionning for 5.6
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5CHARTS_VERSION = $(QT5_VERSION)
-else
-QT5CHARTS_VERSION = 2.1.3
-endif
 QT5CHARTS_SITE = $(QT5_SITE)
 QT5CHARTS_SOURCE = qtcharts-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5CHARTS_VERSION).tar.xz
 QT5CHARTS_DEPENDENCIES = qt5base
 QT5CHARTS_INSTALL_STAGING = YES
 
 QT5CHARTS_LICENSE = GPL-3.0
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5CHARTS_LICENSE_FILES = LICENSE.GPL3
-endif
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5CHARTS_DEPENDENCIES += qt5declarative
