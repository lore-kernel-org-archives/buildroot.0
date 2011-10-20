From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Oct 2011 17:13:03 +0200
Subject: [Buildroot] [git commit] mpd: add pulseaudio support
Message-ID: <20111020151345.7A9118E311@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bd96e4d70e6318d5865a5b5a6d01a574ff588eb7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mpd/Config.in |    6 ++++++
 package/multimedia/mpd/mpd.mk    |    5 +++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
index 6de1e5b..27bd309 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -30,6 +30,12 @@ config BR2_PACKAGE_MPD_AO
 	help
 	  Enable libao output support.
 
+config BR2_PACKAGE_MPD_PULSEAUDIO
+	bool "pulseaudio"
+	select BR2_PACKAGE_PULSEAUDIO
+	help
+	  Enable pulseaudio output support.
+
 config BR2_PACKAGE_MPD_BZIP2
 	bool "bzip2"
 	select BR2_PACKAGE_BZIP2
diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index 0bf38a2..b29b9f7 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -22,6 +22,11 @@ MPD_DEPENDENCIES += libao
 MPD_CONF_OPT += --enable-ao
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_PULSEAUDIO),y)
+MPD_DEPENDENCIES += pulseaudio
+MPD_CONF_OPT += --enable-pulse
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_BZIP2),y)
 MPD_DEPENDENCIES += bzip2
 MPD_CONF_OPT += --enable-bzip2
