From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 15:25:17 +0200
Subject: [Buildroot] [PATCH 00/47] package/kodi: bump version to 15.0
 Isengard
In-Reply-To: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150730152517.6ebf732d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Wed, 22 Jul 2015 22:30:22 +0200, Bernd Kuhls wrote:

> Bernd Kuhls (47):
>   package/libsquish: New package
>   package/libplatform: new package
>   package/libcec: bump to version 3.0.1
>   package/kodi: bump version to 15.0 Isengard
>   package/kodi: Add option for lirc support
>   package/kodi: Rework audio encoder support
>   package/kodi-audioencoder-flac: bump version
>   package/kodi-audioencoder-lame: bump version
>   package/kodi-audioencoder-vorbis: bump version
>   package/kodi-audioencoder-wav: bump version
>   package/kodi-addon-xvdr: bump version
>   package/kodi-pvr-addons: Prepare to split into addon-specific
>     packages
>   package/kodi-platform: new package
>   package/kodi-pvr-argustv: new package
>   package/kodi-pvr-dvblink: new package
>   package/kodi-pvr-dvbviewer: new package
>   package/kodi-pvr-filmon: new package
>   package/kodi-pvr-hts: new package
>   package/kodi-pvr-iptvsimple: new package
>   package/kodi-pvr-mediaportal-tvserver: new package
>   package/kodi-pvr-mythtv: new package
>   package/kodi-pvr-nextpvr: new package
>   package/kodi-pvr-njoy: new package
>   package/kodi-pvr-pctv: new package
>   package/kodi-pvr-stalker: new package
>   package/kodi-pvr-vbox: new package
>   package/kodi-pvr-vdr-vnsi: new package
>   package/kodi-pvr-vuplus: new package
>   package/kodi-pvr-wmc: new package
>   package/kodi-audiodecoder-modplug: new package
>   package/kodi-audiodecoder-nosefart: new package
>   package/kodi-audiodecoder-sidplay: new package
>   package/kodi-audiodecoder-snesapu: new package
>   package/kodi-audiodecoder-stsound: new package
>   package/kodi-audiodecoder-timidity: new package
>   package/kodi-audiodecoder-vgmstream: new package
>   package/kodi-screensaver-asteroids: new package
>   package/kodi-screensaver-biogenesis: new package
>   package/kodi-screensaver-crystalmorph: new package
>   package/kodi-screensaver-greynetic: new package
>   package/kodi-screensaver-pingpong: new package
>   package/kodi-screensaver-pyro: new package
>   package/kodi-screensaver-stars: new package
>   package/kodi-visualisation-shadertoy: new package
>   package/kodi-visualisation-waveform: new package
>   package/kodi-visualisation-spectrum: new package
>   package/kodi-visualisation-waveforhue: new package

I've applied the series, after doing a number of changes to different
patches. The main one, which applies to almost all patches, is the
removal of -DCMAKE_MODULE_PATH. It has become unnecessary because I
fixed the kodi-config.cmake file so that the right path for CMake
modules is automatically used. It allowed to simply all the kodi-pvr-*,
kodi-audiodecoder-*, kodi-audioencoder-*, kodi-screensaver-* and
kodi-visualisation-* packages.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
