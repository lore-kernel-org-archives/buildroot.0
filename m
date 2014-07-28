From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 28 Jul 2014 21:03:34 +0200
Subject: [Buildroot] [PATCH 1/1] xapp_xconsole: Needs MMU
Message-ID: <1406574214-2816-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/be8/be89847832a2588dbda8dd921edb09b2af130e03/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xconsole/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_xconsole/Config.in b/package/x11r7/xapp_xconsole/Config.in
index 7863afd..1aaa118 100644
--- a/package/x11r7/xapp_xconsole/Config.in
+++ b/package/x11r7/xapp_xconsole/Config.in
@@ -5,5 +5,6 @@ config BR2_PACKAGE_XAPP_XCONSOLE
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XLIB_LIBXMU
+	depends on BR2_USE_MMU # fork()
 	help
 	  xconsole - monitor system console messages with X
-- 
1.7.10.4
