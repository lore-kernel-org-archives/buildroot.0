From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sun, 23 Jun 2013 16:34:56 +0200
Subject: [Buildroot] [PATCH] package/libdvbsi: new package
Message-ID: <1371998097-27155-1-git-send-email-c.schoenert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carsten Schoenert <c.schoenert@gmail.com>

libdvbsi++ is a C++ library for parsing DVB SI sections and providing
the output in C++ objects. It's usefull in any case you need prepared
and preselected DVB SI data from the raw stream.

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
---
 package/Config.in            |    1 +
 package/libdvbsi/Config.in   |    9 +++++++++
 package/libdvbsi/libdvbsi.mk |   17 +++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/libdvbsi/Config.in
 create mode 100644 package/libdvbsi/libdvbsi.mk

diff --git a/package/Config.in b/package/Config.in
index 0eb6a9c..dfc4584 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -513,6 +513,7 @@ source "package/json-javascript/Config.in"
 endmenu
 
 menu "Multimedia"
+source "package/libdvbsi/Config.in"
 source "package/libdvdread/Config.in"
 source "package/libdvdnav/Config.in"
 source "package/libebml/Config.in"
diff --git a/package/libdvbsi/Config.in b/package/libdvbsi/Config.in
new file mode 100644
index 0000000..2f58d2a
--- /dev/null
+++ b/package/libdvbsi/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBDVBSI
+	bool "libdvbsi"
+	depends on BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  C++ parsing library for Service Information (SI) in DVB systems.
+	  With libdvbsi++ you can convert raw DVB service information to
+	  a set of C++ objects, removing the need to parse data manually.
+
+	  http://www.saftware.de/
diff --git a/package/libdvbsi/libdvbsi.mk b/package/libdvbsi/libdvbsi.mk
new file mode 100644
index 0000000..1fc0701
--- /dev/null
+++ b/package/libdvbsi/libdvbsi.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libdvbsi++
+#
+################################################################################
+
+LIBDVBSI_VERSION = 0.3.6
+LIBDVBSI_SOURCE = libdvbsi++-$(LIBDVBSI_VERSION).tar.bz2
+LIBDVBSI_SITE = http://www.saftware.de/
+LIBDVBSI_INSTALL_STAGING = YES
+LIBDVBSI_LICENSE = LGPLv2.1
+LIBDVBSI_LICENSE_FILE = COPYING
+
+# sometimes no Makefile is in the archive
+LIBDVBSI_AUTORECONF=YES
+
+$(eval $(autotools-package))
-- 
1.7.10.4
