From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Sep 2011 22:46:13 +0200
Subject: [Buildroot] [git commit] gtk2-themes: normalize package name and
	directory
Message-ID: <20110920205935.345E48D72D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11bdfeaf3bb4271fca0e4063d699bff6df4fb9df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix directory argument of AUTOTARGETS macro]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gtk2-themes/Config.in                      |    3 +--
 package/gtk2-themes/gtk2-theme-hicolor/Config.in   |    2 ++
 .../gtk2-theme-hicolor.mk}                         |    2 +-
 package/gtk2-themes/gtk2-themes.mk                 |    1 +
 4 files changed, 5 insertions(+), 3 deletions(-)

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
similarity index 90%
rename from package/gtk2-themes/gtk2_themes.mk
rename to package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
index 8dc8af4..ac2eaef 100644
--- a/package/gtk2-themes/gtk2_themes.mk
+++ b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
@@ -15,4 +15,4 @@ GTK2_THEME_HICOLOR_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NA
 
 GTK2_THEME_HICOLOR_DEPENDENCIES = libgtk2
 
-$(eval $(call AUTOTARGETS,package,gtk2_theme_hicolor))
+$(eval $(call AUTOTARGETS,package/gtk2-themes,gtk2-theme-hicolor))
diff --git a/package/gtk2-themes/gtk2-themes.mk b/package/gtk2-themes/gtk2-themes.mk
new file mode 100644
index 0000000..6f31c6d
--- /dev/null
+++ b/package/gtk2-themes/gtk2-themes.mk
@@ -0,0 +1 @@
+include package/gtk2-themes/*/*.mk
