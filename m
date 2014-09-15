From: Maarten ter Huurne <maarten@treewalker.org>
Date: Mon, 15 Sep 2014 04:53:38 +0200
Subject: [Buildroot] [PATCH v2] memstat: Add patch to fix compilation with
	musl libc
In-Reply-To: <20140913224356.174954fc@free-electrons.com>
References: <20140913224356.174954fc@free-electrons.com>
Message-ID: <1410749618-6304-1-git-send-email-maarten@treewalker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PATH_MAX was undefined because of a missing #include.

Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
---
 package/memstat/memstat-0001-PATH_MAX.patch | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 package/memstat/memstat-0001-PATH_MAX.patch

diff --git a/package/memstat/memstat-0001-PATH_MAX.patch b/package/memstat/memstat-0001-PATH_MAX.patch
new file mode 100644
index 0000000..0c3617a
--- /dev/null
+++ b/package/memstat/memstat-0001-PATH_MAX.patch
@@ -0,0 +1,14 @@
+Add missing #include for PATH_MAX
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+
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
