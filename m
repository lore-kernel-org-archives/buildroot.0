From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 23 Jul 2012 09:42:38 -0300
Subject: [Buildroot] [PATCH] radvd: fix high jobcount build failure
Message-ID: <1343047358-26801-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build failure:
http://autobuild.buildroot.org/results/48aabbc41dff2e4196dfd6e1e942cf6dbe050deb/build-end.log
because of a typo/missed update in the Makefile

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/radvd/radvd-highjob.patch |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 package/radvd/radvd-highjob.patch

diff --git a/package/radvd/radvd-highjob.patch b/package/radvd/radvd-highjob.patch
new file mode 100644
index 0000000..5945435
--- /dev/null
+++ b/package/radvd/radvd-highjob.patch
@@ -0,0 +1,27 @@
+From ce4911c13a3ab6877c0288c8a1874decb5d0e90a Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Mon, 23 Jul 2012 09:14:24 -0300
+Subject: [PATCH] Makefile: fix high jobcount build failures
+
+gram.h is a dependency for scanner.c rather than scanner.o which is
+unused.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ Makefile.am |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 04b834b..8a90ca7 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -131,5 +131,5 @@ dist-hook:
+ 	rm -f $(distdir)/gram.h
+ 	rm -f $(distdir)/scanner.c
+ 
+-scanner.o: gram.h
++scanner.c: gram.h
+ 
+-- 
+1.7.8.6
+
-- 
1.7.8.6
