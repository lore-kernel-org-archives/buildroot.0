From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 21 Feb 2013 15:58:32 +0100
Subject: [Buildroot] [PATCH 02/13] libass: new package
In-Reply-To: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <7ff8c0099da14f55f98ca36f4c9b313422987528.1361458625.git.maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libass is a portable subtitle renderer for the
ASS/SSA (Advanced Substation Alpha/Substation Alpha) subtitle format.
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in        |    1 +
 package/libass/Config.in |   10 ++++++++++
 package/libass/libass.mk |   14 ++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/libass/Config.in
 create mode 100644 package/libass/libass.mk

diff --git a/package/Config.in b/package/Config.in
index e56c13f..0da1905 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -473,6 +473,7 @@ source "package/jsmin/Config.in"
 endmenu
 
 menu "Multimedia"
+source "package/libass/Config.in"
 source "package/libdvdread/Config.in"
 source "package/libdvdnav/Config.in"
 source "package/libebml/Config.in"
diff --git a/package/libass/Config.in b/package/libass/Config.in
new file mode 100644
index 0000000..ff34b64
--- /dev/null
+++ b/package/libass/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBASS
+	bool "libass"
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_LIBENCA
+	help
+	  libass is a portable subtitle renderer for the ASS/SSA
+	  (Advanced Substation Alpha/Substation Alpha) subtitle format
+
+	  http://code.google.com/p/libass/
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
new file mode 100644
index 0000000..3fd748a
--- /dev/null
+++ b/package/libass/libass.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# libass
+#
+#############################################################
+
+LIBASS_VERSION = 0.9.12
+LIBASS_SITE = http://libass.googlecode.com/files
+LIBASS_INSTALL_STAGING = YES
+LIBASS_DEPENDENCIES = freetype fontconfig libenca
+LIBASS_LICENSE = BSD-3c
+LIBASS_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.10.4
