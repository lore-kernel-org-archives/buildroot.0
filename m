From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Feb 2015 00:21:10 +0100
Subject: [Buildroot] [git commit] libzip: new package
Message-ID: <20150131232144.0AE818046F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=083f853801afab95aee8e4e9a30c57c69f7f379a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: license is BSD-3c]
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in        |    1 +
 package/libzip/Config.in |    8 ++++++++
 package/libzip/libzip.mk |   15 +++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 095126d..88a37d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -605,6 +605,7 @@ endmenu
 
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
index 0000000..e5d8e26
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
+LIBZIP_LICENSE = BSD-3c
+LIBZIP_LICENSE_FILES = LICENSE
+LIBZIP_INSTALL_STAGING = YES
+LIBZIP_DEPENDENCIES = zlib
+
+$(eval $(autotools-package))
