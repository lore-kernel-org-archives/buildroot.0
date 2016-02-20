From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:09:24 +0100
Subject: [Buildroot] [PATCH/next 19/31] package/kodi-screensaver-asterwave:
	new package
In-Reply-To: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456006176-21308-20-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-asterwave/Config.in                  | 11 +++++++++++
 .../kodi-screensaver-asterwave.hash                           |  2 ++
 .../kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk  | 11 +++++++++++
 package/kodi/Config.in                                        |  1 +
 4 files changed, 25 insertions(+)
 create mode 100644 package/kodi-screensaver-asterwave/Config.in
 create mode 100644 package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
 create mode 100644 package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk

diff --git a/package/kodi-screensaver-asterwave/Config.in b/package/kodi-screensaver-asterwave/Config.in
new file mode 100644
index 0000000..c430cff
--- /dev/null
+++ b/package/kodi-screensaver-asterwave/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_ASTERWAVE
+	bool "kodi-screensaver-asterwave"
+	depends on BR2_PACKAGE_KODI_GL # libsoil
+	select BR2_PACKAGE_LIBSOIL
+	help
+	  AsterWave screensaver for Kodi
+
+	  https://github.com/notspiff/screensaver.asterwave
+
+comment "asterwave needs an OpenGL backend"
+	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
new file mode 100644
index 0000000..5f04031
--- /dev/null
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 6bf9367889c4ddece7e0c3720762d41bb0b22fc9ab28d1c8759edb1f77487ecd kodi-screensaver-asterwave-0dc2c48dadb100954eef823e7e3a5f502ce65b1e.tar.gz
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
new file mode 100644
index 0000000..1cb74f3
--- /dev/null
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# kodi-screensaver-asterwave
+#
+################################################################################
+
+KODI_SCREENSAVER_ASTERWAVE_VERSION = 0dc2c48dadb100954eef823e7e3a5f502ce65b1e
+KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,notspiff,screensaver.asterwave,$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
+KODI_SCREENSAVER_ASTERWAVE_DEPENDENCIES = kodi libsoil
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 13955e4..fe52232 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -264,6 +264,7 @@ endmenu
 
 menu "Screensavers"
 	source "package/kodi-screensaver-asteroids/Config.in"
+	source "package/kodi-screensaver-asterwave/Config.in"
 	source "package/kodi-screensaver-biogenesis/Config.in"
 	source "package/kodi-screensaver-crystalmorph/Config.in"
 	source "package/kodi-screensaver-greynetic/Config.in"
-- 
2.7.0
