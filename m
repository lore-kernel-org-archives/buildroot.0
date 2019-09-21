From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Sep 2019 21:28:20 +0200
Subject: [Buildroot] [PATCH v6 19/25] package/kodi-pvr-vuplus: bump version
In-Reply-To: <20190921192826.10143-1-bernd.kuhls@t-online.de>
References: <20190921192826.10143-1-bernd.kuhls@t-online.de>
Message-ID: <20190921192826.10143-20-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added dependency to json-for-modern-cpp after upstream commit:
https://github.com/kodi-pvr/pvr.vuplus/commit/07480b96fc674317ccbb792b03b811edec143e0c

Also added missing dependency to tinyxml.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-vuplus/Config.in            | 2 ++
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk   | 6 ++----
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/kodi-pvr-vuplus/Config.in b/package/kodi-pvr-vuplus/Config.in
index a56c4ede93..96320f6fcb 100644
--- a/package/kodi-pvr-vuplus/Config.in
+++ b/package/kodi-pvr-vuplus/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_KODI_PVR_VUPLUS
 	bool "kodi-pvr-vuplus"
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_TINYXML
 	help
 	  VuPlus PVR client addon for Kodi
 
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
index f4f6756931..f931ae4fae 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 a8c7345e4e2e415e29c21f14460b257dfbe08ed5ecf1cc2dc6bc393a10f95cf3  kodi-pvr-vuplus-2.4.12-Krypton.tar.gz
+sha256 0f859437d8bfc5443f146fc6349216cc76ce65f5b4b228d47952919951aa6682  kodi-pvr-vuplus-92145dad673de0f951ae2a2dd84513b987948faa.tar.gz
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index 581d884caa..c01ccb9ece 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_VUPLUS_VERSION = 2.4.12-Krypton
+KODI_PVR_VUPLUS_VERSION = 92145dad673de0f951ae2a2dd84513b987948faa
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
 KODI_PVR_VUPLUS_LICENSE_FILES = src/client.h
-KODI_PVR_VUPLUS_DEPENDENCIES = kodi-platform
+KODI_PVR_VUPLUS_DEPENDENCIES = json-for-modern-cpp kodi-platform tinyxml
 
 $(eval $(cmake-package))
-- 
2.20.1
