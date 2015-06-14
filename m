From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:35:59 +0200
Subject: [Buildroot] [PATCH/RFC v2 00/44] package/kodi: bump version to 15.0
	Beta2 Isengard
Message-ID: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this series is a RFC and not meant for committing to buildroot.

The Kodi project is preparing its next release 15.0, called Isengard.
This patch series introduces two new dependencies, libsquish and libplatform.
The pvr-addons were split into seperate repositories, so the current
package kodi-pvr-addons is removed.
Also audio codecs, which are not part of ffmpeg, were removed from Kodi
and are now provided as seperate addons.

Regards, Bernd

v2:
- bump to beta2
- libsquish: use upstream source tarball and add kodi-specific patch
  from OpenElec (Yann)
- added libplatform
- bumped libcec (depends on Kodi 15.0, please do not commit on its own)
- added some screensaver and visualisation addons

Bernd Kuhls (44):
  package/libsquish: New package
  package/libplatform: new package
  package/libcec: bump to version 3.0.0
  package/kodi: bump version to 15.0 Beta2 Isengard
  package/kodi: Add option for lirc support
  package/kodi: Rework audio encoder support
  package/kodi-audioencoder-flac: bump version
  package/kodi-audioencoder-lame: bump version
  package/kodi-audioencoder-vorbis: bump version
  package/kodi-audioencoder-wav: bump version
  package/kodi-addon-xvdr: bump version
  package/kodi-pvr-addons: Prepare to split into addon-specific
    packages
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
  package/kodi-pvr-stalker: new package
  package/kodi-pvr-vbox: new package
  package/kodi-pvr-vdr: new package
  package/kodi-pvr-vuplus: new package
  package/kodi-pvr-wmc: new package
  package/kodi-audiodecoder-modplug: new package
  package/kodi-audiodecoder-nosefart: new package
  package/kodi-audiodecoder-sidplay: new package
  package/kodi-audiodecoder-snesapu: new package
  package/kodi-audiodecoder-stsound: new package
  package/kodi-audiodecoder-timidity: new package
  package/kodi-audiodecoder-vgmstream: new package
  package/kodi-screensaver-asteroids: new package
  package/kodi-screensaver-biogenesis: new package
  package/kodi-screensaver-crystalmorph: new package
  package/kodi-screensaver-greynetic: new package
  package/kodi-screensaver-pingpong: new package
  package/kodi-screensaver-pyro: new package
  package/kodi-screensaver-stars: new package
  package/kodi-visualisation-shadertoy: new package

 package/kodi/kodi.mk         |    2 +-
 package/lame/0003-msse.patch |   24 ------------------------
 2 files changed, 1 insertion(+), 25 deletions(-)
 delete mode 100644 package/lame/0003-msse.patch

-- 
1.7.10.4
