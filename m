From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2016 19:29:23 +0100
Subject: [Buildroot] [git commit] pptp-linux: add musl build fix patch
Message-ID: <20160217183004.7415D81944@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68d73dba9ea52b177f2e317b0e38da1672798407
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/56d/56dd530d53489220d0080480310b8dc150cf1b2e/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-pqueue.h-include-sys-types.h.patch        | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/pptp-linux/0003-pqueue.h-include-sys-types.h.patch b/package/pptp-linux/0003-pqueue.h-include-sys-types.h.patch
new file mode 100644
index 0000000..d6b5445
--- /dev/null
+++ b/package/pptp-linux/0003-pqueue.h-include-sys-types.h.patch
@@ -0,0 +1,30 @@
+From 060ad28b9ca5e99d7c6e8010132da58a3a8a0585 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Fri, 22 Jan 2016 10:19:18 -0300
+Subject: [PATCH] pqueue.h: include sys/types.h
+
+We're using u_int32_t here, this breaks on musl libc builds otherwise.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Patch status: sent upstream to the devel mailing list
+(moderated, no archive link yet)
+
+ pqueue.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/pqueue.h b/pqueue.h
+index a56590f..8c60c62 100644
+--- a/pqueue.h
++++ b/pqueue.h
+@@ -3,6 +3,7 @@
+ 
+ #include <time.h>
+ #include <sys/time.h>
++#include <sys/types.h>
+ 
+ /* wait this many seconds for missing packets before forgetting about them */
+ #define DEFAULT_PACKET_TIMEOUT 0.3
+-- 
+2.4.10
+
