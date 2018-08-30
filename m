From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 30 Aug 2018 18:38:26 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] domoticz: do not use static version of openssl
Message-ID: <20180830163826.5397-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to the dependency on mosquitto, domoticz depends on !BR2_STATIC_LIBS
so set USE_OPENSSL_STATIC to OFF (default value is ON)

This parameter has been added in release 4.9700.

Fixes:
 - http://autobuild.buildroot.net/results/b1b84b8c12d31b9242b5732fcdd1eb76b1217366

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Update commit message: build failure was reproduced and this patch is
   correctly fixing it

 package/domoticz/domoticz.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 3d6cae4746..7f094d0976 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -19,8 +19,10 @@ DOMOTICZ_DEPENDENCIES = \
 	zlib
 
 # Due to the dependency on mosquitto, domoticz depends on
-# !BR2_STATIC_LIBS so set USE_STATIC_BOOST to OFF
-DOMOTICZ_CONF_OPTS += -DUSE_STATIC_BOOST=OFF
+# !BR2_STATIC_LIBS so set USE_STATIC_BOOST and USE_OPENSSL_STATIC to OFF
+DOMOTICZ_CONF_OPTS += \
+	-DUSE_STATIC_BOOST=OFF \
+	-DUSE_OPENSSL_STATIC=OFF
 
 # Do not use any built-in libraries which are enabled by default for
 # lua, sqlite and mqtt
-- 
2.14.1
