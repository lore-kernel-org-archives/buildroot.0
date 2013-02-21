From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 21 Feb 2013 15:58:39 +0100
Subject: [Buildroot] [PATCH 09/13] libplist: new package
In-Reply-To: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <28cc50d3bae240e6956876b657cafabc7f2187b0.1361458625.git.maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LIBPLIST is a client for manipulating Apple Property List (.plist) files
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in            |    1 +
 package/libplist/Config.in   |   12 ++++++++++++
 package/libplist/libplist.mk |   15 +++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/libplist/Config.in
 create mode 100644 package/libplist/libplist.mk

diff --git a/package/Config.in b/package/Config.in
index a9cb9ed..382d859 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -559,6 +559,7 @@ source "package/gsl/Config.in"
 source "package/libglib2/Config.in"
 source "package/libical/Config.in"
 source "package/lockdev/Config.in"
+source "package/libplist/Config.in"
 source "package/libnspr/Config.in"
 source "package/libsigc/Config.in"
 source "package/libtpl/Config.in"
diff --git a/package/libplist/Config.in b/package/libplist/Config.in
new file mode 100644
index 0000000..a4a3adb
--- /dev/null
+++ b/package/libplist/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBPLIST
+	bool "libplist"
+	select BR2_PACKAGE_LIBXML2
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  libplist is a client for manipulating Apple Property List
+	  (.plist) files
+
+	  http://cgit.sukimashita.com/libplist.git
+
+comment "libplist requires C++ support in toolchain"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libplist/libplist.mk b/package/libplist/libplist.mk
new file mode 100644
index 0000000..16ea5ff
--- /dev/null
+++ b/package/libplist/libplist.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libplist
+#
+#############################################################
+
+LIBPLIST_VERSION = 1.6
+LIBPLIST_SITE = http://cgit.sukimashita.com/libplist.git/snapshot
+LIBPLIST_DEPENDENCIES = libxml2
+LIBPLIST_INSTALL_STAGING = YES
+LIBPLIST_MAKE = $(MAKE1)
+LIBPLIST_LICENSE = GPLv2
+LIBPLIST_LICENSE_FILES = COPYING
+
+$(eval $(cmake-package))
-- 
1.7.10.4
