From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 27 Jan 2017 12:04:26 -0500
Subject: [Buildroot] [PATCH 1/1] pjsip: bump to version 2.6
Message-ID: <20170127170426.19010-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In addition, --disable-webrtc has been changed to --disable-libwebrtc
in the aconfigure file.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/libpjsip/libpjsip.hash |  6 +++---
 package/libpjsip/libpjsip.mk   | 10 ++--------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index 9976065..ec636a8 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,5 +1,5 @@
-# From http://www.pjsip.org/release/2.5.5/MD5SUM.TXT
-md5	183f7144b9aa238884243c0fc52ece36  pjproject-2.5.5.tar.bz2
+# From http://www.pjsip.org/release/2.6/MD5SUM.TXT
+md5	c347a672679e7875ce572e18517884b2  pjproject-2.6.tar.bz2
 
 # Locally computed
-sha256	ab39207b761d3485199cd881410afeb2d171dff7c2bf75e8caae91c6dca508f3	pjproject-2.5.5.tar.bz2
+sha256	2f5a1da1c174d845871c758bd80fbb580fca7799d3cfaa0d3c4e082b5161c7b4	pjproject-2.6.tar.bz2
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index eb50f00..f8adf5f 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -1,10 +1,4 @@
-################################################################################
-#
-# libpjsip
-#
-################################################################################
-
-LIBPJSIP_VERSION = 2.5.5
+LIBPJSIP_VERSION = 2.6
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.bz2
 LIBPJSIP_SITE = http://www.pjsip.org/release/$(LIBPJSIP_VERSION)
 LIBPJSIP_DEPENDENCIES = libsrtp
@@ -34,7 +28,7 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-opencore-amr \
 	--disable-g7221-codec \
 	--disable-ilbc-codec \
-	--disable-webrtc \
+	--disable-libwebrtc \
 	--disable-opus \
 	--disable-oss \
 	--disable-ext-sound \
-- 
2.9.3
