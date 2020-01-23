From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Jan 2020 01:04:02 +0100
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: bump
 version
Message-ID: <20200122235421.1089D8386D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bb8a8fed1ba21d34e4728c2cdafaa8517a5c12f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched dependencies from libplatform & kodi-platform to kodi after
upstream commit:
https://github.com/peak3d/inputstream.adaptive/commit/0d1c5503ad809a23062aebd3c01837ca5d21ea3a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kodi-inputstream-adaptive/Config.in                      | 2 --
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk   | 6 ++----
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/Config.in b/package/kodi-inputstream-adaptive/Config.in
index cb5127363a..f9ba20adcf 100644
--- a/package/kodi-inputstream-adaptive/Config.in
+++ b/package/kodi-inputstream-adaptive/Config.in
@@ -3,8 +3,6 @@ config BR2_PACKAGE_KODI_INPUTSTREAM_ADAPTIVE
 	# wvdecrypter/cdm/build/build_config.h
 	depends on BR2_aarch64 || BR2_arm || BR2_i386 || BR2_mipsel \
 		|| BR2_mips64el || BR2_x86_64
-	select BR2_PACKAGE_LIBPLATFORM
-	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  Kodi inputstream addon for several manifest types
 
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 15ecf494f1..94a001c4e7 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 872a6ffefb90b6201a1e01fe5a52e05877e2040737e052b2f249725b9a8a44ff  kodi-inputstream-adaptive-c51b9a9b58a645f820883e6d99982277fc58aac5.tar.gz
+sha256 e47263240ac9276546ead439ba14ee26c3f3b45f2882351a9081e5502e296329  kodi-inputstream-adaptive-2.4.2-Leia.tar.gz
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index ab810d3248..90958bdf1a 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = c51b9a9b58a645f820883e6d99982277fc58aac5
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 2.4.2-Leia
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,peak3d,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = src/main.cpp
-KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = libplatform kodi-platform
+KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
