From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  8 Oct 2013 23:27:17 +0200
Subject: [Buildroot] [PATCH 1/1] xlib_libpthread-stubs: needs thread support
Message-ID: <1381267637-3957-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.org/results/609/6099baac4bb469ae18aab6512233db25183eaabd/

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/x11r7/xlib_libpthread-stubs/Config.in |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/x11r7/xlib_libpthread-stubs/Config.in b/package/x11r7/xlib_libpthread-stubs/Config.in
index fb53585..b2df95a 100644
--- a/package/x11r7/xlib_libpthread-stubs/Config.in
+++ b/package/x11r7/xlib_libpthread-stubs/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
 	bool "libpthread-stubs"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  This library provides weak aliases for pthread functions not
 	  provided in libc or otherwise available by default.
 
 	  http://xcb.freedesktop.org/
+
+comment "xlib_libpthread-stubs needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.7.9.5
