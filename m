From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Apr 2014 21:31:07 +0200
Subject: [Buildroot] [PATCH 1/1] xlib_libXpm: needs MMU (fork)
Message-ID: <1398540667-23731-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/c57/c571b0a9d9f36a445ea36a4bd609154f9a9bddd5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXpm/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xlib_libXpm/Config.in b/package/x11r7/xlib_libXpm/Config.in
index 528498c..077041a 100644
--- a/package/x11r7/xlib_libXpm/Config.in
+++ b/package/x11r7/xlib_libXpm/Config.in
@@ -4,5 +4,6 @@ config BR2_PACKAGE_XLIB_LIBXPM
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BR2_USE_MMU # fork()
 	help
 	  X.Org Xpm library
-- 
1.7.10.4
