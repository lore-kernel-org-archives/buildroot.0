From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:15:31 +0100
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-dvbviewer:
 bump version to 7.2.0-Matrix
Message-ID: <20210306213554.AC6768183D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1784f47c8530fcc05e2c92b4f1992969b3f0e9fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Switch dependency to kodi after upstream removed the dependency to
kodi-platform:
https://github.com/kodi-pvr/pvr.dvbviewer/commit/838efac4e46ad249d066437b96633c2e0b9dda1a
https://github.com/kodi-pvr/pvr.dvbviewer/commit/7ca7ca3ab05f67606d7cdae15fcfab292ad00b37

Add missing dependency to tinyxml.

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-dvbviewer/Config.in               | 2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash | 4 ++--
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk   | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/kodi-pvr-dvbviewer/Config.in b/package/kodi-pvr-dvbviewer/Config.in
index e7dd7b3eb6..6a47d154fc 100644
--- a/package/kodi-pvr-dvbviewer/Config.in
+++ b/package/kodi-pvr-dvbviewer/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_DVBVIEWER
 	bool "kodi-pvr-dvbviewer"
-	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_TINYXML
 	help
 	  Kodi's DVBViewer client addon
 
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
index ec2013412f..a2aac32bf3 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8a3d167e652574caf30ba0ce9c22d278715e0237774b817e37826f1b2d647bff  kodi-pvr-dvbviewer-3.7.11-Leia.tar.gz
-sha256  5757dbd6a8731e9395508cd7ab9ca0ea0c2863a7aac7136299d40549c88c9c2c  debian/copyright
+sha256  aa81c0a59c00aa13bc1ea3adc078e2910fde42bc86ad3a78ecefc6e4c3d5de59  kodi-pvr-dvbviewer-7.2.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index b88d3d86cd..cbc12ed9e5 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_DVBVIEWER_VERSION = 3.7.11-Leia
+KODI_PVR_DVBVIEWER_VERSION = 7.2.0-Matrix
 KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
 KODI_PVR_DVBVIEWER_LICENSE = GPL-2.0+
-KODI_PVR_DVBVIEWER_LICENSE_FILES = debian/copyright
-KODI_PVR_DVBVIEWER_DEPENDENCIES = kodi-platform
+KODI_PVR_DVBVIEWER_LICENSE_FILES = LICENSE.md
+KODI_PVR_DVBVIEWER_DEPENDENCIES = kodi tinyxml
 
 $(eval $(cmake-package))
