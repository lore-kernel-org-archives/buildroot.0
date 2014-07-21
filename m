From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 21:59:21 +0200
Subject: [Buildroot] [git commit] qt5graphicaleffects: depend on quick module
Message-ID: <20140721195948.4A6A19D2A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c5d69b890ab21866d54421b45c1e1e2577a6865
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also remove redundant dependencies.

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5graphicaleffects/Config.in |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/qt5/qt5graphicaleffects/Config.in b/package/qt5/qt5graphicaleffects/Config.in
index 2747af8..0a83638 100644
--- a/package/qt5/qt5graphicaleffects/Config.in
+++ b/package/qt5/qt5graphicaleffects/Config.in
@@ -1,10 +1,9 @@
 config BR2_PACKAGE_QT5GRAPHICALEFFECTS
 	bool "qt5graphicaleffects"
-	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on BR2_PACKAGE_HAS_LIBEGL
-	depends on BR2_PACKAGE_HAS_LIBGLES
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -13,6 +12,6 @@ config BR2_PACKAGE_QT5GRAPHICALEFFECTS
 
 	  http://qt-project.org
 
-comment "qt5graphicaleffects requires an OpenGL-capable backend"
-	depends on (!BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES) && \
-		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+comment "qt5graphicaleffects needs an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
