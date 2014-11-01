From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  1 Nov 2014 10:21:34 +0100
Subject: [Buildroot] [PATCH 6/6] adwaita-icon-theme: new package
In-Reply-To: <1414833694-4236-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1414833694-4236-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1414833694-4236-7-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides the Adwaita icon theme from the GNOME desktop
environment.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in                                |  1 +
 package/adwaita-icon-theme/Config.in             |  4 ++++
 package/adwaita-icon-theme/adwaita-icon-theme.mk | 14 ++++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/adwaita-icon-theme/Config.in
 create mode 100644 package/adwaita-icon-theme/adwaita-icon-theme.mk

diff --git a/package/Config.in b/package/Config.in
index 5d5a9ee..bb9d4b5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -624,6 +624,7 @@ menu "Filesystem"
 endmenu
 
 menu "Graphics"
+	source "package/adwaita-icon-theme/Config.in"
 	source "package/atk/Config.in"
 	source "package/cairo/Config.in"
 	source "package/fltk/Config.in"
diff --git a/package/adwaita-icon-theme/Config.in b/package/adwaita-icon-theme/Config.in
new file mode 100644
index 0000000..6fabd48
--- /dev/null
+++ b/package/adwaita-icon-theme/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_ADWAITA_ICON_THEME
+	bool "adwaita icon theme"
+	help
+	  Adwaita icon theme
diff --git a/package/adwaita-icon-theme/adwaita-icon-theme.mk b/package/adwaita-icon-theme/adwaita-icon-theme.mk
new file mode 100644
index 0000000..ef797a2
--- /dev/null
+++ b/package/adwaita-icon-theme/adwaita-icon-theme.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# adwaita-icon-theme
+#
+################################################################################
+
+ADWAITA_ICON_THEME_VERSION_MAJOR = 3.14
+ADWAITA_ICON_THEME_VERSION = $(ADWAITA_ICON_THEME_VERSION_MAJOR).0
+ADWAITA_ICON_THEME_SITE = ftp://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/$(ADWAITA_ICON_THEME_VERSION_MAJOR)
+ADWAITA_ICON_THEME_SOURCE = adwaita-icon-theme-$(ADWAITA_ICON_THEME_VERSION).tar.xz
+ADWAITA_ICON_THEME_LICENSE = LGPLv3
+ADWAITA_ICON_THEME_LICENSE_FILES = COPYING_LGPL COPYING_CCBYSA3
+
+$(eval $(autotools-package))
-- 
1.9.3
