From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:09:05 +0100
Subject: [Buildroot] [PATCH/next 00/31] package/kodi: bump version to
	16.0-Jarvis
Message-ID: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patch series bumps Kodi to version 16.0-Jarvis, released today.

This series consist of several stages:

Patches 1 & 2 are independent of the version bump, goom & rsxs can be
used as addons with Kodi 15.x already although their source code is also
part of Kodi 15.x. In Kodi 16.x their source code was removed so the
creation of standalone packages is necessary at this stage.

Patches 3 - 18 are the real version bump, first some dependency libs
are bumped, then Kodi with some additional cleanups, at last the addons
are bumped, most of them as a mass version bump, as discussed on the
mailinglist. These patches also add hashes were missing:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/135294

Patches 19 - 31 add new addons and can be applied at any time after the
version bump took place, they are independent of this bump.

Regards, Bernd

Bernd Kuhls (31):
  package/kodi-visualisation-goom: new package
  package/kodi-screensaver-rsxs: new package
  package/libplatform: bump version, add hash
  package/libcec: bump version, add hash
  package/kodi-platform: bump version, add hash
  package/kodi: bump version to 16.0-Jarvis
  package/kodi: enable samba support with uClibc toolchain
  package/kodi: not available using a musl-based toolchain
  package/kodi: reorder select/depends
  package/kodi: Remove dependency for BR2_STATIC_LIBS from sub packages
  package/kodi: Remove dependency for BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
    from sub packages
  package/ffmpeg: Remove patch not needed anymore for Kodi 16.0-Jarvis
  package/kodi-audio??coder-*: mass version bump, add hashes
  package/kodi-pvr-*: mass version bump, add hashes
  package/kodi-screensaver/visualisation-*: mass version bump, add
    hashes
  package/kodi-visualisation-shadertoy: bump version, add hash
  package/kodi-screensaver-crystalmorph: add hash
  package/kodi-visualisation-waveforhue: add hash
  package/kodi-screensaver-asterwave: new package
  package/kodi-screensaver-cpblobs: new package
  package/kodi-screensaver-matrixtrails: new package
  package/kodi-screensaver-planestate: new package
  package/kodi-visualisation-fishbmc: new package
  package/kodi-visualisation-fountain: new package
  package/kodi-pvr-hdhomerun: new package
  package/kodi-audiodecoder-opus: new package
  package/kodi-adsp-freesurround: new package
  package/kodi-adsp-basic: new package
  package/kodi-adsp-biquad-filters: new package
  package/vsxu: new package
  package/kodi-visualisation-vsxu: new package

 Config.in.legacy                                   | 25 ++++++
 package/Config.in                                  |  1 +
 ...add-public-version-of-ff_read_frame_flush.patch | 53 ------------
 package/kodi-addon-xvdr/kodi-addon-xvdr.hash       |  2 +
 package/kodi-addon-xvdr/kodi-addon-xvdr.mk         |  4 +-
 package/kodi-adsp-basic/Config.in                  | 12 +++
 package/kodi-adsp-basic/kodi-adsp-basic.hash       |  2 +
 package/kodi-adsp-basic/kodi-adsp-basic.mk         | 13 +++
 package/kodi-adsp-biquad-filters/Config.in         | 10 +++
 .../kodi-adsp-biquad-filters.hash                  |  2 +
 .../kodi-adsp-biquad-filters.mk                    | 14 ++++
 package/kodi-adsp-freesurround/Config.in           | 11 +++
 .../kodi-adsp-freesurround.hash                    |  2 +
 .../kodi-adsp-freesurround.mk                      | 13 +++
 .../kodi-audiodecoder-modplug.hash                 |  2 +
 .../kodi-audiodecoder-modplug.mk                   |  2 +-
 .../kodi-audiodecoder-nosefart.hash                |  2 +
 .../kodi-audiodecoder-nosefart.mk                  |  2 +-
 package/kodi-audiodecoder-opus/Config.in           | 10 +++
 .../kodi-audiodecoder-opus.hash                    |  2 +
 .../kodi-audiodecoder-opus.mk                      | 13 +++
 .../kodi-audiodecoder-sidplay.hash                 |  2 +
 .../kodi-audiodecoder-sidplay.mk                   |  2 +-
 .../kodi-audiodecoder-snesapu.hash                 |  2 +
 .../kodi-audiodecoder-snesapu.mk                   |  2 +-
 .../kodi-audiodecoder-stsound.hash                 |  2 +
 .../kodi-audiodecoder-stsound.mk                   |  2 +-
 .../kodi-audiodecoder-timidity.hash                |  2 +
 .../kodi-audiodecoder-timidity.mk                  |  2 +-
 .../kodi-audiodecoder-vgmstream.hash               |  2 +
 .../kodi-audiodecoder-vgmstream.mk                 |  2 +-
 .../kodi-audioencoder-flac.hash                    |  2 +
 .../kodi-audioencoder-flac.mk                      |  2 +-
 .../kodi-audioencoder-lame.hash                    |  2 +
 .../kodi-audioencoder-lame.mk                      |  2 +-
 .../kodi-audioencoder-vorbis.hash                  |  2 +
 .../kodi-audioencoder-vorbis.mk                    |  2 +-
 .../kodi-audioencoder-wav.hash                     |  2 +
 .../kodi-audioencoder-wav/kodi-audioencoder-wav.mk |  2 +-
 package/kodi-platform/kodi-platform.hash           |  2 +
 package/kodi-platform/kodi-platform.mk             |  2 +-
 package/kodi-pvr-argustv/Config.in                 |  4 -
 package/kodi-pvr-argustv/kodi-pvr-argustv.hash     |  2 +
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk       |  4 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash     |  2 +
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk       |  4 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash |  2 +
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk   |  4 +-
 package/kodi-pvr-filmon/Config.in                  |  4 -
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash       |  2 +
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk         |  4 +-
 package/kodi-pvr-hdhomerun/Config.in               |  9 ++
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash |  2 +
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk   | 15 ++++
 package/kodi-pvr-hts/kodi-pvr-hts.hash             |  2 +
 package/kodi-pvr-hts/kodi-pvr-hts.mk               |  4 +-
 .../kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash   |  2 +
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk |  4 +-
 .../kodi-pvr-mediaportal-tvserver.hash             |  2 +
 .../kodi-pvr-mediaportal-tvserver.mk               |  4 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash       |  2 +
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk         |  4 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash     |  2 +
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk       |  4 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash           |  2 +
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk             |  4 +-
 package/kodi-pvr-pctv/Config.in                    |  4 -
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash           |  2 +
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk             |  4 +-
 package/kodi-pvr-stalker/Config.in                 |  4 -
 package/kodi-pvr-stalker/kodi-pvr-stalker.hash     |  2 +
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk       |  4 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash           |  2 +
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk             |  4 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash   |  2 +
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk     |  4 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash       |  2 +
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk         |  4 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash             |  2 +
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk               |  4 +-
 .../kodi-screensaver-asteroids.hash                |  2 +
 .../kodi-screensaver-asteroids.mk                  |  2 +-
 package/kodi-screensaver-asterwave/Config.in       | 11 +++
 .../kodi-screensaver-asterwave.hash                |  2 +
 .../kodi-screensaver-asterwave.mk                  | 11 +++
 .../kodi-screensaver-biogenesis.hash               |  2 +
 .../kodi-screensaver-biogenesis.mk                 |  2 +-
 package/kodi-screensaver-cpblobs/Config.in         | 11 +++
 .../kodi-screensaver-cpblobs.hash                  |  2 +
 .../kodi-screensaver-cpblobs.mk                    | 13 +++
 .../kodi-screensaver-crystalmorph.hash             |  2 +
 .../kodi-screensaver-greynetic.hash                |  2 +
 .../kodi-screensaver-greynetic.mk                  |  2 +-
 .../kodi-screensaver-matrixtrails/0001-cmake.patch | 33 ++++++++
 package/kodi-screensaver-matrixtrails/Config.in    | 11 +++
 .../kodi-screensaver-matrixtrails.hash             |  2 +
 .../kodi-screensaver-matrixtrails.mk               | 14 ++++
 .../kodi-screensaver-pingpong.hash                 |  2 +
 .../kodi-screensaver-pingpong.mk                   |  2 +-
 package/kodi-screensaver-planestate/Config.in      | 11 +++
 .../kodi-screensaver-planestate.hash               |  2 +
 .../kodi-screensaver-planestate.mk                 | 11 +++
 .../kodi-screensaver-pyro.hash                     |  2 +
 .../kodi-screensaver-pyro/kodi-screensaver-pyro.mk |  2 +-
 .../kodi-screensaver-rsxs/0001-cross-compile.patch | 37 +++++++++
 package/kodi-screensaver-rsxs/Config.in            | 10 +++
 .../kodi-screensaver-rsxs.hash                     |  2 +
 .../kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk | 14 ++++
 .../kodi-screensaver-stars.hash                    |  2 +
 .../kodi-screensaver-stars.mk                      |  2 +-
 package/kodi-visualisation-fishbmc/Config.in       | 10 +++
 .../kodi-visualisation-fishbmc.hash                |  2 +
 .../kodi-visualisation-fishbmc.mk                  | 13 +++
 package/kodi-visualisation-fountain/Config.in      | 11 +++
 .../kodi-visualisation-fountain.hash               |  2 +
 .../kodi-visualisation-fountain.mk                 | 11 +++
 .../0001-cross-compile.patch                       | 32 ++++++++
 package/kodi-visualisation-goom/Config.in          | 10 +++
 .../kodi-visualisation-goom.hash                   |  2 +
 .../kodi-visualisation-goom.mk                     | 14 ++++
 ...GLES2-also-search-for-egl-with-pkg-config.patch | 14 ++--
 .../kodi-visualisation-shadertoy.hash              |  2 +
 .../kodi-visualisation-shadertoy.mk                |  4 +-
 .../kodi-visualisation-spectrum.hash               |  2 +
 .../kodi-visualisation-spectrum.mk                 |  2 +-
 package/kodi-visualisation-vsxu/Config.in          |  8 ++
 .../kodi-visualisation-vsxu.hash                   |  2 +
 .../kodi-visualisation-vsxu.mk                     | 13 +++
 .../kodi-visualisation-waveforhue.hash             |  2 +
 .../kodi-visualisation-waveform.hash               |  2 +
 .../kodi-visualisation-waveform.mk                 |  2 +-
 ....cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch | 21 +++--
 package/kodi/Config.in                             | 96 +++++++++-------------
 package/kodi/kodi.hash                             |  2 +-
 package/kodi/kodi.mk                               | 36 +-------
 ...-generate-an-invalid-env.h-when-not-built.patch | 31 -------
 package/libcec/libcec.hash                         |  2 +
 package/libcec/libcec.mk                           |  2 +-
 package/libplatform/libplatform.hash               |  2 +
 package/libplatform/libplatform.mk                 |  2 +-
 package/vsxu/0001-Detect-backtrace-support.patch   | 65 +++++++++++++++
 ...o-not-use-host-paths-when-cross-compiling.patch | 55 +++++++++++++
 package/vsxu/Config.in                             | 22 +++++
 package/vsxu/vsxu.hash                             |  3 +
 package/vsxu/vsxu.mk                               | 43 ++++++++++
 145 files changed, 892 insertions(+), 248 deletions(-)
 delete mode 100644 package/ffmpeg/0013-add-public-version-of-ff_read_frame_flush.patch
 create mode 100644 package/kodi-addon-xvdr/kodi-addon-xvdr.hash
 create mode 100644 package/kodi-adsp-basic/Config.in
 create mode 100644 package/kodi-adsp-basic/kodi-adsp-basic.hash
 create mode 100644 package/kodi-adsp-basic/kodi-adsp-basic.mk
 create mode 100644 package/kodi-adsp-biquad-filters/Config.in
 create mode 100644 package/kodi-adsp-biquad-filters/kodi-adsp-biquad-filters.hash
 create mode 100644 package/kodi-adsp-biquad-filters/kodi-adsp-biquad-filters.mk
 create mode 100644 package/kodi-adsp-freesurround/Config.in
 create mode 100644 package/kodi-adsp-freesurround/kodi-adsp-freesurround.hash
 create mode 100644 package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk
 create mode 100644 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
 create mode 100644 package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
 create mode 100644 package/kodi-audiodecoder-opus/Config.in
 create mode 100644 package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.hash
 create mode 100644 package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk
 create mode 100644 package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
 create mode 100644 package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
 create mode 100644 package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
 create mode 100644 package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
 create mode 100644 package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
 create mode 100644 package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
 create mode 100644 package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
 create mode 100644 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
 create mode 100644 package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
 create mode 100644 package/kodi-platform/kodi-platform.hash
 create mode 100644 package/kodi-pvr-argustv/kodi-pvr-argustv.hash
 create mode 100644 package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
 create mode 100644 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
 create mode 100644 package/kodi-pvr-filmon/kodi-pvr-filmon.hash
 create mode 100644 package/kodi-pvr-hdhomerun/Config.in
 create mode 100644 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
 create mode 100644 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
 create mode 100644 package/kodi-pvr-hts/kodi-pvr-hts.hash
 create mode 100644 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
 create mode 100644 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
 create mode 100644 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
 create mode 100644 package/kodi-pvr-njoy/kodi-pvr-njoy.hash
 create mode 100644 package/kodi-pvr-pctv/kodi-pvr-pctv.hash
 create mode 100644 package/kodi-pvr-stalker/kodi-pvr-stalker.hash
 create mode 100644 package/kodi-pvr-vbox/kodi-pvr-vbox.hash
 create mode 100644 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
 create mode 100644 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
 create mode 100644 package/kodi-pvr-wmc/kodi-pvr-wmc.hash
 create mode 100644 package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
 create mode 100644 package/kodi-screensaver-asterwave/Config.in
 create mode 100644 package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
 create mode 100644 package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
 create mode 100644 package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
 create mode 100644 package/kodi-screensaver-cpblobs/Config.in
 create mode 100644 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
 create mode 100644 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
 create mode 100644 package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
 create mode 100644 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
 create mode 100644 package/kodi-screensaver-matrixtrails/0001-cmake.patch
 create mode 100644 package/kodi-screensaver-matrixtrails/Config.in
 create mode 100644 package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
 create mode 100644 package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
 create mode 100644 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
 create mode 100644 package/kodi-screensaver-planestate/Config.in
 create mode 100644 package/kodi-screensaver-planestate/kodi-screensaver-planestate.hash
 create mode 100644 package/kodi-screensaver-planestate/kodi-screensaver-planestate.mk
 create mode 100644 package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
 create mode 100644 package/kodi-screensaver-rsxs/0001-cross-compile.patch
 create mode 100644 package/kodi-screensaver-rsxs/Config.in
 create mode 100644 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
 create mode 100644 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
 create mode 100644 package/kodi-screensaver-stars/kodi-screensaver-stars.hash
 create mode 100644 package/kodi-visualisation-fishbmc/Config.in
 create mode 100644 package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
 create mode 100644 package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
 create mode 100644 package/kodi-visualisation-fountain/Config.in
 create mode 100644 package/kodi-visualisation-fountain/kodi-visualisation-fountain.hash
 create mode 100644 package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk
 create mode 100644 package/kodi-visualisation-goom/0001-cross-compile.patch
 create mode 100644 package/kodi-visualisation-goom/Config.in
 create mode 100644 package/kodi-visualisation-goom/kodi-visualisation-goom.hash
 create mode 100644 package/kodi-visualisation-goom/kodi-visualisation-goom.mk
 create mode 100644 package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
 create mode 100644 package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
 create mode 100644 package/kodi-visualisation-vsxu/Config.in
 create mode 100644 package/kodi-visualisation-vsxu/kodi-visualisation-vsxu.hash
 create mode 100644 package/kodi-visualisation-vsxu/kodi-visualisation-vsxu.mk
 create mode 100644 package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.hash
 create mode 100644 package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
 delete mode 100644 package/libcec/0001-fixed-don-t-generate-an-invalid-env.h-when-not-built.patch
 create mode 100644 package/libcec/libcec.hash
 create mode 100644 package/libplatform/libplatform.hash
 create mode 100644 package/vsxu/0001-Detect-backtrace-support.patch
 create mode 100644 package/vsxu/0002-Do-not-use-host-paths-when-cross-compiling.patch
 create mode 100644 package/vsxu/Config.in
 create mode 100644 package/vsxu/vsxu.hash
 create mode 100644 package/vsxu/vsxu.mk

-- 
2.7.0
