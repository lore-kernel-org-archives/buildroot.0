From: Denis Bodor <lefinnois@lefinnois.net>
Date: Tue, 11 Mar 2014 14:42:40 +0100
Subject: [Buildroot] [PATCH 1/1] Adding libstrophe
Message-ID: <1394545360-23126-1-git-send-email-lefinnois@lefinnois.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Denis Bodor <lefinnois@lefinnois.net>
---
 package/libstrophe/Config.in                            | 11 +++++++++++
 package/libstrophe/libstrophe-make-autoreconfable.patch |  9 +++++++++
 package/libstrophe/libstrophe.mk                        | 14 ++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 package/libstrophe/Config.in
 create mode 100644 package/libstrophe/libstrophe-make-autoreconfable.patch
 create mode 100644 package/libstrophe/libstrophe.mk

diff --git a/package/libstrophe/Config.in b/package/libstrophe/Config.in
new file mode 100644
index 0000000..ac02a66
--- /dev/null
+++ b/package/libstrophe/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBSTROPHE
+	bool "libstrophe"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_EXPAT
+	help
+	  libstrophe is a lightweight XMPP client library written in C.
+	  It has minimal dependencies and is configurable for various
+	  environments. It runs well on both Linux, Unix, and Windows
+	  based platforms.
+
+	  https://github.com/strophe/libstrophe
diff --git a/package/libstrophe/libstrophe-make-autoreconfable.patch b/package/libstrophe/libstrophe-make-autoreconfable.patch
new file mode 100644
index 0000000..5caeaff
--- /dev/null
+++ b/package/libstrophe/libstrophe-make-autoreconfable.patch
@@ -0,0 +1,9 @@
+diff -ur libstrophe.orig/Makefile.am libstrophe/Makefile.am
+--- libstrophe.orig/Makefile.am	2014-03-02 18:58:36.219753865 +0100
++++ libstrophe/Makefile.am	2014-03-02 18:58:02.739752477 +0100
+@@ -1,4 +1,4 @@
+-AUTOMAKE_OPTIONS = subdir-objects
++AUTOMAKE_OPTIONS = subdir-objects foreign
+ 
+ CFLAGS = -g -Wall
+ 
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
new file mode 100644
index 0000000..356d3d4
--- /dev/null
+++ b/package/libstrophe/libstrophe.mk
@@ -0,0 +1,14 @@
+################################################################################
+# 
+# libstrophe
+#
+################################################################################
+
+LIBSTROPHE_VERSION = d408eaf2bbfe5ff5c56eab01463c278f9891c08e
+LIBSTROPHE_SITE = $(call github,strophe,libstrophe,$(LIBSTROPHE_VERSION))
+LIBSTROPHE_INSTALL_STAGING = YES
+LIBSTROPHE_INSTALL_TARGET = NO
+LIBSTROPHE_DEPENDENCIES = expat openssl host-pkgconf
+LIBSTROPHE_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
1.8.5.3
