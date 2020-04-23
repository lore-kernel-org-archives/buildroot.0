From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Apr 2020 22:56:08 +0200
Subject: [Buildroot] [git commit] package/paho-mqtt-c: fix bump to version
 1.3.2
Message-ID: <20200423204312.302008FDD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a078ef054896758ad90abb7619be2347fef062c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit e69b8ddd43292b03b8f30f748ee2279b8df64c47 bumped paho-mqtt-c to
version 1.3.2 but hash was wrong moreover licence has changed to EPL-2.0
since
https://github.com/eclipse/paho.mqtt.c/commit/1e91229cb6403e3a9b02dfdc11c71b04c0518cff

So fix that and add LICENSE to the list of license files

Fixes:
 - http://autobuild.buildroot.org/results/7ea1791778053613e9ef6b146dbd1992a0f63dc6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/paho-mqtt-c/paho-mqtt-c.hash | 5 +++--
 package/paho-mqtt-c/paho-mqtt-c.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
index 80231c762a..8f6ca61480 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.hash
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -1,4 +1,5 @@
 # Locally computed:
-sha256  c2d74a37c8e23d6eef229db0e04cb8e511571562668808e02d836e82d5bbd0ae  paho-mqtt-c-1.3.2.tar.gz
+sha256  c426334c2ffc9f7a230e3de5162bdbc1762f8f60ffe27460e553edb74c7e0681  paho-mqtt-c-1.3.2.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
-sha256  44277b2bec6093e4ac313afec251a4de599d24c4e768f8574d95b13a9d2d97b5  epl-v10
+sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
+sha256  99d3a5c5cc2812f0593a85ec7c1b6dd83e8477b5090c01d9de0d49d49f367a4a  LICENSE
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index 49d5be3777..7cace9a607 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -6,8 +6,8 @@
 
 PAHO_MQTT_C_VERSION = 1.3.2
 PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,v$(PAHO_MQTT_C_VERSION))
-PAHO_MQTT_C_LICENSE = EPL-1.0 or BSD-3-Clause
-PAHO_MQTT_C_LICENSE_FILES = epl-v10 edl-v10
+PAHO_MQTT_C_LICENSE = EPL-2.0 or BSD-3-Clause
+PAHO_MQTT_C_LICENSE_FILES = epl-v20 edl-v10 LICENSE
 PAHO_MQTT_C_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
