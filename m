From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 15:22:59 +0100
Subject: [Buildroot] [git commit] adwaita-icon-theme: new package
Message-ID: <20141101142535.26BFBB27F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=edc92b68afb66ea8ec562afc8bbe3d5ae10b74c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides the Adwaita icon theme from the GNOME desktop
environment.

[Thomas: fix the license information to indicate that CC-BY-SA-3.0 is
one of the licenses, and add the COPYING file as well.]

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                |    1 +
 package/adwaita-icon-theme/Config.in             |    4 ++++
 package/adwaita-icon-theme/adwaita-icon-theme.mk |   14 ++++++++++++++
 3 files changed, 19 insertions(+), 0 deletions(-)

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
index 0000000..af49dc0
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
+ADWAITA_ICON_THEME_LICENSE = LGPLv3 or CC-BY-SA-3.0
+ADWAITA_ICON_THEME_LICENSE_FILES = COPYING COPYING_LGPL COPYING_CCBYSA3
+
+$(eval $(autotools-package))
