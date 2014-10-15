From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Wed, 15 Oct 2014 15:18:53 +0200
Subject: [Buildroot] [PATCH v2 7/8] package/mpd: enable support for dsd
In-Reply-To: <1413379134-28918-1-git-send-email-jkrause@posteo.de>
References: <1413379134-28918-1-git-send-email-jkrause@posteo.de>
Message-ID: <1413379134-28918-7-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
Changes v1 -> v2:
  - none
---
 package/mpd/Config.in | 6 ++++++
 package/mpd/mpd.mk    | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 54c023c..f40b3d4 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -62,6 +62,12 @@ config BR2_PACKAGE_MPD_AUDIOFILE
 		Enable audiofile input/streaming support.
 		Select this if you want to play back WAV files.
 
+config BR2_PACKAGE_MPD_DSD
+	bool "dsd"
+	help
+		Enable Digital Speech Decoder (DSD) support to play audio files encoded
+		in a digital speech format.
+
 config BR2_PACKAGE_MPD_FAAD2
 	bool "faad2"
 	select BR2_PACKAGE_FAAD2
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 476bf0a..3370bc7 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -62,6 +62,12 @@ else
 MPD_CONF_OPTS += --disable-curl
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_DSD),y)
+MPD_CONF_OPTS += --enable-dsd
+else
+MPD_CONF_OPTS += --disable-dsd
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_FAAD2),y)
 MPD_DEPENDENCIES += faad2
 MPD_CONF_OPTS += --enable-aac
-- 
2.1.2
