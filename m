From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 24 Oct 2016 05:21:51 +0200
Subject: [Buildroot] [PATCH] uclibc: fix pthread.h
Message-ID: <20161024032151.GA7530@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 bfin: http://autobuild.buildroot.net/results/fbf/fbf63bbe0974b490b875a95fb930ba601364b85a/
 m68k: http://autobuild.buildroot.net/results/cc9/cc9b87c4c695f97a056cc53f19e7662750dffeff/
 microblazeel: http://autobuild.buildroot.net/results/941/941c06e29f6542e258f20799dc6f3f94b2f8af88/

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
---
 .../0001-linuxthreads-add-back-signal.h.patch      | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/uclibc/0001-linuxthreads-add-back-signal.h.patch

diff --git a/package/uclibc/0001-linuxthreads-add-back-signal.h.patch b/package/uclibc/0001-linuxthreads-add-back-signal.h.patch
new file mode 100644
index 0000000..1a957c5
--- /dev/null
+++ b/package/uclibc/0001-linuxthreads-add-back-signal.h.patch
@@ -0,0 +1,28 @@
+From 543308f6c46cf2edf8a524bc9c631e472570fe72 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@uclibc-ng.org>
+Date: Mon, 24 Oct 2016 05:15:07 +0200
+Subject: [PATCH] linuxthreads: add back signal.h
+
+Somehow this got removed with f1d7505e40654a185843bdc8f1cf1fd00ab55c04.
+
+Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+---
+ libpthread/linuxthreads/sysdeps/pthread/pthread.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libpthread/linuxthreads/sysdeps/pthread/pthread.h b/libpthread/linuxthreads/sysdeps/pthread/pthread.h
+index cf043b5..cc13a52 100644
+--- a/libpthread/linuxthreads/sysdeps/pthread/pthread.h
++++ b/libpthread/linuxthreads/sysdeps/pthread/pthread.h
+@@ -20,6 +20,7 @@
+ #include <sched.h>
+ #include <time.h>
+ 
++#include <signal.h>
+ #include <bits/pthreadtypes.h>
+ #include <bits/initspin.h>
+ 
+-- 
+2.1.4
+
-- 
2.1.4
