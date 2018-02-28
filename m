From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  1 Mar 2018 00:11:40 +0100
Subject: [Buildroot] [PATCH] mosquitto: security bump to version 1.4.15
Message-ID: <20180228231140.7660-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2017-7651: Unauthenticated clients can send a crafted CONNECT
packet which causes large amounts of memory use in the broker.  If multiple
clients do this, an out of memory situation can occur and the system may
become unresponsive or the broker will be killed by the operating system.

The fix addresses the problem by limiting the permissible size for CONNECT
packet, and by adding a memory_limit configuration option that allows the
broker to self limit the amount of memory it uses.

The hash of new tarball is not (yet) available through download.php, so use
a locally calculated hash.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 4 ++--
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index f6f17aa5ef..91c855cb4e 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,5 +1,5 @@
-# From http://www.eclipse.org/downloads/download.php?file=/mosquitto/source/mosquitto-1.4.14.tar.gz
-sha512 dc75a971354f87deeb79f32435acfae9bc561a1a24a75ee4940a35176ff91758071930d2105d8dee2a090e07527dbfaa5692bece67e03cc87e8b4b8b46f846c2  mosquitto-1.4.14.tar.gz
+# Locally calculated after checking gpg signature
+sha256 7d3b3e245a3b4ec94b05678c8199c806359737949f4cfe0bf936184f6ca89a83  mosquitto-1.4.15.tar.gz
 
 # License files
 sha256 cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index c9b4418d04..ec5fc02f9f 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.4.14
+MOSQUITTO_VERSION = 1.4.15
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
-- 
2.11.0
