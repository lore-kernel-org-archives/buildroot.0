From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2021 09:58:33 +0100
Subject: [Buildroot] [PATCH/next 14/54] package/kodi-pvr-argustv: bump
 version to 7.1.0-Matrix
In-Reply-To: <20210220085913.888324-1-bernd.kuhls@t-online.de>
References: <20210220085913.888324-1-bernd.kuhls@t-online.de>
Message-ID: <20210220085913.888324-15-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch dependency to kodi after upstream removed the dependency to
kodi-platform:
https://github.com/kodi-pvr/pvr.argustv/commit/44d9c5a20579a2f505f26a072096911d68855a4a
https://github.com/kodi-pvr/pvr.argustv/commit/6a6968892d468d02ca0d380e3fff54e607346024

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-argustv/Config.in             | 1 -
 package/kodi-pvr-argustv/kodi-pvr-argustv.hash | 4 ++--
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk   | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/kodi-pvr-argustv/Config.in b/package/kodi-pvr-argustv/Config.in
index 216000aefd..7cca2661c7 100644
--- a/package/kodi-pvr-argustv/Config.in
+++ b/package/kodi-pvr-argustv/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_ARGUSTV
 	bool "kodi-pvr-argustv"
 	select BR2_PACKAGE_JSONCPP
-	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  Kodi's ARGUS TV client addon
 
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
index 5c47dd30b2..3024d8e65f 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7bfedb27b2aec4015b2594df18b76fe42e97ec10f4b5cb9c6987b1a7a264c844  kodi-pvr-argustv-3.5.6-Leia.tar.gz
-sha256  17bc5450fff10fc46484886690adbf20c369f5baff021435feab1187b9943834  debian/copyright
+sha256  d91f195c4a91af893231d03a887a340900c4e515597ea059ee6b9e6444717fc9  kodi-pvr-argustv-7.1.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
index 73a9f1c764..2d5d62a539 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_ARGUSTV_VERSION = 3.5.6-Leia
+KODI_PVR_ARGUSTV_VERSION = 7.1.0-Matrix
 KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
 KODI_PVR_ARGUSTV_LICENSE = GPL-2.0+
-KODI_PVR_ARGUSTV_LICENSE_FILES = debian/copyright
-KODI_PVR_ARGUSTV_DEPENDENCIES = jsoncpp kodi-platform
+KODI_PVR_ARGUSTV_LICENSE_FILES = LICENSE.md
+KODI_PVR_ARGUSTV_DEPENDENCIES = jsoncpp kodi
 
 $(eval $(cmake-package))
-- 
2.29.2
