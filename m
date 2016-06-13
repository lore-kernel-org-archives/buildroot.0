From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Jun 2016 20:23:14 +0200
Subject: [Buildroot] [PATCH 2/3] package/qwt: Fix selecting OpenGL support
	in qt4
In-Reply-To: <1465842195-21158-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465842195-21158-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465842195-21158-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A Kconfig option being part of a choice can not be selected directly,
so we use the new option BR2_PACKAGE_QT_OPENGL.

Fixes
http://autobuild.buildroot.net/results/2a8/2a8edb18ab7f8a9e324966282858014e9b5bbea0/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/qwt/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index 810bd75..dabbda2 100644
--- a/package/qwt/Config.in
+++ b/package/qwt/Config.in
@@ -29,7 +29,7 @@ config BR2_PACKAGE_QWT_OPENGL
 	bool "OpenGL support"
 	depends on (BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_QT) || \
 		(BR2_PACKAGE_QT5_GL_AVAILABLE && BR2_PACKAGE_QT5)
-	select BR2_PACKAGE_QT_OPENGL_ES if BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT_OPENGL if BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5
 
 endif
-- 
2.8.1
