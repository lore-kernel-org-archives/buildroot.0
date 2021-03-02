From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  2 Mar 2021 08:07:19 +0100
Subject: [Buildroot] [PATCH v2 24/54] package/kodi-pvr-njoy: bump version to
 7.1.0-Matrix
In-Reply-To: <20210302070749.647742-1-bernd.kuhls@t-online.de>
References: <20210302070749.647742-1-bernd.kuhls@t-online.de>
Message-ID: <20210302070749.647742-25-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch dependency to kodi after upstream removed the dependency to
kodi-platform:
https://github.com/kodi-pvr/pvr.njoy/commit/eb5613fb8bbf45643e211147f39f106ea9ff573d

Added missing dependency to tinyxml.

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-njoy/Config.in          | 2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash | 4 ++--
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk   | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/kodi-pvr-njoy/Config.in b/package/kodi-pvr-njoy/Config.in
index 33c493cb8b..bb84ea3a66 100644
--- a/package/kodi-pvr-njoy/Config.in
+++ b/package/kodi-pvr-njoy/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_NJOY
 	bool "kodi-pvr-njoy"
-	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_TINYXML
 	help
 	  Kodi's Njoy N7 client addon
 
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
index 3071dfac67..76e5e988db 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8c42a3c3754d7a07de9682504c4883a584eb21a92b9af70f0129ffc2707c1554  kodi-pvr-njoy-3.4.2-Leia.tar.gz
-sha256  9d42154eabd84ae131cc6384a3ea0fc622c3551595564bec7a6bec8df4a57fbd  debian/copyright
+sha256  26134e815efd38fa09507a6119e6463c4785a78a417e253558d23a94a9989613  kodi-pvr-njoy-7.1.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
index ca86d46d85..17a69af73b 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_NJOY_VERSION = 3.4.2-Leia
+KODI_PVR_NJOY_VERSION = 7.1.0-Matrix
 KODI_PVR_NJOY_SITE = $(call github,kodi-pvr,pvr.njoy,$(KODI_PVR_NJOY_VERSION))
 KODI_PVR_NJOY_LICENSE = GPL-2.0+
-KODI_PVR_NJOY_LICENSE_FILES = debian/copyright
-KODI_PVR_NJOY_DEPENDENCIES = kodi-platform
+KODI_PVR_NJOY_LICENSE_FILES = LICENSE.md
+KODI_PVR_NJOY_DEPENDENCIES = kodi tinyxml
 
 $(eval $(cmake-package))
-- 
2.29.2
