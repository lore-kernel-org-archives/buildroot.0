From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Fri, 17 Oct 2014 00:29:02 +0200
Subject: [Buildroot] [PATCH v3 7/8] package/mpd: enable support for dsd
In-Reply-To: <1413498543-643-1-git-send-email-jkrause@posteo.de>
References: <1413498543-643-1-git-send-email-jkrause@posteo.de>
Message-ID: <1413498543-643-7-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
Changes v2 -> v3:
  - fix indentation of help text
Changes v1 -> v2:
  - none
---
 package/mpd/Config.in | 6 ++++++
 package/mpd/mpd.mk    | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 4294daf..73bfaf7 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -62,6 +62,12 @@ config BR2_PACKAGE_MPD_AUDIOFILE
 	  Enable audiofile input/streaming support.
 	  Select this if you want to play back WAV files.
 
+config BR2_PACKAGE_MPD_DSD
+	bool "dsd"
+	help
+	  Enable Digital Speech Decoder (DSD) support to play audio files encoded
+	  in a digital speech format.
+
 config BR2_PACKAGE_MPD_FAAD2
 	bool "faad2"
 	select BR2_PACKAGE_FAAD2
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index ef89f3d..4eca183 100644
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
