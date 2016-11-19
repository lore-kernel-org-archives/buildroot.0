From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Nov 2016 10:50:19 +0100
Subject: [Buildroot] [git commit] qwt: fix qt5 opengl support
Message-ID: <20161119095026.57819817B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d20845c447d5b6a9d4ef5d1fc2c82b2dfb70480b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt5base BR2_PACKAGE_QT5BASE_OPENGL_LIB depends on BR2_PACKAGE_QT5BASE_OPENGL (see
package/qt5/qt5base/Config.in), so select it.

Fixes [1]:

  cp: cannot stat '.../output/host/usr/sh4-buildroot-linux-uclibc/sysroot/usr/lib/libQt5OpenGL.so.*': No such file or directory

[1] http://autobuild.buildroot.net/results/262/2623d48194b778c92134f9bceea923749b26ac6b

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
