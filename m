From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 15 Nov 2008 22:06:13 +0100
Subject: [Buildroot] [PATCH 2/2] mplayer, vlc: move into multimedia category
Message-ID: <200811152206.13831.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 package/Config.in                                  |    4 ----
 package/multimedia/Config.in                       |    2 ++
 package/{ => multimedia}/mplayer/Config.in         |    0
 .../mplayer/mplayer-1.0rc1-atmel.3.patch           |    0
 .../mplayer/mplayer-1.0rc1-index.patch             |    0
 package/{ => multimedia}/mplayer/mplayer.mk        |    2 +-
 package/{ => multimedia}/vlc/Config.in             |    0
 package/{ => multimedia}/vlc/vlc.mk                |    2 +-
 8 files changed, 4 insertions(+), 6 deletions(-)
 rename package/{ => multimedia}/mplayer/Config.in (100%)
 rename package/{ => multimedia}/mplayer/mplayer-1.0rc1-atmel.3.patch (100%)
 rename package/{ => multimedia}/mplayer/mplayer-1.0rc1-index.patch (100%)
 rename package/{ => multimedia}/mplayer/mplayer.mk (95%)
 rename package/{ => multimedia}/vlc/Config.in (100%)
 rename package/{ => multimedia}/vlc/vlc.mk (88%)

diff --git a/package/Config.in b/package/Config.in
index 203767d..2e842fb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -381,10 +381,6 @@ source "package/x11vnc/Config.in"
 source "package/xpdf/Config.in"
 source "package/xstroke/Config.in"
 source "package/xvkbd/Config.in"
-
-comment "Video libraries/codecs and applications"
-source "package/mplayer/Config.in"
-source "package/vlc/Config.in"
 endmenu
 
 menu "Compressors / decompressors"
diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index acbb2c4..4568a51 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -10,6 +10,8 @@ source "package/multimedia/libsndfile/Config.in"
 source "package/multimedia/libvorbis/Config.in"
 source "package/multimedia/madplay/Config.in"
 source "package/multimedia/mpg123/Config.in"
+source "package/multimedia/mplayer/Config.in"
 source "package/multimedia/speex/Config.in"
 source "package/multimedia/festival/Config.in"
+source "package/multimedia/vlc/Config.in"
 endmenu
diff --git a/package/mplayer/Config.in b/package/multimedia/mplayer/Config.in
similarity index 100%
rename from package/mplayer/Config.in
rename to package/multimedia/mplayer/Config.in
diff --git a/package/mplayer/mplayer-1.0rc1-atmel.3.patch b/package/multimedia/mplayer/mplayer-1.0rc1-atmel.3.patch
similarity index 100%
rename from package/mplayer/mplayer-1.0rc1-atmel.3.patch
rename to package/multimedia/mplayer/mplayer-1.0rc1-atmel.3.patch
diff --git a/package/mplayer/mplayer-1.0rc1-index.patch b/package/multimedia/mplayer/mplayer-1.0rc1-index.patch
similarity index 100%
rename from package/mplayer/mplayer-1.0rc1-index.patch
rename to package/multimedia/mplayer/mplayer-1.0rc1-index.patch
diff --git a/package/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
similarity index 95%
rename from package/mplayer/mplayer.mk
rename to package/multimedia/mplayer/mplayer.mk
index 90217a2..3f32bf6 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -22,7 +22,7 @@ $(DL_DIR)/$(MPLAYER_SOURCE):
 
 $(MPLAYER_DIR)/.unpacked: $(DL_DIR)/$(MPLAYER_SOURCE)
 	$(MPLAYER_CAT) $(DL_DIR)/$(MPLAYER_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MPLAYER_DIR) package/mplayer/ mplayer-$(MPLAYER_VERSION)\*.patch\*
+	toolchain/patch-kernel.sh $(MPLAYER_DIR) package/multimedia/mplayer/ mplayer-$(MPLAYER_VERSION)\*.patch\*
 	$(CONFIG_UPDATE) $(MPLAYER_DIR)
 	touch $@
 
diff --git a/package/vlc/Config.in b/package/multimedia/vlc/Config.in
similarity index 100%
rename from package/vlc/Config.in
rename to package/multimedia/vlc/Config.in
diff --git a/package/vlc/vlc.mk b/package/multimedia/vlc/vlc.mk
similarity index 88%
rename from package/vlc/vlc.mk
rename to package/multimedia/vlc/vlc.mk
index e285fda..b448e94 100644
--- a/package/vlc/vlc.mk
+++ b/package/multimedia/vlc/vlc.mk
@@ -14,5 +14,5 @@ VLC_CONF_OPT =
 
 VLC_DEPENDENCIES = uclibc
 
-$(eval $(call AUTOTARGETS,package,vlc))
+$(eval $(call AUTOTARGETS,package/multimedia,vlc))
 
-- 
1.6.0.4.620.g87fa
