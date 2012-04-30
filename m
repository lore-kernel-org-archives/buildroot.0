From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Apr 2012 09:49:35 -0300
Subject: [Buildroot] [PATCH 1/4] libnfnetlink: new package
Message-ID: <1335790178-25333-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                    |    1 +
 package/libnfnetlink/Config.in       |   11 +++++++++++
 package/libnfnetlink/libnfnetlink.mk |   12 ++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/libnfnetlink/Config.in
 create mode 100644 package/libnfnetlink/libnfnetlink.mk

diff --git a/package/Config.in b/package/Config.in
index 0b1a746..1587ffb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -369,6 +369,7 @@ source "package/neon/Config.in"
 source "package/libmnl/Config.in"
 source "package/libmodbus/Config.in"
 source "package/libmbus/Config.in"
+source "package/libnfnetlink/Config.in"
 source "package/libnl/Config.in"
 source "package/libpcap/Config.in"
 source "package/libosip2/Config.in"
diff --git a/package/libnfnetlink/Config.in b/package/libnfnetlink/Config.in
new file mode 100644
index 0000000..fa247c5
--- /dev/null
+++ b/package/libnfnetlink/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBNFNETLINK
+	bool "libnfnetlink"
+	help
+	  libnfnetlink is the low-level library for netfilter related
+	  kernel/userspace communication.
+	  It provides a generic messaging infrastructure for in-kernel
+	  netfilter subsystems (such as nfnetlink_log, nfnetlink_queue,
+	  nfnetlink_conntrack) and their respective users
+	  and/or management tools in userspace.
+
+	  http://www.netfilter.org/projects/libnfnetlink/
diff --git a/package/libnfnetlink/libnfnetlink.mk b/package/libnfnetlink/libnfnetlink.mk
new file mode 100644
index 0000000..67ea266
--- /dev/null
+++ b/package/libnfnetlink/libnfnetlink.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# libnfnetlink
+#
+#############################################################
+
+LIBNFNETLINK_VERSION = 1.0.0
+LIBNFNETLINK_SOURCE = libnfnetlink-$(LIBNFNETLINK_VERSION).tar.bz2
+LIBNFNETLINK_SITE = http://www.netfilter.org/projects/libnfnetlink/files
+LIBNFNETLINK_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.3.4
