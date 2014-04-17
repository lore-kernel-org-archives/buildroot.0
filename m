From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 17 Apr 2014 17:42:10 +0200
Subject: [Buildroot] [PATCH 1/1] xapp_xdriinfo: depends on the virtual
	package libgl
Message-ID: <1397749330-2079-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is an addition to Yann?s patch series and depends on it
"Add virtual package for full-openGL (branch yem/opengl)"
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/81168

Fixes http://autobuild.buildroot.net/results/90a/90a8226a8a2978eb13d02645cb9e3d95d9b95757/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xdriinfo/Config.in |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xdriinfo/Config.in b/package/x11r7/xapp_xdriinfo/Config.in
index 970bff5..b2101f2 100644
--- a/package/x11r7/xapp_xdriinfo/Config.in
+++ b/package/x11r7/xapp_xdriinfo/Config.in
@@ -2,6 +2,9 @@ config BR2_PACKAGE_XAPP_XDRIINFO
 	bool "xdriinfo"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XPROTO_GLPROTO
-	depends on BR2_PACKAGE_MESA3D
+	depends on BR2_PACKAGE_HAS_LIBGL
 	help
 	  query configuration information of DRI drivers
+
+comment "xdriinfo depends on OpenGL"
+	depends on !BR2_PACKAGE_HAS_LIBGL
-- 
1.7.10.4
