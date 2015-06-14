From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:41 +0200
Subject: [Buildroot] [PATCH/RFC v2 42/44] package/kodi-screensaver-pyro: new
	package
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-43-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-pyro/Config.in               |    6 ++++++
 .../kodi-screensaver-pyro/kodi-screensaver-pyro.mk    |   17 +++++++++++++++++
 package/kodi/Config.in                                |    1 +
 3 files changed, 24 insertions(+)
 create mode 100644 package/kodi-screensaver-pyro/Config.in
 create mode 100644 package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk

diff --git a/package/kodi-screensaver-pyro/Config.in b/package/kodi-screensaver-pyro/Config.in
new file mode 100644
index 0000000..eaed84e
--- /dev/null
+++ b/package/kodi-screensaver-pyro/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_PYRO
+	bool "kodi-screensaver-pyro"
+	help
+	  Pyro screensaver for Kodi
+
+	  https://github.com/notspiff/screensaver.pyro
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
new file mode 100644
index 0000000..97d63f4
--- /dev/null
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
@@ -0,0 +1,17 @@
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
+
+KODI_SCREENSAVER_PYRO_DEPENDENCIES = kodi
+
+KODI_SCREENSAVER_PYRO_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 4ce965f..d2ec088 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -294,6 +294,7 @@ menu "Screensavers"
 	source "package/kodi-screensaver-crystalmorph/Config.in"
 	source "package/kodi-screensaver-greynetic/Config.in"
 	source "package/kodi-screensaver-pingpong/Config.in"
+	source "package/kodi-screensaver-pyro/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
-- 
1.7.10.4
