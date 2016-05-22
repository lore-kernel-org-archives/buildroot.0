From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 22 May 2016 21:46:19 +0300
Subject: [Buildroot] [PATCH] putty: fix musl build
Message-ID: <04962c9264edbe6a6a2a00954c50e0ed1a78fbf4.1463942779.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch for fixing build with musl.

Fixes:
http://autobuild.buildroot.net/results/84b/84b8e3e73f7e70ea1f013fc7c1120cf23095a77a/
http://autobuild.buildroot.net/results/b7c/b7cd550af983165d7d930bcc68fcab5bad00159d/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/putty/0001-uxcons-Fix-on-musl-libc.patch | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/putty/0001-uxcons-Fix-on-musl-libc.patch

diff --git a/package/putty/0001-uxcons-Fix-on-musl-libc.patch b/package/putty/0001-uxcons-Fix-on-musl-libc.patch
new file mode 100644
index 000000000000..5f43af0d0555
--- /dev/null
+++ b/package/putty/0001-uxcons-Fix-on-musl-libc.patch
@@ -0,0 +1,29 @@
+From 4ae1577b432c1859704d2763f70a764dee23bd98 Mon Sep 17 00:00:00 2001
+From: Kylie McClain <somasis@exherbo.org>
+Date: Thu, 28 Apr 2016 22:40:32 -0400
+Subject: [PATCH] uxcons: Fix on musl libc
+
+musl libc exports FD_SET and friends in sys/select.h.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: upstream commit 4ae1577b432c
+
+ unix/uxcons.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/unix/uxcons.c b/unix/uxcons.c
+index b9fd67fe9274..f2a25f3fed70 100644
+--- a/unix/uxcons.c
++++ b/unix/uxcons.c
+@@ -12,6 +12,7 @@
+ #include <termios.h>
+ #include <unistd.h>
+ #include <fcntl.h>
++#include <sys/select.h>
+ 
+ #include "putty.h"
+ #include "storage.h"
+-- 
+2.8.1
+
-- 
2.8.1
