From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jan 2020 12:07:26 +0100
Subject: [Buildroot] [PATCH v9 14/23] package/kodi-screensaver-asteroids:
 bump version
In-Reply-To: <20200119110735.1104443-1-bernd.kuhls@t-online.de>
References: <20200119110735.1104443-1-bernd.kuhls@t-online.de>
Message-ID: <20200119110735.1104443-15-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package was moved to xbmc repo:
https://github.com/xbmc/repo-binary-addons/commit/57b8ed5fb9b5f0368738260b762cc0bab1147172#diff-4fa94ef50ebd8df4af5fd4eed5e693b6

Added dependency to glm:
https://github.com/xbmc/screensaver.asteroids/commit/360a02fc20925fa17179f3298dd4515b4354e266

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-asteroids/Config.in                | 3 ++-
 .../kodi-screensaver-asteroids.hash                         | 2 +-
 .../kodi-screensaver-asteroids.mk                           | 6 +++---
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/kodi-screensaver-asteroids/Config.in b/package/kodi-screensaver-asteroids/Config.in
index ccc2aba6aa..3d66c3dcc3 100644
--- a/package/kodi-screensaver-asteroids/Config.in
+++ b/package/kodi-screensaver-asteroids/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_ASTEROIDS
 	bool "kodi-screensaver-asteroids"
 	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_GLM
 	help
 	  Asteroids screensaver for Kodi
 
-	  https://github.com/notspiff/screensaver.asteroids
+	  https://github.com/xbmc/screensaver.asteroids
 
 comment "kodi-screensaver-asteroids needs OpenGL"
 	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
index d62032c076..b01580a62e 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 2e072e6aad12f707dec1e70b7df26c590bb41fed8880dcfdbe6c99949b7e287a  kodi-screensaver-asteroids-1.1.2.tar.gz
+sha256 fa7671a1c88b75e6d26a172fdffdad4fdbd78f000f54632c47e38c17cd0da460  kodi-screensaver-asteroids-2.3.1-Leia.tar.gz
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
index 378da74be1..70d9d8e48b 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTEROIDS_VERSION = 1.1.2
-KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,notspiff,screensaver.asteroids,v$(KODI_SCREENSAVER_ASTEROIDS_VERSION))
+KODI_SCREENSAVER_ASTEROIDS_VERSION = 2.3.1-Leia
+KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,xbmc,screensaver.asteroids,$(KODI_SCREENSAVER_ASTEROIDS_VERSION))
 KODI_SCREENSAVER_ASTEROIDS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = src/main.cpp
-KODI_SCREENSAVER_ASTEROIDS_DEPENDENCIES = kodi
+KODI_SCREENSAVER_ASTEROIDS_DEPENDENCIES = glm kodi
 
 $(eval $(cmake-package))
-- 
2.20.1
