From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 29 Jan 2015 12:35:36 +0100
Subject: [Buildroot] [PATCH v2 1/5] libzip: new package
In-Reply-To: <1422531340-24883-1-git-send-email-bgolaszewski@baylibre.com>
References: <1422531340-24883-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1422531340-24883-2-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/Config.in        |  1 +
 package/libzip/Config.in |  8 ++++++++
 package/libzip/libzip.mk | 15 +++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/libzip/Config.in
 create mode 100644 package/libzip/libzip.mk

diff --git a/package/Config.in b/package/Config.in
index d65de70..7312255 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -603,6 +603,7 @@ endmenu
 
 menu "Compression and decompression"
 	source "package/libarchive/Config.in"
+	source "package/libzip/Config.in"
 	source "package/lzo/Config.in"
 	source "package/snappy/Config.in"
 	source "package/szip/Config.in"
diff --git a/package/libzip/Config.in b/package/libzip/Config.in
new file mode 100644
index 0000000..54de9e5
--- /dev/null
+++ b/package/libzip/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBZIP
+	bool "libzip"
+	select BR2_PACKAGE_ZLIB
+	help
+	  C library for reading, creating, and modifying zip archives. This
+	  package also contains zipcmp, ziptorrent and zipmerge utilities.
+
+	  http://www.nih.at/libzip/
diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
new file mode 100644
index 0000000..3a9cdb1
--- /dev/null
+++ b/package/libzip/libzip.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libzip
+#
+################################################################################
+
+LIBZIP_VERSION = 0.11.2
+LIBZIP_SITE = http://www.nih.at/libzip/
+LIBZIP_SOURCE = libzip-$(LIBZIP_VERSION).tar.xz
+LIBZIP_LICENSE = special libzip license
+LIBZIP_LICENSE_FILES = LICENSE
+LIBZIP_INSTALL_STAGING = YES
+LIBZIP_DEPENDENCIES = zlib
+
+$(eval $(autotools-package))
-- 
2.1.4
