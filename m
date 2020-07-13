From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 13 Jul 2020 18:49:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmpdclient: bump to version 2.19
Message-ID: <20200713164920.1469219-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* fix off-by-one bug in MPD_HOST parser
* add function mpd_lookup_replay_gain_mode()
* identify messages with length over the buffer limit
* support MPD protocol 0.16
 - replay gain
* support MPD protocol 0.19
 - idle events "neighbor" and "mount"
* support MPD protocol 0.20
 - rangeid
* support MPD protocol 0.21
  - command "tagtypes all"

https://raw.githubusercontent.com/MusicPlayerDaemon/libmpdclient/v2.19/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmpdclient/libmpdclient.hash | 4 ++--
 package/libmpdclient/libmpdclient.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmpdclient/libmpdclient.hash b/package/libmpdclient/libmpdclient.hash
index e4456f125c..882a588a88 100644
--- a/package/libmpdclient/libmpdclient.hash
+++ b/package/libmpdclient/libmpdclient.hash
@@ -1,3 +1,3 @@
-# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.18.tar.xz.sig, sha256 locally computed
-sha256  4cb01e1f567e0169aca94875fb6e1200e7f5ce35b63a4df768ec1591fb1081fa  libmpdclient-2.18.tar.xz
+# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.19.tar.xz.sig, sha256 locally computed
+sha256  158aad4c2278ab08e76a3f2b0166c99b39fae00ee17231bd225c5a36e977a189  libmpdclient-2.19.tar.xz
 sha256  9574c3b0a9c31723cc3d5f32af4655a015fff5ec6ec8115b7906cd7d9623cf32  COPYING
diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
index 6e7c5a45a9..a880980a3c 100644
--- a/package/libmpdclient/libmpdclient.mk
+++ b/package/libmpdclient/libmpdclient.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMPDCLIENT_VERSION_MAJOR = 2
-LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).18
+LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).19
 LIBMPDCLIENT_SOURCE = libmpdclient-$(LIBMPDCLIENT_VERSION).tar.xz
 LIBMPDCLIENT_SITE = http://www.musicpd.org/download/libmpdclient/$(LIBMPDCLIENT_VERSION_MAJOR)
 LIBMPDCLIENT_INSTALL_STAGING = YES
-- 
2.27.0
