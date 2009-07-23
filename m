From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 23 Jul 2009 15:46:07 +0200
Subject: [Buildroot] [PATCH] libmms: new package
Message-ID: <1248356767-27956-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LibMMS is a common library for parsing mms:// and mmsh:// type network
streams.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/multimedia/Config.in        |    1 +
 package/multimedia/libmms/Config.in |   11 +++++++++++
 package/multimedia/libmms/libmms.mk |   17 +++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/libmms/Config.in
 create mode 100644 package/multimedia/libmms/libmms.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 1b6cfbd..d00abab 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -14,6 +14,7 @@ source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
 source "package/multimedia/libid3tag/Config.in"
 source "package/multimedia/libmad/Config.in"
+source "package/multimedia/libmms/Config.in"
 source "package/multimedia/libmpd/Config.in"
 source "package/multimedia/libogg/Config.in"
 source "package/multimedia/libsndfile/Config.in"
diff --git a/package/multimedia/libmms/Config.in b/package/multimedia/libmms/Config.in
new file mode 100644
index 0000000..8f5cc94
--- /dev/null
+++ b/package/multimedia/libmms/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBMMS
+	bool "libmms"
+        select BR2_PACKAGE_LIBGLIB2
+	help
+          LibMMS is a common library for parsing mms:// and mmsh://
+          type network streams. These are commonly used to stream
+          Windows Media Video content over the web. LibMMS itself is
+          only for receiving MMS stream, it doesn't handle sending at
+          all.
+
+	  http://launchpad.net/libmms
diff --git a/package/multimedia/libmms/libmms.mk b/package/multimedia/libmms/libmms.mk
new file mode 100644
index 0000000..a866fad
--- /dev/null
+++ b/package/multimedia/libmms/libmms.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# libmms
+#
+#############################################################
+LIBMMS_VERSION = 0.4
+LIBMMS_SOURCE = libmms-$(LIBMMS_VERSION).tar.gz
+LIBMMS_SITE = http://launchpad.net/libmms/trunk/$(LIBMMS_VERSION)/+download
+
+LIBMMS_AUTORECONF = NO
+LIBMMS_LIBTOOL_PATCH = NO
+LIBMMS_INSTALL_STAGING = YES
+LIBMMS_INSTALL_TARGET = YES
+
+LIBMMS_DEPENDENCIES = uclibc host-pkgconfig libglib2
+
+$(eval $(call AUTOTARGETS,package/multimedia,libmms))
-- 
1.6.0.4
