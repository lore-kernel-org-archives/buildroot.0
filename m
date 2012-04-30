From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Apr 2012 10:48:16 -0300
Subject: [Buildroot] [PATCHv3 2/3] package/multimedia: move audio libraries
	out
In-Reply-To: <1335793697-27149-1-git-send-email-gustavo@zacarias.com.ar>
References: <1335793697-27149-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1335793697-27149-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move audio libraries out of the Audio and Video category into the
Libraries/Audio one.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                                  |   20 ++++++++++++++++++++
 package/{multimedia => }/alsa-lib/Config.in        |    0
 .../alsa-lib/alsa-lib-avr32-bad-inline.patch       |    0
 package/{multimedia => }/alsa-lib/alsa-lib.mk      |    0
 package/{multimedia => }/audiofile/Config.in       |    0
 package/{multimedia => }/audiofile/audiofile.mk    |    0
 package/{multimedia => }/libao/Config.in           |    0
 package/{multimedia => }/libao/libao.mk            |    0
 package/{multimedia => }/libcdaudio/Config.in      |    0
 package/{multimedia => }/libcdaudio/libcdaudio.mk  |    0
 package/{multimedia => }/libcue/Config.in          |    0
 .../libcue/libcue-1.4.0-__unused-fix.patch         |    0
 package/{multimedia => }/libcue/libcue.mk          |    0
 package/{multimedia => }/libcuefile/Config.in      |    0
 package/{multimedia => }/libcuefile/libcuefile.mk  |    0
 package/{multimedia => }/libid3tag/Config.in       |    0
 package/{multimedia => }/libid3tag/libid3tag.mk    |    0
 package/{multimedia => }/libmad/Config.in          |    0
 .../libmad-0.15.1b-mips-h-constraint-removal.patch |    0
 .../libmad/libmad-0.15.1b-optimization.patch.avr32 |    0
 .../libmad-0.15.1b-remove-deprecated-cflags.patch  |    0
 package/{multimedia => }/libmad/libmad.mk          |    0
 package/{multimedia => }/libmad/mad.pc             |    0
 package/{multimedia => }/libmpd/Config.in          |    0
 package/{multimedia => }/libmpd/libmpd.mk          |    0
 package/{multimedia => }/libreplaygain/Config.in   |    0
 .../libreplaygain/libreplaygain.mk                 |    0
 package/{multimedia => }/libsamplerate/Config.in   |    0
 .../libsamplerate/libsamplerate.mk                 |    0
 package/{multimedia => }/libsndfile/Config.in      |    0
 .../libsndfile/libsndfile-srconly.patch            |    0
 package/{multimedia => }/libsndfile/libsndfile.mk  |    0
 package/{multimedia => }/libvorbis/Config.in       |    0
 package/{multimedia => }/libvorbis/libvorbis.mk    |    0
 package/multimedia/Config.in                       |   17 -----------------
 package/{multimedia => }/portaudio/Config.in       |    0
 package/{multimedia => }/portaudio/portaudio.mk    |    0
 package/{multimedia => }/speex/Config.in           |    0
 package/{multimedia => }/speex/speex.mk            |    0
 package/{multimedia => }/taglib/Config.in          |    0
 package/{multimedia => }/taglib/taglib.mk          |    0
 package/{multimedia => }/tremor/Config.in          |    0
 package/{multimedia => }/tremor/tremor.mk          |    0
 43 files changed, 20 insertions(+), 17 deletions(-)
 rename package/{multimedia => }/alsa-lib/Config.in (100%)
 rename package/{multimedia => }/alsa-lib/alsa-lib-avr32-bad-inline.patch (100%)
 rename package/{multimedia => }/alsa-lib/alsa-lib.mk (100%)
 rename package/{multimedia => }/audiofile/Config.in (100%)
 rename package/{multimedia => }/audiofile/audiofile.mk (100%)
 rename package/{multimedia => }/libao/Config.in (100%)
 rename package/{multimedia => }/libao/libao.mk (100%)
 rename package/{multimedia => }/libcdaudio/Config.in (100%)
 rename package/{multimedia => }/libcdaudio/libcdaudio.mk (100%)
 rename package/{multimedia => }/libcue/Config.in (100%)
 rename package/{multimedia => }/libcue/libcue-1.4.0-__unused-fix.patch (100%)
 rename package/{multimedia => }/libcue/libcue.mk (100%)
 rename package/{multimedia => }/libcuefile/Config.in (100%)
 rename package/{multimedia => }/libcuefile/libcuefile.mk (100%)
 rename package/{multimedia => }/libid3tag/Config.in (100%)
 rename package/{multimedia => }/libid3tag/libid3tag.mk (100%)
 rename package/{multimedia => }/libmad/Config.in (100%)
 rename package/{multimedia => }/libmad/libmad-0.15.1b-mips-h-constraint-removal.patch (100%)
 rename package/{multimedia => }/libmad/libmad-0.15.1b-optimization.patch.avr32 (100%)
 rename package/{multimedia => }/libmad/libmad-0.15.1b-remove-deprecated-cflags.patch (100%)
 rename package/{multimedia => }/libmad/libmad.mk (100%)
 rename package/{multimedia => }/libmad/mad.pc (100%)
 rename package/{multimedia => }/libmpd/Config.in (100%)
 rename package/{multimedia => }/libmpd/libmpd.mk (100%)
 rename package/{multimedia => }/libreplaygain/Config.in (100%)
 rename package/{multimedia => }/libreplaygain/libreplaygain.mk (100%)
 rename package/{multimedia => }/libsamplerate/Config.in (100%)
 rename package/{multimedia => }/libsamplerate/libsamplerate.mk (100%)
 rename package/{multimedia => }/libsndfile/Config.in (100%)
 rename package/{multimedia => }/libsndfile/libsndfile-srconly.patch (100%)
 rename package/{multimedia => }/libsndfile/libsndfile.mk (100%)
 rename package/{multimedia => }/libvorbis/Config.in (100%)
 rename package/{multimedia => }/libvorbis/libvorbis.mk (100%)
 rename package/{multimedia => }/portaudio/Config.in (100%)
 rename package/{multimedia => }/portaudio/portaudio.mk (100%)
 rename package/{multimedia => }/speex/Config.in (100%)
 rename package/{multimedia => }/speex/speex.mk (100%)
 rename package/{multimedia => }/taglib/Config.in (100%)
 rename package/{multimedia => }/taglib/taglib.mk (100%)
 rename package/{multimedia => }/tremor/Config.in (100%)
 rename package/{multimedia => }/tremor/tremor.mk (100%)

