From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jun 2016 22:25:25 +0200
Subject: [Buildroot] [git commit] qt: enable opengl support by default if
	available
Message-ID: <20160613203323.4CD4581E8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4303e3e11334549d817d03096c030d659acfdb79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If opengl(-es) support is available then it makes sense for Qt to use it by
default.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 91eb208..99b00a0 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -354,6 +354,7 @@ config BR2_PACKAGE_QT_OPENGL
 	bool "OpenGL support"
 	depends on (BR2_PACKAGE_HAS_LIBGL && BR2_PACKAGE_QT_X11) || \
 		   (BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGLES)
+	default y
 	help
 	  This option enables OpenGL support.
 
