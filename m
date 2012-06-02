From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jun 2012 00:09:15 +0200
Subject: [Buildroot] [PATCH v3 1/4] liburcu: bump to version 0.7.3
Message-ID: <1338674958-1972-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Note that liburcu-0.6.7-missing-gnu-source.patch has been merged upstream.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 delete mode 100644 package/liburcu/liburcu-0.6.7-missing-gnu-source.patch

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
--
1.7.10.3
