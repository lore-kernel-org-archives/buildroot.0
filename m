From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Feb 2016 17:03:01 +0100
Subject: [Buildroot] [PATCH 17/28] package/kodi-screensaver-cpblobs: new
	package
In-Reply-To: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454860992-25114-18-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-cpblobs/Config.in                  | 11 +++++++++++
 .../kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk    | 13 +++++++++++++
 package/kodi/Config.in                                      |  1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-screensaver-cpblobs/Config.in
 create mode 100644 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk

diff --git a/package/kodi-screensaver-cpblobs/Config.in b/package/kodi-screensaver-cpblobs/Config.in
new file mode 100644
index 0000000..184509e
--- /dev/null
+++ b/package/kodi-screensaver-cpblobs/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_CPBLOBS
+	bool "kodi-screensaver-cpblobs"
+	depends on BR2_PACKAGE_KODI_GL # libsoil
+	select BR2_PACKAGE_LIBSOIL
+	help
+	  CpBlobs screensaver for Kodi
+
+	  https://github.com/notspiff/screensaver.cpblobs
+
+comment "cpblobs needs an OpenGL backend"
+	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
new file mode 100644
index 0000000..57f3adb
--- /dev/null
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-screensaver-cpblobs
+#
+################################################################################
+
+KODI_SCREENSAVER_CPBLOBS_VERSION = 87a3abfbe6e4fd1089548eab77a84902d0e1af60
+KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,notspiff,screensaver.cpblobs,$(KODI_SCREENSAVER_CPBLOBS_VERSION))
+KODI_SCREENSAVER_CPBLOBS_LICENSE = GPLv2+
+KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE
+KODI_SCREENSAVER_CPBLOBS_DEPENDENCIES = kodi libsoil
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 65f37ad..4b0be39 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -266,6 +266,7 @@ menu "Screensavers"
 	source "package/kodi-screensaver-asteroids/Config.in"
 	source "package/kodi-screensaver-asterwave/Config.in"
 	source "package/kodi-screensaver-biogenesis/Config.in"
+	source "package/kodi-screensaver-cpblobs/Config.in"
 	source "package/kodi-screensaver-crystalmorph/Config.in"
 	source "package/kodi-screensaver-greynetic/Config.in"
 	source "package/kodi-screensaver-pingpong/Config.in"
-- 
2.7.0
