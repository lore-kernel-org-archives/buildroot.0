From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Sep 2014 09:41:37 +0200
Subject: [Buildroot] [PATCH] xapp_xf86dga: Needs MMU
Message-ID: <1410075697-11689-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/e76/e76b8ff1767f061587b630091174c58da599d5e3/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xf86dga/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_xf86dga/Config.in b/package/x11r7/xapp_xf86dga/Config.in
index 769ebf6..8a13bd4 100644
--- a/package/x11r7/xapp_xf86dga/Config.in
+++ b/package/x11r7/xapp_xf86dga/Config.in
@@ -2,5 +2,6 @@ config BR2_PACKAGE_XAPP_XF86DGA
 	bool "xf86dga"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXXF86DGA
+	depends on BR2_USE_MMU # fork()
 	help
 	  test program for the XFree86-DGA extension
-- 
1.7.10.4
