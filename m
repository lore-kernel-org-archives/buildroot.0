From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2021 09:58:28 +0100
Subject: [Buildroot] [PATCH/next 09/54] package/kodi-inputstream-adaptive:
 bump version to 2.6.7-Matrix
In-Reply-To: <20210220085913.888324-1-bernd.kuhls@t-online.de>
References: <20210220085913.888324-1-bernd.kuhls@t-online.de>
Message-ID: <20210220085913.888324-10-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add expat as dependency after it was removed from the kodi package:
https://github.com/xbmc/inputstream.adaptive/blob/Matrix/CMakeLists.txt#L61

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-inputstream-adaptive/Config.in                   | 1 +
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash  | 2 +-
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk    | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/Config.in b/package/kodi-inputstream-adaptive/Config.in
index 21f1cff171..f0a24b7043 100644
--- a/package/kodi-inputstream-adaptive/Config.in
+++ b/package/kodi-inputstream-adaptive/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_KODI_INPUTSTREAM_ADAPTIVE
 	# wvdecrypter/cdm/build/build_config.h
 	depends on BR2_aarch64 || BR2_arm || BR2_i386 || BR2_mipsel \
 		|| BR2_mips64el || BR2_x86_64
+	select BR2_PACKAGE_EXPAT
 	help
 	  Kodi inputstream addon for several manifest types
 
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index b12c93ac11..6c9b79b881 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  222b7ad879146c62a1fc6016fc70ca1ca57b3b882882ebc54e0b772bf96482e7  kodi-inputstream-adaptive-2.4.6-Leia.tar.gz
+sha256  353207f5f98bf81ce8d79cec903c28da8c0227d7c7a632692c910d81e59c2dbe  kodi-inputstream-adaptive-2.6.7-Matrix.tar.gz
 sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.GPL
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index a8024951d4..d6d86817ce 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 2.4.6-Leia
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 2.6.7-Matrix
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.GPL
-KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = kodi
+KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = expat kodi
 
 $(eval $(cmake-package))
-- 
2.29.2
