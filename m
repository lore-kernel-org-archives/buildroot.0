From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Jan 2020 21:06:09 +0100
Subject: [Buildroot] [PATCH v8 09/20] package/kodi-pvr-iptvsimple: bump
 version
In-Reply-To: <20200118200620.3967240-1-bernd.kuhls@t-online.de>
References: <20200118200620.3967240-1-bernd.kuhls@t-online.de>
Message-ID: <20200118200620.3967240-10-bernd.kuhls@t-online.de>
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
index 0b0406feb8..1b79b57049 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 329bd71e5c786d7b037bf5fd103ee4abff892afc6e5186a5d0a797194a8c4c7c  kodi-pvr-iptvsimple-2.4.14-Krypton.tar.gz
+sha256 25eff252ad748e0cf166cd01b0f08e8fb3977c98a1b04cad9ef6509ea30c5fa9  kodi-pvr-iptvsimple-3.8.8-Leia.tar.gz
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 0df509ea6a..16007cf404 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_IPTVSIMPLE_VERSION = 2.4.14-Krypton
+KODI_PVR_IPTVSIMPLE_VERSION = 3.8.8-Leia
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = src/client.h
-KODI_PVR_IPTVSIMPLE_DEPENDENCIES = kodi-platform
+KODI_PVR_IPTVSIMPLE_DEPENDENCIES = kodi-platform rapidxml
 
 $(eval $(cmake-package))
-- 
2.20.1
