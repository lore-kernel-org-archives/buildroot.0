From: Dagg Stompler <daggs@gmx.com>
Date: Sun, 13 Aug 2017 20:35:59 +0300
Subject: [Buildroot] [PATCH] sysvinit: fix compilation error against musl
Message-ID: <20170813173559.8413-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 .../0002-musl_fix_compilation_errors.patch         | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/sysvinit/0002-musl_fix_compilation_errors.patch

diff --git a/package/sysvinit/0002-musl_fix_compilation_errors.patch b/package/sysvinit/0002-musl_fix_compilation_errors.patch
new file mode 100644
index 0000000000..76b6ced894
--- /dev/null
+++ b/package/sysvinit/0002-musl_fix_compilation_errors.patch
@@ -0,0 +1,38 @@
+fix compilation errors when compiling against must libc.
+
+Signed-off-by: Dagg Stompler <daggs@gmx.com>
+
+diff -Nupr a/src/init.c b/src/init.c
+--- a/src/init.c	2017-08-13 18:44:27.000000000 +0300
++++ b/src/init.c	2017-08-13 18:34:45.000000000 +0300
+@@ -37,6 +37,7 @@
+ #include <sys/kd.h>
+ #endif
+ #include <sys/resource.h>
++#include <sys/ttydefaults.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <errno.h>
+diff -Nupr a/src/init.h b/src/init.h
+--- a/src/init.h	2017-08-13 19:35:46.000000000 +0300
++++ b/src/init.h	2017-08-13 19:36:01.000000000 +0300
+@@ -22,6 +22,8 @@
+  *
+  */
+ 
++#include <time.h>
++
+ /* Standard configuration */
+ #define CHANGE_WAIT 0			/* Change runlevel while
+ 					   waiting for a process to exit? */
+diff -Nupr a/src/mountpoint.c b/src/mountpoint.c
+--- a/src/mountpoint.c	2017-08-13 20:28:26.000000000 +0300
++++ b/src/mountpoint.c	2017-08-13 20:28:40.000000000 +0300
+@@ -24,6 +24,7 @@
+  */
+ 
+ #include <sys/stat.h>
++#include <sys/types.h>
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <string.h>
-- 
2.14.1
