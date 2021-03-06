From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:56:48 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-mythtv: bump version to
 7.3.0-Matrix
Message-ID: <20210308072138.5EF4A81607@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c84437722f69be1dd8776eda0fbdd7ccb9d6d0c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch dependency to kodi after upstream removed the dependency to
kodi-platform:
https://github.com/janbar/pvr.mythtv/commit/b847285c33ce4e469d29f8ada643c69d4360af62

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-mythtv/Config.in            | 1 -
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 4 ++--
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/kodi-pvr-mythtv/Config.in b/package/kodi-pvr-mythtv/Config.in
index 798ff3e911..ebdbc00487 100644
--- a/package/kodi-pvr-mythtv/Config.in
+++ b/package/kodi-pvr-mythtv/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_KODI_PVR_MYTHTV
 	bool "kodi-pvr-mythtv"
-	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  MythTV PVR for Kodi
 
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index 1896592cf5..30a7ec841c 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b2048db252966d5f78828cacd41e85d00a522c03fe7f24a0f000f720fe7aff0a  kodi-pvr-mythtv-5.10.19-Leia.tar.gz
-sha256  0efb11009d447b39ec35d77dc265db3d1c3d261730bbc33b267587254d973ec8  debian/copyright
+sha256  fa741677fc2d58689111d18c8eb1114115f4c33bc99267bb761f225e82fdc588  kodi-pvr-mythtv-7.3.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index e902bab148..98e83e2035 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 5.10.19-Leia
+KODI_PVR_MYTHTV_VERSION = 7.3.0-Matrix
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
-KODI_PVR_MYTHTV_LICENSE_FILES = debian/copyright
-KODI_PVR_MYTHTV_DEPENDENCIES = kodi-platform
+KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
+KODI_PVR_MYTHTV_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
