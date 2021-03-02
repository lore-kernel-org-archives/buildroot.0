From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  2 Mar 2021 08:07:32 +0100
Subject: [Buildroot] [PATCH v2 37/54] package/kodi-screensaver-greynetic:
 bump version to 2.5.0-Matrix
In-Reply-To: <20210302070749.647742-1-bernd.kuhls@t-online.de>
References: <20210302070749.647742-1-bernd.kuhls@t-online.de>
Message-ID: <20210302070749.647742-38-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove dependency to opengl, add dependency to glm, opengles support
was fixed upstream:
https://github.com/xbmc/screensaver.greynetic/commit/aee7082c92f8c8aa1195c33db89e38753a039bba

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-greynetic/Config.in                | 5 +----
 .../kodi-screensaver-greynetic.hash                         | 4 ++--
 .../kodi-screensaver-greynetic.mk                           | 6 +++---
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/kodi-screensaver-greynetic/Config.in b/package/kodi-screensaver-greynetic/Config.in
index 685feb8872..92db2855e6 100644
--- a/package/kodi-screensaver-greynetic/Config.in
+++ b/package/kodi-screensaver-greynetic/Config.in
@@ -1,10 +1,7 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_GREYNETIC
 	bool "kodi-screensaver-greynetic"
-	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_GLM
 	help
 	  Greynetic screensaver for Kodi
 
 	  https://github.com/xbmc/screensaver.greynetic
-
-comment "kodi-screensaver-greynetic needs OpenGL"
-	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
index 87961fdae0..d1f4992240 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e9a24d3204e3d6d5b5302a865e37c6f2ae9e25a3536eeda4205830f5e0256555  kodi-screensaver-greynetic-2.2.3-Leia.tar.gz
-sha256  2905fdee5c68dc4944c42711d45f47794e8fb881bd67d66d0875d10f9a2156a0  debian/copyright
+sha256  093c77ad332dc5797f1866895218d6c6b4490ef1f9bd4cbdf15c000c3b881798  kodi-screensaver-greynetic-2.5.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
index 6311325540..b7c4a15b87 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_GREYNETIC_VERSION = 2.2.3-Leia
+KODI_SCREENSAVER_GREYNETIC_VERSION = 2.5.0-Matrix
 KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,xbmc,screensaver.greynetic,$(KODI_SCREENSAVER_GREYNETIC_VERSION))
 KODI_SCREENSAVER_GREYNETIC_LICENSE = GPL-2.0+
-KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = debian/copyright
-KODI_SCREENSAVER_GREYNETIC_DEPENDENCIES = kodi
+KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = LICENSE.md
+KODI_SCREENSAVER_GREYNETIC_DEPENDENCIES = glm kodi
 
 $(eval $(cmake-package))
-- 
2.29.2
