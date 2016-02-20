From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:09:25 +0100
Subject: [Buildroot] [PATCH/next 20/31] package/kodi-screensaver-cpblobs:
	new package
In-Reply-To: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456006176-21308-21-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-cpblobs/Config.in                  | 11 +++++++++++
 .../kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash  |  2 ++
 .../kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk    | 13 +++++++++++++
 package/kodi/Config.in                                      |  1 +
 4 files changed, 27 insertions(+)
 create mode 100644 package/kodi-screensaver-cpblobs/Config.in
 create mode 100644 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
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
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
new file mode 100644
index 0000000..ebf19d9
--- /dev/null
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 c2d19c33aff73b99cbf51f943b62e58b2b6233dcf1d789ae8f73e92fa96f07bc kodi-screensaver-cpblobs-87a3abfbe6e4fd1089548eab77a84902d0e1af60.tar.gz
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
index fe52232..1b7c673 100644
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
