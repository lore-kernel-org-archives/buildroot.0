From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Sat, 19 Jul 2014 20:33:28 +0300
Subject: [Buildroot] [PATCH 6/6] qt5quickcontrols: depend on quick module
In-Reply-To: <1405791208-30356-1-git-send-email-fatih.asici@gmail.com>
References: <1405791208-30356-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <1405791208-30356-7-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove redundant dependencies.

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/qt5quickcontrols/Config.in | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/qt5/qt5quickcontrols/Config.in b/package/qt5/qt5quickcontrols/Config.in
index c350a74..aae3d89 100644
--- a/package/qt5/qt5quickcontrols/Config.in
+++ b/package/qt5/qt5quickcontrols/Config.in
@@ -1,11 +1,9 @@
 config BR2_PACKAGE_QT5QUICKCONTROLS
 	bool "qt5quickcontrols"
-	select BR2_PACKAGE_QT5BASE
-	select BR2_PACKAGE_QT5BASE_NETWORK
 	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on BR2_PACKAGE_HAS_LIBEGL
-	depends on BR2_PACKAGE_HAS_LIBGLES
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -14,6 +12,6 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
 
 	  http://qt-project.org
 
-comment "qt5quickcontrols requires an OpenGL-capable backend"
-	depends on (!BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES) && \
-		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+comment "qt5quickcontrols needs an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-- 
2.0.1
