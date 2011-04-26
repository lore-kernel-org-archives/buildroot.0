From: Chih-Min Chao <cmchao@gmail.com>
Date: Tue, 26 Apr 2011 15:03:49 +0200
Subject: [Buildroot] [git commit] package: add libraw package
Message-ID: <20110426131524.E2E8A82A51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7536aeea8a581ad06a49be095347de359be38eb0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use ' = ' rather than ':=' in .mk]
Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/libraw/Config.in |   10 ++++++++++
 package/libraw/libraw.mk |   16 ++++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 package/libraw/Config.in
 create mode 100644 package/libraw/libraw.mk

diff --git a/package/Config.in b/package/Config.in
index b5a1ee4..8e78f0f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -282,6 +282,7 @@ source "package/libglade/Config.in"
 source "package/gdk-pixbuf/Config.in"
 source "package/libgtk2/Config.in"
 source "package/libpng/Config.in"
+source "package/libraw/Config.in"
 source "package/librsvg/Config.in"
 source "package/libsvgtiny/Config.in"
 source "package/libungif/Config.in"
diff --git a/package/libraw/Config.in b/package/libraw/Config.in
new file mode 100644
index 0000000..4378ccd
--- /dev/null
+++ b/package/libraw/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBRAW
+	bool "libraw"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  libraw is a raw image manipulation library
+
+	  http://www.libraw.org/
+
+comment "libraw requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
new file mode 100644
index 0000000..b76fbbe
--- /dev/null
+++ b/package/libraw/libraw.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# libraw
+#
+#############################################################
+
+LIBRAW_VERSION = 0.13.1
+LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
+LIBRAW_SITE = http://www.libraw.org/data/
+
+LIBRAW_INSTALL_STAGING = YES
+LIBRAW_CONF_OPT += --disable-examples --disable-lcms \
+			--disable-openmp --disable-demosaic-pack-gpl2 \
+			--disable-demosaic-pack-gpl3
+
+$(eval $(call AUTOTARGETS,package,libraw))
-- 
1.7.3.4
