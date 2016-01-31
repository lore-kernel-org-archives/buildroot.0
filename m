From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 21:06:25 +0100
Subject: [Buildroot] [git commit] package/smack: fix musl build
Message-ID: <20160201224708.8EA077F892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=421defd17679c6d203a01ca1768cd347da593e40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build error was not yet found by the autobuilders:

common.c: In function ???clear???:
common.c:36:12: error: ???PATH_MAX??? undeclared (first use in this function)
  char path[PATH_MAX];
            ^

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ck-common.c-Include-limits.h-for-PATH_MAX.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/smack/0001-libsmack-common.c-Include-limits.h-for-PATH_MAX.patch b/package/smack/0001-libsmack-common.c-Include-limits.h-for-PATH_MAX.patch
new file mode 100644
index 0000000..0e30ef5
--- /dev/null
+++ b/package/smack/0001-libsmack-common.c-Include-limits.h-for-PATH_MAX.patch
@@ -0,0 +1,29 @@
+From 316c911aa741b14513622a4206ed6d324e951fa0 Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Wed, 20 May 2015 21:25:22 +0200
+Subject: [PATCH 1/1] libsmack/common.c: Include <limits.h> for PATH_MAX
+
+Signed-off-by: Felix Janda <felix.janda@posteo.de>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+Downloaded from upstream commit
+https://github.com/smack-team/smack/commit/316c911aa741b14513622a4206ed6d324e951fa0
+
+ libsmack/common.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libsmack/common.c b/libsmack/common.c
+index 55fee1a..55b59e3 100644
+--- a/libsmack/common.c
++++ b/libsmack/common.c
+@@ -22,6 +22,7 @@
+ #include <dirent.h>
+ #include <errno.h>
+ #include <fcntl.h>
++#include <limits.h>
+ #include <stdio.h>
+ #include <string.h>
+ #include <unistd.h>
+-- 
+2.7.0
+
