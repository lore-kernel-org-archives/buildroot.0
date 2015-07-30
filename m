From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:49:18 +0200
Subject: [Buildroot] [git commit branch/next]
	package/kodi-screensaver-biogenesis: new package
Message-ID: <20150808105651.8D09081904@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2734e1052e6085acf21327b269dd371c45dc708b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-screensaver-biogenesis/Config.in      |   10 ++++++++++
 .../kodi-screensaver-biogenesis.mk                 |   13 +++++++++++++
 package/kodi/Config.in                             |    1 +
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/kodi-screensaver-biogenesis/Config.in b/package/kodi-screensaver-biogenesis/Config.in
new file mode 100644
index 0000000..4b0d053
--- /dev/null
+++ b/package/kodi-screensaver-biogenesis/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_BIOGENESIS
+	bool "kodi-screensaver-biogenesis"
+	depends on BR2_PACKAGE_KODI_GL
+	help
+	  BioGenesis screensaver for Kodi
+
+	  https://github.com/notspiff/screensaver.biogenesis
+
+comment "kodi-screensaver-biogenesis needs an OpenGL backend"
+	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
new file mode 100644
index 0000000..728383f
--- /dev/null
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-screensaver-biogenesis
+#
+################################################################################
+
+KODI_SCREENSAVER_BIOGENESIS_VERSION = 2eccbd4e46320de03fde6731c560660659fd34d7
+KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,notspiff,screensaver.biogenesis,$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
+KODI_SCREENSAVER_BIOGENESIS_LICENSE = GPLv2+
+KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = src/Life.cpp
+KODI_SCREENSAVER_BIOGENESIS_DEPENDENCIES = kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index ac6c6fc..2ef8a71 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -288,6 +288,7 @@ endmenu
 
 menu "Screensavers"
 	source "package/kodi-screensaver-asteroids/Config.in"
+	source "package/kodi-screensaver-biogenesis/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
