From: Julien CORJON <corjon.j@ecagroup.com>
Date: Fri, 3 Jul 2015 07:20:54 +0000
Subject: [Buildroot] [PATCH 3/3] qt5quick1, qt5script,
	qt5webkit: tag as deprecated
In-Reply-To: <1435908049-11930-1-git-send-email-corjon.j@ecagroup.com>
References: <1435908049-11930-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <4fef60e5-fbfb-4595-8c48-646c3d00a3d0@MAIL-SINTERS-01.sinters-int.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/Config.in                    | 9 +++++----
 package/qt5/qt5quick1/Config.in          | 6 +++++-
 package/qt5/qt5script/Config.in          | 6 +++++-
 package/qt5/qt5webkit-examples/Config.in | 6 +++++-
 package/qt5/qt5webkit/Config.in          | 6 +++++-
 5 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index e8ec7d9..49e3450 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -36,15 +36,16 @@ source "package/qt5/qt5enginio/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
-source "package/qt5/qt5quick1/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
-source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5sensors/Config.in"
 source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
-source "package/qt5/qt5webkit/Config.in"
-source "package/qt5/qt5webkit-examples/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
+comment "Depracated Qt modules"
+source "package/qt5/qt5quick1/Config.in"
+source "package/qt5/qt5script/Config.in"
+source "package/qt5/qt5webkit/Config.in"
+source "package/qt5/qt5webkit-examples/Config.in"
 endif
diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
index 16076eb..8cde603 100644
--- a/package/qt5/qt5quick1/Config.in
+++ b/package/qt5/qt5quick1/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_QT5QUICK1
-	bool "qt5quick1"
+	bool "qt5quick1 (deprecated)"
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_NETWORK
@@ -15,6 +15,10 @@ config BR2_PACKAGE_QT5QUICK1
 
 	  This package corresponds to the qt5quick1 module.
 
+	  This package has been tagged as deprecated since version
+	  5.5.0 and should be replaced by Qt Quick module in new
+	  design.
+
 	  http://qt.io
 
 comment "qt5quick1 needs a toolchain w/ dynamic library"
diff --git a/package/qt5/qt5script/Config.in b/package/qt5/qt5script/Config.in
index 5313e90..447ac86 100644
--- a/package/qt5/qt5script/Config.in
+++ b/package/qt5/qt5script/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_QT5SCRIPT
-	bool "qt5script"
+	bool "qt5script (deprecated)"
 	select BR2_PACKAGE_QT5BASE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
@@ -8,4 +8,8 @@ config BR2_PACKAGE_QT5SCRIPT
 
 	  This package corresponds to the qt5script module.
 
+	  This package has been tagged as deprecated since version
+	  5.5.0 and should be replaced by Qt QML module in new
+	  design.
+
 	  http://qt.io
diff --git a/package/qt5/qt5webkit-examples/Config.in b/package/qt5/qt5webkit-examples/Config.in
index e7610c2..5267f9d 100644
--- a/package/qt5/qt5webkit-examples/Config.in
+++ b/package/qt5/qt5webkit-examples/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_QT5WEBKIT_EXAMPLES
-	bool "qt5webkit examples"
+	bool "qt5webkit examples (deprecated)"
 	depends on BR2_PACKAGE_QT5WEBKIT
 	help
 	  Qt is a cross-platform application and UI framework for
@@ -7,4 +7,8 @@ config BR2_PACKAGE_QT5WEBKIT_EXAMPLES
 
 	  This package contains examples for the qt5webkit module.
 
+	  This package has been tagged as deprecated since version
+	  5.5.0 and should be replaced by Qt WebEngine module in
+	  new design.
+
 	  http://qt.io
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 3507a9d..df69c5f 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_QT5WEBKIT
-	bool "qt5webkit"
+	bool "qt5webkit (depracated)"
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_ICU
 	select BR2_PACKAGE_QT5BASE_GUI
@@ -17,4 +17,8 @@ config BR2_PACKAGE_QT5WEBKIT
 
 	  This package corresponds to the qt5webkit module.
 
+	  This package has been tagged as deprecated since version
+	  5.5.0 and should be replaced by Qt WebEngine module in
+	  new design.
+
 	  http://qt.io
-- 
2.1.0
