From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 30 Aug 2013 11:05:57 +0200
Subject: [Buildroot] [PATCH] Remove multimedia subdirectory
Message-ID: <1377853557-26832-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unless it was a group of sub-packages, packages was never regrouped by
category. multimedia/ was an exception to this rule.

This patch move packages/multimedia/ sub-directories to packages/. It
keeps two subdirectories for gstream 0.10 and gstreamer 1.X.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/Config.in                                  |   27 +++++++++++-
 package/{multimedia => }/alsa-utils/Config.in      |    0
 package/{multimedia => }/alsa-utils/alsa-utils.mk  |    0
 package/{multimedia => }/aumix/Config.in           |    0
 .../aumix-2.8-fix-incorrect-makefile-am.patch      |    0
 package/{multimedia => }/aumix/aumix.mk            |    0
 package/{multimedia => }/bellagio/Config.in        |    0
 .../bellagio/bellagio-0.9.3-drop-werror.patch      |    0
 .../bellagio-0.9.3-dynamicloader-linking.patch     |    0
 .../bellagio/bellagio-0.9.3-parallel-build.patch   |    0
 ...-0.9.3-segfault-on-removeFromWaitResource.patch |    0
 package/{multimedia => }/bellagio/bellagio.mk      |    0
 package/{multimedia => }/faad2/Config.in           |    0
 package/{multimedia => }/faad2/faad2.mk            |    0
 package/{multimedia => }/ffmpeg/Config.in          |    0
 .../{multimedia => }/ffmpeg/ffmpeg-sdlconfig.patch |    0
 package/{multimedia => }/ffmpeg/ffmpeg.mk          |    0
 package/{multimedia => }/flac/Config.in            |    0
 .../{multimedia => }/flac/flac-no-altivec.patch    |    0
 package/{multimedia => }/flac/flac.mk              |    0
 package/gstreamer/Config.in                        |   11 +++++
 .../{multimedia => gstreamer}/gst-dsp/Config.in    |    0
 .../{multimedia => gstreamer}/gst-dsp/gst-dsp.mk   |    0
 .../{multimedia => gstreamer}/gst-ffmpeg/Config.in |    0
 .../gst-ffmpeg/gst-ffmpeg.mk                       |    0
 .../gst-fsl-plugins/Config.in                      |    0
 ...sl-plugins-0001-gplay-add-missing-include.patch |    0
 ...gins-0002-Fix-bashism-in-configure-script.patch |    0
 .../gst-fsl-plugins-0003-Use-proper-objdump.patch  |    0
 .../gst-fsl-plugins/gst-fsl-plugins.mk             |    0
 .../{multimedia => gstreamer}/gst-omapfb/Config.in |    0
 .../gst-omapfb/gst-omapfb.mk                       |    0
 .../gst-plugin-x170/Config.in                      |    0
 .../gst-plugin-x170-01-correct-CFLAGS.patch        |    0
 .../gst-plugin-x170/gst-plugin-x170.mk             |    0
 .../gst-plugins-bad/Config.in                      |    0
 .../gst-plugins-bad-0002-fix-dfb-example.patch     |    0
 ...d-opus-jpegformat-unbreak-non-debug-build.patch |    0
 .../gst-plugins-bad/gst-plugins-bad.mk             |    0
 .../gst-plugins-base/Config.in                     |    0
 .../gst-plugins-base/gst-plugins-base-tremor.patch |    0
 .../gst-plugins-base/gst-plugins-base.mk           |    0
 .../gst-plugins-good/Config.in                     |    0
 .../gst-plugins-good-linux36.patch                 |    0
 ...-compilation-against-newer-kernel-headers.patch |    0
 .../gst-plugins-good/gst-plugins-good.mk           |    0
 .../gst-plugins-ugly/Config.in                     |    0
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |    0
 package/gstreamer/gstreamer.mk                     |    1 +
 .../{multimedia => gstreamer}/gstreamer/Config.in  |    0
 .../gstreamer/gstreamer.mk                         |    0
 package/gstreamer1/Config.in                       |    7 ++++
 .../{multimedia => gstreamer1}/gst-omx/Config.in   |    0
 .../gst-omx/gst-omx-config-files.patch             |    0
 .../{multimedia => gstreamer1}/gst-omx/gst-omx.mk  |    0
 .../gst1-plugins-bad/Config.in                     |    0
 .../gst1-plugins-bad-use-gettext-0.18.patch        |    0
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |    0
 .../gst1-plugins-base/Config.in                    |    0
 .../gst1-plugins-base/gst1-plugins-base.mk         |    0
 .../gst1-plugins-good/Config.in                    |    0
 ...dpsink-unbreak-on-IPv6-systems-after-1302.patch |    0
 .../gst1-plugins-good/gst1-plugins-good.mk         |    0
 .../gst1-plugins-ugly/Config.in                    |    0
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |    0
 package/gstreamer1/gstreamer1.mk                   |    1 +
 .../gstreamer1/Config.in                           |    0
 .../gstreamer1/gstreamer1.mk                       |    0
 package/{multimedia => }/lame/Config.in            |    0
 package/{multimedia => }/lame/lame.mk              |    0
 package/{multimedia => }/libvpx/Config.in          |    0
 package/{multimedia => }/libvpx/libvpx.mk          |    0
 package/{multimedia => }/madplay/Config.in         |    0
 .../madplay-0.15.2b-switch-to-new-alsa-api.patch   |    0
 package/{multimedia => }/madplay/madplay.mk        |    0
 package/{multimedia => }/mpd/Config.in             |    0
 package/{multimedia => }/mpd/S95mpd                |    0
 package/{multimedia => }/mpd/mpd.conf              |    0
 package/{multimedia => }/mpd/mpd.mk                |    0
 package/{multimedia => }/mpg123/Config.in          |    0
 package/{multimedia => }/mpg123/mpg123.mk          |    0
 package/{multimedia => }/mplayer/Config.in         |    0
 .../mplayer-1.1-disable-install-strip.patch        |    0
 .../mplayer/mplayer-1.1-fix-cc-parsing.patch       |    0
 package/{multimedia => }/mplayer/mplayer.mk        |    0
 package/multimedia/Config.in                       |   44 --------------------
 package/multimedia/multimedia.mk                   |    1 -
 package/{multimedia => }/musepack/Config.in        |    0
 .../musepack/musepack-shared.patch                 |    0
 package/{multimedia => }/musepack/musepack.mk      |    0
 package/{multimedia => }/on2-8170-libs/Config.in   |    0
 .../on2-8170-libs/on2-8170-libs.mk                 |    0
 package/{multimedia => }/pulseaudio/Config.in      |    0
 package/{multimedia => }/pulseaudio/S50pulseaudio  |    0
 package/{multimedia => }/pulseaudio/pulseaudio.mk  |    0
 package/{multimedia => }/tidsp-binaries/Config.in  |    0
 .../tidsp-binaries/tidsp-binaries.mk               |    0
 package/{multimedia => }/vorbis-tools/Config.in    |    0
 .../{multimedia => }/vorbis-tools/vorbis-tools.mk  |    0
 package/{multimedia => }/wavpack/Config.in         |    0
 package/{multimedia => }/wavpack/wavpack.mk        |    0
 101 files changed, 45 insertions(+), 47 deletions(-)
 rename package/{multimedia => }/alsa-utils/Config.in (100%)
 rename package/{multimedia => }/alsa-utils/alsa-utils.mk (100%)
 rename package/{multimedia => }/aumix/Config.in (100%)
 rename package/{multimedia => }/aumix/aumix-2.8-fix-incorrect-makefile-am.patch (100%)
 rename package/{multimedia => }/aumix/aumix.mk (100%)
 rename package/{multimedia => }/bellagio/Config.in (100%)
 rename package/{multimedia => }/bellagio/bellagio-0.9.3-drop-werror.patch (100%)
 rename package/{multimedia => }/bellagio/bellagio-0.9.3-dynamicloader-linking.patch (100%)
 rename package/{multimedia => }/bellagio/bellagio-0.9.3-parallel-build.patch (100%)
 rename package/{multimedia => }/bellagio/bellagio-0.9.3-segfault-on-removeFromWaitResource.patch (100%)
 rename package/{multimedia => }/bellagio/bellagio.mk (100%)
 rename package/{multimedia => }/faad2/Config.in (100%)
 rename package/{multimedia => }/faad2/faad2.mk (100%)
 rename package/{multimedia => }/ffmpeg/Config.in (100%)
 rename package/{multimedia => }/ffmpeg/ffmpeg-sdlconfig.patch (100%)
 rename package/{multimedia => }/ffmpeg/ffmpeg.mk (100%)
 rename package/{multimedia => }/flac/Config.in (100%)
 rename package/{multimedia => }/flac/flac-no-altivec.patch (100%)
 rename package/{multimedia => }/flac/flac.mk (100%)
 create mode 100644 package/gstreamer/Config.in
 rename package/{multimedia => gstreamer}/gst-dsp/Config.in (100%)
 rename package/{multimedia => gstreamer}/gst-dsp/gst-dsp.mk (100%)
 rename package/{multimedia => gstreamer}/gst-ffmpeg/Config.in (100%)
 rename package/{multimedia => gstreamer}/gst-ffmpeg/gst-ffmpeg.mk (100%)
 rename package/{multimedia => gstreamer}/gst-fsl-plugins/Config.in (100%)
 rename package/{multimedia => gstreamer}/gst-fsl-plugins/gst-fsl-plugins-0001-gplay-add-missing-include.patch (100%)
 rename package/{multimedia => gstreamer}/gst-fsl-plugins/gst-fsl-plugins-0002-Fix-bashism-in-configure-script.patch (100%)
 rename package/{multimedia => gstreamer}/gst-fsl-plugins/gst-fsl-plugins-0003-Use-proper-objdump.patch (100%)
 rename package/{multimedia => gstreamer}/gst-fsl-plugins/gst-fsl-plugins.mk (100%)
 rename package/{multimedia => gstreamer}/gst-omapfb/Config.in (100%)
 rename package/{multimedia => gstreamer}/gst-omapfb/gst-omapfb.mk (100%)
 rename package/{multimedia => gstreamer}/gst-plugin-x170/Config.in (100%)
 rename package/{multimedia => gstreamer}/gst-plugin-x170/gst-plugin-x170-01-correct-CFLAGS.patch (100%)
 rename package/{multimedia => gstreamer}/gst-plugin-x170/gst-plugin-x170.mk (100%)
 rename package/{multimedia => gstreamer}/gst-plugins-bad/Config.in (100%)
 rename package/{multimedia => gstreamer}/gst-plugins-bad/gst-plugins-bad-0002-fix-dfb-example.patch (100%)
 rename package/{multimedia => gstreamer}/gst-plugins-bad/gst-plugins-bad-opus-jpegformat-unbreak-non-debug-build.patch (100%)
 rename package/{multimedia => gstreamer}/gst-plugins-bad/gst-plugins-bad.mk (100%)
 rename package/{multimedia => gstreamer}/gst-plugins-base/Config.in (100%)
 rename package/{multimedia => gstreamer}/gst-plugins-base/gst-plugins-base-tremor.patch (100%)
 rename package/{multimedia => gstreamer}/gst-plugins-base/gst-plugins-base.mk (100%)
 rename package/{multimedia => gstreamer}/gst-plugins-good/Config.in (100%)
 rename package/{multimedia => gstreamer}/gst-plugins-good/gst-plugins-good-linux36.patch (100%)
 rename package/{multimedia => gstreamer}/gst-plugins-good/gst-plugins-good-v4l2-fix-compilation-against-newer-kernel-headers.patch (100%)
 rename package/{multimedia => gstreamer}/gst-plugins-good/gst-plugins-good.mk (100%)
 rename package/{multimedia => gstreamer}/gst-plugins-ugly/Config.in (100%)
 rename package/{multimedia => gstreamer}/gst-plugins-ugly/gst-plugins-ugly.mk (100%)
 create mode 100644 package/gstreamer/gstreamer.mk
 rename package/{multimedia => gstreamer}/gstreamer/Config.in (100%)
 rename package/{multimedia => gstreamer}/gstreamer/gstreamer.mk (100%)
 create mode 100644 package/gstreamer1/Config.in
 rename package/{multimedia => gstreamer1}/gst-omx/Config.in (100%)
 rename package/{multimedia => gstreamer1}/gst-omx/gst-omx-config-files.patch (100%)
 rename package/{multimedia => gstreamer1}/gst-omx/gst-omx.mk (100%)
 rename package/{multimedia => gstreamer1}/gst1-plugins-bad/Config.in (100%)
 rename package/{multimedia => gstreamer1}/gst1-plugins-bad/gst1-plugins-bad-use-gettext-0.18.patch (100%)
 rename package/{multimedia => gstreamer1}/gst1-plugins-bad/gst1-plugins-bad.mk (100%)
 rename package/{multimedia => gstreamer1}/gst1-plugins-base/Config.in (100%)
 rename package/{multimedia => gstreamer1}/gst1-plugins-base/gst1-plugins-base.mk (100%)
 rename package/{multimedia => gstreamer1}/gst1-plugins-good/Config.in (100%)
 rename package/{multimedia => gstreamer1}/gst1-plugins-good/gst1-plugins-good-dyn-multi-udpsink-unbreak-on-IPv6-systems-after-1302.patch (100%)
 rename package/{multimedia => gstreamer1}/gst1-plugins-good/gst1-plugins-good.mk (100%)
 rename package/{multimedia => gstreamer1}/gst1-plugins-ugly/Config.in (100%)
 rename package/{multimedia => gstreamer1}/gst1-plugins-ugly/gst1-plugins-ugly.mk (100%)
 create mode 100644 package/gstreamer1/gstreamer1.mk
 rename package/{multimedia => gstreamer1}/gstreamer1/Config.in (100%)
 rename package/{multimedia => gstreamer1}/gstreamer1/gstreamer1.mk (100%)
 rename package/{multimedia => }/lame/Config.in (100%)
 rename package/{multimedia => }/lame/lame.mk (100%)
 rename package/{multimedia => }/libvpx/Config.in (100%)
 rename package/{multimedia => }/libvpx/libvpx.mk (100%)
 rename package/{multimedia => }/madplay/Config.in (100%)
 rename package/{multimedia => }/madplay/madplay-0.15.2b-switch-to-new-alsa-api.patch (100%)
 rename package/{multimedia => }/madplay/madplay.mk (100%)
 rename package/{multimedia => }/mpd/Config.in (100%)
 rename package/{multimedia => }/mpd/S95mpd (100%)
 rename package/{multimedia => }/mpd/mpd.conf (100%)
 rename package/{multimedia => }/mpd/mpd.mk (100%)
 rename package/{multimedia => }/mpg123/Config.in (100%)
 rename package/{multimedia => }/mpg123/mpg123.mk (100%)
 rename package/{multimedia => }/mplayer/Config.in (100%)
 rename package/{multimedia => }/mplayer/mplayer-1.1-disable-install-strip.patch (100%)
 rename package/{multimedia => }/mplayer/mplayer-1.1-fix-cc-parsing.patch (100%)
 rename package/{multimedia => }/mplayer/mplayer.mk (100%)
 delete mode 100644 package/multimedia/Config.in
 delete mode 100644 package/multimedia/multimedia.mk
 rename package/{multimedia => }/musepack/Config.in (100%)
 rename package/{multimedia => }/musepack/musepack-shared.patch (100%)
 rename package/{multimedia => }/musepack/musepack.mk (100%)
 rename package/{multimedia => }/on2-8170-libs/Config.in (100%)
 rename package/{multimedia => }/on2-8170-libs/on2-8170-libs.mk (100%)
 rename package/{multimedia => }/pulseaudio/Config.in (100%)
 rename package/{multimedia => }/pulseaudio/S50pulseaudio (100%)
 rename package/{multimedia => }/pulseaudio/pulseaudio.mk (100%)
 rename package/{multimedia => }/tidsp-binaries/Config.in (100%)
 rename package/{multimedia => }/tidsp-binaries/tidsp-binaries.mk (100%)
 rename package/{multimedia => }/vorbis-tools/Config.in (100%)
 rename package/{multimedia => }/vorbis-tools/vorbis-tools.mk (100%)
 rename package/{multimedia => }/wavpack/Config.in (100%)
 rename package/{multimedia => }/wavpack/wavpack.mk (100%)

