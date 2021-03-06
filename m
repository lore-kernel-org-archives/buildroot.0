From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:56:49 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-vuplus: bump version to
 7.4.0-Matrix
Message-ID: <20210308072138.B4DDE81132@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bd4830c82e2836d17d91cf91695d0f87b261a4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch dependency to kodi after upstream removed the dependency to
kodi-platform:
https://github.com/kodi-pvr/pvr.vuplus/commit/122a9b281668d31f921e842e8700b2f048121c16

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-vuplus/Config.in            | 1 -
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash | 4 ++--
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk   | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/kodi-pvr-vuplus/Config.in b/package/kodi-pvr-vuplus/Config.in
index b6a03e843f..862f5f9267 100644
--- a/package/kodi-pvr-vuplus/Config.in
+++ b/package/kodi-pvr-vuplus/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_KODI_PVR_VUPLUS
 	bool "kodi-pvr-vuplus"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # json-for-modern-cpp
 	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
-	select BR2_PACKAGE_KODI_PLATFORM
 	select BR2_PACKAGE_TINYXML
 	help
 	  VuPlus PVR client addon for Kodi
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
index e80e51bc78..2b12649aea 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d7dd890e4491e211ff3781cdc043347ab7a4ef6e00619ac1b4641ed81b0c3626  kodi-pvr-vuplus-3.28.9-Leia.tar.gz
-sha256  e98518889de8d38eaa6ddcb086b6e3b86efed98b501a5c666b9cf48f79e6df5d  debian/copyright
+sha256  2024ed208168089e51d9beade47fedec2e80e23044029f6919e27746f9634150  kodi-pvr-vuplus-7.4.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index bf1de1178d..fee4e816ab 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_VUPLUS_VERSION = 3.28.9-Leia
+KODI_PVR_VUPLUS_VERSION = 7.4.0-Matrix
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
-KODI_PVR_VUPLUS_LICENSE_FILES = debian/copyright
-KODI_PVR_VUPLUS_DEPENDENCIES = json-for-modern-cpp kodi-platform tinyxml
+KODI_PVR_VUPLUS_LICENSE_FILES = LICENSE.md
+KODI_PVR_VUPLUS_DEPENDENCIES = json-for-modern-cpp kodi tinyxml
 
 $(eval $(cmake-package))