diff --git a/package/Config.in b/package/Config.in
index 48ec61f..e971c25 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -266,6 +266,26 @@ endmenu
 
 menu "Libraries"
 
+menu "Audio/Sound"
+source "package/alsa-lib/Config.in"
+source "package/audiofile/Config.in"
+source "package/libao/Config.in"
+source "package/libcdaudio/Config.in"
+source "package/libcue/Config.in"
+source "package/libcuefile/Config.in"
+source "package/libid3tag/Config.in"
+source "package/libmad/Config.in"
+source "package/libmpd/Config.in"
+source "package/libreplaygain/Config.in"
+source "package/libsamplerate/Config.in"
+source "package/libsndfile/Config.in"
+source "package/libvorbis/Config.in"
+source "package/portaudio/Config.in"
+source "package/speex/Config.in"
+source "package/taglib/Config.in"
+source "package/tremor/Config.in"
+endmenu
+
 menu "Compression and decompression"
 source "package/libarchive/Config.in"
 source "package/lzo/Config.in"
diff --git a/package/multimedia/alsa-lib/Config.in b/package/alsa-lib/Config.in
similarity index 100%
rename from package/multimedia/alsa-lib/Config.in
rename to package/alsa-lib/Config.in
diff --git a/package/multimedia/alsa-lib/alsa-lib-avr32-bad-inline.patch b/package/alsa-lib/alsa-lib-avr32-bad-inline.patch
similarity index 100%
rename from package/multimedia/alsa-lib/alsa-lib-avr32-bad-inline.patch
rename to package/alsa-lib/alsa-lib-avr32-bad-inline.patch
diff --git a/package/multimedia/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
similarity index 100%
rename from package/multimedia/alsa-lib/alsa-lib.mk
rename to package/alsa-lib/alsa-lib.mk
diff --git a/package/multimedia/audiofile/Config.in b/package/audiofile/Config.in
similarity index 100%
rename from package/multimedia/audiofile/Config.in
rename to package/audiofile/Config.in
diff --git a/package/multimedia/audiofile/audiofile.mk b/package/audiofile/audiofile.mk
similarity index 100%
rename from package/multimedia/audiofile/audiofile.mk
rename to package/audiofile/audiofile.mk
diff --git a/package/multimedia/libao/Config.in b/package/libao/Config.in
similarity index 100%
rename from package/multimedia/libao/Config.in
rename to package/libao/Config.in
diff --git a/package/multimedia/libao/libao.mk b/package/libao/libao.mk
similarity index 100%
rename from package/multimedia/libao/libao.mk
rename to package/libao/libao.mk
diff --git a/package/multimedia/libcdaudio/Config.in b/package/libcdaudio/Config.in
similarity index 100%
rename from package/multimedia/libcdaudio/Config.in
rename to package/libcdaudio/Config.in
diff --git a/package/multimedia/libcdaudio/libcdaudio.mk b/package/libcdaudio/libcdaudio.mk
similarity index 100%
rename from package/multimedia/libcdaudio/libcdaudio.mk
rename to package/libcdaudio/libcdaudio.mk
diff --git a/package/multimedia/libcue/Config.in b/package/libcue/Config.in
similarity index 100%
rename from package/multimedia/libcue/Config.in
rename to package/libcue/Config.in
diff --git a/package/multimedia/libcue/libcue-1.4.0-__unused-fix.patch b/package/libcue/libcue-1.4.0-__unused-fix.patch
similarity index 100%
rename from package/multimedia/libcue/libcue-1.4.0-__unused-fix.patch
rename to package/libcue/libcue-1.4.0-__unused-fix.patch
diff --git a/package/multimedia/libcue/libcue.mk b/package/libcue/libcue.mk
similarity index 100%
rename from package/multimedia/libcue/libcue.mk
rename to package/libcue/libcue.mk
diff --git a/package/multimedia/libcuefile/Config.in b/package/libcuefile/Config.in
similarity index 100%
rename from package/multimedia/libcuefile/Config.in
rename to package/libcuefile/Config.in
diff --git a/package/multimedia/libcuefile/libcuefile.mk b/package/libcuefile/libcuefile.mk
similarity index 100%
rename from package/multimedia/libcuefile/libcuefile.mk
rename to package/libcuefile/libcuefile.mk
diff --git a/package/multimedia/libid3tag/Config.in b/package/libid3tag/Config.in
similarity index 100%
rename from package/multimedia/libid3tag/Config.in
rename to package/libid3tag/Config.in
diff --git a/package/multimedia/libid3tag/libid3tag.mk b/package/libid3tag/libid3tag.mk
similarity index 100%
rename from package/multimedia/libid3tag/libid3tag.mk
rename to package/libid3tag/libid3tag.mk
diff --git a/package/multimedia/libmad/Config.in b/package/libmad/Config.in
similarity index 100%
rename from package/multimedia/libmad/Config.in
rename to package/libmad/Config.in
diff --git a/package/multimedia/libmad/libmad-0.15.1b-mips-h-constraint-removal.patch b/package/libmad/libmad-0.15.1b-mips-h-constraint-removal.patch
similarity index 100%
rename from package/multimedia/libmad/libmad-0.15.1b-mips-h-constraint-removal.patch
rename to package/libmad/libmad-0.15.1b-mips-h-constraint-removal.patch
diff --git a/package/multimedia/libmad/libmad-0.15.1b-optimization.patch.avr32 b/package/libmad/libmad-0.15.1b-optimization.patch.avr32
similarity index 100%
rename from package/multimedia/libmad/libmad-0.15.1b-optimization.patch.avr32
rename to package/libmad/libmad-0.15.1b-optimization.patch.avr32
diff --git a/package/multimedia/libmad/libmad-0.15.1b-remove-deprecated-cflags.patch b/package/libmad/libmad-0.15.1b-remove-deprecated-cflags.patch
similarity index 100%
rename from package/multimedia/libmad/libmad-0.15.1b-remove-deprecated-cflags.patch
rename to package/libmad/libmad-0.15.1b-remove-deprecated-cflags.patch
diff --git a/package/multimedia/libmad/libmad.mk b/package/libmad/libmad.mk
similarity index 100%
rename from package/multimedia/libmad/libmad.mk
rename to package/libmad/libmad.mk
diff --git a/package/multimedia/libmad/mad.pc b/package/libmad/mad.pc
similarity index 100%
rename from package/multimedia/libmad/mad.pc
rename to package/libmad/mad.pc
diff --git a/package/multimedia/libmpd/Config.in b/package/libmpd/Config.in
similarity index 100%
rename from package/multimedia/libmpd/Config.in
rename to package/libmpd/Config.in
diff --git a/package/multimedia/libmpd/libmpd.mk b/package/libmpd/libmpd.mk
similarity index 100%
rename from package/multimedia/libmpd/libmpd.mk
rename to package/libmpd/libmpd.mk
diff --git a/package/multimedia/libreplaygain/Config.in b/package/libreplaygain/Config.in
similarity index 100%
rename from package/multimedia/libreplaygain/Config.in
rename to package/libreplaygain/Config.in
diff --git a/package/multimedia/libreplaygain/libreplaygain.mk b/package/libreplaygain/libreplaygain.mk
similarity index 100%
rename from package/multimedia/libreplaygain/libreplaygain.mk
rename to package/libreplaygain/libreplaygain.mk
diff --git a/package/multimedia/libsamplerate/Config.in b/package/libsamplerate/Config.in
similarity index 100%
rename from package/multimedia/libsamplerate/Config.in
rename to package/libsamplerate/Config.in
diff --git a/package/multimedia/libsamplerate/libsamplerate.mk b/package/libsamplerate/libsamplerate.mk
similarity index 100%
rename from package/multimedia/libsamplerate/libsamplerate.mk
rename to package/libsamplerate/libsamplerate.mk
diff --git a/package/multimedia/libsndfile/Config.in b/package/libsndfile/Config.in
similarity index 100%
rename from package/multimedia/libsndfile/Config.in
rename to package/libsndfile/Config.in
diff --git a/package/multimedia/libsndfile/libsndfile-srconly.patch b/package/libsndfile/libsndfile-srconly.patch
similarity index 100%
rename from package/multimedia/libsndfile/libsndfile-srconly.patch
rename to package/libsndfile/libsndfile-srconly.patch
diff --git a/package/multimedia/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
similarity index 100%
rename from package/multimedia/libsndfile/libsndfile.mk
rename to package/libsndfile/libsndfile.mk
diff --git a/package/multimedia/libvorbis/Config.in b/package/libvorbis/Config.in
similarity index 100%
rename from package/multimedia/libvorbis/Config.in
rename to package/libvorbis/Config.in
diff --git a/package/multimedia/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
similarity index 100%
rename from package/multimedia/libvorbis/libvorbis.mk
rename to package/libvorbis/libvorbis.mk
diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 89c5041..895dde6 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -1,7 +1,5 @@
 menu "Audio and video libraries and applications"
