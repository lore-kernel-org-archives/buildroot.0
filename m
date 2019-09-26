From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Sep 2019 11:30:32 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/mosquitto:
 security bump to v1.5.9
Message-ID: <20190926092527.B8917814E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d30a52e9f24ae4d0b540f64915d386e6adf4ab70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

This is a backportport of c5c106e4e362b7c657cf322e82ce7102e29313a1 into 2019.02

If a client sends a SUBSCRIBE packet containing a topic that consists of
approximately 65400 or more '/' characters, i.e.  the topic hierarchy
separator, then a stack overflow will occur.

The issue is fixed in Mosquitto 1.6.6 and 1.5.9.  Patches for older versions
are available at https://mosquitto.org/files/cve/2019-hier

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 2 +-
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 25b9910138..83b521aa83 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking gpg signature
-sha256 78d7e70c3794dc3a1d484b4f2f8d3addebe9c2da3f5a1cebe557f7d13beb0da4  mosquitto-1.5.8.tar.gz
+sha256 d7b62aa0ca680b0d869d6883373903362f98326a6465fc6cd01a0b9e0e8f0333  mosquitto-1.5.9.tar.gz
 
 # License files
 sha256 cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 51c0abd0ba..b6ee048cc6 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.5.8
+MOSQUITTO_VERSION = 1.5.9
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
