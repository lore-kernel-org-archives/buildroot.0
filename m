From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 22:53:51 +0100
Subject: [Buildroot] [git commit] package/mpd: enable support for dsd
Message-ID: <20141027220850.B837FB1AB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03c929fc4768774f0fb6a3c27f6a7c5c4b9b6bbf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/Config.in |    6 ++++++
 package/mpd/mpd.mk    |    6 ++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 289b197..98ac2b6 100644
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
