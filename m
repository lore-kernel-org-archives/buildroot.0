From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Thu, 4 Dec 2014 11:18:14 +0100
Subject: [Buildroot] [PATCH] exiv2: add patch to fix build error with some
	toolchains
Message-ID: <1417688294-3397-1-git-send-email-nicolas.serafini@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch remove a header inclusion that is not required an can create
build error with some toolchains.
The patch is pushed on the upstream for the next release.
http://dev.exiv2.org/issues/1007

Fixes:
http://autobuild.buildroot.net/results/09d/09d9b525eeee458247e10a7948070c00bbabb964/

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
---
 package/exiv2/exiv2-0001-remove-useless-header.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/exiv2/exiv2-0001-remove-useless-header.patch

diff --git a/package/exiv2/exiv2-0001-remove-useless-header.patch b/package/exiv2/exiv2-0001-remove-useless-header.patch
new file mode 100644
index 0000000..96a3734
--- /dev/null
+++ b/package/exiv2/exiv2-0001-remove-useless-header.patch
@@ -0,0 +1,19 @@
+version.cpp: remove useless header inclusion
+
+The inclusion of link.h header is not required and can create build
+error with some toolchains.
+The patch is pushed on the upstream for the next release.
+http://dev.exiv2.org/issues/1007
+
+Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
+
+--- exiv2-0.24.orig/src/version.cpp	2013-12-01 13:13:42.000000000 +0100
++++ exiv2-0.24/src/version.cpp	2014-12-04 09:30:39.667234130 +0100
+@@ -116,7 +116,6 @@ typedef string_v::iterator  string_i;
+ #elif defined(__linux__)
+ # include <unistd.h>
+ // http://syprog.blogspot.com/2011/12/listing-loaded-shared-objects-in-linux.html
+-# include "link.h"
+ # include <dlfcn.h>
+   struct something
+   {
-- 
2.1.3
