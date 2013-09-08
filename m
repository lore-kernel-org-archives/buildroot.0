From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 8 Sep 2013 21:41:39 +0200
Subject: [Buildroot] [git commit] Remove multimedia subdirectory
Message-ID: <20130908204534.4E8589B6AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=adf6511013b8921d6856f5dc0e053cdd27891244
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unless it was a group of sub-packages, packages was never regrouped by
category. multimedia/ was an exception to this rule.

This patch move packages/multimedia/ sub-directories to packages/. It
keeps two subdirectories for gstream 0.10 and gstreamer 1.X.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
 package/gstreamer1/Config.in                       |    7 +++
 .../{multimedia => gstreamer1}/gst-omx/Config.in   |    0
 .../gst-omx/gst-omx-config-files.patch             |    0
 .../{multimedia => gstreamer1}/gst-omx/gst-omx.mk  |    0
 .../gst1-plugins-bad/Config.in                     |    0
 .../gst1-plugins-bad-use-gettext-0.18.patch        |    0
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |    0
 .../gst1-plugins-base/Config.in                    |    0
 .../gst1-plugins-base/gst1-plugins-base.mk         |    0
 .../gst1-plugins-good/Config.in                    |    0
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
 100 files changed, 45 insertions(+), 47 deletions(-)

Patch is too large, so refusing to show it
