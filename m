From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 15 Nov 2008 22:06:05 +0100
Subject: [Buildroot] [PATCH 1/2] package/audio: rename audio category to
	multimedia
Message-ID: <200811152206.05850.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Prepare for the merge of audio and video packages. Many packages cannot
properly be assigned to either audio or video, because they have support
for both (libogg, mplayer, vlc).

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 package/Config.in                                  |    4 ++--
 package/audio/Config.in                            |   15 ---------------
 package/audio/audio.mk                             |    1 -
 package/audio/festival/festival.mk                 |    4 ----
 package/multimedia/Config.in                       |   15 +++++++++++++++
 package/{audio => multimedia}/alsa-lib/Config.in   |    0
 package/{audio => multimedia}/alsa-lib/alsa-lib.mk |    2 +-
 package/{audio => multimedia}/alsa-utils/Config.in |    0
 .../{audio => multimedia}/alsa-utils/alsa-utils.mk |    2 +-
 package/{audio => multimedia}/asterisk/Config.in   |    0
 package/{audio => multimedia}/asterisk/asterisk.mk |    2 +-
 .../asterisk/asterisk_no_res_ninit.patch           |    0
 package/{audio => multimedia}/aumix/Config.in      |    0
 package/{audio => multimedia}/aumix/aumix.mk       |    0
 package/{audio => multimedia}/festival/Config.in   |    6 +++---
 package/multimedia/festival/festival.mk            |    4 ++++
 .../festival/festival/festival-1.96-beta-doc.patch |    0
 .../festival/festival-1.96-beta-etcsiteinit.patch  |    0
 .../festival/festival-1.96-beta-libdir.patch       |    0
 .../festival-1.96-beta-speechtools-dir.patch       |    0
 .../festival/festival/festival.mk                  |    2 +-
 .../festival/lexicons/Config.in                    |    0
 .../festival/lexicons/festlex.mk                   |    0
 .../festival/speech-tools/Config.in                |    0
 .../speech-tools-1.2.96-beta-install.patch         |    0
 .../festival/speech-tools/speech-tools.mk          |    2 +-
 .../festival/voices/Config.in                      |    0
 .../festival/voices/festvox.mk                     |    0
 package/{audio => multimedia}/libid3tag/Config.in  |    0
 .../{audio => multimedia}/libid3tag/libid3tag.mk   |    2 +-
 package/{audio => multimedia}/libmad/Config.in     |    0
 .../libmad/libmad-0.15.1b-optimization.patch.avr32 |    0
 package/{audio => multimedia}/libmad/libmad.mk     |    4 ++--
 package/{audio => multimedia}/libogg/Config.in     |    0
 package/{audio => multimedia}/libogg/libogg.mk     |    2 +-
 package/{audio => multimedia}/libsndfile/Config.in |    0
 .../libsndfile/libsndfile-srconly.patch            |    0
 .../{audio => multimedia}/libsndfile/libsndfile.mk |    2 +-
 package/{audio => multimedia}/libvorbis/Config.in  |    0
 .../{audio => multimedia}/libvorbis/libvorbis.mk   |    0
 package/{audio => multimedia}/madplay/Config.in    |    0
 package/{audio => multimedia}/madplay/madplay.mk   |    2 +-
 package/{audio => multimedia}/mpg123/Config.in     |    0
 .../mpg123/mpg123-0.59r-cross.patch                |    0
 package/{audio => multimedia}/mpg123/mpg123.mk     |    2 +-
 package/multimedia/multimedia.mk                   |    1 +
 package/{audio => multimedia}/speex/Config.in      |    0
 package/{audio => multimedia}/speex/speex.mk       |    2 +-
 48 files changed, 38 insertions(+), 38 deletions(-)
 delete mode 100644 package/audio/Config.in
 delete mode 100644 package/audio/audio.mk
 delete mode 100644 package/audio/festival/festival.mk
 create mode 100644 package/multimedia/Config.in
 rename package/{audio => multimedia}/alsa-lib/Config.in (100%)
 rename package/{audio => multimedia}/alsa-lib/alsa-lib.mk (96%)
 rename package/{audio => multimedia}/alsa-utils/Config.in (100%)
 rename package/{audio => multimedia}/alsa-utils/alsa-utils.mk (96%)
 rename package/{audio => multimedia}/asterisk/Config.in (100%)
 rename package/{audio => multimedia}/asterisk/asterisk.mk (97%)
 rename package/{audio => multimedia}/asterisk/asterisk_no_res_ninit.patch (100%)
 rename package/{audio => multimedia}/aumix/Config.in (100%)
 rename package/{audio => multimedia}/aumix/aumix.mk (100%)
 rename package/{audio => multimedia}/festival/Config.in (63%)
 create mode 100644 package/multimedia/festival/festival.mk
 rename package/{audio => multimedia}/festival/festival/festival-1.96-beta-doc.patch (100%)
 rename package/{audio => multimedia}/festival/festival/festival-1.96-beta-etcsiteinit.patch (100%)
 rename package/{audio => multimedia}/festival/festival/festival-1.96-beta-libdir.patch (100%)
 rename package/{audio => multimedia}/festival/festival/festival-1.96-beta-speechtools-dir.patch (100%)
 rename package/{audio => multimedia}/festival/festival/festival.mk (90%)
 rename package/{audio => multimedia}/festival/lexicons/Config.in (100%)
 rename package/{audio => multimedia}/festival/lexicons/festlex.mk (100%)
 rename package/{audio => multimedia}/festival/speech-tools/Config.in (100%)
 rename package/{audio => multimedia}/festival/speech-tools/speech-tools-1.2.96-beta-install.patch (100%)
 rename package/{audio => multimedia}/festival/speech-tools/speech-tools.mk (89%)
 rename package/{audio => multimedia}/festival/voices/Config.in (100%)
 rename package/{audio => multimedia}/festival/voices/festvox.mk (100%)
 rename package/{audio => multimedia}/libid3tag/Config.in (100%)
 rename package/{audio => multimedia}/libid3tag/libid3tag.mk (95%)
 rename package/{audio => multimedia}/libmad/Config.in (100%)
 rename package/{audio => multimedia}/libmad/libmad-0.15.1b-optimization.patch.avr32 (100%)
 rename package/{audio => multimedia}/libmad/libmad.mk (92%)
 rename package/{audio => multimedia}/libogg/Config.in (100%)
 rename package/{audio => multimedia}/libogg/libogg.mk (87%)
 rename package/{audio => multimedia}/libsndfile/Config.in (100%)
 rename package/{audio => multimedia}/libsndfile/libsndfile-srconly.patch (100%)
 rename package/{audio => multimedia}/libsndfile/libsndfile.mk (96%)
 rename package/{audio => multimedia}/libvorbis/Config.in (100%)
 rename package/{audio => multimedia}/libvorbis/libvorbis.mk (100%)
 rename package/{audio => multimedia}/madplay/Config.in (100%)
 rename package/{audio => multimedia}/madplay/madplay.mk (96%)
 rename package/{audio => multimedia}/mpg123/Config.in (100%)
 rename package/{audio => multimedia}/mpg123/mpg123-0.59r-cross.patch (100%)
 rename package/{audio => multimedia}/mpg123/mpg123.mk (95%)
 create mode 100644 package/multimedia/multimedia.mk
 rename package/{audio => multimedia}/speex/Config.in (100%)
 rename package/{audio => multimedia}/speex/speex.mk (95%)

