From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Aug 2020 11:27:21 +0200
Subject: [Buildroot] [git commit] package/bluez-alsa: update gcc 10 patch
Message-ID: <20200816092111.4EAFB7FAA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b25fd13c71682ce720ab0383c8efbf65f006852
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update patch by adding the missing update on src/ofono-iface.h from
https://github.com/Arkq/bluez-alsa/commit/30a23dd7ce9b00c702fa48545f6b03038f9e17c6

Fixes:
 - http://autobuild.buildroot.org/results/9200bdab254e24ecacd345c00216a3d87c014dfc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-fix-build-issue-with-gcc-10.patch         | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/package/bluez-alsa/0001-fix-build-issue-with-gcc-10.patch b/package/bluez-alsa/0001-fix-build-issue-with-gcc-10.patch
index 65a67c35c5..b0b1f72721 100644
--- a/package/bluez-alsa/0001-fix-build-issue-with-gcc-10.patch
+++ b/package/bluez-alsa/0001-fix-build-issue-with-gcc-10.patch
@@ -10,6 +10,8 @@ does not apply on current used version in buildroot.
 [1] https://github.com/Arkq/bluez-alsa/commit/30a23dd7ce9b00c702fa48545f6b03038f9e17c6
 
 Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+[Fabrice: also update src/ofono-iface.h]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/bluealsa-dbus.c  | 4 ++++
  src/bluealsa-iface.c | 2 ++
@@ -113,6 +115,26 @@ index cfdbff8..190101e 100644
  /**
   * Structure describing registered D-Bus object. */
  struct dbus_object_data {
+ diff --git a/src/ofono-iface.h b/src/ofono-iface.h
+index d5a6715..d5b9065 100644
+--- a/src/ofono-iface.h
++++ b/src/ofono-iface.h
+@@ -1,6 +1,6 @@
+ /*
+  * BlueALSA - ofono-iface.h
+- * Copyright (c) 2016-2019 Arkadiusz Bokowy
++ * Copyright (c) 2016-2020 Arkadiusz Bokowy
+  *               2018 Thierry Bultel
+  *
+  * This file is a part of bluez-alsa.
+@@ -27,6 +27,6 @@
+ #define OFONO_AUDIO_CODEC_CVSD 0x01
+ #define OFONO_AUDIO_CODEC_MSBC 0x02
+ 
+-const GDBusInterfaceInfo ofono_iface_hf_audio_agent;
++extern const GDBusInterfaceInfo ofono_iface_hf_audio_agent;
+ 
+ #endif
 -- 
 2.20.1
 
