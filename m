From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 09:16:12 +0100
Subject: [Buildroot] [git commit] lttng-libust: bump to version 2.6.0
Message-ID: <20150307100623.317227FF36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8b4ba71d11a1e8c6898ac8ad46bf0a42e0e445d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: revert the change of <pkg>_LICENSE_FILES, which was
incorrect.]

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-libust/Config.in         |    2 +-
 package/lttng-libust/lttng-libust.hash |    8 ++------
 package/lttng-libust/lttng-libust.mk   |    2 +-
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index 4583380..0a6abb6 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_LTTNG_LIBUST
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
-	  Userspace tracing library for the Lttng tracing
+	  Userspace tracing library for the LTTng 2.x tracing
 	  infrastructure. It allows userspace programs to create
 	  custom trace events that are integrated with all other
 	  events gathered by LTTng.
diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
index ac897f3..65db612 100644
--- a/package/lttng-libust/lttng-libust.hash
+++ b/package/lttng-libust/lttng-libust.hash
@@ -1,6 +1,2 @@
-# From http://lttng.org/files/lttng-ust/lttng-ust-2.6.0-rc1.tar.bz2.sha1
-sha1    8db1627f16f466589c7842822ea4ad2f9d406b02  lttng-ust-2.5.1.tar.bz2
-# From http://lttng.org/files/lttng-ust/lttng-ust-2.6.0-rc1.tar.bz2.md5
-md5     d551d601bdc1a9285e1cd6c5728fb803  lttng-ust-2.5.1.tar.bz2
-# Locally generated
-sha256  fbd9e2d78641e5c659f1d51f8097c8279c155ff50f8e38a4c57f188ca4b84546  lttng-ust-2.5.1.tar.bz2
+# http://www.lttng.org/files/lttng-ust/lttng-ust-2.6.0.tar.bz2.sha1
+sha1  774fc2052781ba6fd789d422223c739d5f64482d  lttng-ust-2.6.0.tar.bz2
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index e6f02ca..2afcd61 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.5.1
+LTTNG_LIBUST_VERSION = 2.6.0
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPLv2.1; MIT for system headers; GPLv2 for liblttng-ust-ctl/ustctl.c (used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
