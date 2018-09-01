From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Sep 2018 14:48:54 +0200
Subject: [Buildroot] [git commit] domoticz: do not use static version of
 openssl
Message-ID: <20180901124840.3E6D9813EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19b04d844277467fcd9c605f6b7ee57d979a630a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to the dependency on mosquitto, domoticz depends on !BR2_STATIC_LIBS
so set USE_OPENSSL_STATIC to OFF (default value is ON)

This parameter has been added in release 4.9700.

Fixes:
 - http://autobuild.buildroot.net/results/b1b84b8c12d31b9242b5732fcdd1eb76b1217366

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
