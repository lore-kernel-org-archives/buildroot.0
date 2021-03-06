From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:15:32 +0100
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-filmon: bump
 version to 6.1.0-Matrix
Message-ID: <20210306213554.BC15686DA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d7b098e146acac0184d6bdf8c35a8d164b0f85b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Switch dependency to kodi after upstream removed the dependency to
kodi-platform:
https://github.com/kodi-pvr/pvr.filmon/commit/b0ea8036274480245b5a7aa48d2ba18cc37b6b88
https://github.com/kodi-pvr/pvr.filmon/commit/b8f249fcb50a27168f8b96ca9b4b8075d8c42b4a

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-filmon/Config.in            | 1 -
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash | 4 ++--
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk   | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/kodi-pvr-filmon/Config.in b/package/kodi-pvr-filmon/Config.in
index 0b662df176..d10002912a 100644
--- a/package/kodi-pvr-filmon/Config.in
+++ b/package/kodi-pvr-filmon/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_FILMON
 	bool "kodi-pvr-filmon"
 	select BR2_PACKAGE_JSONCPP
-	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  Filmon PVR client addon for Kodi
 
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
index e89ce6359b..277adb4087 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  90988e4833c0f84ab08e08be3cd08b84e4ba2baf2ebc1545c62e5dbd6708d749  kodi-pvr-filmon-2.4.6-Leia.tar.gz
-sha256  081907693b03f27cb1b17e0a440ae05fd8c8b4631be6fe6fdba4e18a5d40fdc5  debian/copyright
+sha256  7c2998bdde04acee5c147cb9f82939cfb13af57e5ecf46a4343dcfee15eb02e2  kodi-pvr-filmon-6.1.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index 078eae176a..2612f9aead 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_FILMON_VERSION = 2.4.6-Leia
+KODI_PVR_FILMON_VERSION = 6.1.0-Matrix
 KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
 KODI_PVR_FILMON_LICENSE = GPL-2.0+
-KODI_PVR_FILMON_LICENSE_FILES = debian/copyright
-KODI_PVR_FILMON_DEPENDENCIES = jsoncpp kodi-platform
+KODI_PVR_FILMON_LICENSE_FILES = LICENSE.md
+KODI_PVR_FILMON_DEPENDENCIES = jsoncpp kodi
 
 $(eval $(cmake-package))
