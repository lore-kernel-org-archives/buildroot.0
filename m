From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 May 2016 13:09:08 +0200
Subject: [Buildroot] [PATCH v1] qt5multimedia: select Qt5OpenGL module in
	case OpenGL support is enabled
Message-ID: <1463483348-8157-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt5Multimedia needs Qt5OpenGL module in case OpenGL support is
enabled.

Fixes bug reported by Marco Trapanese ([1]).

[1] http://lists.busybox.net/pipermail/buildroot/2016-May/161288.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5multimedia/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5multimedia/Config.in b/package/qt5/qt5multimedia/Config.in
index 59c3984..7549b35 100644
--- a/package/qt5/qt5multimedia/Config.in
+++ b/package/qt5/qt5multimedia/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_QT5MULTIMEDIA
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_NETWORK
+	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5BASE_OPENGL
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
-- 
2.8.1
