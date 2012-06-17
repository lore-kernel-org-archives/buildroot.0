From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 17 Jun 2012 19:48:57 +0200
Subject: [Buildroot] [git commit] liburcu: bump to version 0.7.3
Message-ID: <20120618191207.8D08896F69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb26e26269726434ced2850163ad8ba1e0253571
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note that liburcu-0.6.7-missing-gnu-source.patch has been merged upstream.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 delete mode 100644 package/liburcu/liburcu-0.6.7-missing-gnu-source.patch
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../liburcu/liburcu-0.6.7-missing-gnu-source.patch |   13 -------------
 package/liburcu/liburcu.mk                         |    9 +++++++--
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/package/liburcu/liburcu-0.6.7-missing-gnu-source.patch b/package/liburcu/liburcu-0.6.7-missing-gnu-source.patch
deleted file mode 100644
index f34120c..0000000
--- a/package/liburcu/liburcu-0.6.7-missing-gnu-source.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Define _GNU_SOURCE to access CPU_ZERO() macro in uClibc
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: userspace-rcu-0.6.7/tests/urcutorture.c
-===================================================================
---- userspace-rcu-0.6.7.orig/tests/urcutorture.c	2012-02-01 10:17:09.938804402 +0100
-+++ userspace-rcu-0.6.7/tests/urcutorture.c	2012-02-01 10:17:15.308713372 +0100
-@@ -1,3 +1,4 @@
-+#define _GNU_SOURCE
- #include <string.h>
- #include <sys/time.h>
- #include <poll.h>
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index a34079d..1272485 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -1,5 +1,10 @@
-LIBURCU_VERSION = 0.6.7
-LIBURCU_SITE    = http://lttng.org/files/bundles/20111214/
+#############################################################
+#
+# liburc: userspace RCU (read-copy-update) library
+#
+#############################################################
+LIBURCU_VERSION = 0.7.3
+LIBURCU_SITE    = http://lttng.org/files/urcu/
 LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 
 LIBURCU_INSTALL_STAGING = YES
