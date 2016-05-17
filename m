From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 15:22:20 +0200
Subject: [Buildroot] [git commit] qt5multimedia: select Qt5OpenGL module in
	case OpenGL support is enabled
Message-ID: <20160517132503.A83A27F881@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5a153b6689a01eadfffcf360addecfe90848fdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt5Multimedia needs Qt5OpenGL module in case OpenGL support is
enabled.

Fixes bug reported by Marco Trapanese ([1]).

[1] http://lists.busybox.net/pipermail/buildroot/2016-May/161288.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
