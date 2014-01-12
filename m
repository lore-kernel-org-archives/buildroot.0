From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Jan 2014 18:53:17 +0100
Subject: [Buildroot] [PATCH 03/14] libass: new package
In-Reply-To: <1389549208-19078-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1389549208-19078-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1389549208-19078-4-git-send-email-maxime.hadjinlian@gmail.com>
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
 package/Config.in        |  1 +
 package/libass/Config.in | 10 ++++++++++
 package/libass/libass.mk | 14 ++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/libass/Config.in
 create mode 100644 package/libass/libass.mk

diff --git a/package/Config.in b/package/Config.in
index b1a805b..0b00a9e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -620,6 +620,7 @@ source "package/yajl/Config.in"
 endmenu
 
 menu "Multimedia"
+source "package/libass/Config.in"
 source "package/libdvbsi/Config.in"
 source "package/libdvdnav/Config.in"
 source "package/libdvdread/Config.in"
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
1.8.5.2
