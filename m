From: Wojciech Slenska <wojciech.slenska@gmail.com>
Date: Mon,  5 May 2014 19:06:46 +0200
Subject: [Buildroot] [PATCH 1/1] qtquick1: removed OpenGL dependencies
Message-ID: <1399309606-25561-1-git-send-email-wojciech.slenska@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

QtQuick1 module doesn't need OpenGl libs and declarative module.
This module can be used to port qt4 qml apps to qt5. Patch has been tested with linuxfb output plugin.

Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
---
 package/qt5/qt5quick1/Config.in    |    8 ++------
 package/qt5/qt5quick1/qt5quick1.mk |    2 +-
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
index 30c2e79..59b6c34 100644
--- a/package/qt5/qt5quick1/Config.in
+++ b/package/qt5/qt5quick1/Config.in
@@ -5,11 +5,8 @@ config BR2_PACKAGE_QT5QUICK1
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5SCRIPT
 	select BR2_PACKAGE_QT5XMLPATTERNS
-	select BR2_PACKAGE_QT5DECLARATIVE
 	# This module does not support static linking
 	depends on !BR2_PREFER_STATIC_LIB
-	depends on BR2_PACKAGE_HAS_LIBEGL
-	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
@@ -19,7 +16,6 @@ config BR2_PACKAGE_QT5QUICK1
 
 	  http://qt-project.org
 
-comment "qt5quick1 needs a toolchain w/ dynamic library and an OpenGL-capable backend"
+comment "qt5quick1 needs a toolchain w/ dynamic library"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES || \
-		BR2_PREFER_STATIC_LIB
+	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/qt5/qt5quick1/qt5quick1.mk b/package/qt5/qt5quick1/qt5quick1.mk
index 624b130..e9d7a64 100644
--- a/package/qt5/qt5quick1/qt5quick1.mk
+++ b/package/qt5/qt5quick1/qt5quick1.mk
@@ -7,7 +7,7 @@
 QT5QUICK1_VERSION = $(QT5_VERSION)
 QT5QUICK1_SITE = $(QT5_SITE)
 QT5QUICK1_SOURCE = qtquick1-opensource-src-$(QT5QUICK1_VERSION).tar.xz
-QT5QUICK1_DEPENDENCIES = qt5base qt5xmlpatterns qt5script qt5declarative \
+QT5QUICK1_DEPENDENCIES = qt5base qt5xmlpatterns qt5script \
 	$(if $(BR2_PACKAGE_QT5WEBKIT),qt5webkit)
 QT5QUICK1_INSTALL_STAGING = YES
 
-- 
1.7.10.4
