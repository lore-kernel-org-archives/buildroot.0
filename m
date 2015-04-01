From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:35:53 +0200
Subject: [Buildroot] [PATCH/RFC 00/27] package/kodi: bump version to 15.0
	Alpha2-Isengard
Message-ID: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this series is a RFC and not meant for committing to buildroot.

The Kodi project is preparing its next release 15.0, called Isengard.
This patch series introduces two new dependencies, libsquish and tinyxml2.
The pvr-addons were split into seperate repositories, so the current
package kodi-pvr-addons is transformed into a config option.
Also audio codecs, which are not part of ffmpeg, were removed from Kodi
and are now provided as seperate addons.

Regards, Bernd

Bernd Kuhls (27):
  package/libsquish: New package
  package/tinyxml2: new package
  package/kodi: bump version to 15.0 Alpha2-Isengard
  package/kodi-pvr-addons: Split into addon-specific packages
  package/kodi-platform: new package
  package/kodi-pvr-argustv: new package
  package/kodi-pvr-dvblink: new package
  package/kodi-pvr-dvbviewer: new package
  package/kodi-pvr-filmon: new package
  package/kodi-pvr-hts: new package
  package/kodi-pvr-iptvsimple: new package
  package/kodi-pvr-mediaportal-tvserver: new package
  package/kodi-pvr-mythtv: new package
  package/kodi-pvr-nextpvr: new package
  package/kodi-pvr-njoy: new package
  package/kodi-pvr-pctv: new package
  package/kodi-pvr-vdr: new package
  package/kodi-pvr-vuplus: new package
  package/kodi-pvr-wmc: new package
  package/kodi-addon-xvdr: bump version
  package/kodi-audiodecoder-vgmstream: new package
  package/kodi-audiodecoder-modplug: new package
  package/kodi-audiodecoder-snesapu: new package
  package/kodi-audiodecoder-nosefart: new package
  package/kodi-audiodecoder-stsound: new package
  package/kodi-audiodecoder-timidity: new package
  package/kodi-audiodecoder-sidplay: new package

 package/alsa-utils/alsa-utils-0001-libintl.patch   |   23 -
 package/alsa-utils/alsa-utils.mk                   |    5 -
 package/efl/libevas/0001-giflib.patch              |   91 --
 package/efl/libevas/Config.in                      |    2 +-
 package/efl/libevas/libevas.mk                     |    2 +-
 package/ffmpeg/0002-asf-hacks.patch                |   42 +
 ...add-public-version-of-ff_read_frame_flush.patch |   54 ++
 package/ffmpeg/0013-fix-ff-thread-get-format.patch |  131 ---
 .../ffmpeg/0014-hevc-avoid-unnecessary-calls.patch |   72 --
 package/ffmpeg/ffmpeg.hash                         |    2 +-
 package/ffmpeg/ffmpeg.mk                           |    2 +-
 package/lame/lame.mk                               |   13 -
 package/libungif/Config.in                         |    2 -
 package/mesa3d-headers/mesa3d-headers.mk           |    2 +-
 .../0002-Fix-runtime-error-with-uClibc.patch       |   58 ++
 package/mesa3d/0002-disable-python2.patch          |   29 -
 ...if-python-mako-is-not-found-when-required.patch |   61 --
 package/mesa3d/mesa3d.hash                         |    4 +-
 package/mesa3d/mesa3d.mk                           |    3 +-
 package/powertop/Config.in                         |   14 +-
 package/tvheadend/tvheadend.mk                     |    2 +-
 .../0069-Add-missing-C99-float-ld-wrappers.patch   |  870 --------------------
 package/x11r7/xserver_xorg-server/Config.in        |    1 -
 23 files changed, 170 insertions(+), 1315 deletions(-)
 delete mode 100644 package/alsa-utils/alsa-utils-0001-libintl.patch
 delete mode 100644 package/efl/libevas/0001-giflib.patch
 create mode 100644 package/ffmpeg/0002-asf-hacks.patch
 create mode 100644 package/ffmpeg/0013-add-public-version-of-ff_read_frame_flush.patch
 delete mode 100644 package/ffmpeg/0013-fix-ff-thread-get-format.patch
 delete mode 100644 package/ffmpeg/0014-hevc-avoid-unnecessary-calls.patch
 create mode 100644 package/mesa3d/0002-Fix-runtime-error-with-uClibc.patch
 delete mode 100644 package/mesa3d/0002-disable-python2.patch
 delete mode 100644 package/mesa3d/0003-configure.ac-error-out-if-python-mako-is-not-found-when-required.patch
 delete mode 100644 package/uclibc/0.9.33.2/0069-Add-missing-C99-float-ld-wrappers.patch

-- 
1.7.10.4
