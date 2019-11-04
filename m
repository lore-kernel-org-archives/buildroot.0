From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  4 Nov 2019 21:14:10 +0100
Subject: [Buildroot] [PATCH v7 09/18] package/kodi-pvr-iptvsimple: bump
 version
In-Reply-To: <20191104201419.2757-1-bernd.kuhls@t-online.de>
References: <20191104201419.2757-1-bernd.kuhls@t-online.de>
Message-ID: <20191104201419.2757-10-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rapidxml was added as dependency:
https://github.com/kodi-pvr/pvr.iptvsimple/commit/d27b3ed1d379d2f865e95f08bdf2dbf086f8c0ad

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-iptvsimple/Config.in                | 1 +
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk   | 6 ++----
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/kodi-pvr-iptvsimple/Config.in b/package/kodi-pvr-iptvsimple/Config.in
index b59674979f..94fc1f0602 100644
--- a/package/kodi-pvr-iptvsimple/Config.in
+++ b/package/kodi-pvr-iptvsimple/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_KODI_PVR_IPTVSIMPLE
 	bool "kodi-pvr-iptvsimple"
 	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_RAPIDXML
 	help
 	  IPTV Live TV and Radio PVR client addon for Kodi
 
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index 0b0406feb8..c5f134d1e0 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 329bd71e5c786d7b037bf5fd103ee4abff892afc6e5186a5d0a797194a8c4c7c  kodi-pvr-iptvsimple-2.4.14-Krypton.tar.gz
+sha256 3a53bb91e7c93308e943f26700ecc82005fbd634601605b5e279f73576fc0f71  kodi-pvr-iptvsimple-3.8.5-Leia.tar.gz
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 0df509ea6a..54f4d0419b 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_IPTVSIMPLE_VERSION = 2.4.14-Krypton
+KODI_PVR_IPTVSIMPLE_VERSION = 3.8.5-Leia
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = src/client.h
-KODI_PVR_IPTVSIMPLE_DEPENDENCIES = kodi-platform
+KODI_PVR_IPTVSIMPLE_DEPENDENCIES = kodi-platform rapidxml
 
 $(eval $(cmake-package))
-- 
2.20.1
