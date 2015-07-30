From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:49:19 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi-screensaver-pyro:
	new package
Message-ID: <20150808105651.B10928190C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95c854c3027359ddb01f63d2e675224e353fca1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-screensaver-pyro/Config.in            |   10 ++++++++++
 .../kodi-screensaver-pyro/kodi-screensaver-pyro.mk |   13 +++++++++++++
 package/kodi/Config.in                             |    1 +
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/kodi-screensaver-pyro/Config.in b/package/kodi-screensaver-pyro/Config.in
new file mode 100644
index 0000000..45432c4
--- /dev/null
+++ b/package/kodi-screensaver-pyro/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_PYRO
+	bool "kodi-screensaver-pyro"
+	depends on BR2_PACKAGE_KODI_GL
+	help
+	  Pyro screensaver for Kodi
+
+	  https://github.com/notspiff/screensaver.pyro
+
+comment "kodi-screensaver-pyro needs an OpenGL backend"
+	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
new file mode 100644
index 0000000..e4c2b96
--- /dev/null
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-screensaver-pyro
+#
+################################################################################
+
+KODI_SCREENSAVER_PYRO_VERSION = 7551f3f4b6414c40c1c4170c750b9f45dd995261
+KODI_SCREENSAVER_PYRO_SITE = $(call github,notspiff,screensaver.pyro,$(KODI_SCREENSAVER_PYRO_VERSION))
+KODI_SCREENSAVER_PYRO_LICENSE = GPLv2+
+KODI_SCREENSAVER_PYRO_LICENSE_FILES = src/Pyro.cpp
+KODI_SCREENSAVER_PYRO_DEPENDENCIES = kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 54f4d02..1ef8d6c 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -292,6 +292,7 @@ menu "Screensavers"
 	source "package/kodi-screensaver-crystalmorph/Config.in"
 	source "package/kodi-screensaver-greynetic/Config.in"
 	source "package/kodi-screensaver-pingpong/Config.in"
+	source "package/kodi-screensaver-pyro/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
