From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 22:53:06 +0200
Subject: [Buildroot] [PATCH 03/21] gtk2-themes: normalize package name and
	directory
In-Reply-To: <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
Message-ID: <234d0748afaaceec52b490697920b8716f063d76.1316464690.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gtk2-themes/Config.in                      |    3 +--
 package/gtk2-themes/gtk2-theme-hicolor/Config.in   |    2 ++
 .../gtk2-theme-hicolor.mk}                         |    2 +-
 package/gtk2-themes/gtk2-themes.mk                 |    1 +
 4 files changed, 5 insertions(+), 3 deletions(-)
 create mode 100644 package/gtk2-themes/gtk2-theme-hicolor/Config.in
 rename package/gtk2-themes/{gtk2_themes.mk => gtk2-theme-hicolor/gtk2-theme-hicolor.mk} (92%)
 create mode 100644 package/gtk2-themes/gtk2-themes.mk

diff --git a/package/gtk2-themes/Config.in b/package/gtk2-themes/Config.in
index 351b602..ac212b8 100644
--- a/package/gtk2-themes/Config.in
+++ b/package/gtk2-themes/Config.in
@@ -1,7 +1,6 @@
 menu "GTK Themes"
 depends on BR2_PACKAGE_LIBGTK2
 
-config BR2_PACKAGE_GTK2_THEME_HICOLOR
-	bool "hicolor (default theme)"
+source "package/gtk2-themes/gtk2-theme-hicolor/Config.in"
 
 endmenu
diff --git a/package/gtk2-themes/gtk2-theme-hicolor/Config.in b/package/gtk2-themes/gtk2-theme-hicolor/Config.in
new file mode 100644
index 0000000..144f1d8
--- /dev/null
+++ b/package/gtk2-themes/gtk2-theme-hicolor/Config.in
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_GTK2_THEME_HICOLOR
+	bool "hicolor (default theme)"
diff --git a/package/gtk2-themes/gtk2_themes.mk b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
similarity index 92%
rename from package/gtk2-themes/gtk2_themes.mk
rename to package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
index 8dc8af4..ff3648b 100644
--- a/package/gtk2-themes/gtk2_themes.mk
+++ b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
@@ -15,4 +15,4 @@ GTK2_THEME_HICOLOR_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NA
 
 GTK2_THEME_HICOLOR_DEPENDENCIES = libgtk2
 
-$(eval $(call AUTOTARGETS,package,gtk2_theme_hicolor))
+$(eval $(call AUTOTARGETS,package,gtk2-theme-hicolor))
diff --git a/package/gtk2-themes/gtk2-themes.mk b/package/gtk2-themes/gtk2-themes.mk
new file mode 100644
index 0000000..6f31c6d
--- /dev/null
+++ b/package/gtk2-themes/gtk2-themes.mk
@@ -0,0 +1 @@
+include package/gtk2-themes/*/*.mk
-- 
1.7.4.1
