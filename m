From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 23 Sep 2014 18:21:10 +0200
Subject: [Buildroot] [PATCH 2/3] hicolor-icon-theme: new package
In-Reply-To: <1411489271-26899-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1411489271-26899-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1411489271-26899-3-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package provides Freedesktop Hicolor icon theme.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in                                |  1 +
 package/hicolor-icon-theme/Config.in             |  4 ++++
 package/hicolor-icon-theme/hicolor-icon-theme.mk | 12 ++++++++++++
 3 files changed, 17 insertions(+)
 create mode 100644 package/hicolor-icon-theme/Config.in
 create mode 100644 package/hicolor-icon-theme/hicolor-icon-theme.mk

diff --git a/package/Config.in b/package/Config.in
index 2eefc3f..1fa2398 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -622,6 +622,7 @@ menu "Graphics"
 	source "package/gtk2-engines/Config.in"
 	source "package/gtk2-themes/Config.in"
 	source "package/harfbuzz/Config.in"
+	source "package/hicolor-icon-theme/Config.in"
 	source "package/imlib2/Config.in"
 	source "package/jasper/Config.in"
 	source "package/jpeg/Config.in"
diff --git a/package/hicolor-icon-theme/Config.in b/package/hicolor-icon-theme/Config.in
new file mode 100644
index 0000000..b1c66f6
--- /dev/null
+++ b/package/hicolor-icon-theme/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_HICOLOR_ICON_THEME
+	bool "hicolor icon theme"
+	help
+	  Freedesktop Hicolor icon theme
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
-- 
1.9.1
