From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 21:33:16 +0100
Subject: [Buildroot] [git commit] package/stress-ng: fix build without
 threads
Message-ID: <20181206204105.876BE8B493@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d935f001abbc8e414c72593f673530f1a481b249
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

semaphore.h is available only if HAVE_LIB_PTHREAD and
HAVE_SEM_POSIX are defined

Fixes:
 - http://autobuild.buildroot.org/results/1c95898b2833683a22bbe2ff8471fa08d94210e1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: update upstream status of the patch.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-stress-ng.h-fix-include-on-semaphore.h.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/stress-ng/0001-stress-ng.h-fix-include-on-semaphore.h.patch b/package/stress-ng/0001-stress-ng.h-fix-include-on-semaphore.h.patch
new file mode 100644
index 0000000000..3d656f3159
--- /dev/null
+++ b/package/stress-ng/0001-stress-ng.h-fix-include-on-semaphore.h.patch
@@ -0,0 +1,34 @@
+From 818ed67f67c487d519bb55ed5656cff2dd58375e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 4 Dec 2018 21:41:12 +0100
+Subject: [PATCH] stress-ng.h: fix include on semaphore.h
+
+semaphore.h is available only if HAVE_LIB_PTHREAD and
+HAVE_SEM_POSIX are defined
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1c95898b2833683a22bbe2ff8471fa08d94210e1
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/ColinIanKing/stress-ng/commit/9b861e679f9de32e4c68437453756f93e13c01fb]
+---
+ stress-ng.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/stress-ng.h b/stress-ng.h
+index 0485dc1c..1bf2e207 100644
+--- a/stress-ng.h
++++ b/stress-ng.h
+@@ -53,7 +53,9 @@
+ #include <dirent.h>
+ #include <limits.h>
+ #include <setjmp.h>
++#if defined(HAVE_LIB_PTHREAD) && (HAVE_SEM_POSIX)
+ #include <semaphore.h>
++#endif
+ #include <sched.h>
+ 
+ #if defined(__GNUC__) && defined(__linux__)
+-- 
+2.14.1
+
