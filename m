From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  6 Jan 2016 22:09:58 +0100
Subject: [Buildroot] [PATCH] package/x11r7/xlib_libfontenc: select zlib
Message-ID: <1452114598-6861-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xlib_libfontenc depends on the zlib package but doesn't select it.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/x11r7/xlib_libfontenc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xlib_libfontenc/Config.in b/package/x11r7/xlib_libfontenc/Config.in
index d2a3023..d25e96a 100644
--- a/package/x11r7/xlib_libfontenc/Config.in
+++ b/package/x11r7/xlib_libfontenc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBFONTENC
 	bool "libfontenc"
 	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_ZLIB
 	help
 	  X.Org fontenc library
-- 
2.4.3
