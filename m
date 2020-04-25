From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 25 Apr 2020 15:56:08 -0400
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: disable tests and
 cpack docs
Message-ID: <20200425195608.9627-1-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

paho-mqtt-c by default enables the building of test materials and
install of CPack documentation:

PAHO_ENABLE_TESTING - "Build tests and run"
PAHO_ENABLE_CPACK - "Enable CPack"

Let's disable these to save a couple megabytes and time.  This is
in keeping with the generic settings in pkg-cmake.mk.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/paho-mqtt-c/paho-mqtt-c.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index 7cace9a607..b2d9955ea3 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -10,6 +10,8 @@ PAHO_MQTT_C_LICENSE = EPL-2.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v20 edl-v10 LICENSE
 PAHO_MQTT_C_INSTALL_STAGING = YES
 
+PAHO_MQTT_C_CONF_OPTS += -DPAHO_ENABLE_TESTING=FALSE -DPAHO_ENABLE_CPACK=FALSE
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PAHO_MQTT_C_DEPENDENCIES += openssl
 PAHO_MQTT_C_CONF_OPTS += -DPAHO_WITH_SSL=TRUE
-- 
2.17.1
