From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 12:48:47 +0200
Subject: [Buildroot] [git commit] package/mosquitto: bump to v1.6.3
Message-ID: <20190801104619.6A9DD8390E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82e27fd38a97955b1b5a4503093e1a3a14b4c936
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop dependency on libuuid as it got removed in v1.6.  From ChangeLog.txt:

1.6 - 20190417
==============
- Improved general support for broker generated client ids. Removed libuuid
  dependency.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
[Peter: explain why libuuid isn't needed any more]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 2 +-
 package/mosquitto/mosquitto.mk   | 9 +--------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 25b9910138..c6efdabd2a 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking gpg signature
-sha256 78d7e70c3794dc3a1d484b4f2f8d3addebe9c2da3f5a1cebe557f7d13beb0da4  mosquitto-1.5.8.tar.gz
+sha256 9ef5cc75f4fe31d7bf50654ddf4728ad9e1ae2e5609a4b42ecbbcb4a209ed17e  mosquitto-1.6.3.tar.gz
 
 # License files
 sha256 cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 51c0abd0ba..5c849de2ab 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.5.8
+MOSQUITTO_VERSION = 1.6.3
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
@@ -44,13 +44,6 @@ else
 MOSQUITTO_MAKE_OPTS += WITH_SRV=no
 endif
 
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
-MOSQUITTO_DEPENDENCIES += util-linux
-MOSQUITTO_MAKE_OPTS += WITH_UUID=yes
-else
-MOSQUITTO_MAKE_OPTS += WITH_UUID=no
-endif
-
 ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
 MOSQUITTO_DEPENDENCIES += libwebsockets
 MOSQUITTO_MAKE_OPTS += WITH_WEBSOCKETS=yes
