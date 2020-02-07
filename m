From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  7 Feb 2020 15:50:15 +0100
Subject: [Buildroot] [PATCH 00/10] Remove gstreamer 0.10
Message-ID: <20200207145026.28384-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gstreamer 0.10 hasn't seen an upstream releases in 8 years and is
missing a lot of features and (security) fixes compared to gstreamer
1.x. Lets drop the packages and support in other packages before
releasing the new LTS.

Peter Korsgaard (10):
  package/classpath: drop gstreamer 0.10.x support
  package/gupnp-dlna: drop gstreamer 0.10.x support
  package/libnice: drop gstreamer 0.10.x support
  package/qt5multimedia: drop gstreamer 0.10.x support
  package/libplayer: remove package
  package/opencv: drop gstreamer 0.10.x support
  package/opencv3: drop gstreamer 0.10.x support
  package/freerdp: drop gstreamer 0.10.x support
  package/nvidia-tegra23-binaries: drop gstreamer 0.10.x support
  package/gstreamer/*: remove packages

 Config.in.legacy                              |  51 ++
 DEVELOPERS                                    |   1 -
 package/Config.in                             |   1 -
 package/classpath/classpath.mk                |  11 +-
 package/freerdp/Config.in                     |  24 +-
 package/freerdp/freerdp.mk                    |   9 +-
 package/gstreamer/Config.in                   |  13 -
 package/gstreamer/gst-ffmpeg/0001-gcc47.patch |  65 --
 ...arm-avoid-using-the-movw-instruction.patch |  41 --
 package/gstreamer/gst-ffmpeg/Config.in        |  30 -
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.hash  |   6 -
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk    | 103 ---
 .../0001-gplay-add-missing-include.patch      |  23 -
 ...0002-Fix-bashism-in-configure-script.patch |  48 --
 .../0003-Use-proper-objdump.patch             |  36 --
 ...nkage-add-lrt-for-shared-memory-func.patch |  46 --
 ...-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch |  69 --
 package/gstreamer/gst-fsl-plugins/Config.in   | 105 ----
 .../gst-fsl-plugins/gst-fsl-plugins.hash      |   4 -
 .../gst-fsl-plugins/gst-fsl-plugins.mk        |  40 --
 package/gstreamer/gst-omapfb/Config.in        |   7 -
 package/gstreamer/gst-omapfb/gst-omapfb.hash  |   2 -
 package/gstreamer/gst-omapfb/gst-omapfb.mk    |  20 -
 .../gst-plugin-x170/0001-correct-CFLAGS.patch |  28 -
 package/gstreamer/gst-plugin-x170/Config.in   |  16 -
 .../gst-plugin-x170/gst-plugin-x170.hash      |   2 -
 .../gst-plugin-x170/gst-plugin-x170.mk        |  18 -
 ...s-jpegformat-unbreak-non-debug-build.patch |  78 ---
 .../0002-fix-dfb-example.patch                |  22 -
 ...03-drop-buggy-libvpx-legacy-handling.patch |  44 --
 package/gstreamer/gst-plugins-bad/Config.in   | 334 ----------
 .../gst-plugins-bad/gst-plugins-bad.hash      |   5 -
 .../gst-plugins-bad/gst-plugins-bad.mk        | 593 ------------------
 .../gst-plugins-base/0001-tremor.patch        | 139 ----
 ...x-build-on-x86-if-emmintrin.h-is-ava.patch |  38 --
 ...-s-HAVE_EMMINTRIN_H-not-HAVE_XMMINTR.patch |  27 -
 package/gstreamer/gst-plugins-base/Config.in  | 110 ----
 .../gst-plugins-base/gst-plugins-base.hash    |   5 -
 .../gst-plugins-base/gst-plugins-base.mk      | 196 ------
 .../gst-plugins-good/0001-linux36.patch       |  37 --
 ...ilation-against-newer-kernel-headers.patch |  30 -
 package/gstreamer/gst-plugins-good/Config.in  | 234 -------
 .../gst-plugins-good/gst-plugins-good.hash    |   4 -
 .../gst-plugins-good/gst-plugins-good.mk      | 394 ------------
 package/gstreamer/gst-plugins-ugly/Config.in  |  53 --
 .../gst-plugins-ugly/gst-plugins-ugly.hash    |   6 -
 .../gst-plugins-ugly/gst-plugins-ugly.mk      |  90 ---
 package/gstreamer/gstreamer.mk                |   1 -
 package/gstreamer/gstreamer/0001-bison3.patch |  24 -
 package/gstreamer/gstreamer/Config.in         |  38 --
 package/gstreamer/gstreamer/gstreamer.hash    |   5 -
 package/gstreamer/gstreamer/gstreamer.mk      |  36 --
 package/gupnp-dlna/gupnp-dlna.mk              |   7 +-
 package/libnice/libnice.mk                    |   8 +-
 package/libplayer/0001-add-fpic.patch         |  18 -
 .../libplayer/0002-fix-configure-cflags.patch |  41 --
 package/libplayer/Config.in                   |  28 -
 package/libplayer/libplayer.hash              |   3 -
 package/libplayer/libplayer.mk                |  36 --
 .../nvidia-tegra23-binaries/Config.in         |  16 -
 .../nvidia-tegra23-binaries.mk                |  31 -
 package/opencv/Config.in                      |  31 +-
 package/opencv/opencv.mk                      |   8 +-
 package/opencv3/Config.in                     |  27 +-
 package/opencv3/opencv3.mk                    |   8 +-
 package/qt5/qt5multimedia/qt5multimedia.mk    |   4 -
 66 files changed, 68 insertions(+), 3560 deletions(-)
 delete mode 100644 package/gstreamer/Config.in
 delete mode 100644 package/gstreamer/gst-ffmpeg/0001-gcc47.patch
 delete mode 100644 package/gstreamer/gst-ffmpeg/0002-arm-avoid-using-the-movw-instruction.patch
 delete mode 100644 package/gstreamer/gst-ffmpeg/Config.in
 delete mode 100644 package/gstreamer/gst-ffmpeg/gst-ffmpeg.hash
 delete mode 100644 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
 delete mode 100644 package/gstreamer/gst-fsl-plugins/0001-gplay-add-missing-include.patch
 delete mode 100644 package/gstreamer/gst-fsl-plugins/0002-Fix-bashism-in-configure-script.patch
 delete mode 100644 package/gstreamer/gst-fsl-plugins/0003-Use-proper-objdump.patch
 delete mode 100644 package/gstreamer/gst-fsl-plugins/0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch
 delete mode 100644 package/gstreamer/gst-fsl-plugins/0005-Remove-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch
 delete mode 100644 package/gstreamer/gst-fsl-plugins/Config.in
 delete mode 100644 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.hash
 delete mode 100644 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
 delete mode 100644 package/gstreamer/gst-omapfb/Config.in
 delete mode 100644 package/gstreamer/gst-omapfb/gst-omapfb.hash
 delete mode 100644 package/gstreamer/gst-omapfb/gst-omapfb.mk
 delete mode 100644 package/gstreamer/gst-plugin-x170/0001-correct-CFLAGS.patch
 delete mode 100644 package/gstreamer/gst-plugin-x170/Config.in
 delete mode 100644 package/gstreamer/gst-plugin-x170/gst-plugin-x170.hash
 delete mode 100644 package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk
 delete mode 100644 package/gstreamer/gst-plugins-bad/0001-opus-jpegformat-unbreak-non-debug-build.patch
 delete mode 100644 package/gstreamer/gst-plugins-bad/0002-fix-dfb-example.patch
 delete mode 100644 package/gstreamer/gst-plugins-bad/0003-drop-buggy-libvpx-legacy-handling.patch
 delete mode 100644 package/gstreamer/gst-plugins-bad/Config.in
 delete mode 100644 package/gstreamer/gst-plugins-bad/gst-plugins-bad.hash
 delete mode 100644 package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
 delete mode 100644 package/gstreamer/gst-plugins-base/0001-tremor.patch
 delete mode 100644 package/gstreamer/gst-plugins-base/0002-audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
 delete mode 100644 package/gstreamer/gst-plugins-base/0003-audioresample-It-s-HAVE_EMMINTRIN_H-not-HAVE_XMMINTR.patch
 delete mode 100644 package/gstreamer/gst-plugins-base/Config.in
 delete mode 100644 package/gstreamer/gst-plugins-base/gst-plugins-base.hash
 delete mode 100644 package/gstreamer/gst-plugins-base/gst-plugins-base.mk
 delete mode 100644 package/gstreamer/gst-plugins-good/0001-linux36.patch
 delete mode 100644 package/gstreamer/gst-plugins-good/0002-v4l2-fix-compilation-against-newer-kernel-headers.patch
 delete mode 100644 package/gstreamer/gst-plugins-good/Config.in
 delete mode 100644 package/gstreamer/gst-plugins-good/gst-plugins-good.hash
 delete mode 100644 package/gstreamer/gst-plugins-good/gst-plugins-good.mk
 delete mode 100644 package/gstreamer/gst-plugins-ugly/Config.in
 delete mode 100644 package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.hash
 delete mode 100644 package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
 delete mode 100644 package/gstreamer/gstreamer.mk
 delete mode 100644 package/gstreamer/gstreamer/0001-bison3.patch
 delete mode 100644 package/gstreamer/gstreamer/Config.in
 delete mode 100644 package/gstreamer/gstreamer/gstreamer.hash
 delete mode 100644 package/gstreamer/gstreamer/gstreamer.mk
 delete mode 100644 package/libplayer/0001-add-fpic.patch
 delete mode 100644 package/libplayer/0002-fix-configure-cflags.patch
 delete mode 100644 package/libplayer/Config.in
 delete mode 100644 package/libplayer/libplayer.hash
 delete mode 100644 package/libplayer/libplayer.mk

-- 
2.20.1
