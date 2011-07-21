From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Jul 2011 16:49:56 -0300
Subject: [Buildroot] [PATCH 1/2] libmnl: new package
Message-ID: <1311277797-20347-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in        |    1 +
 package/libmnl/Config.in |    7 +++++++
 package/libmnl/libmnl.mk |   12 ++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/libmnl/Config.in
 create mode 100644 package/libmnl/libmnl.mk

diff --git a/package/Config.in b/package/Config.in
index 166ce24..c993c31 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -325,6 +325,7 @@ source "package/libeXosip2/Config.in"
 source "package/libidn/Config.in"
 source "package/libmicrohttpd/Config.in"
 source "package/neon/Config.in"
+source "package/libmnl/Config.in"
 source "package/libnl/Config.in"
 source "package/libpcap/Config.in"
 source "package/libosip2/Config.in"
diff --git a/package/libmnl/Config.in b/package/libmnl/Config.in
new file mode 100644
index 0000000..5acfb24
--- /dev/null
+++ b/package/libmnl/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBMNL
+	bool "libmnl"
+	help
+	  libmnl is a minimalistic user-space library oriented
+	  to Netlink developers.
+
+	  http://netfilter.org/projects/libmnl/
diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
new file mode 100644
index 0000000..6749756
--- /dev/null
+++ b/package/libmnl/libmnl.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# libmnl
+#
+#############################################################
+
+LIBMNL_VERSION = 1.0.1
+LIBMNL_SOURCE = libmnl-$(LIBMNL_VERSION).tar.bz2
+LIBMNL_SITE = http://netfilter.org/projects/libmnl/files
+LIBMNL_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package,libmnl))
-- 
1.7.3.4