-source "package/multimedia/alsa-lib/Config.in"
 source "package/multimedia/alsa-utils/Config.in"
-source "package/multimedia/audiofile/Config.in"
 source "package/multimedia/aumix/Config.in"
 source "package/multimedia/bellagio/Config.in"
 source "package/multimedia/faad2/Config.in"
@@ -16,28 +14,13 @@ source "package/multimedia/gst-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
 source "package/multimedia/lame/Config.in"
-source "package/multimedia/libao/Config.in"
-source "package/multimedia/libcdaudio/Config.in"
-source "package/multimedia/libcue/Config.in"
-source "package/multimedia/libcuefile/Config.in"
-source "package/multimedia/libid3tag/Config.in"
-source "package/multimedia/libmad/Config.in"
-source "package/multimedia/libmpd/Config.in"
-source "package/multimedia/libreplaygain/Config.in"
-source "package/multimedia/libsamplerate/Config.in"
-source "package/multimedia/libsndfile/Config.in"
-source "package/multimedia/libvorbis/Config.in"
 source "package/multimedia/madplay/Config.in"
 source "package/multimedia/mpd/Config.in"
 source "package/multimedia/mpg123/Config.in"
 source "package/multimedia/mplayer/Config.in"
 source "package/multimedia/musepack/Config.in"
