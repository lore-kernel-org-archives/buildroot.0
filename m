From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:49:18 +0200
Subject: [Buildroot] [git commit branch/next]
	package/kodi-screensaver-greynetic: new package
Message-ID: <20150808105651.9DD8D81904@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50099a6bcd9e849ef89c264b7a54e7109356fae0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-screensaver-greynetic/Config.in       |   10 ++++++++++
 .../kodi-screensaver-greynetic.mk                  |   13 +++++++++++++
 package/kodi/Config.in                             |    1 +
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/kodi-screensaver-greynetic/Config.in b/package/kodi-screensaver-greynetic/Config.in
new file mode 100644
index 0000000..14cab18
--- /dev/null
+++ b/package/kodi-screensaver-greynetic/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_GREYNETIC
+	bool "kodi-screensaver-greynetic"
+	depends on BR2_PACKAGE_KODI_GL
+	help
+	  Greynetic screensaver for Kodi
+
+	  https://github.com/notspiff/screensaver.greynetic
+
+comment "kodi-screensaver-greynetic needs an OpenGL backend"
+	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
new file mode 100644
index 0000000..0b16e32
--- /dev/null
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-screensaver-greynetic
+#
+################################################################################
+
+KODI_SCREENSAVER_GREYNETIC_VERSION = 5f370b0f1a51e57719f605344e94824105316c17
+KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,notspiff,screensaver.greynetic,$(KODI_SCREENSAVER_GREYNETIC_VERSION))
+KODI_SCREENSAVER_GREYNETIC_LICENSE = GPLv2+
+KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = src/GreyNetic.cpp
+KODI_SCREENSAVER_GREYNETIC_DEPENDENCIES = kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 58c8718..4fb1261 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -290,6 +290,7 @@ menu "Screensavers"
 	source "package/kodi-screensaver-asteroids/Config.in"
 	source "package/kodi-screensaver-biogenesis/Config.in"
 	source "package/kodi-screensaver-crystalmorph/Config.in"
+	source "package/kodi-screensaver-greynetic/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
