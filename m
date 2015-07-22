From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 22 Jul 2015 22:30:22 +0200
Subject: [Buildroot] [PATCH 00/47] package/kodi: bump version to 15.0
	Isengard
Message-ID: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Kodi 15.0 Isengard was released yesterday:
http://kodi.tv/kodi-15-0-isengard-one-release-to-rule-them-all/

This patch series introduces two new dependencies, libsquish and
libplatform, also the way the host binary of TexturePacker has to be
built was updated. The pvr-addons were split into separate repositories,
the current package kodi-pvr-addons is removed. Also audio codecs, which
are not part of ffmpeg, were removed from Kodi and are now provided as
seperate addons.

Please commit this patch series as a whole because libcec-3 is
incompatible with Kodi 14.2, also all the addons packages depend on
Kodi 15.0.

I regard this patch series as v1, here is the changelog after v3 of the
previous RFC patch series:

v1:
- bump to Kodi 15.0 release version
- added Config.in.legacy handling for PVR addons
- added some SoB lines to Kodi patches

This is the changelog from the previous RFC patch series:

v3:
- bump to rc2, but a later commit fixing problems with disabled
  BR2_PACKAGE_KODI_LIBMICROHTTPD
- Kodi depends on eventfd_read/write support which is missing in
  uclibc 0.9.33.2, I sent this patch upstream:
  package/kodi/0003-ALSA-make-device-change-event-support-optional.patch
  which is currently under discussion:
  https://github.com/xbmc/xbmc/pull/7551
  Depending on the outcome of the discussion I may block Kodi for uclibc
  in the final patch series
- libsquish is now at 1.13, upstream changed to sourceforge and
  the Kodi-specific stuff is now a smaller patch (Thomas)
- various version bumps compared to v2 (libcec, libplatform, ffmpeg)
- Goom and rsxs are now binary addons
To-Do
- Config.in.legacy handling

v2:
- bump to beta2
- libsquish: use upstream source tarball and add kodi-specific patch
  from OpenElec (Yann)
- added libplatform
- bumped libcec (depends on Kodi 15.0, please do not commit on its own)
- added some screensaver and visualisation addons

Regards, Bernd


Bernd Kuhls (47):
  package/libsquish: New package
  package/libplatform: new package
  package/libcec: bump to version 3.0.1
  package/kodi: bump version to 15.0 Isengard
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
  package/kodi-pvr-vdr-vnsi: new package
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
  package/kodi-visualisation-waveform: new package
  package/kodi-visualisation-spectrum: new package
  package/kodi-visualisation-waveforhue: new package

-- 
1.7.10.4
