From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Apr 2011 10:01:25 +0200
Subject: [Buildroot] [git commit] package: add libexif
Message-ID: <20110426080641.5BB86818CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1445e1455e1d80da7d9e8e4d90f7e38903440e07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix Config.in indentation, source URL]
Signed-off-by: Guillaume Gardet <guillaume.gardet@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/libexif/Config.in  |    9 +++++++++
 package/libexif/libexif.mk |   14 ++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/libexif/Config.in
 create mode 100644 package/libexif/libexif.mk

diff --git a/package/Config.in b/package/Config.in
index 46ecbcb..71dc0a8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -275,6 +275,7 @@ source "package/gtk2-themes/Config.in"
 source "package/jpeg/Config.in"
 source "package/libart/Config.in"
 source "package/libdrm/Config.in"
+source "package/libexif/Config.in"
 source "package/libgail/Config.in"
 source "package/libglade/Config.in"
 source "package/gdk-pixbuf/Config.in"
diff --git a/package/libexif/Config.in b/package/libexif/Config.in
new file mode 100644
index 0000000..9c89df4
--- /dev/null
+++ b/package/libexif/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBEXIF
+	bool "libexif"
+	help
+	  Most digital cameras produce EXIF files, which are JPEG
+	  files with extra tags that contain information about the
+	  image.  The EXIF library allows you to parse an EXIF file
+	  and read the data from those tags.
+
+	  http://libexif.sf.net
diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
new file mode 100644
index 0000000..17c44af
--- /dev/null
+++ b/package/libexif/libexif.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# libexif
+#
+#############################################################
+
+LIBEXIF_VERSION = 0.6.20
+LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.bz2
+LIBEXIF_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libexif/libexif/$(LIBEXIF_VERSION)
+LIBEXIF_INSTALL_STAGING = YES
+LIBEXIF_CONF_OPT = --disable-docs
+LIBEXIF_DEPENDENCIES = host-pkg-config
+
+$(eval $(call AUTOTARGETS,package,libexif))
-- 
1.7.3.4
