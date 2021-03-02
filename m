From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  2 Mar 2021 08:07:21 +0100
Subject: [Buildroot] [PATCH v2 26/54] package/kodi-pvr-pctv: bump version to
 6.1.0-Matrix
In-Reply-To: <20210302070749.647742-1-bernd.kuhls@t-online.de>
References: <20210302070749.647742-1-bernd.kuhls@t-online.de>
Message-ID: <20210302070749.647742-27-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch dependency to kodi after upstream removed the dependency to
kodi-platform:
https://github.com/kodi-pvr/pvr.pctv/commit/b6cebce2c9579a2bcce619dbba586eafd2cf2701
https://github.com/kodi-pvr/pvr.pctv/commit/db2eca67995017c7b3b4755e5bf674faaebe77ea

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-pctv/Config.in          | 1 -
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash | 4 ++--
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk   | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/kodi-pvr-pctv/Config.in b/package/kodi-pvr-pctv/Config.in
index 255cd4a5f0..11fe09b2f1 100644
--- a/package/kodi-pvr-pctv/Config.in
+++ b/package/kodi-pvr-pctv/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_PCTV
 	bool "kodi-pvr-pctv"
 	select BR2_PACKAGE_JSONCPP
-	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  PCTV PVR client addon for Kodi
 
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
index 30fb81a906..0e3f464cff 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  10124e5444c6cfb0c77bad1d1122f6ba5fc233248d6b33066ba799f4dedceeee  kodi-pvr-pctv-2.4.7-Leia.tar.gz
-sha256  43376e70ae80133530c8ce71a3b0dcde8529a8162d3b3956009eb8fc0f5c559c  debian/copyright
+sha256  94b8be4988cb6d8c61f6bdf237ddabb04d77fe4900f61411f5abf918eb5a078c  kodi-pvr-pctv-6.1.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
index 851788c96b..78d500e3e8 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_PCTV_VERSION = 2.4.7-Leia
+KODI_PVR_PCTV_VERSION = 6.1.0-Matrix
 KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
 KODI_PVR_PCTV_LICENSE = GPL-2.0+
-KODI_PVR_PCTV_LICENSE_FILES = debian/copyright
-KODI_PVR_PCTV_DEPENDENCIES = jsoncpp kodi-platform
+KODI_PVR_PCTV_LICENSE_FILES = LICENSE.md
+KODI_PVR_PCTV_DEPENDENCIES = jsoncpp kodi
 
 $(eval $(cmake-package))
-- 
2.29.2
