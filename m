From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Sep 2014 23:58:34 +0200
Subject: [Buildroot] [git commit] memstat: Add patch to fix compilation with
	musl libc
Message-ID: <20140924220143.E3BC39D771@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7989e053279034fc0a6e29cfc5ffe0b32bcae2e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PATH_MAX was undefined because of a missing #include.

Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/memstat/memstat-0001-PATH_MAX.patch |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

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
