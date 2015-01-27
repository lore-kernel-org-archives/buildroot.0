From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Tue, 27 Jan 2015 17:02:12 +0100
Subject: [Buildroot] [PATCH 1/2] libzip: new package
In-Reply-To: <1422374533-11694-1-git-send-email-bgolaszewski@baylibre.com>
References: <1422374533-11694-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1422374533-11694-2-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/Config.in        |  1 +
 package/libzip/Config.in |  7 +++++++
 package/libzip/libzip.mk | 15 +++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/libzip/Config.in
 create mode 100644 package/libzip/libzip.mk

diff --git a/package/Config.in b/package/Config.in
index 51d4c15..2d0adac 100644
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
index 0000000..c07b956
--- /dev/null
+++ b/package/libzip/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBZIP
+	bool "libzip"
+	select BR2_PACKAGE_ZLIB
+	help
+	  C library for reading, creating, and modifying zip archives.
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
