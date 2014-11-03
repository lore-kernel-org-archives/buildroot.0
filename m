From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon,  3 Nov 2014 14:25:55 +0100
Subject: [Buildroot] [PATCH 1/1] adwaita-icon-theme: depends on host-libgtk3
Message-ID: <1415021155-29232-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The adwaita icon theme can only be selected with libgtk3 and depends on
host-libgtk3 to build.

Fixes http://autobuild.buildroot.org/results/f8d/f8d0e2198fa54f9141512e2db6dc46e3cee1cd44/

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/adwaita-icon-theme/Config.in             | 1 +
 package/adwaita-icon-theme/adwaita-icon-theme.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/adwaita-icon-theme/Config.in b/package/adwaita-icon-theme/Config.in
index 6fabd48..a06071e 100644
--- a/package/adwaita-icon-theme/Config.in
+++ b/package/adwaita-icon-theme/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_ADWAITA_ICON_THEME
 	bool "adwaita icon theme"
+	depends on BR2_PACKAGE_LIBGTK3
 	help
 	  Adwaita icon theme
diff --git a/package/adwaita-icon-theme/adwaita-icon-theme.mk b/package/adwaita-icon-theme/adwaita-icon-theme.mk
index e273d90..f9a6b50 100644
--- a/package/adwaita-icon-theme/adwaita-icon-theme.mk
+++ b/package/adwaita-icon-theme/adwaita-icon-theme.mk
@@ -10,6 +10,6 @@ ADWAITA_ICON_THEME_SITE = ftp://ftp.gnome.org/pub/gnome/sources/adwaita-icon-the
 ADWAITA_ICON_THEME_SOURCE = adwaita-icon-theme-$(ADWAITA_ICON_THEME_VERSION).tar.xz
 ADWAITA_ICON_THEME_LICENSE = LGPLv3 or CC-BY-SA-3.0
 ADWAITA_ICON_THEME_LICENSE_FILES = COPYING COPYING_LGPL COPYING_CCBYSA3
-ADWAITA_ICON_THEME_DEPENDENCIES = host-intltool
+ADWAITA_ICON_THEME_DEPENDENCIES = host-intltool host-libgtk3
 
 $(eval $(autotools-package))
-- 
1.9.1
