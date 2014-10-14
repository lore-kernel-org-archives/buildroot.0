From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Oct 2014 17:27:47 +0200
Subject: [Buildroot] [git commit] hicolor-icon-theme: new package
Message-ID: <20141015125351.E711DB2DF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ced34ea1036ab5360146ca80fd7816060e3783b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new package provides Freedesktop Hicolor icon theme.

This is the fallback icon theme, which only creates the standard
directory structure for storing icons of third-party applications (i.e.
the ones not available in usual icon themes).

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                |    1 +
 package/hicolor-icon-theme/Config.in             |    8 ++++++++
 package/hicolor-icon-theme/hicolor-icon-theme.mk |   12 ++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 19bb9bf..ec22c35 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -627,6 +627,7 @@ menu "Graphics"
 	source "package/gtk2-engines/Config.in"
 	source "package/gtk2-themes/Config.in"
 	source "package/harfbuzz/Config.in"
+	source "package/hicolor-icon-theme/Config.in"
 	source "package/imlib2/Config.in"
 	source "package/jasper/Config.in"
 	source "package/jpeg/Config.in"
diff --git a/package/hicolor-icon-theme/Config.in b/package/hicolor-icon-theme/Config.in
new file mode 100644
index 0000000..6cda097
--- /dev/null
+++ b/package/hicolor-icon-theme/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HICOLOR_ICON_THEME
+	bool "hicolor icon theme"
+	help
+	  Freedesktop Hicolor icon theme
+
+	  This is the fallback icon theme, which only creates the
+	  standard directory structure for storing icons of third-party
+	  applications (i.e. the ones not available in usual icon themes).
diff --git a/package/hicolor-icon-theme/hicolor-icon-theme.mk b/package/hicolor-icon-theme/hicolor-icon-theme.mk
new file mode 100644
index 0000000..768aec8
--- /dev/null
+++ b/package/hicolor-icon-theme/hicolor-icon-theme.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# hicolor-icon-theme
+#
+################################################################################
+
+HICOLOR_ICON_THEME_VERSION = 0.13
+HICOLOR_ICON_THEME_SITE = http://icon-theme.freedesktop.org/releases/
+HICOLOR_ICON_THEME_LICENSE = GPLv2
+HICOLOR_ICON_THEME_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
