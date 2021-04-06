From: Titouan Christophe <titouanchristophe@gmail.com>
Date: Tue,  6 Apr 2021 13:16:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: security bump to v2.0.10
Message-ID: <20210406111613.253507-1-titouanchristophe@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Versions 2.0.10 of Mosquitto has been released. This is a security and bugfix release.

CVE-xxxx-xxxx: If an authenticated client connected with MQTT v5 sent a malformed
CONNACK message to the broker a NULL pointer dereference occurred, most likely
resulting in a segfault. This will be updated with the CVE number when it is assigned.
Affects versions 2.0.0 to 2.0.9 inclusive.

See the announcement: https://mosquitto.org/blog/2021/04/version-2-0-10-released/

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/mosquitto/mosquitto.hash | 4 ++--
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index e2c5181223..aa052979ff 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-2.0.9.tar.gz.asc
-sha256  1b8553ef64a1cf5e4f4cfbe098330ae612adccd3d37f35b2db6f6fab501b01d4  mosquitto-2.0.9.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-2.0.10.tar.gz.asc
+sha256  0188f7b21b91d6d80e992b8d6116ba851468b3bd154030e8a003ed28fb6f4a44  mosquitto-2.0.10.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index d1699ab860..7820e8fea5 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.9
+MOSQUITTO_VERSION = 2.0.10
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
-- 
2.25.3
