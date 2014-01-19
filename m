From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 19 Jan 2014 22:04:07 +0100
Subject: [Buildroot] [PATCH v3 11/12] libass: new package
In-Reply-To: <1390165448-9130-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1390165448-9130-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1390165448-9130-12-git-send-email-maxime.hadjinlian@gmail.com>
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
Cc: gimli <ebsi4711@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Changes v2 -> v3
  - Add missing libfribidi dependency
  - Fix header
Changes v1 -> v2
  - Bump version to 0.10.2 (Bernd Kuhls)
---
 package/Config.in        |  1 +
 package/libass/Config.in | 11 +++++++++++
 package/libass/libass.mk | 14 ++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/libass/Config.in
 create mode 100644 package/libass/libass.mk

diff --git a/package/Config.in b/package/Config.in
index 675e5a2..bce1039 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -630,6 +630,7 @@ source "package/yajl/Config.in"
 endmenu
 
 menu "Multimedia"
+source "package/libass/Config.in"
 source "package/libbluray/Config.in"
 source "package/libdvbsi/Config.in"
 source "package/libdvdnav/Config.in"
diff --git a/package/libass/Config.in b/package/libass/Config.in
new file mode 100644
index 0000000..9170c6f
--- /dev/null
+++ b/package/libass/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBASS
+	bool "libass"
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_LIBENCA
+	select BR2_PACKAGE_LIBFRIBIDI
+	help
+	  libass is a portable subtitle renderer for the ASS/SSA
+	  (Advanced Substation Alpha/Substation Alpha) subtitle format
+
+	  http://code.google.com/p/libass/
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
new file mode 100644
index 0000000..5c2a1b3
--- /dev/null
+++ b/package/libass/libass.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libass
+#
+################################################################################
+
+LIBASS_VERSION = 0.10.2
+LIBASS_SITE = http://libass.googlecode.com/files
+LIBASS_INSTALL_STAGING = YES
+LIBASS_DEPENDENCIES = freetype fontconfig libenca libfribidi
+LIBASS_LICENSE = BSD-3c
+LIBASS_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.8.5.2
