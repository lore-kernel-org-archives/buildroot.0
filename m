From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:56:48 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-nextpvr: bump version to
 8.2.1-Matrix
Message-ID: <20210308072138.6843C8896D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e9b9f4aa2a5c5566523a4b183d9b8e465c13e42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch dependency to kodi after upstream removed the dependency to
kodi-platform:
https://github.com/kodi-pvr/pvr.nextpvr/commit/98b78cee615f5efeb207583c8b75adbaa742e43c
https://github.com/kodi-pvr/pvr.nextpvr/commit/304b0ba94fc2ffb5f2982e6ea4c31cd0e601a44e

Added dependency to tinyxml2:
https://github.com/kodi-pvr/pvr.nextpvr/commit/6855f12ad8496760fa0787660b2c8025ce77311a

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-nextpvr/Config.in             | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash | 4 ++--
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk   | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/kodi-pvr-nextpvr/Config.in b/package/kodi-pvr-nextpvr/Config.in
index e520426796..d260df833f 100644
--- a/package/kodi-pvr-nextpvr/Config.in
+++ b/package/kodi-pvr-nextpvr/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_NEXTPVR
 	bool "kodi-pvr-nextpvr"
-	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_TINYXML2
 	help
 	  Kodi's NextPVR client addon
 
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index 345ece6df9..f8d9e6c853 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1f5576070a0bf076d1f28cdd547bc4ff134861c18a71cff7fd036eaacc357707  kodi-pvr-nextpvr-3.3.21-Leia.tar.gz
-sha256  0bd576badce05c6b4315c415dabd77d80c871e72026c399f7a7bb8582e0911fe  debian/copyright
+sha256  ebe2b1f96b49c08c5960a6f75da6cb3cfc0cc30d6fafe43b77d2f2249915b752  kodi-pvr-nextpvr-8.2.1-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index b35216048c..bed6097c8a 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_NEXTPVR_VERSION = 3.3.21-Leia
+KODI_PVR_NEXTPVR_VERSION = 8.2.1-Matrix
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
-KODI_PVR_NEXTPVR_LICENSE_FILES = debian/copyright
-KODI_PVR_NEXTPVR_DEPENDENCIES = kodi-platform
+KODI_PVR_NEXTPVR_LICENSE_FILES = LICENSE.md
+KODI_PVR_NEXTPVR_DEPENDENCIES = kodi tinyxml2
 
 $(eval $(cmake-package))