-source "package/multimedia/portaudio/Config.in"
 source "package/multimedia/pulseaudio/Config.in"
-source "package/multimedia/speex/Config.in"
 source "package/multimedia/tidsp-binaries/Config.in"
-source "package/multimedia/taglib/Config.in"
-source "package/multimedia/tremor/Config.in"
 source "package/multimedia/vorbis-tools/Config.in"
 source "package/multimedia/wavpack/Config.in"
 endmenu
diff --git a/package/multimedia/portaudio/Config.in b/package/portaudio/Config.in
similarity index 100%
rename from package/multimedia/portaudio/Config.in
rename to package/portaudio/Config.in
diff --git a/package/multimedia/portaudio/portaudio.mk b/package/portaudio/portaudio.mk
similarity index 100%
rename from package/multimedia/portaudio/portaudio.mk
rename to package/portaudio/portaudio.mk
diff --git a/package/multimedia/speex/Config.in b/package/speex/Config.in
similarity index 100%
rename from package/multimedia/speex/Config.in
rename to package/speex/Config.in
diff --git a/package/multimedia/speex/speex.mk b/package/speex/speex.mk
similarity index 100%
rename from package/multimedia/speex/speex.mk
rename to package/speex/speex.mk
diff --git a/package/multimedia/taglib/Config.in b/package/taglib/Config.in
similarity index 100%
rename from package/multimedia/taglib/Config.in
rename to package/taglib/Config.in
diff --git a/package/multimedia/taglib/taglib.mk b/package/taglib/taglib.mk
similarity index 100%
rename from package/multimedia/taglib/taglib.mk
rename to package/taglib/taglib.mk
diff --git a/package/multimedia/tremor/Config.in b/package/tremor/Config.in
similarity index 100%
rename from package/multimedia/tremor/Config.in
rename to package/tremor/Config.in
diff --git a/package/multimedia/tremor/tremor.mk b/package/tremor/tremor.mk
similarity index 100%
rename from package/multimedia/tremor/tremor.mk
rename to package/tremor/tremor.mk
-- 
1.7.3.4
