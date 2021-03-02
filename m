From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  2 Mar 2021 08:06:55 +0100
Subject: [Buildroot] [PATCH v2 00/54] package/kodi: bump version to
 19.0-Matrix
Message-ID: <20210302070749.647742-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this series bumps kodi to 19.0-Matrix.

Patches 0001 & 0002 are cherry-picked from next branch to avoid
errors during rebase.

Regards, Bernd

v2:
- kodi-pvr-iptvsimple: bump version to 7.4.3-Matrix
- kodi-pvr-vuplus: bump version to 7.4.0-Matrix
- kodi-pvr-zattoo: bump version to 19.7.3-Matrix
- kodi-skin-confluence: bump version
- kodi:
  - patch 0001 was reverted upstream, not rejected in the first place
  - removed patch to revert upstream wayland-scanner detection changes
  - added configure options to force host version detection of
    wayland-scanner (Yann)
  - added -DENABLE_INTERNAL_UDFREAD=OFF (Yann)


Bernd Kuhls (54):
  package/kodi-pvr-iptvsimple: bump version to 3.10.0-Leia
  package/kodi-pvr-zattoo: bump version to 18.1.23-Leia
  package/kodi-screensaver-crystalmorph: remove package
  package/libcec: bump version to 6.0.2
  package/libplatform: bump version
  package/kodi: bump version to 19.0-Matrix
  package/kodi-audiodecoder-*: mass version bump
  package/kodi-audioencoder-*: mass version bump
  package/kodi-inputstream-adaptive: bump version to 2.6.7-Matrix
  package/kodi-inputstream-ffmpegdirect: new package
  package/kodi-inputstream-rtmp: bump version to 3.4.0-Matrix
  package/kodi-peripheral-joystick: bump version to 1.7.1-Matrix
  package/kodi-peripheral-xarcade: bump version to 1.2.0-Matrix
  package/kodi-pvr-argustv: bump version to 7.1.0-Matrix
  package/kodi-pvr-dvblink: bump version to 9.1.0-Matrix
  package/kodi-pvr-dvbviewer: bump version to 7.2.0-Matrix
  package/kodi-pvr-filmon: bump version to 6.1.0-Matrix
  package/kodi-pvr-hdhomerun: bump version to 7.1.0-Matrix
  package/kodi-pvr-hts: bump version to 8.2.1-Matrix
  package/kodi-pvr-iptvsimple: bump version to 7.4.3-Matrix
  package/kodi-pvr-mediaportal-tvserver: bump version to 8.1.0-Matrix
  package/kodi-pvr-mythtv: bump version to 7.3.0-Matrix
  package/kodi-pvr-nextpvr: bump version to 8.2.1-Matrix
  package/kodi-pvr-njoy: bump version to 7.1.0-Matrix
  package/kodi-pvr-octonet: bump version to 4.1.0-2-Matrix
  package/kodi-pvr-pctv: bump version to 6.1.0-Matrix
  package/kodi-pvr-stalker: bump version to 7.1.0-Matrix
  package/kodi-pvr-vbox: bump version to 8.1.0-Matrix
  package/kodi-pvr-vdr-vnsi: bump version to 8.2.1-Matrix
  package/kodi-pvr-vuplus: bump version to 7.4.0-Matrix
  package/kodi-pvr-wmc: bump version to 6.1.1-Matrix
  package/kodi-pvr-zattoo: bump version to 19.7.3-Matrix
  package/kodi-screensaver-asteroids: bump version to 2.6.0-Matrix
  package/kodi-screensaver-asterwave: bump version to 3.3.0-Matrix
  package/kodi-screensaver-biogenesis: bump version to 2.5.0-Matrix
  package/kodi-screensaver-cpblobs: bump version to 3.4.0-Matrix
  package/kodi-screensaver-greynetic: bump version to 2.5.0-Matrix
  package/kodi-screensaver-matrixtrails: bump version to 2.6.0-Matrix
  package/kodi-screensaver-pingpong: bump version to 2.4.0-Matrix
  package/kodi-screensaver-pyro: bump version to 3.3.0-Matrix
  package/kodi-screensaver-rsxs: bump version
  package/kodi-screensaver-stars: bump version to 2.4.0-Matrix
  package/kodi-skin-confluence: bump version
  package/kodi-vfs-libarchive: new package
  package/kodi-vfs-rar: bump version to 4.0.0-Matrix
  package/kodi-vfs-sftp: bump version to 2.0.0-Matrix
  package/kodi-visualisation-fishbmc: bump version to 6.3.0-Matrix
  package/kodi-visualisation-goom: bump version 3.4.0-Matrix
  package/kodi-visualisation-shadertoy: bump version to 2.3.0-Matrix
  package/kodi-visualisation-spectrum: bump version to 3.4.0-Matrix
  package/kodi-visualisation-starburst: bump version to 2.4.0-Matrix
  package/kodi-visualisation-waveform: bump version to 4.4.0-Matrix
  package/kodi-visualisation-matrix: new package
  package/kodi-platform: remove package

 .../kodi-audiodecoder-modplug.hash            |   4 +-
 .../kodi-audiodecoder-modplug.mk              |   4 +-
 .../kodi-audiodecoder-nosefart.hash           |   4 +-
 .../kodi-audiodecoder-nosefart.mk             |   4 +-
 .../kodi-audiodecoder-sidplay.hash            |   4 +-
 .../kodi-audiodecoder-sidplay.mk              |   4 +-
 .../kodi-audiodecoder-snesapu.hash            |   4 +-
 .../kodi-audiodecoder-snesapu.mk              |   4 +-
 .../kodi-audiodecoder-stsound.hash            |   4 +-
 .../kodi-audiodecoder-stsound.mk              |   4 +-
 .../kodi-audiodecoder-timidity.hash           |   2 +-
 .../kodi-audiodecoder-timidity.mk             |   2 +-
 .../kodi-audiodecoder-vgmstream.hash          |   4 +-
 .../kodi-audiodecoder-vgmstream.mk            |   4 +-
 .../kodi-audioencoder-flac.hash               |   4 +-
 .../kodi-audioencoder-flac.mk                 |   4 +-
 .../kodi-audioencoder-lame.hash               |   4 +-
 .../kodi-audioencoder-lame.mk                 |   4 +-
 .../kodi-audioencoder-vorbis.hash             |   4 +-
 .../kodi-audioencoder-vorbis.mk               |   4 +-
 .../kodi-audioencoder-wav.hash                |   4 +-
 .../kodi-audioencoder-wav.mk                  |   4 +-
 package/kodi-inputstream-adaptive/Config.in   |   1 +
 .../kodi-inputstream-adaptive.hash            |   2 +-
 .../kodi-inputstream-adaptive.mk              |   4 +-
 .../kodi-inputstream-ffmpegdirect/Config.in   |  13 +
 .../kodi-inputstream-ffmpegdirect.hash        |   3 +
 .../kodi-inputstream-ffmpegdirect.mk          |  15 +
 package/kodi-inputstream-rtmp/Config.in       |   2 +
 .../kodi-inputstream-rtmp.hash                |   4 +-
 .../kodi-inputstream-rtmp.mk                  |   6 +-
 .../kodi-jsonschemabuilder.mk                 |   2 +-
 .../kodi-peripheral-joystick.hash             |   4 +-
 .../kodi-peripheral-joystick.mk               |   4 +-
 .../kodi-peripheral-xarcade.hash              |   4 +-
 .../kodi-peripheral-xarcade.mk                |   4 +-
 ...nfig.cmake-fix-for-cross-compilation.patch |  56 --
 package/kodi-platform/Config.in               |   7 -
 package/kodi-platform/kodi-platform.hash      |   3 -
 package/kodi-platform/kodi-platform.mk        |  14 -
 package/kodi-pvr-argustv/Config.in            |   1 -
 .../kodi-pvr-argustv/kodi-pvr-argustv.hash    |   4 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk  |   6 +-
 package/kodi-pvr-dvblink/Config.in            |   1 -
 .../kodi-pvr-dvblink/kodi-pvr-dvblink.hash    |   4 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk  |   6 +-
 package/kodi-pvr-dvbviewer/Config.in          |   2 +-
 .../kodi-pvr-dvbviewer.hash                   |   4 +-
 .../kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk  |   6 +-
 package/kodi-pvr-filmon/Config.in             |   1 -
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash  |   4 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk    |   6 +-
 package/kodi-pvr-hdhomerun/Config.in          |   1 -
 .../kodi-pvr-hdhomerun.hash                   |   4 +-
 .../kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk  |   6 +-
 package/kodi-pvr-hts/Config.in                |   5 +-
 package/kodi-pvr-hts/kodi-pvr-hts.hash        |   4 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk          |   6 +-
 package/kodi-pvr-iptvsimple/Config.in         |  10 +-
 .../kodi-pvr-iptvsimple.hash                  |   4 +-
 .../kodi-pvr-iptvsimple.mk                    |   6 +-
 ...o-more-supported-C-17-declaration-ke.patch |  29 +
 .../0002-Remove-p8-os-includes.patch          | 160 +++++
 .../0003-Use-kodi-StringUtils.patch           | 127 ++++
 .../0004-Remove-SAFE_DELETE.patch             | 292 ++++++++
 ...d-sleep_for-instead-of-p8-time-utils.patch | 311 ++++++++
 ...td-mutex-condition_variable-instead-.patch | 676 ++++++++++++++++++
 ...-Remove-charset-converter-dependency.patch |  58 ++
 .../0008-Remove-p8-platform-dependency.patch  |  77 ++
 .../0009-Travis-changes-for-cpp17.patch       |  31 +
 ...-keyword-as-no-longer-valid-in-CPP17.patch |  26 +
 .../0011-changelog-and-version-v8.1.1.patch   |  45 ++
 .../kodi-pvr-mediaportal-tvserver/Config.in   |   2 +-
 .../kodi-pvr-mediaportal-tvserver.hash        |   4 +-
 .../kodi-pvr-mediaportal-tvserver.mk          |   6 +-
 package/kodi-pvr-mythtv/Config.in             |   1 -
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash  |   4 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk    |   6 +-
 package/kodi-pvr-nextpvr/Config.in            |   2 +-
 .../kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash    |   4 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk  |   6 +-
 package/kodi-pvr-njoy/Config.in               |   2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash      |   4 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk        |   6 +-
 package/kodi-pvr-octonet/Config.in            |   2 -
 .../kodi-pvr-octonet/kodi-pvr-octonet.hash    |   4 +-
 package/kodi-pvr-octonet/kodi-pvr-octonet.mk  |   6 +-
 package/kodi-pvr-pctv/Config.in               |   1 -
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash      |   4 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk        |   6 +-
 package/kodi-pvr-stalker/Config.in            |   1 -
 .../kodi-pvr-stalker/kodi-pvr-stalker.hash    |   4 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk  |   6 +-
 package/kodi-pvr-vbox/Config.in               |   1 -
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash      |   4 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk        |   6 +-
 package/kodi-pvr-vdr-vnsi/Config.in           |   5 +-
 .../kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash  |   4 +-
 .../kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk    |   6 +-
 package/kodi-pvr-vuplus/Config.in             |   1 -
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash  |   4 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk    |   6 +-
 package/kodi-pvr-wmc/Config.in                |   1 -
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash        |   4 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk          |   6 +-
 package/kodi-pvr-zattoo/Config.in             |   2 -
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash  |   4 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk    |   6 +-
 package/kodi-screensaver-asteroids/Config.in  |   4 -
 .../kodi-screensaver-asteroids.hash           |   4 +-
 .../kodi-screensaver-asteroids.mk             |   4 +-
 package/kodi-screensaver-asterwave/Config.in  |   7 +-
 .../kodi-screensaver-asterwave.hash           |   4 +-
 .../kodi-screensaver-asterwave.mk             |  10 +-
 package/kodi-screensaver-biogenesis/Config.in |   4 -
 .../kodi-screensaver-biogenesis.hash          |   4 +-
 .../kodi-screensaver-biogenesis.mk            |   4 +-
 package/kodi-screensaver-cpblobs/Config.in    |   6 +-
 .../kodi-screensaver-cpblobs.hash             |   4 +-
 .../kodi-screensaver-cpblobs.mk               |  10 +-
 .../kodi-screensaver-crystalmorph/Config.in   |  10 -
 .../kodi-screensaver-crystalmorph.hash        |   3 -
 .../kodi-screensaver-crystalmorph.mk          |  13 -
 package/kodi-screensaver-greynetic/Config.in  |   5 +-
 .../kodi-screensaver-greynetic.hash           |   4 +-
 .../kodi-screensaver-greynetic.mk             |   6 +-
 .../kodi-screensaver-matrixtrails/Config.in   |   5 -
 .../kodi-screensaver-matrixtrails.hash        |   4 +-
 .../kodi-screensaver-matrixtrails.mk          |  10 +-
 package/kodi-screensaver-pingpong/Config.in   |   5 +-
 .../kodi-screensaver-pingpong.hash            |   4 +-
 .../kodi-screensaver-pingpong.mk              |   6 +-
 package/kodi-screensaver-pyro/Config.in       |   4 -
 .../kodi-screensaver-pyro.hash                |   4 +-
 .../kodi-screensaver-pyro.mk                  |   4 +-
 .../0001-Disable-drempels.patch               |  40 --
 package/kodi-screensaver-rsxs/Config.in       |  10 +-
 .../kodi-screensaver-rsxs.hash                |   4 +-
 .../kodi-screensaver-rsxs.mk                  |   6 +-
 package/kodi-screensaver-stars/Config.in      |   4 -
 .../kodi-screensaver-stars.hash               |   2 +-
 .../kodi-screensaver-stars.mk                 |   2 +-
 .../kodi-skin-confluence.hash                 |   2 +-
 .../kodi-skin-confluence.mk                   |   2 +-
 .../kodi-texturepacker/kodi-texturepacker.mk  |   2 +-
 package/kodi-vfs-libarchive/Config.in         |  13 +
 .../kodi-vfs-libarchive.hash                  |   3 +
 .../kodi-vfs-libarchive.mk                    |  21 +
 package/kodi-vfs-rar/kodi-vfs-rar.hash        |   2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.mk          |   2 +-
 package/kodi-vfs-sftp/Config.in               |   4 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.hash      |   2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.mk        |   4 +-
 .../kodi-visualisation-fishbmc.hash           |   4 +-
 .../kodi-visualisation-fishbmc.mk             |   4 +-
 package/kodi-visualisation-goom/Config.in     |   6 +-
 .../kodi-visualisation-goom.hash              |   4 +-
 .../kodi-visualisation-goom.mk                |   4 +-
 package/kodi-visualisation-matrix/Config.in   |   7 +
 .../kodi-visualisation-matrix.hash            |   3 +
 .../kodi-visualisation-matrix.mk              |  13 +
 .../kodi-visualisation-shadertoy/Config.in    |   1 -
 .../kodi-visualisation-shadertoy.hash         |   4 +-
 .../kodi-visualisation-shadertoy.mk           |   6 +-
 ...Backport-Add-missing-cstddef-include.patch |  30 -
 package/kodi-visualisation-spectrum/Config.in |   1 +
 .../kodi-visualisation-spectrum.hash          |   4 +-
 .../kodi-visualisation-spectrum.mk            |   6 +-
 .../kodi-visualisation-starburst.hash         |   4 +-
 .../kodi-visualisation-starburst.mk           |   4 +-
 package/kodi-visualisation-waveform/Config.in |   1 +
 .../kodi-visualisation-waveform.hash          |   2 +-
 .../kodi-visualisation-waveform.mk            |   6 +-
 ...e-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch |  17 +-
 .../kodi/0002-Fix-crosscompiling-issues.patch |  76 --
 ...ux-fix-drm-object-build-with-gcc-4.9.patch |  34 +
 package/kodi/Config.in                        | 141 ++--
 package/kodi/kodi.hash                        |   3 +-
 package/kodi/kodi.mk                          |  96 +--
 package/libcec/libcec.hash                    |   2 +-
 package/libcec/libcec.mk                      |   2 +-
 package/libplatform/libplatform.hash          |   2 +-
 package/libplatform/libplatform.mk            |   6 +-
 183 files changed, 2365 insertions(+), 701 deletions(-)
 create mode 100644 package/kodi-inputstream-ffmpegdirect/Config.in
 create mode 100644 package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
 create mode 100644 package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
 delete mode 100644 package/kodi-platform/0001-kodiplatform-config.cmake-fix-for-cross-compilation.patch
 delete mode 100644 package/kodi-platform/Config.in
 delete mode 100644 package/kodi-platform/kodi-platform.hash
 delete mode 100644 package/kodi-platform/kodi-platform.mk
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0001-Revert-Removed-no-more-supported-C-17-declaration-ke.patch
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0002-Remove-p8-os-includes.patch
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0003-Use-kodi-StringUtils.patch
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0004-Remove-SAFE_DELETE.patch
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0005-Use-thread-sleep_for-instead-of-p8-time-utils.patch
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0006-Use-std-thread-std-mutex-condition_variable-instead-.patch
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0007-Remove-charset-converter-dependency.patch
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0008-Remove-p8-platform-dependency.patch
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0009-Travis-changes-for-cpp17.patch
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0010-Remove-register-keyword-as-no-longer-valid-in-CPP17.patch
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0011-changelog-and-version-v8.1.1.patch
 delete mode 100644 package/kodi-screensaver-crystalmorph/Config.in
 delete mode 100644 package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
 delete mode 100644 package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
 delete mode 100644 package/kodi-screensaver-rsxs/0001-Disable-drempels.patch
 create mode 100644 package/kodi-vfs-libarchive/Config.in
 create mode 100644 package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
 create mode 100644 package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
 create mode 100644 package/kodi-visualisation-matrix/Config.in
 create mode 100644 package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
 create mode 100644 package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
 delete mode 100644 package/kodi-visualisation-spectrum/0001-Backport-Add-missing-cstddef-include.patch
 delete mode 100644 package/kodi/0002-Fix-crosscompiling-issues.patch
 create mode 100644 package/kodi/0002-linux-fix-drm-object-build-with-gcc-4.9.patch

-- 
2.29.2
