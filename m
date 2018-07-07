From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Jul 2018 18:09:18 +0200
Subject: [Buildroot] [PATCH 1/1] domoticz: remove DOMOTICZ_CXXFLAGS
Message-ID: <20180707160918.1335-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 6be346cec40dda8ab762e11471fa6ff951fdbfa0,
DOMOTICZ_CXXFLAGS is not set anymore so remove it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/domoticz.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 6421fd0dd5..3d6cae4746 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -27,8 +27,7 @@ DOMOTICZ_CONF_OPTS += -DUSE_STATIC_BOOST=OFF
 DOMOTICZ_CONF_OPTS += \
 	-DUSE_BUILTIN_LUA=OFF \
 	-DUSE_BUILTIN_SQLITE=OFF \
-	-DUSE_BUILTIN_MQTT=OFF \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(DOMOTICZ_CXXFLAGS)"
+	-DUSE_BUILTIN_MQTT=OFF
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 DOMOTICZ_DEPENDENCIES += libusb
-- 
2.14.1
