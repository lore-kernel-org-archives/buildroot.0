From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  2 Mar 2021 08:07:27 +0100
Subject: [Buildroot] [PATCH v2 32/54] package/kodi-pvr-zattoo: bump version
 to 19.7.3-Matrix
In-Reply-To: <20210302070749.647742-1-bernd.kuhls@t-online.de>
References: <20210302070749.647742-1-bernd.kuhls@t-online.de>
Message-ID: <20210302070749.647742-33-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch dependency to kodi after upstream removed the dependency to
kodi-platform and libplatform:
https://github.com/rbuehlma/pvr.zattoo/commit/382c83d0cadcfb3152c577291ee0a2d1015a128c
https://github.com/rbuehlma/pvr.zattoo/commit/a813b2c9f0510d2b9cd23d57b659ae5346c63065

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-zattoo/Config.in            | 2 --
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 4 ++--
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 6 +++---
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/kodi-pvr-zattoo/Config.in b/package/kodi-pvr-zattoo/Config.in
index 5dfadcadd1..9a6eb3fec5 100644
--- a/package/kodi-pvr-zattoo/Config.in
+++ b/package/kodi-pvr-zattoo/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_KODI_PVR_ZATTOO
 	bool "kodi-pvr-zattoo"
-	select BR2_PACKAGE_KODI_PLATFORM
-	select BR2_PACKAGE_LIBPLATFORM
 	select BR2_PACKAGE_RAPIDJSON
 	select BR2_PACKAGE_TINYXML2
 	help
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index a9e2cd996c..824a40b96a 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9c3dc2ed9f8c39bcc4f5798439b85f2bdae1a427ffeb1b9d18aa5e2caca29f4e  kodi-pvr-zattoo-18.1.23-Leia.tar.gz
-sha256  d3670aef89085fd6b97665967a8422c89324afbc4720daa0975696a2ee92e236  debian/copyright
+sha256  7f9f1e5907ea0ad8a30d073e67ad42a2ddc16a99f30f704a6b9690ce5dac3268  kodi-pvr-zattoo-19.7.3-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index cb995c9c78..58acd7edc6 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 18.1.23-Leia
+KODI_PVR_ZATTOO_VERSION = 19.7.3-Matrix
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
-KODI_PVR_ZATTOO_LICENSE_FILES = debian/copyright
-KODI_PVR_ZATTOO_DEPENDENCIES = kodi-platform libplatform rapidjson tinyxml2
+KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
+KODI_PVR_ZATTOO_DEPENDENCIES = kodi rapidjson tinyxml2
 
 $(eval $(cmake-package))
-- 
2.29.2
