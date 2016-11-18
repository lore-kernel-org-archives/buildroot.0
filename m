From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 18 Nov 2016 23:00:12 +0100
Subject: [Buildroot] [PATCH v1] qwt: fix qt5 opengl support
Message-ID: <1479506412-28270-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt5base BR2_PACKAGE_QT5BASE_OPENGL_LIB depends on BR2_PACKAGE_QT5BASE_OPENGL (see
package/qt5/qt5base/Config.in), so select it.

Fixes [1]:

  cp: cannot stat '.../output/host/usr/sh4-buildroot-linux-uclibc/sysroot/usr/lib/libQt5OpenGL.so.*': No such file or directory

[1] http://autobuild.buildroot.net/results/262/2623d48194b778c92134f9bceea923749b26ac6b

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qwt/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index dabbda2..a678637 100644
--- a/package/qwt/Config.in
+++ b/package/qwt/Config.in
@@ -30,6 +30,7 @@ config BR2_PACKAGE_QWT_OPENGL
 	depends on (BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_QT) || \
 		(BR2_PACKAGE_QT5_GL_AVAILABLE && BR2_PACKAGE_QT5)
 	select BR2_PACKAGE_QT_OPENGL if BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5
 
 endif
-- 
2.8.1
