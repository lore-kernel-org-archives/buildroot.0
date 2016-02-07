From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Feb 2016 17:02:44 +0100
Subject: [Buildroot] [PATCH 00/28] package/kodi: bump version to 16.0 rc3
Message-ID: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patch series bumps Kodi to the soon-to-be-released version
16.0-Jarvis, currently upstream is at rc3. The release date is not
public atm, I do not know if a decision was already made upstream.

This series consist of several stages:

Patches 1 & 2 are independent of the version bump, goom & rsxs can be
used as addons with Kodi 15.x already although their source code is also
part of Kodi 15.x. In Kodi 16.x their source code was removed so the
creation of standalone packages is necessary at this stage.

Patches 3 - 15 are the real version bump, first some dependency libs
are bumped, then Kodi with some additional cleanups, at last the addons
are bumped, most of them as a mass version bump, as discussed on the
mailinglist. I will send hash files for all addon packages after Kodi
16.0 was released.

Patches 16 - 28 add new addons and can be applied at any time after the
version bump took place, they are independent of this bump.

Regards, Bernd


Bernd Kuhls (28):
  package/kodi-visualisation-goom: new package
  package/kodi-screensaver-rsxs: new package
  package/libplatform: bump version
  package/libcec: bump version
  package/kodi-platform: bump version
  package/kodi: bump version to 16.0 rc3
  package/kodi: enable samba support with uClibc toolchain
  package/kodi: not available using a musl-based toolchain
  package/kodi: reorder select/depends
  package/kodi: Remove dependency for BR2_STATIC_LIBS from sub packages
  package/ffmpeg: Remove patch not needed anymore for Kodi 16.0-Jarvis
  package/kodi-audio??coder-*: mass version bump
  package/kodi-pvr-*: mass version bump
  package/kodi-screensaver/visualisation-*: mass version bump
  package/kodi-visualisation-shadertoy: bump version
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

 Config.in.legacy                                   | 21 +++++
 package/Config.in                                  |  1 +
 ...add-public-version-of-ff_read_frame_flush.patch | 53 ------------
 package/kodi-adsp-basic/Config.in                  | 12 +++
 package/kodi-adsp-basic/kodi-adsp-basic.mk         | 13 +++
 package/kodi-adsp-biquad-filters/Config.in         | 10 +++
 .../kodi-adsp-biquad-filters.mk                    | 14 ++++
 package/kodi-adsp-freesurround/Config.in           | 11 +++
 .../kodi-adsp-freesurround.mk                      | 13 +++
 .../kodi-audiodecoder-modplug.mk                   |  2 +-
 .../kodi-audiodecoder-nosefart.mk                  |  2 +-
 package/kodi-audiodecoder-opus/Config.in           | 10 +++
 .../kodi-audiodecoder-opus.mk                      | 13 +++
 .../kodi-audiodecoder-sidplay.mk                   |  2 +-
 .../kodi-audiodecoder-snesapu.mk                   |  2 +-
 .../kodi-audiodecoder-stsound.mk                   |  2 +-
 .../kodi-audiodecoder-timidity.mk                  |  2 +-
 .../kodi-audiodecoder-vgmstream.mk                 |  2 +-
 .../kodi-audioencoder-flac.mk                      |  2 +-
 .../kodi-audioencoder-lame.mk                      |  2 +-
 .../kodi-audioencoder-vorbis.mk                    |  2 +-
 .../kodi-audioencoder-wav/kodi-audioencoder-wav.mk |  2 +-
 package/kodi-platform/kodi-platform.mk             |  2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk       |  2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk       |  2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk   |  2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk         |  2 +-
 package/kodi-pvr-hdhomerun/Config.in               | 13 +++
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk   | 13 +++
 package/kodi-pvr-hts/kodi-pvr-hts.mk               |  2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk |  2 +-
 .../kodi-pvr-mediaportal-tvserver.mk               |  2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk         |  2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk       |  2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk             |  2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk             |  2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk       |  2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk             |  2 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk     |  2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk         |  2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk               |  2 +-
 .../kodi-screensaver-asteroids.mk                  |  2 +-
 package/kodi-screensaver-asterwave/Config.in       | 11 +++
 .../kodi-screensaver-asterwave.mk                  | 11 +++
 .../kodi-screensaver-biogenesis.mk                 |  2 +-
 package/kodi-screensaver-cpblobs/Config.in         | 11 +++
 .../kodi-screensaver-cpblobs.mk                    | 13 +++
 .../kodi-screensaver-greynetic.mk                  |  2 +-
 .../kodi-screensaver-matrixtrails/0001-cmake.patch | 33 ++++++++
 package/kodi-screensaver-matrixtrails/Config.in    | 11 +++
 .../kodi-screensaver-matrixtrails.mk               | 14 ++++
 .../kodi-screensaver-pingpong.mk                   |  2 +-
 package/kodi-screensaver-planestate/Config.in      | 11 +++
 .../kodi-screensaver-planestate.mk                 | 11 +++
 .../kodi-screensaver-pyro/kodi-screensaver-pyro.mk |  2 +-
 .../kodi-screensaver-rsxs/0001-cross-compile.patch | 37 +++++++++
 package/kodi-screensaver-rsxs/Config.in            | 10 +++
 .../kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk | 14 ++++
 .../kodi-screensaver-stars.mk                      |  2 +-
 package/kodi-visualisation-fishbmc/Config.in       | 10 +++
 .../kodi-visualisation-fishbmc.mk                  | 13 +++
 package/kodi-visualisation-fountain/Config.in      | 11 +++
 .../kodi-visualisation-fountain.mk                 | 11 +++
 .../0001-cross-compile.patch                       | 32 ++++++++
 package/kodi-visualisation-goom/Config.in          | 10 +++
 .../kodi-visualisation-goom.mk                     | 14 ++++
 ...GLES2-also-search-for-egl-with-pkg-config.patch | 14 ++--
 .../kodi-visualisation-shadertoy.mk                |  4 +-
 .../kodi-visualisation-spectrum.mk                 |  2 +-
 package/kodi-visualisation-vsxu/Config.in          |  8 ++
 .../kodi-visualisation-vsxu.mk                     | 13 +++
 .../kodi-visualisation-waveform.mk                 |  2 +-
 ....cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch | 21 +++--
 package/kodi/Config.in                             | 96 +++++++++-------------
 package/kodi/kodi.hash                             |  2 +-
 package/kodi/kodi.mk                               | 36 +-------
 ...-generate-an-invalid-env.h-when-not-built.patch | 31 -------
 package/libcec/libcec.mk                           |  2 +-
 package/libplatform/libplatform.mk                 |  2 +-
 package/vsxu/0001-Detect-backtrace-support.patch   | 65 +++++++++++++++
 ...o-not-use-host-paths-when-cross-compiling.patch | 55 +++++++++++++
 package/vsxu/Config.in                             | 22 +++++
 package/vsxu/vsxu.mk                               | 43 ++++++++++
 83 files changed, 741 insertions(+), 230 deletions(-)
 delete mode 100644 package/ffmpeg/0013-add-public-version-of-ff_read_frame_flush.patch
 create mode 100644 package/kodi-adsp-basic/Config.in
 create mode 100644 package/kodi-adsp-basic/kodi-adsp-basic.mk
 create mode 100644 package/kodi-adsp-biquad-filters/Config.in
 create mode 100644 package/kodi-adsp-biquad-filters/kodi-adsp-biquad-filters.mk
 create mode 100644 package/kodi-adsp-freesurround/Config.in
 create mode 100644 package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk
 create mode 100644 package/kodi-audiodecoder-opus/Config.in
 create mode 100644 package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk
 create mode 100644 package/kodi-pvr-hdhomerun/Config.in
 create mode 100644 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
 create mode 100644 package/kodi-screensaver-asterwave/Config.in
 create mode 100644 package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
 create mode 100644 package/kodi-screensaver-cpblobs/Config.in
 create mode 100644 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
 create mode 100644 package/kodi-screensaver-matrixtrails/0001-cmake.patch
 create mode 100644 package/kodi-screensaver-matrixtrails/Config.in
 create mode 100644 package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
 create mode 100644 package/kodi-screensaver-planestate/Config.in
 create mode 100644 package/kodi-screensaver-planestate/kodi-screensaver-planestate.mk
 create mode 100644 package/kodi-screensaver-rsxs/0001-cross-compile.patch
 create mode 100644 package/kodi-screensaver-rsxs/Config.in
 create mode 100644 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
 create mode 100644 package/kodi-visualisation-fishbmc/Config.in
 create mode 100644 package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
 create mode 100644 package/kodi-visualisation-fountain/Config.in
 create mode 100644 package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk
 create mode 100644 package/kodi-visualisation-goom/0001-cross-compile.patch
 create mode 100644 package/kodi-visualisation-goom/Config.in
 create mode 100644 package/kodi-visualisation-goom/kodi-visualisation-goom.mk
 create mode 100644 package/kodi-visualisation-vsxu/Config.in
 create mode 100644 package/kodi-visualisation-vsxu/kodi-visualisation-vsxu.mk
 delete mode 100644 package/libcec/0001-fixed-don-t-generate-an-invalid-env.h-when-not-built.patch
 create mode 100644 package/vsxu/0001-Detect-backtrace-support.patch
 create mode 100644 package/vsxu/0002-Do-not-use-host-paths-when-cross-compiling.patch
 create mode 100644 package/vsxu/Config.in
 create mode 100644 package/vsxu/vsxu.mk

-- 
2.7.0
