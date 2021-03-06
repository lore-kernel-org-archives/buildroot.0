From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 21:52:06 +0100
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: bump
 version to 2.6.7-Matrix
Message-ID: <20210308072137.B832E81607@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e78c80467c99b6aa094416959e0f18992bf30e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add expat as dependency after it was removed from the kodi package:
https://github.com/xbmc/inputstream.adaptive/blob/Matrix/CMakeLists.txt#L61

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-inputstream-adaptive/Config.in                      | 1 +
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk   | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/Config.in b/package/kodi-inputstream-adaptive/Config.in
index f9ba20adcf..90e9a85dd8 100644
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
index 30fbaf5251..6b085e49ce 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 2.4.6-Leia
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 2.6.7-Matrix
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,peak3d,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.GPL
-KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = kodi
+KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = expat kodi
 
 $(eval $(cmake-package))
