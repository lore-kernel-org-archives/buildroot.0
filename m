From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Mon, 18 Jun 2018 18:49:06 -0400
Subject: [Buildroot] [PATCH 1/2] qt5charts: allow to build with qt5.6
In-Reply-To: <20180618224907.17322-1-gael.portay@savoirfairelinux.com>
References: <20180618224907.17322-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180618224907.17322-2-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This module is available for Qt 5.6 since version 5.6.3 under the
version number 2.1.3.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/qt5charts/Config.in      | 4 ----
 package/qt5/qt5charts/qt5charts.hash | 3 +++
 package/qt5/qt5charts/qt5charts.mk   | 5 +++++
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/qt5/qt5charts/Config.in b/package/qt5/qt5charts/Config.in
index 78f08fe637..db199922db 100644
--- a/package/qt5/qt5charts/Config.in
+++ b/package/qt5/qt5charts/Config.in
@@ -1,9 +1,5 @@
-comment "qt5charts needs at least qt-5.7"
-	depends on !BR2_PACKAGE_QT5_VERSION_LATEST
-
 config BR2_PACKAGE_QT5CHARTS
 	bool "qt5charts"
-	depends on BR2_PACKAGE_QT5_VERSION_LATEST
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_WIDGETS
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index 5a5845ef9f..ce1189d0e1 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,3 +1,6 @@
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcharts-opensource-src-2.1.3.tar.xz.mirrorlist
+sha256 f636a9b1c255f678f11b36cd73abc807d16dae0c31ecbc75c09524703aae7d2f  qtcharts-opensource-src-2.1.3.tar.xz
+
 # Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtcharts-everywhere-src-5.10.1.tar.xz.mirrorlist
 sha256 4f0d577bf73dd2bbb2765c2cfb493a2d68790fc2c64f42544d31dba806321ec9  qtcharts-everywhere-src-5.10.1.tar.xz
 
diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
index 123cb658fe..71d0e54027 100644
--- a/package/qt5/qt5charts/qt5charts.mk
+++ b/package/qt5/qt5charts/qt5charts.mk
@@ -4,7 +4,12 @@
 #
 ################################################################################
 
+# Qt5Charts does not follow Qt versionning for 5.6
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5CHARTS_VERSION = $(QT5_VERSION)
+else
+QT5CHARTS_VERSION = 2.1.3
+endif
 QT5CHARTS_SITE = $(QT5_SITE)
 QT5CHARTS_SOURCE = qtcharts-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5CHARTS_VERSION).tar.xz
 QT5CHARTS_DEPENDENCIES = qt5base
-- 
2.17.1
