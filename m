From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Jan 2016 10:23:37 -0300
Subject: [Buildroot] [PATCH] pptp-linux: add musl build fix patch
Message-ID: <1453469017-11700-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/56d/56dd530d53489220d0080480310b8dc150cf1b2e/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../0003-pqueue.h-include-sys-types.h.patch        | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/pptp-linux/0003-pqueue.h-include-sys-types.h.patch

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
-- 
2.4.10
