From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 17:35:07 +0100
Subject: [Buildroot] [git commit] package/paho-mqtt-cpp: drop cmake
 workaround
Message-ID: <20210126164409.E0B0C81620@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=010d56bad233234e270ff27635e4e27692a30f0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop workaround for cmake < 3.10 (not needed since commit
d4773b610a40be1d3ac7d793033abaf4eb2491ed)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/paho-mqtt-cpp/paho-mqtt-cpp.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
index bf1c4a27b7..161e53d484 100644
--- a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
@@ -11,10 +11,6 @@ PAHO_MQTT_CPP_LICENSE_FILES = epl-v10 edl-v10
 PAHO_MQTT_CPP_INSTALL_STAGING = YES
 PAHO_MQTT_CPP_DEPENDENCIES = paho-mqtt-c
 
-# The following CMake variable disables a TRY_RUN call in the -pthread
-# test which is not allowed when cross-compiling (for cmake < 3.10)
-PAHO_MQTT_CPP_CONF_OPTS = -DTHREADS_PTHREAD_ARG=OFF
-
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PAHO_MQTT_CPP_DEPENDENCIES += openssl
 PAHO_MQTT_CPP_CONF_OPTS += -DPAHO_WITH_SSL=TRUE
