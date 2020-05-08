From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 May 2020 12:38:50 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/paho-mqtt-c:
 disable tests and cpack docs
Message-ID: <20200508143236.694B191051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea288b517d16d176d969c3d9f2c7a1eb604de68f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

paho-mqtt-c by default enables the building of test materials and
install of CPack documentation:

PAHO_ENABLE_TESTING - "Build tests and run"
PAHO_ENABLE_CPACK - "Enable CPack"

Let's disable these to save a couple megabytes and time.  This is
in keeping with the generic settings in pkg-cmake.mk.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5686d69eef4cb5d789dade22039937eef445b071)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/paho-mqtt-c/paho-mqtt-c.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index 7cace9a607..6a6b5f3d64 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -10,6 +10,10 @@ PAHO_MQTT_C_LICENSE = EPL-2.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v20 edl-v10 LICENSE
 PAHO_MQTT_C_INSTALL_STAGING = YES
 
+PAHO_MQTT_C_CONF_OPTS = \
+	-DPAHO_ENABLE_TESTING=FALSE \
+	-DPAHO_ENABLE_CPACK=FALSE
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PAHO_MQTT_C_DEPENDENCIES += openssl
 PAHO_MQTT_C_CONF_OPTS += -DPAHO_WITH_SSL=TRUE
