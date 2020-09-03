From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  4 Sep 2020 01:15:55 +0300
Subject: [Buildroot] [PATCH 1/1] package/collectd: bump to version 5.12.0
Message-ID: <20200903221557.91239-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And drop patch (already in version).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 ...c-dpdk_telemetry.c-fix-build-on-musl.patch | 37 -------------------
 package/collectd/collectd.hash                |  6 +--
 package/collectd/collectd.mk                  |  2 +-
 3 files changed, 4 insertions(+), 41 deletions(-)
 delete mode 100644 package/collectd/0001-src-dpdk_telemetry.c-fix-build-on-musl.patch

diff --git a/package/collectd/0001-src-dpdk_telemetry.c-fix-build-on-musl.patch b/package/collectd/0001-src-dpdk_telemetry.c-fix-build-on-musl.patch
deleted file mode 100644
index 8378cd0d33..0000000000
--- a/package/collectd/0001-src-dpdk_telemetry.c-fix-build-on-musl.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 70318d6bcf7ef89e1a73fc775d33f4c854aed484 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 14 Apr 2020 14:49:19 +0200
-Subject: [PATCH] src/dpdk_telemetry.c: fix build on musl
-
-Include unistd.h instead of sys/unistd.h to fix the following build
-failure on musl:
-
-src/dpdk_telemetry.c:43:10: fatal error: sys/unistd.h: No such file or directory
- #include <sys/unistd.h>
-          ^~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/aafb8c72f147fefc7a988c45e4dc17de48b07a95
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/collectd/collectd/pull/3439]
----
- src/dpdk_telemetry.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/dpdk_telemetry.c b/src/dpdk_telemetry.c
-index b46e8574..cfee5f12 100755
---- a/src/dpdk_telemetry.c
-+++ b/src/dpdk_telemetry.c
-@@ -40,7 +40,7 @@
- #include <sys/queue.h>
- #include <sys/socket.h>
- #include <sys/un.h>
--#include <sys/unistd.h>
-+#include <unistd.h>
- 
- #define BUF_SIZE 100000
- #define PLUGIN_NAME "dpdk_telemetry"
--- 
-2.25.1
-
diff --git a/package/collectd/collectd.hash b/package/collectd/collectd.hash
index 0378eca11f..394904a190 100644
--- a/package/collectd/collectd.hash
+++ b/package/collectd/collectd.hash
@@ -1,5 +1,5 @@
 # Locally computed checksums
-sha512	87671545e3d01770c204ba4439265d1c0add6a105bf04ff02dc04db3731fd933d32ecb9b0dc15f2e504d70c3e421a64cf19728c897aa4fb1fda86e393ffc15bf	collectd-5.11.0.tar.bz2
-sha256	37b10a806e34aa8570c1cafa6006c604796fae13cc2e1b3e630d33dcba9e5db2	collectd-5.11.0.tar.bz2
-sha1	18bfb0be0493ed4a1b5d73c8bcc3f28d37652480	collectd-5.11.0.tar.bz2
+sha512	7a15e4c0ae587db4987d673a790a4f3bea1cab29ce24a506fb21fa7bd2f60bfec70867eaa1c1395cb5b0e0ae81a024fb6109b064da0ef50e7c146d2198871c70	collectd-5.12.0.tar.bz2
+sha256	5bae043042c19c31f77eb8464e56a01a5454e0b39fa07cf7ad0f1bfc9c3a09d6	collectd-5.12.0.tar.bz2
+sha1	af36fe83e2995270b5632fc21e5a001e6702cdce	collectd-5.12.0.tar.bz2
 sha256	ed0409b2b1c30566dab5fcdaf46ee70e140c99788e22f0267645a9357b476ae4	COPYING
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index ecca50840c..00e33f27df 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COLLECTD_VERSION = 5.11.0
+COLLECTD_VERSION = 5.12.0
 COLLECTD_SITE = \
 	https://github.com/collectd/collectd/releases/download/collectd-$(COLLECTD_VERSION)
 COLLECTD_SOURCE = collectd-$(COLLECTD_VERSION).tar.bz2
-- 
2.26.2
