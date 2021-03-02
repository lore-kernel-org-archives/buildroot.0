From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  2 Mar 2021 08:07:35 +0100
Subject: [Buildroot] [PATCH v2 40/54] package/kodi-screensaver-pyro: bump
 version to 3.3.0-Matrix
In-Reply-To: <20210302070749.647742-1-bernd.kuhls@t-online.de>
References: <20210302070749.647742-1-bernd.kuhls@t-online.de>
Message-ID: <20210302070749.647742-41-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove dependency to opengl, opengles support was added upstream:
https://github.com/xbmc/screensaver.pyro/commit/d052f9997bcc0efc1c5dfb974a4bd24654e715fb

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-pyro/Config.in                  | 4 ----
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash | 4 ++--
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk   | 4 ++--
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/kodi-screensaver-pyro/Config.in b/package/kodi-screensaver-pyro/Config.in
index e2d1988ec5..9ee99883b4 100644
--- a/package/kodi-screensaver-pyro/Config.in
+++ b/package/kodi-screensaver-pyro/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_PYRO
 	bool "kodi-screensaver-pyro"
-	depends on BR2_PACKAGE_HAS_LIBGL
 	help
 	  Pyro screensaver for Kodi
 
 	  https://github.com/xbmc/screensaver.pyro
-
-comment "kodi-screensaver-pyro needs OpenGL"
-	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
index fd51a7c1d3..db4244e8fa 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cf9ed582b70460682175366641e6a00eaea085a1d3477a02710ba8398a1d17bd  kodi-screensaver-pyro-3.0.1-Leia.tar.gz
-sha256  24354cf1e6058ba0a95c7652eab9f1be2224c835ce36d14e82c0f401f65a53b7  debian/copyright
+sha256  83a3375166d6aaed01939bc370981ad46909fe1f1365fe7af22d4614fa6d06e6  kodi-screensaver-pyro-3.3.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
index 8a6ea93e83..dac03c6347 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PYRO_VERSION = 3.0.1-Leia
+KODI_SCREENSAVER_PYRO_VERSION = 3.3.0-Matrix
 KODI_SCREENSAVER_PYRO_SITE = $(call github,xbmc,screensaver.pyro,$(KODI_SCREENSAVER_PYRO_VERSION))
 KODI_SCREENSAVER_PYRO_LICENSE = GPL-2.0+
-KODI_SCREENSAVER_PYRO_LICENSE_FILES = debian/copyright
+KODI_SCREENSAVER_PYRO_LICENSE_FILES = LICENSE.md
 KODI_SCREENSAVER_PYRO_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
-- 
2.29.2
