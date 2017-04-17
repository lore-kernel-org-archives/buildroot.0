From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 17 Apr 2017 21:54:00 +0200
Subject: [Buildroot] [PATCH v5 01/34] package/kodi-visualisation-fountain:
	remove package
In-Reply-To: <20170417195433.26672-1-bernd.kuhls@t-online.de>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
Message-ID: <20170417195433.26672-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove broken package:
https://github.com/notspiff/visualization.fountain/issues/1#issuecomment-166156021

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                                              |  7 +++++++
 package/kodi-visualisation-fountain/Config.in                 | 11 -----------
 .../kodi-visualisation-fountain.hash                          |  2 --
 .../kodi-visualisation-fountain.mk                            | 11 -----------
 package/kodi/Config.in                                        |  1 -
 5 files changed, 7 insertions(+), 25 deletions(-)
 delete mode 100644 package/kodi-visualisation-fountain/Config.in
 delete mode 100644 package/kodi-visualisation-fountain/kodi-visualisation-fountain.hash
 delete mode 100644 package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 8e9f3d175..a13e4453b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.05"
 
+config BR2_PACKAGE_KODI_VISUALISATION_FOUNTAIN
+	bool "kodi-visualisation-fountain has been removed"
+	select BR2_LEGACY
+	help
+	  According to upstream 'the visualization is not currently
+	  in a working shape.'
+
 config BR2_PACKAGE_PORTMAP
 	bool "portmap has been removed"
 	select BR2_LEGACY
diff --git a/package/kodi-visualisation-fountain/Config.in b/package/kodi-visualisation-fountain/Config.in
deleted file mode 100644
index 570d16933..000000000
--- a/package/kodi-visualisation-fountain/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_KODI_VISUALISATION_FOUNTAIN
-	bool "kodi-visualisation-fountain"
-	depends on BR2_PACKAGE_HAS_LIBGL # libsoil
-	select BR2_PACKAGE_LIBSOIL
-	help
-	  Fountain visualization for Kodi
-
-	  https://github.com/notspiff/visualization.fountain
-
-comment "kodi-visualisation-fountain needs OpenGL"
-	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-visualisation-fountain/kodi-visualisation-fountain.hash b/package/kodi-visualisation-fountain/kodi-visualisation-fountain.hash
deleted file mode 100644
index 8dc933eff..000000000
--- a/package/kodi-visualisation-fountain/kodi-visualisation-fountain.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256 7b2867f415f22e4bc4ba834034f00117fcf76774aea0afc7bf30b5f2d1991dd7 kodi-visualisation-fountain-f22deacd2396a204694d346f85369ea9ea70e16f.tar.gz
diff --git a/package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk b/package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk
deleted file mode 100644
index 5684402a2..000000000
--- a/package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk
+++ /dev/null
@@ -1,11 +0,0 @@
-################################################################################
-#
-# kodi-visualisation-fountain
-#
-################################################################################
-
-KODI_VISUALISATION_FOUNTAIN_VERSION = f22deacd2396a204694d346f85369ea9ea70e16f
-KODI_VISUALISATION_FOUNTAIN_SITE = $(call github,notspiff,visualization.fountain,$(KODI_VISUALISATION_FOUNTAIN_VERSION))
-KODI_VISUALISATION_FOUNTAIN_DEPENDENCIES = kodi libsoil
-
-$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index f2a3e2e03..f94e2c7c2 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -315,7 +315,6 @@ endmenu
 
 menu "Visualisations"
 	source "package/kodi-visualisation-fishbmc/Config.in"
-	source "package/kodi-visualisation-fountain/Config.in"
 	source "package/kodi-visualisation-goom/Config.in"
 	source "package/kodi-visualisation-shadertoy/Config.in"
 	source "package/kodi-visualisation-spectrum/Config.in"
-- 
2.11.0