diff --git a/package/Config.in b/package/Config.in
index a2ff72a..203767d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -268,8 +268,8 @@ source "package/wipe/Config.in"
 source "package/xfsprogs/Config.in"
 endmenu
 
-# Audio support
-source "package/audio/Config.in"
+# Audio/Video support
+source "package/multimedia/Config.in"
 
 menu "Graphic libraries and applications (graphic/text)"
 comment "text rendering libraries"
diff --git a/package/audio/Config.in b/package/audio/Config.in
deleted file mode 100644
index 1a2bbe0..0000000
--- a/package/audio/Config.in
+++ /dev/null
@@ -1,15 +0,0 @@
-menu "Audio libraries and applications"
-source "package/audio/alsa-lib/Config.in"
-source "package/audio/alsa-utils/Config.in"
-source "package/audio/asterisk/Config.in"
-source "package/audio/aumix/Config.in"
-source "package/audio/libid3tag/Config.in"
-source "package/audio/libmad/Config.in"
-source "package/audio/libogg/Config.in"
-source "package/audio/libsndfile/Config.in"
-source "package/audio/libvorbis/Config.in"
-source "package/audio/madplay/Config.in"
-source "package/audio/mpg123/Config.in"
-source "package/audio/speex/Config.in"
-source "package/audio/festival/Config.in"
-endmenu
diff --git a/package/audio/audio.mk b/package/audio/audio.mk
deleted file mode 100644
index 30f43b1..0000000
--- a/package/audio/audio.mk
+++ /dev/null
@@ -1 +0,0 @@
-include package/audio/*/*.mk
diff --git a/package/audio/festival/festival.mk b/package/audio/festival/festival.mk
deleted file mode 100644
index 2842888..0000000
--- a/package/audio/festival/festival.mk
+++ /dev/null
@@ -1,4 +0,0 @@
-include package/audio/festival/speech-tools/speech-tools.mk
-include package/audio/festival/festival/festival.mk
-include package/audio/festival/voices/festvox.mk
-include package/audio/festival/lexicons/festlex.mk
diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
new file mode 100644
index 0000000..acbb2c4
--- /dev/null
+++ b/package/multimedia/Config.in
@@ -0,0 +1,15 @@
+menu "Audio and video libraries and applications"
+source "package/multimedia/alsa-lib/Config.in"
+source "package/multimedia/alsa-utils/Config.in"
+source "package/multimedia/asterisk/Config.in"
+source "package/multimedia/aumix/Config.in"
+source "package/multimedia/libid3tag/Config.in"
+source "package/multimedia/libmad/Config.in"
+source "package/multimedia/libogg/Config.in"
+source "package/multimedia/libsndfile/Config.in"
+source "package/multimedia/libvorbis/Config.in"
+source "package/multimedia/madplay/Config.in"
+source "package/multimedia/mpg123/Config.in"
+source "package/multimedia/speex/Config.in"
+source "package/multimedia/festival/Config.in"
+endmenu
diff --git a/package/audio/alsa-lib/Config.in b/package/multimedia/alsa-lib/Config.in
similarity index 100%
rename from package/audio/alsa-lib/Config.in
rename to package/multimedia/alsa-lib/Config.in
diff --git a/package/audio/alsa-lib/alsa-lib.mk b/package/multimedia/alsa-lib/alsa-lib.mk
similarity index 96%
rename from package/audio/alsa-lib/alsa-lib.mk
rename to package/multimedia/alsa-lib/alsa-lib.mk
index 21953cb..78b0bf2 100644
--- a/package/audio/alsa-lib/alsa-lib.mk
+++ b/package/multimedia/alsa-lib/alsa-lib.mk
@@ -26,7 +26,7 @@ $(DL_DIR)/$(ALSA_LIB_SOURCE):
 
 $(ALSA_LIB_DIR)/.unpacked: $(DL_DIR)/$(ALSA_LIB_SOURCE)
 	$(ALSA_LIB_CAT) $(DL_DIR)/$(ALSA_LIB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(ALSA_LIB_DIR) package/audio/alsa-lib/ alsa-lib-$(ALSA_LIB_VERSION)\*.patch*
+	toolchain/patch-kernel.sh $(ALSA_LIB_DIR) package/multimedia/alsa-lib/ alsa-lib-$(ALSA_LIB_VERSION)\*.patch*
 	$(CONFIG_UPDATE) $(ALSA_LIB_DIR)
 	touch $@
 
diff --git a/package/audio/alsa-utils/Config.in b/package/multimedia/alsa-utils/Config.in
similarity index 100%
rename from package/audio/alsa-utils/Config.in
rename to package/multimedia/alsa-utils/Config.in
diff --git a/package/audio/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
similarity index 96%
rename from package/audio/alsa-utils/alsa-utils.mk
rename to package/multimedia/alsa-utils/alsa-utils.mk
index 094b0ec..65d3413 100644
--- a/package/audio/alsa-utils/alsa-utils.mk
+++ b/package/multimedia/alsa-utils/alsa-utils.mk
@@ -16,7 +16,7 @@ $(DL_DIR)/$(ALSA_UTILS_SOURCE):
 
 $(ALSA_UTILS_DIR)/.unpacked: $(DL_DIR)/$(ALSA_UTILS_SOURCE)
 	$(ALSA_UTILS_CAT) $(DL_DIR)/$(ALSA_UTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(ALSA_UTILS_DIR) package/audio/alsa-utils/ alsa-utils-$(ALSA_UTILS_VERSION)\*.patch\*
+	toolchain/patch-kernel.sh $(ALSA_UTILS_DIR) package/multimedia/alsa-utils/ alsa-utils-$(ALSA_UTILS_VERSION)\*.patch\*
 	$(CONFIG_UPDATE) $(ALSA_UTILS_DIR)
 	touch $@
 
diff --git a/package/audio/asterisk/Config.in b/package/multimedia/asterisk/Config.in
similarity index 100%
rename from package/audio/asterisk/Config.in
rename to package/multimedia/asterisk/Config.in
diff --git a/package/audio/asterisk/asterisk.mk b/package/multimedia/asterisk/asterisk.mk
similarity index 97%
rename from package/audio/asterisk/asterisk.mk
rename to package/multimedia/asterisk/asterisk.mk
index 5c1d4ba..5ff70fb 100644
--- a/package/audio/asterisk/asterisk.mk
+++ b/package/multimedia/asterisk/asterisk.mk
@@ -15,7 +15,7 @@ $(DL_DIR)/$(ASTERISK_SOURCE):
 
 $(ASTERISK_DIR)/.source: $(DL_DIR)/$(ASTERISK_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(ASTERISK_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(ASTERISK_DIR) package/audio/asterisk/ asterisk\*.patch
+	toolchain/patch-kernel.sh $(ASTERISK_DIR) package/multimedia/asterisk/ asterisk\*.patch
 	touch $@
 
 $(ASTERISK_DIR)/.configured: $(ASTERISK_DIR)/.source
diff --git a/package/audio/asterisk/asterisk_no_res_ninit.patch b/package/multimedia/asterisk/asterisk_no_res_ninit.patch
similarity index 100%
rename from package/audio/asterisk/asterisk_no_res_ninit.patch
rename to package/multimedia/asterisk/asterisk_no_res_ninit.patch
diff --git a/package/audio/aumix/Config.in b/package/multimedia/aumix/Config.in
similarity index 100%
rename from package/audio/aumix/Config.in
rename to package/multimedia/aumix/Config.in
diff --git a/package/audio/aumix/aumix.mk b/package/multimedia/aumix/aumix.mk
similarity index 100%
rename from package/audio/aumix/aumix.mk
rename to package/multimedia/aumix/aumix.mk
diff --git a/package/audio/festival/Config.in b/package/multimedia/festival/Config.in
similarity index 63%
rename from package/audio/festival/Config.in
rename to package/multimedia/festival/Config.in
index 4141e7a..0c681d1 100644
--- a/package/audio/festival/Config.in
+++ b/package/multimedia/festival/Config.in
@@ -8,15 +8,15 @@ help
 if BR2_PACKAGE_FESTIVAL
 
 	menu "speech tools"
-		source "package/audio/festival/speech-tools/Config.in"
+		source "package/multimedia/festival/speech-tools/Config.in"
 	endmenu
 
 	menu "festival lexicons"
-		source "package/audio/festival/lexicons/Config.in"
+		source "package/multimedia/festival/lexicons/Config.in"
 	endmenu
 
 	menu "festival voices"
-		source "package/audio/festival/voices/Config.in"
+		source "package/multimedia/festival/voices/Config.in"
 	endmenu
 
 endif
diff --git a/package/multimedia/festival/festival.mk b/package/multimedia/festival/festival.mk
new file mode 100644
index 0000000..445dbc7
--- /dev/null
+++ b/package/multimedia/festival/festival.mk
@@ -0,0 +1,4 @@
+include package/multimedia/festival/speech-tools/speech-tools.mk
+include package/multimedia/festival/festival/festival.mk
+include package/multimedia/festival/voices/festvox.mk
+include package/multimedia/festival/lexicons/festlex.mk
diff --git a/package/audio/festival/festival/festival-1.96-beta-doc.patch b/package/multimedia/festival/festival/festival-1.96-beta-doc.patch
similarity index 100%
rename from package/audio/festival/festival/festival-1.96-beta-doc.patch
rename to package/multimedia/festival/festival/festival-1.96-beta-doc.patch
diff --git a/package/audio/festival/festival/festival-1.96-beta-etcsiteinit.patch b/package/multimedia/festival/festival/festival-1.96-beta-etcsiteinit.patch
similarity index 100%
rename from package/audio/festival/festival/festival-1.96-beta-etcsiteinit.patch
rename to package/multimedia/festival/festival/festival-1.96-beta-etcsiteinit.patch
diff --git a/package/audio/festival/festival/festival-1.96-beta-libdir.patch b/package/multimedia/festival/festival/festival-1.96-beta-libdir.patch
similarity index 100%
rename from package/audio/festival/festival/festival-1.96-beta-libdir.patch
rename to package/multimedia/festival/festival/festival-1.96-beta-libdir.patch
diff --git a/package/audio/festival/festival/festival-1.96-beta-speechtools-dir.patch b/package/multimedia/festival/festival/festival-1.96-beta-speechtools-dir.patch
similarity index 100%
rename from package/audio/festival/festival/festival-1.96-beta-speechtools-dir.patch
rename to package/multimedia/festival/festival/festival-1.96-beta-speechtools-dir.patch
diff --git a/package/audio/festival/festival/festival.mk b/package/multimedia/festival/festival/festival.mk
similarity index 90%
rename from package/audio/festival/festival/festival.mk
rename to package/multimedia/festival/festival/festival.mk
index c5d9493..1762fcf 100644
--- a/package/audio/festival/festival/festival.mk
+++ b/package/multimedia/festival/festival/festival.mk
@@ -17,5 +17,5 @@ FESTIVAL_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX)
 
 FESTIVAL_DEPENDENCIES = uclibc alsa-lib speech-tools
 
-$(eval $(call AUTOTARGETS,package/audio/festival,festival))
+$(eval $(call AUTOTARGETS,package/multimedia/festival,festival))
 
diff --git a/package/audio/festival/lexicons/Config.in b/package/multimedia/festival/lexicons/Config.in
similarity index 100%
rename from package/audio/festival/lexicons/Config.in
rename to package/multimedia/festival/lexicons/Config.in
diff --git a/package/audio/festival/lexicons/festlex.mk b/package/multimedia/festival/lexicons/festlex.mk
similarity index 100%
rename from package/audio/festival/lexicons/festlex.mk
rename to package/multimedia/festival/lexicons/festlex.mk
diff --git a/package/audio/festival/speech-tools/Config.in b/package/multimedia/festival/speech-tools/Config.in
similarity index 100%
rename from package/audio/festival/speech-tools/Config.in
rename to package/multimedia/festival/speech-tools/Config.in
diff --git a/package/audio/festival/speech-tools/speech-tools-1.2.96-beta-install.patch b/package/multimedia/festival/speech-tools/speech-tools-1.2.96-beta-install.patch
similarity index 100%
rename from package/audio/festival/speech-tools/speech-tools-1.2.96-beta-install.patch
rename to package/multimedia/festival/speech-tools/speech-tools-1.2.96-beta-install.patch
diff --git a/package/audio/festival/speech-tools/speech-tools.mk b/package/multimedia/festival/speech-tools/speech-tools.mk
similarity index 89%
rename from package/audio/festival/speech-tools/speech-tools.mk
rename to package/multimedia/festival/speech-tools/speech-tools.mk
index e259a15..c757bf8 100644
--- a/package/audio/festival/speech-tools/speech-tools.mk
+++ b/package/multimedia/festival/speech-tools/speech-tools.mk
@@ -16,5 +16,5 @@ SPEECH_TOOLS_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX)
 
 SPEECH_TOOLS_DEPENDENCIES = uclibc ncurses
 
-$(eval $(call AUTOTARGETS,package/audio/festival,speech-tools))
+$(eval $(call AUTOTARGETS,package/multimedia/festival,speech-tools))
 
diff --git a/package/audio/festival/voices/Config.in b/package/multimedia/festival/voices/Config.in
similarity index 100%
rename from package/audio/festival/voices/Config.in
rename to package/multimedia/festival/voices/Config.in
diff --git a/package/audio/festival/voices/festvox.mk b/package/multimedia/festival/voices/festvox.mk
similarity index 100%
rename from package/audio/festival/voices/festvox.mk
rename to package/multimedia/festival/voices/festvox.mk
diff --git a/package/audio/libid3tag/Config.in b/package/multimedia/libid3tag/Config.in
similarity index 100%
rename from package/audio/libid3tag/Config.in
rename to package/multimedia/libid3tag/Config.in
diff --git a/package/audio/libid3tag/libid3tag.mk b/package/multimedia/libid3tag/libid3tag.mk
similarity index 95%
rename from package/audio/libid3tag/libid3tag.mk
rename to package/multimedia/libid3tag/libid3tag.mk
index 192cf11..3ba4e57 100644
--- a/package/audio/libid3tag/libid3tag.mk
+++ b/package/multimedia/libid3tag/libid3tag.mk
@@ -17,7 +17,7 @@ $(DL_DIR)/$(LIBID3TAG_SOURCE):
 
 $(LIBID3TAG_DIR)/.unpacked: $(DL_DIR)/$(LIBID3TAG_SOURCE)
 	$(LIBID3TAG_CAT) $(DL_DIR)/$(LIBID3TAG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBID3TAG_DIR) package/audio/libid3tag/ libid3tag-$(LIBID3TAG_VERSION)\*.patch\*
+	toolchain/patch-kernel.sh $(LIBID3TAG_DIR) package/multimedia/libid3tag/ libid3tag-$(LIBID3TAG_VERSION)\*.patch\*
 	$(CONFIG_UPDATE) $(LIBID3TAG_DIR)
 	touch $@
 
diff --git a/package/audio/libmad/Config.in b/package/multimedia/libmad/Config.in
similarity index 100%
rename from package/audio/libmad/Config.in
rename to package/multimedia/libmad/Config.in
diff --git a/package/audio/libmad/libmad-0.15.1b-optimization.patch.avr32 b/package/multimedia/libmad/libmad-0.15.1b-optimization.patch.avr32
similarity index 100%
rename from package/audio/libmad/libmad-0.15.1b-optimization.patch.avr32
rename to package/multimedia/libmad/libmad-0.15.1b-optimization.patch.avr32
diff --git a/package/audio/libmad/libmad.mk b/package/multimedia/libmad/libmad.mk
similarity index 92%
rename from package/audio/libmad/libmad.mk
rename to package/multimedia/libmad/libmad.mk
index 1eb2cb0..c641f9f 100644
--- a/package/audio/libmad/libmad.mk
+++ b/package/multimedia/libmad/libmad.mk
@@ -16,8 +16,8 @@ $(DL_DIR)/$(LIBMAD_SOURCE):
 $(LIBMAD_DIR)/.unpacked: $(DL_DIR)/$(LIBMAD_SOURCE)
 	$(LIBMAD_CAT) $(DL_DIR)/$(LIBMAD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(CONFIG_UPDATE) $(LIBMAD_DIR)
-	toolchain/patch-kernel.sh $(LIBMAD_DIR) package/audio/libmad/ libmad-$(LIBMAD_VERSION)\*.patch
-	toolchain/patch-kernel.sh $(LIBMAD_DIR) package/audio/libmad/ libmad-$(LIBMAD_VERSION)\*.patch.$(ARCH)
+	toolchain/patch-kernel.sh $(LIBMAD_DIR) package/multimedia/libmad/ libmad-$(LIBMAD_VERSION)\*.patch
+	toolchain/patch-kernel.sh $(LIBMAD_DIR) package/multimedia/libmad/ libmad-$(LIBMAD_VERSION)\*.patch.$(ARCH)
 	# Prevent automake from running.
 	(cd $(LIBMAD_DIR); touch -c config* aclocal.m4 Makefile*);
 	touch $@
diff --git a/package/audio/libogg/Config.in b/package/multimedia/libogg/Config.in
similarity index 100%
rename from package/audio/libogg/Config.in
rename to package/multimedia/libogg/Config.in
diff --git a/package/audio/libogg/libogg.mk b/package/multimedia/libogg/libogg.mk
similarity index 87%
rename from package/audio/libogg/libogg.mk
rename to package/multimedia/libogg/libogg.mk
index 12314ad..8ea0835 100644
--- a/package/audio/libogg/libogg.mk
+++ b/package/multimedia/libogg/libogg.mk
@@ -12,4 +12,4 @@ LIBOGG_INSTALL_TARGET = YES
 
 LIBOGG_DEPENDENCIES = uclibc pkgconfig
 
-$(eval $(call AUTOTARGETS,package/audio,libogg))
+$(eval $(call AUTOTARGETS,package/multimedia,libogg))
diff --git a/package/audio/libsndfile/Config.in b/package/multimedia/libsndfile/Config.in
similarity index 100%
rename from package/audio/libsndfile/Config.in
rename to package/multimedia/libsndfile/Config.in
diff --git a/package/audio/libsndfile/libsndfile-srconly.patch b/package/multimedia/libsndfile/libsndfile-srconly.patch
similarity index 100%
rename from package/audio/libsndfile/libsndfile-srconly.patch
rename to package/multimedia/libsndfile/libsndfile-srconly.patch
diff --git a/package/audio/libsndfile/libsndfile.mk b/package/multimedia/libsndfile/libsndfile.mk
similarity index 96%
rename from package/audio/libsndfile/libsndfile.mk
rename to package/multimedia/libsndfile/libsndfile.mk
index d74493f..6378452 100644
--- a/package/audio/libsndfile/libsndfile.mk
+++ b/package/multimedia/libsndfile/libsndfile.mk
@@ -15,7 +15,7 @@ $(DL_DIR)/$(LIBSNDFILE_SOURCE):
 
 $(LIBSNDFILE_DIR)/.unpacked: $(DL_DIR)/$(LIBSNDFILE_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(LIBSNDFILE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBSNDFILE_DIR) package/audio/libsndfile/ \*.patch
+	toolchain/patch-kernel.sh $(LIBSNDFILE_DIR) package/multimedia/libsndfile/ \*.patch
 	$(CONFIG_UPDATE) $(LIBSNDFILE_DIR)
 	touch $@
 
diff --git a/package/audio/libvorbis/Config.in b/package/multimedia/libvorbis/Config.in
similarity index 100%
rename from package/audio/libvorbis/Config.in
rename to package/multimedia/libvorbis/Config.in
diff --git a/package/audio/libvorbis/libvorbis.mk b/package/multimedia/libvorbis/libvorbis.mk
similarity index 100%
rename from package/audio/libvorbis/libvorbis.mk
rename to package/multimedia/libvorbis/libvorbis.mk
diff --git a/package/audio/madplay/Config.in b/package/multimedia/madplay/Config.in
similarity index 100%
rename from package/audio/madplay/Config.in
rename to package/multimedia/madplay/Config.in
diff --git a/package/audio/madplay/madplay.mk b/package/multimedia/madplay/madplay.mk
similarity index 96%
rename from package/audio/madplay/madplay.mk
rename to package/multimedia/madplay/madplay.mk
index 9480994..e811545 100644
--- a/package/audio/madplay/madplay.mk
+++ b/package/multimedia/madplay/madplay.mk
@@ -23,7 +23,7 @@ $(DL_DIR)/$(MADPLAY_SOURCE):
 
 $(MADPLAY_DIR)/.unpacked: $(DL_DIR)/$(MADPLAY_SOURCE)
 	$(MADPLAY_CAT) $(DL_DIR)/$(MADPLAY_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MADPLAY_DIR) package/audio/madplay madplay\*.patch\*
+	toolchain/patch-kernel.sh $(MADPLAY_DIR) package/multimedia/madplay madplay\*.patch\*
 	$(CONFIG_UPDATE) $(MADPLAY_DIR)
 	touch $@
 
diff --git a/package/audio/mpg123/Config.in b/package/multimedia/mpg123/Config.in
similarity index 100%
rename from package/audio/mpg123/Config.in
rename to package/multimedia/mpg123/Config.in
diff --git a/package/audio/mpg123/mpg123-0.59r-cross.patch b/package/multimedia/mpg123/mpg123-0.59r-cross.patch
similarity index 100%
rename from package/audio/mpg123/mpg123-0.59r-cross.patch
rename to package/multimedia/mpg123/mpg123-0.59r-cross.patch
diff --git a/package/audio/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
similarity index 95%
rename from package/audio/mpg123/mpg123.mk
rename to package/multimedia/mpg123/mpg123.mk
index a56b690..3fab257 100644
--- a/package/audio/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -23,7 +23,7 @@ $(DL_DIR)/$(MPG123_SOURCE):
 
 $(MPG123_DIR)/.unpacked: $(DL_DIR)/$(MPG123_SOURCE)
 	$(MPG123_CAT) $(DL_DIR)/$(MPG123_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MPG123_DIR) package/audio/mpg123/ mpg123-$(MPG123_VERSION)\*.patch
+	toolchain/patch-kernel.sh $(MPG123_DIR) package/multimedia/mpg123/ mpg123-$(MPG123_VERSION)\*.patch
 	$(CONFIG_UPDATE) $(MPG123_DIR)/build
 	touch $@
 
diff --git a/package/multimedia/multimedia.mk b/package/multimedia/multimedia.mk
new file mode 100644
index 0000000..843f30e
--- /dev/null
+++ b/package/multimedia/multimedia.mk
@@ -0,0 +1 @@
+include package/multimedia/*/*.mk
diff --git a/package/audio/speex/Config.in b/package/multimedia/speex/Config.in
similarity index 100%
rename from package/audio/speex/Config.in
rename to package/multimedia/speex/Config.in
diff --git a/package/audio/speex/speex.mk b/package/multimedia/speex/speex.mk
similarity index 95%
rename from package/audio/speex/speex.mk
rename to package/multimedia/speex/speex.mk
index 516781c..7473557 100644
--- a/package/audio/speex/speex.mk
+++ b/package/multimedia/speex/speex.mk
@@ -22,7 +22,7 @@ ifeq ($(BR2_PACKAGE_SPEEX_ARM5E),y)
 	SPEEX_CONF_OPT += --enable-arm5e-asm
 endif
 
-$(eval $(call AUTOTARGETS,package/audio,speex))
+$(eval $(call AUTOTARGETS,package/multimedia,speex))
 
 $(SPEEX_TARGET_BUILD): $(SPEEX_TARGET_CONFIGURE)
 	$(call MESSAGE,"Building")
-- 
1.6.0.4.620.g87fa
