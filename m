From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 27 Aug 2014 21:44:44 +0200
Subject: [Buildroot] [PATCH] xapp_luit: needs MMU
Message-ID: <1409168684-13271-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/13a/13a97461e3b6098e59cfcd829e6bcafa51e50bb4/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_luit/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_luit/Config.in b/package/x11r7/xapp_luit/Config.in
index aec83a0..3e314de 100644
--- a/package/x11r7/xapp_luit/Config.in
+++ b/package/x11r7/xapp_luit/Config.in
@@ -2,5 +2,6 @@ config BR2_PACKAGE_XAPP_LUIT
 	bool "luit"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBFONTENC
+	depends on BR2_USE_MMU # fork()
 	help
 	  Locale and ISO 2022 support for Unicode terminals
-- 
1.7.10.4
