From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Oct 2012 09:46:22 -0300
Subject: [Buildroot] [PATCH 05/12] libnetfilter_queue: add new package
In-Reply-To: <1350909989-1012-1-git-send-email-gustavo@zacarias.com.ar>
References: <1350909989-1012-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1350909989-1012-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                                |    1 +
 package/libnetfilter_queue/Config.in             |   14 ++++++++++++++
 package/libnetfilter_queue/libnetfilter-queue.mk |   15 +++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 package/libnetfilter_queue/Config.in
 create mode 100644 package/libnetfilter_queue/libnetfilter-queue.mk

diff --git a/package/Config.in b/package/Config.in
index 6fcaa09..bdf8c53 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -448,6 +448,7 @@ source "package/libmbus/Config.in"
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
index 0000000..3b3dec4
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
+LIBNETFILTER_QUEUE_DEPENDENCIES = host-pkg-config libnfnetlink libmnl
+LIBNETFILTER_QUEUE_LICENSE = GPLv2
+LIBNETFILTER_QUEUE_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.8.6