diff --git a/package/Config.in b/package/Config.in
index 97cd7da..bdedbb9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2,8 +2,31 @@ menu "Target packages"
 
 source "package/busybox/Config.in"
 
-# Audio and video applications
-source "package/multimedia/Config.in"
+menu "Audio and video applications"
+source "package/alsa-utils/Config.in"
+source "package/aumix/Config.in"
+source "package/bellagio/Config.in"
+source "package/faad2/Config.in"
+source "package/flac/Config.in"
+source "package/ffmpeg/Config.in"
+source "package/gstreamer/Config.in"
+source "package/gstreamer1/Config.in"
+source "package/lame/Config.in"
+source "package/libvpx/Config.in"
+source "package/madplay/Config.in"
+source "package/mpd/Config.in"
+source "package/mpg123/Config.in"
+source "package/mplayer/Config.in"
+source "package/musepack/Config.in"
+source "package/on2-8170-libs/Config.in"
+source "package/opus-tools/Config.in"
+source "package/pulseaudio/Config.in"
+source "package/tidsp-binaries/Config.in"
+source "package/tstools/Config.in"
+source "package/vorbis-tools/Config.in"
+source "package/wavpack/Config.in"
+source "package/yavta/Config.in"
+endmenu
 
 menu "Compressors and decompressors"
 source "package/bzip2/Config.in"
