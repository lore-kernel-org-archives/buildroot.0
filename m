From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:15:34 +0100
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-hts: bump
 version to 8.2.1-Matrix
Message-ID: <20210306213554.D22B386782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b193fb07b041b957cc6e86e93bfae4c673031582
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Switch dependency to kodi after upstream removed the dependency to
kodi-platform:
https://github.com/kodi-pvr/pvr.hts/commit/9943d05ce52b6ddcd63a3faa094f7ee9b2671c86
https://github.com/kodi-pvr/pvr.hts/commit/d6b71de38b1c522a6f2716a7e4a90528ae06e992

Added dependency to gcc >= 7 due to c++17 code added by
https://github.com/kodi-pvr/pvr.hts/commit/954f25d39652098b5fb1a55d44e2d410de78902b

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-hts/Config.in         | 5 ++++-
 package/kodi-pvr-hts/kodi-pvr-hts.hash | 4 ++--
 package/kodi-pvr-hts/kodi-pvr-hts.mk   | 6 +++---
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/kodi-pvr-hts/Config.in b/package/kodi-pvr-hts/Config.in
index c4c4497bd3..a352457f31 100644
--- a/package/kodi-pvr-hts/Config.in
+++ b/package/kodi-pvr-hts/Config.in
@@ -1,7 +1,10 @@
 config BR2_PACKAGE_KODI_PVR_HTS
 	bool "kodi-pvr-hts"
-	select BR2_PACKAGE_KODI_PLATFORM
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	help
 	  Tvheadend HTSP PVR client addon for Kodi
 
 	  https://github.com/kodi-pvr/pvr.hts
+
+comment "kodi-pvr-hts needs a toolchain w/ gcc >= 7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index c9724404b5..275712df49 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6958b91ca616554e4c068bc303c66388e9a2c3a68b5979d8918b4e0d7b6bb95c  kodi-pvr-hts-4.4.21-Leia.tar.gz
-sha256  6d97c3d608a5d59565b567313bd3e53a1d0066ed59f4ae8e474c895d0c20e746  debian/copyright
+sha256  ec291b5717c19dfd639131d195c64043746043d4f85189accaf29e9b1547fbba  kodi-pvr-hts-8.2.2-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 6a25cda003..a4a14cdd6e 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 4.4.21-Leia
+KODI_PVR_HTS_VERSION = 8.2.2-Matrix
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
-KODI_PVR_HTS_LICENSE_FILES = debian/copyright
-KODI_PVR_HTS_DEPENDENCIES = kodi-platform
+KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
+KODI_PVR_HTS_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
