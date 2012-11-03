From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Nov 2012 19:11:12 +0100
Subject: [Buildroot] [git commit] libnetfilter_queue: add new package
Message-ID: <20121103182340.7819A99A6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94eb5b1cf15f2e71a7bc21cf7c8cb6b552187aec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                |    1 +
 package/libnetfilter_queue/Config.in             |   14 ++++++++++++++
 package/libnetfilter_queue/libnetfilter-queue.mk |   15 +++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e938e53..eae415b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -458,6 +458,7 @@ source "package/libmbus/Config.in"
 source "package/libnetfilter_conntrack/Config.in"
 source "package/libnetfilter_cthelper/Config.in"
 source "package/libnetfilter_cttimeout/Config.in"
+source "package/libnetfilter_queue/Config.in"
 source "package/libnfnetlink/Config.in"
 source "package/libnl/Config.in"
 source "package/liboping/Config.in"
diff --git a/package/libnetfilter_queue/Config.in b/package/libnetfilter_queue/Config.in
new file mode 100644
index 0000000..d06aa77
--- /dev/null
+++ b/package/libnetfilter_queue/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBNETFILTER_QUEUE
+	bool "libnetfilter_queue"
+	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBNFNETLINK
+	select BR2_PACKAGE_LIBMNL
+	help
+	  libnetfilter_queue is the userspace library that provides
+	  the programming interface to the fine-grain
+	  connection tracking timeout infrastructure.
+
+	  http://www.netfilter.org/projects/libnetfilter_queue/
+
+comment "libnetfilter_queue requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/libnetfilter_queue/libnetfilter-queue.mk b/package/libnetfilter_queue/libnetfilter-queue.mk
new file mode 100644
index 0000000..8f9ad5c
--- /dev/null
+++ b/package/libnetfilter_queue/libnetfilter-queue.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libnetfilter-queue
+#
+#############################################################
+
+LIBNETFILTER_QUEUE_VERSION = 1.0.2
+LIBNETFILTER_QUEUE_SOURCE = libnetfilter_queue-$(LIBNETFILTER_QUEUE_VERSION).tar.bz2
+LIBNETFILTER_QUEUE_SITE = http://www.netfilter.org/projects/libnetfilter_queue/files
+LIBNETFILTER_QUEUE_INSTALL_STAGING = YES
+LIBNETFILTER_QUEUE_DEPENDENCIES = host-pkgconf libnfnetlink libmnl
+LIBNETFILTER_QUEUE_LICENSE = GPLv2
+LIBNETFILTER_QUEUE_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