diff --git a/package/multimedia/alsa-utils/Config.in b/package/alsa-utils/Config.in
similarity index 100%
rename from package/multimedia/alsa-utils/Config.in
rename to package/alsa-utils/Config.in
diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
similarity index 100%
rename from package/multimedia/alsa-utils/alsa-utils.mk
rename to package/alsa-utils/alsa-utils.mk
diff --git a/package/multimedia/aumix/Config.in b/package/aumix/Config.in
similarity index 100%
rename from package/multimedia/aumix/Config.in
rename to package/aumix/Config.in
diff --git a/package/multimedia/aumix/aumix-2.8-fix-incorrect-makefile-am.patch b/package/aumix/aumix-2.8-fix-incorrect-makefile-am.patch
similarity index 100%
rename from package/multimedia/aumix/aumix-2.8-fix-incorrect-makefile-am.patch
rename to package/aumix/aumix-2.8-fix-incorrect-makefile-am.patch
diff --git a/package/multimedia/aumix/aumix.mk b/package/aumix/aumix.mk
similarity index 100%
rename from package/multimedia/aumix/aumix.mk
rename to package/aumix/aumix.mk
diff --git a/package/multimedia/bellagio/Config.in b/package/bellagio/Config.in
similarity index 100%
rename from package/multimedia/bellagio/Config.in
rename to package/bellagio/Config.in
diff --git a/package/multimedia/bellagio/bellagio-0.9.3-drop-werror.patch b/package/bellagio/bellagio-0.9.3-drop-werror.patch
similarity index 100%
rename from package/multimedia/bellagio/bellagio-0.9.3-drop-werror.patch
rename to package/bellagio/bellagio-0.9.3-drop-werror.patch
diff --git a/package/multimedia/bellagio/bellagio-0.9.3-dynamicloader-linking.patch b/package/bellagio/bellagio-0.9.3-dynamicloader-linking.patch
similarity index 100%
rename from package/multimedia/bellagio/bellagio-0.9.3-dynamicloader-linking.patch
rename to package/bellagio/bellagio-0.9.3-dynamicloader-linking.patch
diff --git a/package/multimedia/bellagio/bellagio-0.9.3-parallel-build.patch b/package/bellagio/bellagio-0.9.3-parallel-build.patch
similarity index 100%
rename from package/multimedia/bellagio/bellagio-0.9.3-parallel-build.patch
rename to package/bellagio/bellagio-0.9.3-parallel-build.patch
diff --git a/package/multimedia/bellagio/bellagio-0.9.3-segfault-on-removeFromWaitResource.patch b/package/bellagio/bellagio-0.9.3-segfault-on-removeFromWaitResource.patch
similarity index 100%
rename from package/multimedia/bellagio/bellagio-0.9.3-segfault-on-removeFromWaitResource.patch
rename to package/bellagio/bellagio-0.9.3-segfault-on-removeFromWaitResource.patch
diff --git a/package/multimedia/bellagio/bellagio.mk b/package/bellagio/bellagio.mk
similarity index 100%
rename from package/multimedia/bellagio/bellagio.mk
rename to package/bellagio/bellagio.mk
diff --git a/package/multimedia/faad2/Config.in b/package/faad2/Config.in
similarity index 100%
rename from package/multimedia/faad2/Config.in
rename to package/faad2/Config.in
diff --git a/package/multimedia/faad2/faad2.mk b/package/faad2/faad2.mk
similarity index 100%
rename from package/multimedia/faad2/faad2.mk
rename to package/faad2/faad2.mk
diff --git a/package/multimedia/ffmpeg/Config.in b/package/ffmpeg/Config.in
similarity index 100%
rename from package/multimedia/ffmpeg/Config.in
rename to package/ffmpeg/Config.in
diff --git a/package/multimedia/ffmpeg/ffmpeg-sdlconfig.patch b/package/ffmpeg/ffmpeg-sdlconfig.patch
similarity index 100%
rename from package/multimedia/ffmpeg/ffmpeg-sdlconfig.patch
rename to package/ffmpeg/ffmpeg-sdlconfig.patch
diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
similarity index 100%
rename from package/multimedia/ffmpeg/ffmpeg.mk
rename to package/ffmpeg/ffmpeg.mk
diff --git a/package/multimedia/flac/Config.in b/package/flac/Config.in
similarity index 100%
rename from package/multimedia/flac/Config.in
rename to package/flac/Config.in
diff --git a/package/multimedia/flac/flac-no-altivec.patch b/package/flac/flac-no-altivec.patch
similarity index 100%
rename from package/multimedia/flac/flac-no-altivec.patch
rename to package/flac/flac-no-altivec.patch
diff --git a/package/multimedia/flac/flac.mk b/package/flac/flac.mk
similarity index 100%
rename from package/multimedia/flac/flac.mk
rename to package/flac/flac.mk
diff --git a/package/gstreamer/Config.in b/package/gstreamer/Config.in
new file mode 100644
index 0000000..039d657
--- /dev/null
+++ b/package/gstreamer/Config.in
@@ -0,0 +1,11 @@
+# Gstreamer 0.10.x & Plugins
+source "package/gstreamer/gstreamer/Config.in"
+source "package/gstreamer/gst-plugins-base/Config.in"
+source "package/gstreamer/gst-plugins-good/Config.in"
+source "package/gstreamer/gst-plugins-bad/Config.in"
+source "package/gstreamer/gst-plugins-ugly/Config.in"
+source "package/gstreamer/gst-ffmpeg/Config.in"
+source "package/gstreamer/gst-dsp/Config.in"
+source "package/gstreamer/gst-fsl-plugins/Config.in"
+source "package/gstreamer/gst-omapfb/Config.in"
+source "package/gstreamer/gst-plugin-x170/Config.in"
diff --git a/package/multimedia/gst-dsp/Config.in b/package/gstreamer/gst-dsp/Config.in
similarity index 100%
rename from package/multimedia/gst-dsp/Config.in
rename to package/gstreamer/gst-dsp/Config.in
diff --git a/package/multimedia/gst-dsp/gst-dsp.mk b/package/gstreamer/gst-dsp/gst-dsp.mk
similarity index 100%
rename from package/multimedia/gst-dsp/gst-dsp.mk
rename to package/gstreamer/gst-dsp/gst-dsp.mk
diff --git a/package/multimedia/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
similarity index 100%
rename from package/multimedia/gst-ffmpeg/Config.in
rename to package/gstreamer/gst-ffmpeg/Config.in
diff --git a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
similarity index 100%
rename from package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
rename to package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
diff --git a/package/multimedia/gst-fsl-plugins/Config.in b/package/gstreamer/gst-fsl-plugins/Config.in
similarity index 100%
rename from package/multimedia/gst-fsl-plugins/Config.in
rename to package/gstreamer/gst-fsl-plugins/Config.in
diff --git a/package/multimedia/gst-fsl-plugins/gst-fsl-plugins-0001-gplay-add-missing-include.patch b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0001-gplay-add-missing-include.patch
similarity index 100%
rename from package/multimedia/gst-fsl-plugins/gst-fsl-plugins-0001-gplay-add-missing-include.patch
rename to package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0001-gplay-add-missing-include.patch
diff --git a/package/multimedia/gst-fsl-plugins/gst-fsl-plugins-0002-Fix-bashism-in-configure-script.patch b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0002-Fix-bashism-in-configure-script.patch
similarity index 100%
rename from package/multimedia/gst-fsl-plugins/gst-fsl-plugins-0002-Fix-bashism-in-configure-script.patch
rename to package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0002-Fix-bashism-in-configure-script.patch
diff --git a/package/multimedia/gst-fsl-plugins/gst-fsl-plugins-0003-Use-proper-objdump.patch b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0003-Use-proper-objdump.patch
similarity index 100%
rename from package/multimedia/gst-fsl-plugins/gst-fsl-plugins-0003-Use-proper-objdump.patch
rename to package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0003-Use-proper-objdump.patch
diff --git a/package/multimedia/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
similarity index 100%
rename from package/multimedia/gst-fsl-plugins/gst-fsl-plugins.mk
rename to package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
diff --git a/package/multimedia/gst-omapfb/Config.in b/package/gstreamer/gst-omapfb/Config.in
similarity index 100%
rename from package/multimedia/gst-omapfb/Config.in
rename to package/gstreamer/gst-omapfb/Config.in
diff --git a/package/multimedia/gst-omapfb/gst-omapfb.mk b/package/gstreamer/gst-omapfb/gst-omapfb.mk
similarity index 100%
rename from package/multimedia/gst-omapfb/gst-omapfb.mk
rename to package/gstreamer/gst-omapfb/gst-omapfb.mk
diff --git a/package/multimedia/gst-plugin-x170/Config.in b/package/gstreamer/gst-plugin-x170/Config.in
similarity index 100%
rename from package/multimedia/gst-plugin-x170/Config.in
rename to package/gstreamer/gst-plugin-x170/Config.in
diff --git a/package/multimedia/gst-plugin-x170/gst-plugin-x170-01-correct-CFLAGS.patch b/package/gstreamer/gst-plugin-x170/gst-plugin-x170-01-correct-CFLAGS.patch
similarity index 100%
rename from package/multimedia/gst-plugin-x170/gst-plugin-x170-01-correct-CFLAGS.patch
rename to package/gstreamer/gst-plugin-x170/gst-plugin-x170-01-correct-CFLAGS.patch
diff --git a/package/multimedia/gst-plugin-x170/gst-plugin-x170.mk b/package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk
similarity index 100%
rename from package/multimedia/gst-plugin-x170/gst-plugin-x170.mk
rename to package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk
diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
similarity index 100%
rename from package/multimedia/gst-plugins-bad/Config.in
rename to package/gstreamer/gst-plugins-bad/Config.in
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad-0002-fix-dfb-example.patch b/package/gstreamer/gst-plugins-bad/gst-plugins-bad-0002-fix-dfb-example.patch
similarity index 100%
rename from package/multimedia/gst-plugins-bad/gst-plugins-bad-0002-fix-dfb-example.patch
rename to package/gstreamer/gst-plugins-bad/gst-plugins-bad-0002-fix-dfb-example.patch
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad-opus-jpegformat-unbreak-non-debug-build.patch b/package/gstreamer/gst-plugins-bad/gst-plugins-bad-opus-jpegformat-unbreak-non-debug-build.patch
similarity index 100%
rename from package/multimedia/gst-plugins-bad/gst-plugins-bad-opus-jpegformat-unbreak-non-debug-build.patch
rename to package/gstreamer/gst-plugins-bad/gst-plugins-bad-opus-jpegformat-unbreak-non-debug-build.patch
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
similarity index 100%
rename from package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
rename to package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
diff --git a/package/multimedia/gst-plugins-base/Config.in b/package/gstreamer/gst-plugins-base/Config.in
similarity index 100%
rename from package/multimedia/gst-plugins-base/Config.in
rename to package/gstreamer/gst-plugins-base/Config.in
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base-tremor.patch b/package/gstreamer/gst-plugins-base/gst-plugins-base-tremor.patch
similarity index 100%
rename from package/multimedia/gst-plugins-base/gst-plugins-base-tremor.patch
rename to package/gstreamer/gst-plugins-base/gst-plugins-base-tremor.patch
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
similarity index 100%
rename from package/multimedia/gst-plugins-base/gst-plugins-base.mk
rename to package/gstreamer/gst-plugins-base/gst-plugins-base.mk
diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
similarity index 100%
rename from package/multimedia/gst-plugins-good/Config.in
rename to package/gstreamer/gst-plugins-good/Config.in
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good-linux36.patch b/package/gstreamer/gst-plugins-good/gst-plugins-good-linux36.patch
similarity index 100%
rename from package/multimedia/gst-plugins-good/gst-plugins-good-linux36.patch
rename to package/gstreamer/gst-plugins-good/gst-plugins-good-linux36.patch
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good-v4l2-fix-compilation-against-newer-kernel-headers.patch b/package/gstreamer/gst-plugins-good/gst-plugins-good-v4l2-fix-compilation-against-newer-kernel-headers.patch
similarity index 100%
rename from package/multimedia/gst-plugins-good/gst-plugins-good-v4l2-fix-compilation-against-newer-kernel-headers.patch
rename to package/gstreamer/gst-plugins-good/gst-plugins-good-v4l2-fix-compilation-against-newer-kernel-headers.patch
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/gstreamer/gst-plugins-good/gst-plugins-good.mk
similarity index 100%
rename from package/multimedia/gst-plugins-good/gst-plugins-good.mk
rename to package/gstreamer/gst-plugins-good/gst-plugins-good.mk
diff --git a/package/multimedia/gst-plugins-ugly/Config.in b/package/gstreamer/gst-plugins-ugly/Config.in
similarity index 100%
rename from package/multimedia/gst-plugins-ugly/Config.in
rename to package/gstreamer/gst-plugins-ugly/Config.in
diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
similarity index 100%
rename from package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
rename to package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
diff --git a/package/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer.mk
new file mode 100644
index 0000000..bc886c7
--- /dev/null
+++ b/package/gstreamer/gstreamer.mk
@@ -0,0 +1 @@
+include package/gstreamer/*/*.mk
diff --git a/package/multimedia/gstreamer/Config.in b/package/gstreamer/gstreamer/Config.in
similarity index 100%
rename from package/multimedia/gstreamer/Config.in
rename to package/gstreamer/gstreamer/Config.in
diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
similarity index 100%
rename from package/multimedia/gstreamer/gstreamer.mk
rename to package/gstreamer/gstreamer/gstreamer.mk
diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
new file mode 100644
index 0000000..f9d2363
--- /dev/null
+++ b/package/gstreamer1/Config.in
@@ -0,0 +1,7 @@
+# Gstreamer 1.x & Plugins
+source "package/gstreamer1/gstreamer1/Config.in"
+source "package/gstreamer1/gst1-plugins-base/Config.in"
+source "package/gstreamer1/gst1-plugins-good/Config.in"
+source "package/gstreamer1/gst1-plugins-bad/Config.in"
+source "package/gstreamer1/gst1-plugins-ugly/Config.in"
+source "package/gstreamer1/gst-omx/Config.in"
diff --git a/package/multimedia/gst-omx/Config.in b/package/gstreamer1/gst-omx/Config.in
similarity index 100%
rename from package/multimedia/gst-omx/Config.in
rename to package/gstreamer1/gst-omx/Config.in
diff --git a/package/multimedia/gst-omx/gst-omx-config-files.patch b/package/gstreamer1/gst-omx/gst-omx-config-files.patch
similarity index 100%
rename from package/multimedia/gst-omx/gst-omx-config-files.patch
rename to package/gstreamer1/gst-omx/gst-omx-config-files.patch
diff --git a/package/multimedia/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
similarity index 100%
rename from package/multimedia/gst-omx/gst-omx.mk
rename to package/gstreamer1/gst-omx/gst-omx.mk
diff --git a/package/multimedia/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
similarity index 100%
rename from package/multimedia/gst1-plugins-bad/Config.in
rename to package/gstreamer1/gst1-plugins-bad/Config.in
diff --git a/package/multimedia/gst1-plugins-bad/gst1-plugins-bad-use-gettext-0.18.patch b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad-use-gettext-0.18.patch
similarity index 100%
rename from package/multimedia/gst1-plugins-bad/gst1-plugins-bad-use-gettext-0.18.patch
rename to package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad-use-gettext-0.18.patch
diff --git a/package/multimedia/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
similarity index 100%
rename from package/multimedia/gst1-plugins-bad/gst1-plugins-bad.mk
rename to package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
diff --git a/package/multimedia/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
similarity index 100%
rename from package/multimedia/gst1-plugins-base/Config.in
rename to package/gstreamer1/gst1-plugins-base/Config.in
diff --git a/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
similarity index 100%
rename from package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
rename to package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
diff --git a/package/multimedia/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
similarity index 100%
rename from package/multimedia/gst1-plugins-good/Config.in
rename to package/gstreamer1/gst1-plugins-good/Config.in
diff --git a/package/multimedia/gst1-plugins-good/gst1-plugins-good-dyn-multi-udpsink-unbreak-on-IPv6-systems-after-1302.patch b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good-dyn-multi-udpsink-unbreak-on-IPv6-systems-after-1302.patch
similarity index 100%
rename from package/multimedia/gst1-plugins-good/gst1-plugins-good-dyn-multi-udpsink-unbreak-on-IPv6-systems-after-1302.patch
rename to package/gstreamer1/gst1-plugins-good/gst1-plugins-good-dyn-multi-udpsink-unbreak-on-IPv6-systems-after-1302.patch
diff --git a/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
similarity index 100%
rename from package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
rename to package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
diff --git a/package/multimedia/gst1-plugins-ugly/Config.in b/package/gstreamer1/gst1-plugins-ugly/Config.in
similarity index 100%
rename from package/multimedia/gst1-plugins-ugly/Config.in
rename to package/gstreamer1/gst1-plugins-ugly/Config.in
diff --git a/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
similarity index 100%
rename from package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk
rename to package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
diff --git a/package/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1.mk
new file mode 100644
index 0000000..5b748e3
--- /dev/null
+++ b/package/gstreamer1/gstreamer1.mk
@@ -0,0 +1 @@
+include package/gstreamer1/*/*.mk
diff --git a/package/multimedia/gstreamer1/Config.in b/package/gstreamer1/gstreamer1/Config.in
similarity index 100%
rename from package/multimedia/gstreamer1/Config.in
rename to package/gstreamer1/gstreamer1/Config.in
diff --git a/package/multimedia/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
similarity index 100%
rename from package/multimedia/gstreamer1/gstreamer1.mk
rename to package/gstreamer1/gstreamer1/gstreamer1.mk
diff --git a/package/multimedia/lame/Config.in b/package/lame/Config.in
similarity index 100%
rename from package/multimedia/lame/Config.in
rename to package/lame/Config.in
diff --git a/package/multimedia/lame/lame.mk b/package/lame/lame.mk
similarity index 100%
rename from package/multimedia/lame/lame.mk
rename to package/lame/lame.mk
diff --git a/package/multimedia/libvpx/Config.in b/package/libvpx/Config.in
similarity index 100%
rename from package/multimedia/libvpx/Config.in
rename to package/libvpx/Config.in
diff --git a/package/multimedia/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
similarity index 100%
rename from package/multimedia/libvpx/libvpx.mk
rename to package/libvpx/libvpx.mk
diff --git a/package/multimedia/madplay/Config.in b/package/madplay/Config.in
similarity index 100%
rename from package/multimedia/madplay/Config.in
rename to package/madplay/Config.in
diff --git a/package/multimedia/madplay/madplay-0.15.2b-switch-to-new-alsa-api.patch b/package/madplay/madplay-0.15.2b-switch-to-new-alsa-api.patch
similarity index 100%
rename from package/multimedia/madplay/madplay-0.15.2b-switch-to-new-alsa-api.patch
rename to package/madplay/madplay-0.15.2b-switch-to-new-alsa-api.patch
diff --git a/package/multimedia/madplay/madplay.mk b/package/madplay/madplay.mk
similarity index 100%
rename from package/multimedia/madplay/madplay.mk
rename to package/madplay/madplay.mk
diff --git a/package/multimedia/mpd/Config.in b/package/mpd/Config.in
similarity index 100%
rename from package/multimedia/mpd/Config.in
rename to package/mpd/Config.in
diff --git a/package/multimedia/mpd/S95mpd b/package/mpd/S95mpd
similarity index 100%
rename from package/multimedia/mpd/S95mpd
rename to package/mpd/S95mpd
diff --git a/package/multimedia/mpd/mpd.conf b/package/mpd/mpd.conf
similarity index 100%
rename from package/multimedia/mpd/mpd.conf
rename to package/mpd/mpd.conf
diff --git a/package/multimedia/mpd/mpd.mk b/package/mpd/mpd.mk
similarity index 100%
rename from package/multimedia/mpd/mpd.mk
rename to package/mpd/mpd.mk
diff --git a/package/multimedia/mpg123/Config.in b/package/mpg123/Config.in
similarity index 100%
rename from package/multimedia/mpg123/Config.in
rename to package/mpg123/Config.in
diff --git a/package/multimedia/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
similarity index 100%
rename from package/multimedia/mpg123/mpg123.mk
rename to package/mpg123/mpg123.mk
diff --git a/package/multimedia/mplayer/Config.in b/package/mplayer/Config.in
similarity index 100%
rename from package/multimedia/mplayer/Config.in
rename to package/mplayer/Config.in
diff --git a/package/multimedia/mplayer/mplayer-1.1-disable-install-strip.patch b/package/mplayer/mplayer-1.1-disable-install-strip.patch
similarity index 100%
rename from package/multimedia/mplayer/mplayer-1.1-disable-install-strip.patch
rename to package/mplayer/mplayer-1.1-disable-install-strip.patch
diff --git a/package/multimedia/mplayer/mplayer-1.1-fix-cc-parsing.patch b/package/mplayer/mplayer-1.1-fix-cc-parsing.patch
similarity index 100%
rename from package/multimedia/mplayer/mplayer-1.1-fix-cc-parsing.patch
rename to package/mplayer/mplayer-1.1-fix-cc-parsing.patch
diff --git a/package/multimedia/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
similarity index 100%
rename from package/multimedia/mplayer/mplayer.mk
rename to package/mplayer/mplayer.mk
diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
deleted file mode 100644
index 2fcac56..0000000
--- a/package/multimedia/Config.in
+++ /dev/null
@@ -1,44 +0,0 @@
-menu "Audio and video applications"
-source "package/multimedia/alsa-utils/Config.in"
-source "package/multimedia/aumix/Config.in"
-source "package/multimedia/bellagio/Config.in"
-source "package/multimedia/faad2/Config.in"
-source "package/multimedia/flac/Config.in"
-source "package/multimedia/ffmpeg/Config.in"
-
-# Gstreamer 0.10.x & Plugins
-source "package/multimedia/gstreamer/Config.in"
-source "package/multimedia/gst-plugins-base/Config.in"
-source "package/multimedia/gst-plugins-good/Config.in"
-source "package/multimedia/gst-plugins-bad/Config.in"
-source "package/multimedia/gst-plugins-ugly/Config.in"
-source "package/multimedia/gst-ffmpeg/Config.in"
-source "package/multimedia/gst-dsp/Config.in"
-source "package/multimedia/gst-fsl-plugins/Config.in"
-source "package/multimedia/gst-omapfb/Config.in"
-source "package/multimedia/gst-plugin-x170/Config.in"
-
-# Gstreamer 1.x & Plugins
-source "package/multimedia/gstreamer1/Config.in"
-source "package/multimedia/gst1-plugins-base/Config.in"
-source "package/multimedia/gst1-plugins-good/Config.in"
-source "package/multimedia/gst1-plugins-bad/Config.in"
-source "package/multimedia/gst1-plugins-ugly/Config.in"
-source "package/multimedia/gst-omx/Config.in"
-
-source "package/multimedia/lame/Config.in"
-source "package/multimedia/libvpx/Config.in"
-source "package/multimedia/madplay/Config.in"
-source "package/multimedia/mpd/Config.in"
-source "package/multimedia/mpg123/Config.in"
-source "package/multimedia/mplayer/Config.in"
-source "package/multimedia/musepack/Config.in"
-source "package/multimedia/on2-8170-libs/Config.in"
-source "package/opus-tools/Config.in"
-source "package/multimedia/pulseaudio/Config.in"
-source "package/multimedia/tidsp-binaries/Config.in"
-source "package/tstools/Config.in"
-source "package/multimedia/vorbis-tools/Config.in"
-source "package/multimedia/wavpack/Config.in"
-source "package/yavta/Config.in"
-endmenu
diff --git a/package/multimedia/multimedia.mk b/package/multimedia/multimedia.mk
deleted file mode 100644
index 843f30e..0000000
--- a/package/multimedia/multimedia.mk
+++ /dev/null
@@ -1 +0,0 @@
-include package/multimedia/*/*.mk
diff --git a/package/multimedia/musepack/Config.in b/package/musepack/Config.in
similarity index 100%
rename from package/multimedia/musepack/Config.in
rename to package/musepack/Config.in
diff --git a/package/multimedia/musepack/musepack-shared.patch b/package/musepack/musepack-shared.patch
similarity index 100%
rename from package/multimedia/musepack/musepack-shared.patch
rename to package/musepack/musepack-shared.patch
diff --git a/package/multimedia/musepack/musepack.mk b/package/musepack/musepack.mk
similarity index 100%
rename from package/multimedia/musepack/musepack.mk
rename to package/musepack/musepack.mk
diff --git a/package/multimedia/on2-8170-libs/Config.in b/package/on2-8170-libs/Config.in
similarity index 100%
rename from package/multimedia/on2-8170-libs/Config.in
rename to package/on2-8170-libs/Config.in
diff --git a/package/multimedia/on2-8170-libs/on2-8170-libs.mk b/package/on2-8170-libs/on2-8170-libs.mk
similarity index 100%
rename from package/multimedia/on2-8170-libs/on2-8170-libs.mk
rename to package/on2-8170-libs/on2-8170-libs.mk
diff --git a/package/multimedia/pulseaudio/Config.in b/package/pulseaudio/Config.in
similarity index 100%
rename from package/multimedia/pulseaudio/Config.in
rename to package/pulseaudio/Config.in
diff --git a/package/multimedia/pulseaudio/S50pulseaudio b/package/pulseaudio/S50pulseaudio
similarity index 100%
rename from package/multimedia/pulseaudio/S50pulseaudio
rename to package/pulseaudio/S50pulseaudio
diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
similarity index 100%
rename from package/multimedia/pulseaudio/pulseaudio.mk
rename to package/pulseaudio/pulseaudio.mk
diff --git a/package/multimedia/tidsp-binaries/Config.in b/package/tidsp-binaries/Config.in
similarity index 100%
rename from package/multimedia/tidsp-binaries/Config.in
rename to package/tidsp-binaries/Config.in
diff --git a/package/multimedia/tidsp-binaries/tidsp-binaries.mk b/package/tidsp-binaries/tidsp-binaries.mk
similarity index 100%
rename from package/multimedia/tidsp-binaries/tidsp-binaries.mk
rename to package/tidsp-binaries/tidsp-binaries.mk
diff --git a/package/multimedia/vorbis-tools/Config.in b/package/vorbis-tools/Config.in
similarity index 100%
rename from package/multimedia/vorbis-tools/Config.in
rename to package/vorbis-tools/Config.in
diff --git a/package/multimedia/vorbis-tools/vorbis-tools.mk b/package/vorbis-tools/vorbis-tools.mk
similarity index 100%
rename from package/multimedia/vorbis-tools/vorbis-tools.mk
rename to package/vorbis-tools/vorbis-tools.mk
diff --git a/package/multimedia/wavpack/Config.in b/package/wavpack/Config.in
similarity index 100%
rename from package/multimedia/wavpack/Config.in
rename to package/wavpack/Config.in
diff --git a/package/multimedia/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
similarity index 100%
rename from package/multimedia/wavpack/wavpack.mk
rename to package/wavpack/wavpack.mk
-- 
1.7.9.5
