From: Will Newton <will.newton@gmail.com>
Date: Mon, 23 Jan 2012 16:36:14 +0000
Subject: [Buildroot] [PATCH 12/14] libethumb: Add new package
Message-ID: <CAFbHwiTKiPOTnu7ipHQ8=8jZLGST8XqQ6iHe=amnGM6d0xdu-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 package/efl/Config.in              |    1 +
 package/efl/libethumb/Config.in    |    8 ++++++++
 package/efl/libethumb/libethumb.mk |   16 ++++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/efl/libethumb/Config.in
 create mode 100644 package/efl/libethumb/libethumb.mk

diff --git a/package/efl/Config.in b/package/efl/Config.in
index b747953..1632290 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -16,6 +16,7 @@ source "package/efl/libefreet/Config.in"
 source "package/efl/libevas/Config.in"
 source "package/efl/libembryo/Config.in"
 source "package/efl/libedje/Config.in"
+source "package/efl/libethumb/Config.in"

 endif # BR2_PACKAGE_EFL

diff --git a/package/efl/libethumb/Config.in b/package/efl/libethumb/Config.in
new file mode 100644
index 0000000..6f59e00
--- /dev/null
+++ b/package/efl/libethumb/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBETHUMB
+	bool "libethumb"
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_LIBEVAS
+	select BR2_PACKAGE_LIBECORE
+	select BR2_PACKAGE_LIBEDJE
+	help
+	  Ethumb is a library for generating thumbnail images of documents.
diff --git a/package/efl/libethumb/libethumb.mk
b/package/efl/libethumb/libethumb.mk
new file mode 100644
index 0000000..16b2ba9
--- /dev/null
+++ b/package/efl/libethumb/libethumb.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libethumb
+#
+################################################################################
+
+LIBETHUMB_VERSION = 0.1.1.65643
+LIBETHUMB_SOURCE = ethumb-$(LIBETHUMB_VERSION).tar.bz2
+LIBETHUMB_SITE = http://download.enlightenment.org/snapshots/2011-11-28
+LIBETHUMB_INSTALL_STAGING = YES
+
+LIBETHUMB_DEPENDENCIES = libeina libevas libecore libedje host-libedje
+
+LIBETHUMB_CONF_OPT = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.1
-------------- next part --------------
