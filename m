From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Sep 2019 11:29:04 +0200
Subject: [Buildroot] [git commit branch/2019.08.x] package/mosquitto:
 security bump to version 1.6.6
Message-ID: <20190926092451.242118F544@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bdb30be0c91373ed9af9563ce61980ea48ec30f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Fixes a security issue. From the annoncement:

A vulnerability exists in Mosquitto versions 1.5 to 1.6.5 inclusive.

If a client sends a SUBSCRIBE packet containing a topic that consists of
approximately 65400 or more '/' characters, i.e.  the topic hierarchy
separator, then a stack overflow will occur.

The issue is fixed in Mosquitto 1.6.6 and 1.5.9.  Patches for older versions
are available at https://mosquitto.org/files/cve/2019-hier

The fix addresses the problem by restricting the allowed number of topic
hierarchy levels to 200.  An alternative fix is to increase the size of the
stack by a small amount.

https://mosquitto.org/blog/2019/09/version-1-6-6-released/

Also notice that 1.6.5 silently fixed a security issue:

CVE-2019-11778

A vulnerability exists in Mosquitto version 1.6 to 1.6.4 inclusive, known as CVE-2019-11778

If an MQTT v5 client connects to Mosquitto, sets a last will and testament,
sets a will delay interval, sets a session expiry interval, and the will
delay interval is set longer than the session expiry interval, then a use
after free error occurs, which has the potential to cause a crash in some
situations.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c5c106e4e362b7c657cf322e82ce7102e29313a1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 2 +-
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index aa6eeaf13a..23854bd401 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking gpg signature
-sha256 bc71b38b5a26fc7cc772853e5607c657868db9f9a6d2b15e2b677649a0f85d20  mosquitto-1.6.5.tar.gz
+sha256 82676bf4201ff102be1511b56b041a9450fbbfeda40b21aa28be0fee56e8de17  mosquitto-1.6.6.tar.gz
 
 # License files
 sha256 cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index fd8e6df26a..932855107e 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.6.5
+MOSQUITTO_VERSION = 1.6.6
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
