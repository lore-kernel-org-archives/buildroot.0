From: Chih-Min Chao <cmchao@gmail.com>
Date: Fri, 11 Mar 2011 16:13:34 +0800
Subject: [Buildroot] [PATCH 8/9] libraw : new package
In-Reply-To: <1299831215-26466-1-git-send-email-cmchao@gmail.com>
References: <1299831215-26466-1-git-send-email-cmchao@gmail.com>
Message-ID: <1299831215-26466-8-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
---
 package/Config.in        |    1 +
 package/libraw/Config.in |   10 ++++++++++
 package/libraw/libraw.mk |   15 +++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 package/libraw/Config.in
 create mode 100644 package/libraw/libraw.mk

diff --git a/package/Config.in b/package/Config.in
index f459c1b..eefcde8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -278,6 +278,7 @@ source "package/libglade/Config.in"
 source "package/gdk-pixbuf/Config.in"
 source "package/libgtk2/Config.in"
 source "package/libpng/Config.in"
+source "package/libraw/Config.in"
 source "package/librsvg/Config.in"
 source "package/libsvgtiny/Config.in"
 source "package/libungif/Config.in"
diff --git a/package/libraw/Config.in b/package/libraw/Config.in
new file mode 100644
index 0000000..61df2c6
--- /dev/null
+++ b/package/libraw/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBRAW
+	bool "libraw"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  libraw is an dc raw image manipulation library
+
+	  http://www.libraw.org/
+
+comment "libraw requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
new file mode 100644
index 0000000..9cc2f8f
--- /dev/null
+++ b/package/libraw/libraw.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libraw
+#
+#############################################################
+LIBRAW_VERSION:=0.13.1
+LIBRAW_SOURCE:=LibRaw-$(LIBRAW_VERSION).tar.gz
+LIBRAW_SITE:=http://www.libraw.org/data/
+
+LIBRAW_INSTALL_STAGING = YES
+LIBRAW_CONF_OPT += --disable-examples --disable-lcms \
+			--disable-openmp --disable-demosaic-pack-gpl2 \
+			--disable-demosaic-pack-gpl3
+
+$(eval $(call AUTOTARGETS,package,libraw))
-- 
1.7.0.4
