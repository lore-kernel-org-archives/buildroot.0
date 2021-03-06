From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 21:53:16 +0100
Subject: [Buildroot] [git commit branch/next] package/kodi-inputstream-rtmp:
 bump version to 3.4.0-Matrix
Message-ID: <20210306213554.70A248183D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8a582f140695711d940b2d5611daf62a302b08d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Openssl and zlib are built as hard-dependencies of Kodi already. For the
case that Kodi drops these dependencies we need to make sure that this
package still finds its dependencies:
https://github.com/xbmc/inputstream.rtmp/blob/Matrix/CMakeLists.txt#L8

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-inputstream-rtmp/Config.in                  | 2 ++
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash | 4 ++--
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk   | 6 +++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/kodi-inputstream-rtmp/Config.in b/package/kodi-inputstream-rtmp/Config.in
index fa83926301..c4bd2e1380 100644
--- a/package/kodi-inputstream-rtmp/Config.in
+++ b/package/kodi-inputstream-rtmp/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_KODI_INPUTSTREAM_RTMP
 	bool "kodi-inputstream-rtmp"
+	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_RTMPDUMP
+	select BR2_PACKAGE_ZLIB
 	help
 	  RTMP input stream add-on for Kodi
 
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
index d472b89ba9..e645fb14bb 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  56dac63262fa736620863900d903616d4827d735992e6d8beda84e377a5599e5  kodi-inputstream-rtmp-2.0.9-Leia.tar.gz
-sha256  ddba7d22c2586f13de40786c21f3b87c6913c9937f4862dc828d33cfff0395eb  debian/copyright
+sha256  efaaa9b07c18810582a3826df476fc36a2aac82be7512271545073c3f6cc0212  kodi-inputstream-rtmp-3.4.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
index e850be40ff..6029b7d35c 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_RTMP_VERSION = 2.0.9-Leia
+KODI_INPUTSTREAM_RTMP_VERSION = 3.4.0-Matrix
 KODI_INPUTSTREAM_RTMP_SITE = $(call github,xbmc,inputstream.rtmp,$(KODI_INPUTSTREAM_RTMP_VERSION))
 KODI_INPUTSTREAM_RTMP_LICENSE = GPL-2.0+
-KODI_INPUTSTREAM_RTMP_LICENSE_FILES = debian/copyright
-KODI_INPUTSTREAM_RTMP_DEPENDENCIES = kodi rtmpdump
+KODI_INPUTSTREAM_RTMP_LICENSE_FILES = LICENSE.md
+KODI_INPUTSTREAM_RTMP_DEPENDENCIES = kodi openssl rtmpdump zlib
 
 $(eval $(cmake-package))
