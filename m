From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 May 2016 19:51:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/openpgm: Rework defines to fix
	build with musl libc
Message-ID: <1463853064-1337-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/420/420367cc4640c893f48336d71fa04eaeff55c8e6/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ework-defines-to-fix-build-with-musl-libc.patch | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/openpgm/0003-Rework-defines-to-fix-build-with-musl-libc.patch

diff --git a/package/openpgm/0003-Rework-defines-to-fix-build-with-musl-libc.patch b/package/openpgm/0003-Rework-defines-to-fix-build-with-musl-libc.patch
new file mode 100644
index 0000000..1b1aeb2
--- /dev/null
+++ b/package/openpgm/0003-Rework-defines-to-fix-build-with-musl-libc.patch
@@ -0,0 +1,55 @@
+From 01128a2d8ad3288e8b96a908888049f186d156ee Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 21 May 2016 19:44:48 +0200
+Subject: [PATCH 1/1] Rework defines to fix build with musl libc
+
+Downloaded patch from
+http://git.alpinelinux.org/cgit/aports/plain/main/openpgm/openpgm-fix-includes.patch
+and adjusted paths by prefixing with "openpgm/pgm/"
+
+A build log with the compile error can be found here:
+http://autobuild.buildroot.net/results/854/854554827ead82f29b293ddceced6eb7fbfeec27/build-end.log
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(Patch sent upstream: https://github.com/steve-o/openpgm/pull/44)
+---
+ openpgm/pgm/include/impl/security.h | 3 ++-
+ openpgm/pgm/include/pgm/types.h     | 1 +
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/openpgm/pgm/include/impl/security.h b/openpgm/pgm/include/impl/security.h
+index c2b3e3d..896316f 100644
+--- a/openpgm/pgm/include/impl/security.h
++++ b/openpgm/pgm/include/impl/security.h
+@@ -33,7 +33,6 @@
+ #include <stdio.h>
+ #include <stdarg.h>
+ #include <sys/types.h>
+-#include <sys/timeb.h>
+ #include <impl/i18n.h>
+ #include <impl/errno.h>
+ #include <impl/string.h>
+@@ -41,6 +40,8 @@
+ PGM_BEGIN_DECLS
+ 
+ #ifdef HAVE_FTIME
++#include <sys/timeb.h>
++
+ static inline
+ errno_t
+ #	if   !defined( _WIN32 )
+diff --git a/openpgm/pgm/include/pgm/types.h b/openpgm/pgm/include/pgm/types.h
+index 4e41261..58731a3 100644
+--- a/openpgm/pgm/include/pgm/types.h
++++ b/openpgm/pgm/include/pgm/types.h
+@@ -27,6 +27,7 @@
+ 
+ #ifndef _MSC_VER
+ #	include <sys/param.h>
++#	include <sys/types.h>
+ #endif
+ #include <pgm/macros.h>
+ 
+-- 
+2.8.1
+
-- 
2.8.1
