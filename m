From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 28 Sep 2018 23:22:07 +0200
Subject: [Buildroot] [PATCH 1/1] mosquitto: security bump to version 1.5.3
Message-ID: <20180928212207.21878-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix CVE-2018-12543. If a message is sent to Mosquitto with a topic that
begins with $, but is not $SYS, then an assert that should be unreachable is
triggered and Mosquitto will exit.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mosquitto/mosquitto.hash | 2 +-
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 96817d464d..b38830b8b5 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking gpg signature
-sha256 8557bc7ae34dfaf32a0fb56d2491b7a7f731269c88337227233013502df4d5b0  mosquitto-1.5.1.tar.gz
+sha256 3081a998d303a883b1cd064009beabc88aa9159e26f5258a4ae6007160491d10  mosquitto-1.5.3.tar.gz
 
 # License files
 sha256 cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 7ac6487488..1d72f9b16e 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.5.1
+MOSQUITTO_VERSION = 1.5.3
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
-- 
2.17.1
