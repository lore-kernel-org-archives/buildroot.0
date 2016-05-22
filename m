From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 21:36:58 +0200
Subject: [Buildroot] [git commit] putty: fix musl build
Message-ID: <20160522193712.5A7CB817D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=671603fd2e90ba5d9cab1c361837bf4950e7a069
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch for fixing build with musl.

Fixes:
http://autobuild.buildroot.net/results/84b/84b8e3e73f7e70ea1f013fc7c1120cf23095a77a/
http://autobuild.buildroot.net/results/b7c/b7cd550af983165d7d930bcc68fcab5bad00159d/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/putty/0001-uxcons-Fix-on-musl-libc.patch | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/putty/0001-uxcons-Fix-on-musl-libc.patch b/package/putty/0001-uxcons-Fix-on-musl-libc.patch
new file mode 100644
index 0000000..5f43af0
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
