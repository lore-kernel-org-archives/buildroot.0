From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:49:19 +0200
Subject: [Buildroot] [git commit branch/next]
	package/kodi-screensaver-stars: new package
Message-ID: <20150808105651.B895881904@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=16f5cd5cf6324a4f55373a21d864ee04a8ee0c69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-screensaver-stars/Config.in           |   10 ++++++++++
 .../kodi-screensaver-stars.mk                      |   13 +++++++++++++
 package/kodi/Config.in                             |    1 +
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/kodi-screensaver-stars/Config.in b/package/kodi-screensaver-stars/Config.in
new file mode 100644
index 0000000..c78021a
--- /dev/null
+++ b/package/kodi-screensaver-stars/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_STARS
+	bool "kodi-screensaver-stars"
+	depends on BR2_PACKAGE_KODI_GL
+	help
+	  Starfield screensaver for Kodi
+
+	  https://github.com/notspiff/screensaver.stars
+
+comment "kodi-screensaver-starts needs an OpenGL backend"
+	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
new file mode 100644
index 0000000..f2a1be1
--- /dev/null
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-screensaver-stars
+#
+################################################################################
+
+KODI_SCREENSAVER_STARS_VERSION = 91b59f687ceb52488763aca4ba67d50a92f01731
+KODI_SCREENSAVER_STARS_SITE = $(call github,notspiff,screensaver.stars,$(KODI_SCREENSAVER_STARS_VERSION))
+KODI_SCREENSAVER_STARS_LICENSE = GPLv2+
+KODI_SCREENSAVER_STARS_LICENSE_FILES = src/StarField.cpp
+KODI_SCREENSAVER_STARS_DEPENDENCIES = kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 1ef8d6c..758d47f 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -293,6 +293,7 @@ menu "Screensavers"
 	source "package/kodi-screensaver-greynetic/Config.in"
 	source "package/kodi-screensaver-pingpong/Config.in"
 	source "package/kodi-screensaver-pyro/Config.in"
+	source "package/kodi-screensaver-stars/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
