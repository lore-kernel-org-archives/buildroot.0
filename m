From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2021 09:59:01 +0100
Subject: [Buildroot] [PATCH/next 42/54] package/kodi-screensaver-stars: bump
 version to 2.4.0-Matrix
In-Reply-To: <20210220085913.888324-1-bernd.kuhls@t-online.de>
References: <20210220085913.888324-1-bernd.kuhls@t-online.de>
Message-ID: <20210220085913.888324-43-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove dependency to opengl, opengles support was added upstream:
https://github.com/xbmc/screensaver.stars/commit/b0cb93b21888a5808f7701a794c5795f55e641d4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-stars/Config.in                   | 4 ----
 package/kodi-screensaver-stars/kodi-screensaver-stars.hash | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.mk   | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/kodi-screensaver-stars/Config.in b/package/kodi-screensaver-stars/Config.in
index a2e435c0f6..3a8713a56e 100644
--- a/package/kodi-screensaver-stars/Config.in
+++ b/package/kodi-screensaver-stars/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_STARS
 	bool "kodi-screensaver-stars"
-	depends on BR2_PACKAGE_HAS_LIBGL
 	help
 	  Starfield screensaver for Kodi
 
 	  https://github.com/xbmc/screensaver.stars
-
-comment "kodi-screensaver-stars needs OpenGL"
-	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
index b658517300..b98c4baaef 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  98972a9af45015d902ade50db822dbded52d4473acde6bc4b01a5ab8c4af4269  kodi-screensaver-stars-2.1.4-Leia.tar.gz
+sha256  868105f6381bf5439f8c67d54dda00f2108a4363f4b25dfb12787ed65b602f0d  kodi-screensaver-stars-2.4.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
index ca51921b50..c062de9488 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_STARS_VERSION = 2.1.4-Leia
+KODI_SCREENSAVER_STARS_VERSION = 2.4.0-Matrix
 KODI_SCREENSAVER_STARS_SITE = $(call github,xbmc,screensaver.stars,$(KODI_SCREENSAVER_STARS_VERSION))
 KODI_SCREENSAVER_STARS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_STARS_LICENSE_FILES = LICENSE.md
-- 
2.29.2
