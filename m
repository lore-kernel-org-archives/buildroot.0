From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Jan 2020 01:04:02 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-vuplus: bump version
Message-ID: <20200122235421.6201883687@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cc2ae83fca29e3f70a42759a105bb1495831e7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added dependency to json-for-modern-cpp after upstream commit:
https://github.com/kodi-pvr/pvr.vuplus/commit/07480b96fc674317ccbb792b03b811edec143e0c

Also added missing dependency to tinyxml.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kodi-pvr-vuplus/Config.in            | 2 ++
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk   | 6 ++----
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/kodi-pvr-vuplus/Config.in b/package/kodi-pvr-vuplus/Config.in
index a56c4ede93..96320f6fcb 100644
--- a/package/kodi-pvr-vuplus/Config.in
+++ b/package/kodi-pvr-vuplus/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_KODI_PVR_VUPLUS
 	bool "kodi-pvr-vuplus"
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_TINYXML
 	help
 	  VuPlus PVR client addon for Kodi
 
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
index f4f6756931..eb0408db8a 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 a8c7345e4e2e415e29c21f14460b257dfbe08ed5ecf1cc2dc6bc393a10f95cf3  kodi-pvr-vuplus-2.4.12-Krypton.tar.gz
+sha256 d7dd890e4491e211ff3781cdc043347ab7a4ef6e00619ac1b4641ed81b0c3626  kodi-pvr-vuplus-3.28.9-Leia.tar.gz
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index 581d884caa..34ec5d2384 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_VUPLUS_VERSION = 2.4.12-Krypton
+KODI_PVR_VUPLUS_VERSION = 3.28.9-Leia
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
 KODI_PVR_VUPLUS_LICENSE_FILES = src/client.h
-KODI_PVR_VUPLUS_DEPENDENCIES = kodi-platform
+KODI_PVR_VUPLUS_DEPENDENCIES = json-for-modern-cpp kodi-platform tinyxml
 
 $(eval $(cmake-package))
