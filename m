From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 21 Nov 2013 13:39:25 +0100
Subject: [Buildroot] [PATCH] squid: fix compilation due to missing include
	of time.h
Message-ID: <a1073b4cace055956ad3.1385037565@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/b33/b33e1f41e50b6e7ac3e30806b9a617d451bc27b4/

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/squid/squid-03-missing-include-time_h.patch |  28 +++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/squid/squid-03-missing-include-time_h.patch b/package/squid/squid-03-missing-include-time_h.patch
new file mode 100644
--- /dev/null
+++ b/package/squid/squid-03-missing-include-time_h.patch
@@ -0,0 +1,28 @@
+ipc/Kid.cc: add missing include of time.h
+
+Function time() comes from <time.h>, so add the necessary include.
+This fixes compilation on some configurations, for example
+http://autobuild.buildroot.net/results/b33/b33e1f41e50b6e7ac3e30806b9a617d451bc27b4/
+
+Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
+Upstream-status: submitted (http://bugs.squid-cache.org/show_bug.cgi?id=3967)
+
+---
+ src/ipc/Kid.cc |  4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+
+diff --git a/src/ipc/Kid.cc b/src/ipc/Kid.cc
+--- a/src/ipc/Kid.cc
++++ b/src/ipc/Kid.cc
+@@ -11,6 +11,10 @@
+ #include <sys/wait.h>
+ #endif
+ 
++#if HAVE_TIME_H
++#include <time.h>
++#endif
++
+ int TheProcessKind = pkOther;
+ 
+ Kid::Kid():
