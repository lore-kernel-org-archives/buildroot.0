From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  8 May 2020 00:37:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/domoticz: set WITH_LIBUSB
Message-ID: <20200507223720.201764-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use WITH_LIBUSB which is available since version 4.9700 and
https://github.com/domoticz/domoticz/commit/f53817577a834ed0c3fc16458c374aea490be49e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/domoticz.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 5efe86a784..0ceaab87b4 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -38,6 +38,9 @@ DOMOTICZ_CONF_OPTS += \
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 DOMOTICZ_DEPENDENCIES += libusb
+DOMOTICZ_CONF_OPTS += -DWITH_LIBUSB=ON
+else
+DOMOTICZ_CONF_OPTS += -DWITH_LIBUSB=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENZWAVE),y)
-- 
2.26.2
