From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  2 Mar 2021 08:07:26 +0100
Subject: [Buildroot] [PATCH v2 31/54] package/kodi-pvr-wmc: bump version to
 6.1.1-Matrix
In-Reply-To: <20210302070749.647742-1-bernd.kuhls@t-online.de>
References: <20210302070749.647742-1-bernd.kuhls@t-online.de>
Message-ID: <20210302070749.647742-32-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch dependency to kodi after upstream removed the dependency to
kodi-platform:
https://github.com/kodi-pvr/pvr.wmc/commit/6549e6f0cec7314dd4a34dc5cad96d6f76ac7751
https://github.com/kodi-pvr/pvr.wmc/commit/f824bd285df06a45fc0a2f57859fd5b28c426ad6

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-wmc/Config.in         | 1 -
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash | 4 ++--
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk   | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/kodi-pvr-wmc/Config.in b/package/kodi-pvr-wmc/Config.in
index 2672c83434..3daf4c387b 100644
--- a/package/kodi-pvr-wmc/Config.in
+++ b/package/kodi-pvr-wmc/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_KODI_PVR_WMC
 	bool "kodi-pvr-wmc"
-	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  Kodi's Windows Media Center client addon
 
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
index d5387e8534..0da7c17c23 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7fb150ba3b8b41cf164425b56ae5dda3a5fb2f64cdea7229900113965d492fee  kodi-pvr-wmc-2.4.6-Leia.tar.gz
-sha256  6d97c3d608a5d59565b567313bd3e53a1d0066ed59f4ae8e474c895d0c20e746  debian/copyright
+sha256  b58b4d6d2358faf5887133ea1794a2d3f8b35f77411aacafa569d45f7bc4bb3a  kodi-pvr-wmc-6.1.1-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index c280f89df4..7135fda9f2 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_WMC_VERSION = 2.4.6-Leia
+KODI_PVR_WMC_VERSION = 6.1.1-Matrix
 KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
 KODI_PVR_WMC_LICENSE = GPL-2.0+
-KODI_PVR_WMC_LICENSE_FILES = debian/copyright
-KODI_PVR_WMC_DEPENDENCIES = kodi-platform
+KODI_PVR_WMC_LICENSE_FILES = LICENSE.md
+KODI_PVR_WMC_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
-- 
2.29.2
