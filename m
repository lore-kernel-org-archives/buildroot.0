From: Will Newton <will.newton@gmail.com>
Date: Mon, 23 Jan 2012 16:35:25 +0000
Subject: [Buildroot] [PATCH 05/14] libeet: Add new package
Message-ID: <CAFbHwiT1Y2DhHv7BGgDfbky8saDULjY7LVjePpokWaa4y=z8iQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/efl/Config.in        |    1 +
 package/efl/libeet/Config.in |    9 +++++++++
 package/efl/libeet/libeet.mk |   16 ++++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 package/efl/libeet/Config.in
 create mode 100644 package/efl/libeet/libeet.mk

diff --git a/package/efl/Config.in b/package/efl/Config.in
index cc677cb..8ca514d 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -9,6 +9,7 @@ menuconfig BR2_PACKAGE_EFL
 if BR2_PACKAGE_EFL

 source "package/efl/libeina/Config.in"
+source "package/efl/libeet/Config.in"

 endif # BR2_PACKAGE_EFL

diff --git a/package/efl/libeet/Config.in b/package/efl/libeet/Config.in
new file mode 100644
index 0000000..fa1dd2a
--- /dev/null
+++ b/package/efl/libeet/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBEET
+	bool "libeet"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBEINA
+	help
+	  Eet is a tiny library designed to write an arbitary set of
+	  chunks of data to a file and optionally compress each chunk
+	  (very much like a zip file).
diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
new file mode 100644
index 0000000..bcea73e
--- /dev/null
+++ b/package/efl/libeet/libeet.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# libeet
+#
+#############################################################
+
+LIBEET_VERSION = 1.5.0
+LIBEET_SOURCE = eet-$(LIBEET_VERSION).tar.bz2
+LIBEET_SITE = http://download.enlightenment.org/releases/
+LIBEET_INSTALL_STAGING = YES
+LIBEET_INSTALL_TARGET = YES
+
+LIBEET_DEPENDENCIES = host-pkg-config zlib jpeg libeina
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
-- 
1.7.1
-------------- next part --------------
