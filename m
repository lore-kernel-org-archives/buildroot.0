From: Maarten ter Huurne <maarten@treewalker.org>
Date: Fri, 12 Sep 2014 04:04:09 +0200
Subject: [Buildroot] [PATCH] memstat: Add patch to fix compilation with musl
	libc
Message-ID: <1410487449-32325-1-git-send-email-maarten@treewalker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PATH_MAX was undefined because of a missing #include.

Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
---
 package/memstat/memstat-0001-PATH_MAX.patch | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 package/memstat/memstat-0001-PATH_MAX.patch

diff --git a/package/memstat/memstat-0001-PATH_MAX.patch b/package/memstat/memstat-0001-PATH_MAX.patch
new file mode 100644
index 0000000..7143f6d
--- /dev/null
+++ b/package/memstat/memstat-0001-PATH_MAX.patch
@@ -0,0 +1,10 @@
+--- memstat-0.8.org/memstat.c	2009-06-08 14:38:05.000000000 +0200
++++ memstat-0.8/memstat.c	2014-09-12 03:55:43.096035374 +0200
+@@ -19,6 +19,7 @@
+ #include <unistd.h>
+ #include <getopt.h>
+ #include <errno.h>
++#include <limits.h>
+ 
+ /* blacklist devices that just map physical memory */
+ char *blacklist[] = { "/dev/mem",
-- 
1.8.4.5
