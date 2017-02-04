From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Feb 2017 12:44:13 +0100
Subject: [Buildroot] [PATCH v3 00/38] kodi: bump to version 17.0-Krypton
Message-ID: <20170204114451.20935-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this series bumps Kodi to 17.0-Krypton, released 2017/02/01.

Regards, Bernd

v3: fixed legal-info for libplatform & kodi-skin-confluence
v2: added commit log to "package/kodi: add Kconfig option to make
    TexturePacker optional" (Thomas)


Bernd Kuhls (38):
  package/libdvdcss: add Kodi-specific patches
  package/libdvdread: add Kodi-specific patches
  package/libdvdnav: add Kodi-specific patches
  package/libplatform: bump version to 2.1.0
  package/kodi-platform: bump version
  package/libcec: bump version to 4.0.2
  package/xmlstarlet: add host variant
  package/kodi: bump to version 17.0-Krypton
  package/kodi: add patch to disable online check
  package/kodi-inputstream-rtmp: new package
  package/kodi: move rtmp support to new addon kodi-inputstream-rtmp
  package/kodi: add aarch64 support
  package/kodi: add powerpc64 support
  package/kodi: add mips64el support
  package/kodi: add optional support for bluez5
  package/kodi: libxslt is an optional package
  package/kodi: add optional support for lcms2
  package/kodi: add optional support for pulseaudio
  package/libsquish: remove deprecated package
  package/kodi-pvr-*: mass version bump
  package/kodi-pvr-mythtv: bump version to 4.12.12
  package/kodi-pvr-nextpvr: bump version to 2.4.11
  package/kodi-pvr-mediaportal-tvserver: needs locale support
  package/kodi-adsp-basic: bump version
  package/kodi-adsp-freesurround: bump version
  package/kodi-audioencoder-*: mass version bump
  package/kodi-audiodecoder-*: mass version bump
  package/kodi-audiodecoder-timidity: bump version
  package/kodi-screensaver-*: mass version bump
  package/kodi-screensaver-rsxs: bump version
  package/kodi-visualisation-*: mass version bump
  package/kodi-visualisation-waveforhue: bump version
  package/kodi-visualisation-shadertoy: bump version
  package/kodi-inputstream-adaptive: new package
  package/kodi-skin-confluence: new package
  package/kodi: add Kconfig options to remove default skins
  package/kodi: add Kconfig option to make TexturePacker optional
  package/kodi.*: Add -DOVERRIDE_PATHS=1 to all binary addons

 Config.in.legacy                                   |   15 +
 DEVELOPERS                                         |    1 -
 package/Config.in                                  |    1 -
 package/kodi-adsp-basic/kodi-adsp-basic.hash       |    2 +-
 package/kodi-adsp-basic/kodi-adsp-basic.mk         |    5 +-
 .../kodi-adsp-freesurround.hash                    |    2 +-
 .../kodi-adsp-freesurround.mk                      |    5 +-
 .../kodi-audiodecoder-modplug.hash                 |    2 +-
 .../kodi-audiodecoder-modplug.mk                   |    3 +-
 .../kodi-audiodecoder-nosefart.hash                |    2 +-
 .../kodi-audiodecoder-nosefart.mk                  |    3 +-
 .../kodi-audiodecoder-opus.hash                    |    2 +-
 .../kodi-audiodecoder-opus.mk                      |    3 +-
 .../kodi-audiodecoder-sidplay.hash                 |    2 +-
 .../kodi-audiodecoder-sidplay.mk                   |    3 +-
 .../kodi-audiodecoder-snesapu.hash                 |    2 +-
 .../kodi-audiodecoder-snesapu.mk                   |    3 +-
 .../kodi-audiodecoder-stsound.hash                 |    2 +-
 .../kodi-audiodecoder-stsound.mk                   |    3 +-
 package/kodi-audiodecoder-timidity/Config.in       |    1 -
 .../kodi-audiodecoder-timidity.hash                |    2 +-
 .../kodi-audiodecoder-timidity.mk                  |    5 +-
 .../kodi-audiodecoder-vgmstream.hash               |    2 +-
 .../kodi-audiodecoder-vgmstream.mk                 |    3 +-
 .../kodi-audioencoder-flac.hash                    |    2 +-
 .../kodi-audioencoder-flac.mk                      |    3 +-
 .../kodi-audioencoder-lame.hash                    |    2 +-
 .../kodi-audioencoder-lame.mk                      |    3 +-
 .../kodi-audioencoder-vorbis.hash                  |    2 +-
 .../kodi-audioencoder-vorbis.mk                    |    3 +-
 .../kodi-audioencoder-wav.hash                     |    2 +-
 .../kodi-audioencoder-wav/kodi-audioencoder-wav.mk |    3 +-
 package/kodi-inputstream-adaptive/Config.in        |    8 +
 .../kodi-inputstream-adaptive.hash                 |    2 +
 .../kodi-inputstream-adaptive.mk                   |   14 +
 package/kodi-inputstream-rtmp/Config.in            |    7 +
 .../kodi-inputstream-rtmp.hash                     |    2 +
 .../kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk |   14 +
 package/kodi-platform/kodi-platform.hash           |    2 +-
 package/kodi-platform/kodi-platform.mk             |    2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.hash     |    2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk       |    5 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash     |    2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk       |    5 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash |    2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk   |    5 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash       |    2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk         |    5 +-
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash |    2 +-
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk   |    5 +-
 package/kodi-pvr-hts/kodi-pvr-hts.hash             |    2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk               |    5 +-
 .../kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash   |    2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk |    5 +-
 package/kodi-pvr-mediaportal-tvserver/Config.in    |    4 +
 .../kodi-pvr-mediaportal-tvserver.hash             |    2 +-
 .../kodi-pvr-mediaportal-tvserver.mk               |    5 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash       |    2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk         |    7 +-
 ...epresentation-of-char_class_e-in-struct-t.patch |   48 -
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash     |    2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk       |    5 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash           |    2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk             |    5 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash           |    2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk             |    5 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.hash     |    2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk       |    5 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash           |    2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk             |    5 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash   |    2 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk     |    5 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash       |    2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk         |    5 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash             |    2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk               |    5 +-
 .../kodi-screensaver-asteroids.hash                |    2 +-
 .../kodi-screensaver-asteroids.mk                  |    3 +-
 .../kodi-screensaver-asterwave.hash                |    2 +-
 .../kodi-screensaver-asterwave.mk                  |    3 +-
 .../kodi-screensaver-biogenesis.hash               |    2 +-
 .../kodi-screensaver-biogenesis.mk                 |    3 +-
 .../kodi-screensaver-cpblobs.hash                  |    2 +-
 .../kodi-screensaver-cpblobs.mk                    |    3 +-
 .../kodi-screensaver-crystalmorph.hash             |    2 +-
 .../kodi-screensaver-crystalmorph.mk               |    3 +-
 .../kodi-screensaver-greynetic.hash                |    2 +-
 .../kodi-screensaver-greynetic.mk                  |    3 +-
 .../kodi-screensaver-matrixtrails.hash             |    2 +-
 .../kodi-screensaver-matrixtrails.mk               |    4 +-
 .../kodi-screensaver-pingpong.hash                 |    2 +-
 .../kodi-screensaver-pingpong.mk                   |    3 +-
 .../kodi-screensaver-planestate.hash               |    2 +-
 .../kodi-screensaver-planestate.mk                 |    3 +-
 .../kodi-screensaver-pyro.hash                     |    2 +-
 .../kodi-screensaver-pyro/kodi-screensaver-pyro.mk |    3 +-
 .../kodi-screensaver-rsxs/0001-cross-compile.patch |    2 +-
 .../0002-fix-default-include-dir.patch             |   28 +
 package/kodi-screensaver-rsxs/Config.in            |    1 +
 .../kodi-screensaver-rsxs.hash                     |    2 +-
 .../kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk |    6 +-
 .../kodi-screensaver-stars.hash                    |    2 +-
 .../kodi-screensaver-stars.mk                      |    3 +-
 package/kodi-skin-confluence/Config.in             |    7 +
 .../kodi-skin-confluence/kodi-skin-confluence.hash |    2 +
 .../kodi-skin-confluence/kodi-skin-confluence.mk   |   30 +
 .../kodi-visualisation-fishbmc.hash                |    2 +-
 .../kodi-visualisation-fishbmc.mk                  |    3 +-
 .../kodi-visualisation-fountain.hash               |    2 +-
 .../kodi-visualisation-fountain.mk                 |    3 +-
 .../kodi-visualisation-goom.hash                   |    2 +-
 .../kodi-visualisation-goom.mk                     |    4 +-
 ...GLES2-also-search-for-egl-with-pkg-config.patch |    4 +-
 package/kodi-visualisation-shadertoy/Config.in     |    1 -
 .../kodi-visualisation-shadertoy.hash              |    2 +-
 .../kodi-visualisation-shadertoy.mk                |    7 +-
 .../kodi-visualisation-spectrum.hash               |    2 +-
 .../kodi-visualisation-spectrum.mk                 |    3 +-
 .../kodi-visualisation-waveforhue.hash             |    2 +-
 .../kodi-visualisation-waveforhue.mk               |    5 +-
 .../kodi-visualisation-waveform.hash               |    2 +-
 .../kodi-visualisation-waveform.mk                 |    3 +-
 package/kodi/0001-Fixup-include-path.patch         |   33 -
 package/kodi/0001-lib-libdvd-Fix-Makefile.in.patch |  143 ++
 ....cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch |   48 +-
 ...exturePacker-fix-compilation-with-gcc-4.6.patch |   53 -
 package/kodi/0006-ffmpeg30.patch                   |  646 ---------
 ...r-out-of-memory-errors-with-large-numbers.patch |   45 -
 ...ding-issue-when-reading-certain-id3v1-tag.patch |   82 --
 ...lib-cximage-6.0-fix-compilation-with-gcc6.patch | 1438 --------------------
 ...10-curl-support-version-7.5.0-and-upwards.patch |   34 -
 ...bmc_pvr_types.h-Fix-compilation-with-gcc6.patch |   30 -
 package/kodi/0012-Fix_includes_in_amcodec.patch    |   38 -
 package/kodi/0098-disable-online-check.patch       |   65 +
 package/kodi/Config.in                             |  127 +-
 package/kodi/kodi.hash                             |    2 +-
 package/kodi/kodi.mk                               |  166 ++-
 package/libcec/libcec.hash                         |    2 +-
 package/libcec/libcec.mk                           |    4 +-
 ...css-better-handle-partial-read-in-libc_re.patch |   49 +
 ...opy-value-psz_cache-to-dvdcss-psz_cachefi.patch |   33 +
 package/libdvdcss/libdvdcss.mk                     |    5 +
 .../0001-xbmc-dvdnav-allow-get-set-vm-state.patch  |  174 +++
 ...-expose-dvdnav_get_vm-dvdnav_get_button_i.patch |   91 ++
 .../0003-xbmc-dvdnav-detection-of-dvd-name.patch   |   34 +
 ...-xbmc-dvdnav-skip-cell-when-unrecoverable.patch |   42 +
 ...-added-reading-of-VTS_TMAPT-and-TITLE_C_A.patch |   37 +
 .../0006-xbmc-dvdnav-various-safeguards.patch      |   46 +
 ...-disallow-time-search-when-navigation-pro.patch |   34 +
 .../0008-xbmc-dvdnav-additional-debug-log.patch    |   28 +
 ...09-xbmc-dvdnav-add-timemap-to-time-search.patch |  131 ++
 ...dnav-expose-dvdnav_jump_to_sector_by_time.patch |   35 +
 package/libdvdnav/libdvdnav.mk                     |    6 +
 ...01-xbmc-libdvdread-added-defines-includes.patch |   49 +
 ...dread-don-t-do-symlink-resolution-on-kodi.patch |   31 +
 ...read-kodi-VFS-doesn-t-support-opendir-use.patch |   46 +
 package/libdvdread/libdvdread.mk                   |    6 +
 ...nfig.cmake-fix-paths-for-cross-compilatio.patch |   28 +-
 package/libplatform/libplatform.hash               |    2 +-
 package/libplatform/libplatform.mk                 |    8 +-
 package/libsquish/0001-kodi.patch                  |  327 -----
 package/libsquish/Config.in                        |   13 -
 package/libsquish/libsquish.hash                   |    2 -
 package/libsquish/libsquish.mk                     |   37 -
 package/xmlstarlet/xmlstarlet.mk                   |    3 +
 165 files changed, 1672 insertions(+), 3080 deletions(-)
 create mode 100644 package/kodi-inputstream-adaptive/Config.in
 create mode 100644 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
 create mode 100644 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
 create mode 100644 package/kodi-inputstream-rtmp/Config.in
 create mode 100644 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
 create mode 100644 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
 delete mode 100644 package/kodi-pvr-nextpvr/0001-Sync-enum-representation-of-char_class_e-in-struct-t.patch
 create mode 100644 package/kodi-screensaver-rsxs/0002-fix-default-include-dir.patch
 create mode 100644 package/kodi-skin-confluence/Config.in
 create mode 100644 package/kodi-skin-confluence/kodi-skin-confluence.hash
 create mode 100644 package/kodi-skin-confluence/kodi-skin-confluence.mk
 delete mode 100644 package/kodi/0001-Fixup-include-path.patch
 create mode 100644 package/kodi/0001-lib-libdvd-Fix-Makefile.in.patch
 delete mode 100644 package/kodi/0005-native-TexturePacker-fix-compilation-with-gcc-4.6.patch
 delete mode 100644 package/kodi/0006-ffmpeg30.patch
 delete mode 100644 package/kodi/0007-exif-Fix-for-out-of-memory-errors-with-large-numbers.patch
 delete mode 100644 package/kodi/0008-Fix-nullpadding-issue-when-reading-certain-id3v1-tag.patch
 delete mode 100644 package/kodi/0009-lib-cximage-6.0-fix-compilation-with-gcc6.patch
 delete mode 100644 package/kodi/0010-curl-support-version-7.5.0-and-upwards.patch
 delete mode 100644 package/kodi/0011-xbmc_pvr_types.h-Fix-compilation-with-gcc6.patch
 delete mode 100644 package/kodi/0012-Fix_includes_in_amcodec.patch
 create mode 100644 package/kodi/0098-disable-online-check.patch
 create mode 100644 package/libdvdcss/0001-xbmc-libdvdcss-better-handle-partial-read-in-libc_re.patch
 create mode 100644 package/libdvdcss/0002-libdvdcss-Copy-value-psz_cache-to-dvdcss-psz_cachefi.patch
 create mode 100644 package/libdvdnav/0001-xbmc-dvdnav-allow-get-set-vm-state.patch
 create mode 100644 package/libdvdnav/0002-xbmc-dvdnav-expose-dvdnav_get_vm-dvdnav_get_button_i.patch
 create mode 100644 package/libdvdnav/0003-xbmc-dvdnav-detection-of-dvd-name.patch
 create mode 100644 package/libdvdnav/0004-xbmc-dvdnav-skip-cell-when-unrecoverable.patch
 create mode 100644 package/libdvdnav/0005-xbmc-dvdnav-added-reading-of-VTS_TMAPT-and-TITLE_C_A.patch
 create mode 100644 package/libdvdnav/0006-xbmc-dvdnav-various-safeguards.patch
 create mode 100644 package/libdvdnav/0007-xbmc-dvdnav-disallow-time-search-when-navigation-pro.patch
 create mode 100644 package/libdvdnav/0008-xbmc-dvdnav-additional-debug-log.patch
 create mode 100644 package/libdvdnav/0009-xbmc-dvdnav-add-timemap-to-time-search.patch
 create mode 100644 package/libdvdnav/0010-xbmc-dvdnav-expose-dvdnav_jump_to_sector_by_time.patch
 create mode 100644 package/libdvdread/0001-xbmc-libdvdread-added-defines-includes.patch
 create mode 100644 package/libdvdread/0002-xbmc-libdvdread-don-t-do-symlink-resolution-on-kodi.patch
 create mode 100644 package/libdvdread/0003-xbmc-libdvdread-kodi-VFS-doesn-t-support-opendir-use.patch
 delete mode 100644 package/libsquish/0001-kodi.patch
 delete mode 100644 package/libsquish/Config.in
 delete mode 100644 package/libsquish/libsquish.hash
 delete mode 100644 package/libsquish/libsquish.mk

-- 
2.11.0
