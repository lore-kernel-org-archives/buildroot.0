From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:15:30 +0100
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-dvblink: bump
 version to 9.1.0-Matrix
Message-ID: <20210306213554.9CBDF8183D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b99569d8d74e130c3607b1b853647c68015b70e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Switch dependency to kodi after upstream removed the dependency to
kodi-platform:
https://github.com/kodi-pvr/pvr.dvblink/commit/a07c82f1591b0231e66b3ae14fabffa88259b8ec

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-dvblink/Config.in             | 1 -
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash | 4 ++--
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk   | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/kodi-pvr-dvblink/Config.in b/package/kodi-pvr-dvblink/Config.in
index 57f11271ec..3358750376 100644
--- a/package/kodi-pvr-dvblink/Config.in
+++ b/package/kodi-pvr-dvblink/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_KODI_PVR_DVBLINK
 	bool "kodi-pvr-dvblink"
-	select BR2_PACKAGE_KODI_PLATFORM
 	select BR2_PACKAGE_TINYXML2
 	help
 	  Kodi's DVBLink client addon
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
index c2121df025..ce4a42acac 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ad7586abfe7b3f9dd67b3a2225c442fc8d2a442e48bd7df75b11652286392c2f  kodi-pvr-dvblink-4.7.2-Leia.tar.gz
-sha256  4200fb35edb052f04dc43d267a1ad59468cb899e7b4931756b5830039b82716d  debian/copyright
+sha256  4b216871a16c7d9d9ab29f2788dfd0abdc828d1a2cb8203e84aee60ded75c9f6  kodi-pvr-dvblink-9.1.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
index 95bc7bbb4b..b691be6f5b 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_DVBLINK_VERSION = 4.7.2-Leia
+KODI_PVR_DVBLINK_VERSION = 9.1.0-Matrix
 KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
 KODI_PVR_DVBLINK_LICENSE = GPL-2.0+
-KODI_PVR_DVBLINK_LICENSE_FILES = debian/copyright
-KODI_PVR_DVBLINK_DEPENDENCIES = kodi-platform tinyxml2
+KODI_PVR_DVBLINK_LICENSE_FILES = LICENSE.md
+KODI_PVR_DVBLINK_DEPENDENCIES = kodi tinyxml2
 
 $(eval $(cmake-package))
