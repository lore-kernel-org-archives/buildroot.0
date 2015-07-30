From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:49:18 +0200
Subject: [Buildroot] [git commit branch/next]
	package/kodi-screensaver-crystalmorph: new package
Message-ID: <20150808105651.94DC381904@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98fb5da84b6c6882f7b1a706a39df6f32a5fd65d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-screensaver-crystalmorph/Config.in    |   10 ++++++++++
 .../kodi-screensaver-crystalmorph.mk               |   13 +++++++++++++
 package/kodi/Config.in                             |    1 +
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/kodi-screensaver-crystalmorph/Config.in b/package/kodi-screensaver-crystalmorph/Config.in
new file mode 100644
index 0000000..ad29a90
--- /dev/null
+++ b/package/kodi-screensaver-crystalmorph/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_CRYSTALMORPH
+	bool "kodi-screensaver-crystalmorph"
+	depends on BR2_PACKAGE_KODI_GL # libglu
+	help
+	  CrystalMorph screensaver for Kodi
+
+	  https://github.com/notspiff/screensaver.crystalmorph
+
+comment "kodi-screensaver-crystalmorph needs an OpenGL backend"
+	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
new file mode 100644
index 0000000..49ddb43
--- /dev/null
+++ b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-screensaver-crystalmorph
+#
+################################################################################
+
+KODI_SCREENSAVER_CRYSTALMORPH_VERSION = 2e7c10e3543f5aaab6fd2f5aa9d05b976a43ba68
+KODI_SCREENSAVER_CRYSTALMORPH_SITE = $(call github,notspiff,screensaver.crystalmorph,$(KODI_SCREENSAVER_CRYSTALMORPH_VERSION))
+KODI_SCREENSAVER_CRYSTALMORPH_LICENSE = GPLv2+
+KODI_SCREENSAVER_CRYSTALMORPH_LICENSE_FILES = src/Fractal.cpp
+KODI_SCREENSAVER_CRYSTALMORPH_DEPENDENCIES = kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 2ef8a71..58c8718 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -289,6 +289,7 @@ endmenu
 menu "Screensavers"
 	source "package/kodi-screensaver-asteroids/Config.in"
 	source "package/kodi-screensaver-biogenesis/Config.in"
+	source "package/kodi-screensaver-crystalmorph/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
