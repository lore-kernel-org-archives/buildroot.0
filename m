From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Aug 2013 10:15:32 -0300
Subject: [Buildroot] [PATCH] opencv: gtk support doesn't work with directfb
Message-ID: <1376313332-5953-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This was dropped on 4b3d949b8af240bda451b0a4e57d60153188c2e4 when
libgkt2 was updated. Fixes:
http://autobuild.buildroot.net/results/817/8173b7fd3d6af79a7f2c04bf36059a4429127516/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/opencv/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index c6ec3fe..e98ba8a 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -150,7 +150,7 @@ comment "gstreamer support requires a toolchain with WCHAR and threading support
 
 config BR2_PACKAGE_OPENCV_WITH_GTK
 	bool "gtk support"
-	depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
+	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
-- 
1.8.1.5
