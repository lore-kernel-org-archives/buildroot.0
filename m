From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Jul 2016 13:27:50 +0200
Subject: [Buildroot] [git commit] package/libuio: fix build with musl
Message-ID: <20160702113243.DEB3681D88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebce13ae5860a90e2300626cf93b780807c7f9cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

limits.h header is missing in attr.c, base.c and helper.c to provide
PATH_MAX.

Fixes:
http://autobuild.buildroot.net/results/702/7023104e6018ea46c54073ddbe5119d0f66ae5a3

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuio/0002-fix-build-with-musl.patch | 57 +++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/libuio/0002-fix-build-with-musl.patch b/package/libuio/0002-fix-build-with-musl.patch
new file mode 100644
index 0000000..6e5b168
--- /dev/null
+++ b/package/libuio/0002-fix-build-with-musl.patch
@@ -0,0 +1,57 @@
+From c378ee112857128002754c616acb6841ee32aaf6 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sat, 2 Jul 2016 10:52:28 +0200
+Subject: [PATCH] fix build with musl
+
+limits.h header is missing in attr.c, base.c and helper.c to provide
+PATH_MAX.
+
+Fixes:
+http://autobuild.buildroot.net/results/702/7023104e6018ea46c54073ddbe5119d0f66ae5a3
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ attr.c   | 1 +
+ base.c   | 1 +
+ helper.c | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/attr.c b/attr.c
+index 4245140..7512f4e 100644
+--- a/attr.c
++++ b/attr.c
+@@ -25,6 +25,7 @@
+ #include <dirent.h>
+ #include <errno.h>
+ #include <fcntl.h>
++#include <limits.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/base.c b/base.c
+index 14ebcee..4ce7301 100644
+--- a/base.c
++++ b/base.c
+@@ -25,6 +25,7 @@
+ #include <dirent.h>
+ #include <errno.h>
+ #include <fcntl.h>
++#include <limits.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/helper.c b/helper.c
+index 170f084..1fb0b4c 100644
+--- a/helper.c
++++ b/helper.c
+@@ -25,6 +25,7 @@
+ #include <dirent.h>
+ #include <errno.h>
+ #include <fcntl.h>
++#include <limits.h>
+ #include <regex.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+-- 
+2.5.5
+
