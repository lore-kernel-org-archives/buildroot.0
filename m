From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 23 Apr 2012 10:31:37 -0300
Subject: [Buildroot] [PATCH 2/2] mpd: add audiofile support
In-Reply-To: <1335187897-20044-1-git-send-email-gustavo@zacarias.com.ar>
References: <1335187897-20044-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1335187897-20044-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/mpd/Config.in |    7 +++++++
 package/multimedia/mpd/mpd.mk    |    5 +++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
index 27bd309..c7c0cd7 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -30,6 +30,13 @@ config BR2_PACKAGE_MPD_AO
 	help
 	  Enable libao output support.
 
+config BR2_PACKAGE_MPD_AUDIOFILE
+	bool "audiofile"
+	select BR2_PACKAGE_AUDIOFILE
+	help
+	  Enable audiofile input/streaming support.
+	  Select this if you want to play back WAV files.
+
 config BR2_PACKAGE_MPD_PULSEAUDIO
 	bool "pulseaudio"
 	select BR2_PACKAGE_PULSEAUDIO
diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index 095bad6..43d429b 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -21,6 +21,11 @@ MPD_DEPENDENCIES += libao
 MPD_CONF_OPT += --enable-ao
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_AUDIOFILE),y)
+MPD_DEPENDENCIES += audiofile
+MPD_CONF_OPT += --enable-audiofile
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_PULSEAUDIO),y)
 MPD_DEPENDENCIES += pulseaudio
 MPD_CONF_OPT += --enable-pulse
-- 
1.7.3.4
