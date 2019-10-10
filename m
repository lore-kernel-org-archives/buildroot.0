From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 10 Oct 2019 17:59:06 +0100
Subject: [Buildroot] [RFC PATCH v1 11/25] package/libpangox: new package
In-Reply-To: <20191010165920.72050-1-michael.drake@codethink.co.uk>
References: <20191010165920.72050-1-michael.drake@codethink.co.uk>
Message-ID: <20191010165920.72050-12-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/Config.in              |  1 +
 package/libpangox/Config.in    | 14 ++++++++++++++
 package/libpangox/libpangox.mk | 12 ++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/libpangox/Config.in
 create mode 100644 package/libpangox/libpangox.mk

diff --git a/package/Config.in b/package/Config.in
index ab9335a055..56b01b3b31 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1325,6 +1325,7 @@ menu "Graphics"
 	source "package/libgtk3/Config.in"
 	source "package/libmediaart/Config.in"
 	source "package/libmng/Config.in"
+	source "package/libpangox/Config.in"
 	source "package/libpng/Config.in"
 	source "package/libqrencode/Config.in"
 	source "package/libraw/Config.in"
diff --git a/package/libpangox/Config.in b/package/libpangox/Config.in
new file mode 100644
index 0000000000..5575081a4e
--- /dev/null
+++ b/package/libpangox/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBPANGOX
+	bool "libpangox"
+	depends on BR2_USE_WCHAR # gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_XLIB_LIBICE
+	select BR2_PACKAGE_XLIB_LIBSM
+	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_XLIB_LIBXT
+	help
+	  This is a compatibility library providing the obsolete pangox
+	  library that is not shipped by Pango itself anymore.
diff --git a/package/libpangox/libpangox.mk b/package/libpangox/libpangox.mk
new file mode 100644
index 0000000000..35d7720302
--- /dev/null
+++ b/package/libpangox/libpangox.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# libpangox
+#
+################################################################################
+LIBPANGOX_VERSION = 0.0.2
+LIBPANGOX_SOURCE = pangox-compat-$(LIBPANGOX_VERSION).tar.xz
+LIBPANGOX_SITE = http://ftp.gnome.org/pub/GNOME/sources/pangox-compat/0.0
+LIBPANGOX_INSTALL_STAGING = YES
+LIBPANGOX_DEPENDENCIES = libglib2 host-pkgconf pango
+
+$(eval $(autotools-package))
-- 
2.20.1
