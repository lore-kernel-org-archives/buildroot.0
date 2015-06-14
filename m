From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 12:28:25 +0200
Subject: [Buildroot] [PATCH 1/4] package/kodi: Move all kodi packages to
	subdirectories of package/kodi/
References: <1434273033-31723-1-git-send-email-bernd.kuhls@t-online.de>
 <20150614112249.5edc2e52@free-electrons.com>
Message-ID: <XnsA4B97EE33FD2AberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150614112249.5edc2e52 at free-
electrons.com:

> We went exactly the other way around recently with moving up all the
> matchbox packages back to package/ directory.

Hi,

ah, I did not notice that, so please regard my patch as suggestion, I was 
inspired by package/x11r7/ when preparing this patch. Currently my Kodi 
Isengard work directory looks like this:

$ find package/kodi/ -type d | sort
package/kodi/
package/kodi/kodi
package/kodi/kodi-audiodecoder-modplug
package/kodi/kodi-audiodecoder-nosefart
package/kodi/kodi-audiodecoder-sidplay
package/kodi/kodi-audiodecoder-snesapu
package/kodi/kodi-audiodecoder-stsound
package/kodi/kodi-audiodecoder-timidity
package/kodi/kodi-audiodecoder-vgmstream
package/kodi/kodi-audioencoder-flac
package/kodi/kodi-audioencoder-lame
package/kodi/kodi-audioencoder-vorbis
package/kodi/kodi-audioencoder-wav
package/kodi/kodi-platform
package/kodi/kodi-pvr-argustv
package/kodi/kodi-pvr-dvblink
package/kodi/kodi-pvr-dvbviewer
package/kodi/kodi-pvr-filmon
package/kodi/kodi-pvr-hts
package/kodi/kodi-pvr-iptvsimple
package/kodi/kodi-pvr-mediaportal-tvserver
package/kodi/kodi-pvr-mythtv
package/kodi/kodi-pvr-nextpvr
package/kodi/kodi-pvr-njoy
package/kodi/kodi-pvr-pctv
package/kodi/kodi-pvr-stalker
package/kodi/kodi-pvr-vbox
package/kodi/kodi-pvr-vdr
package/kodi/kodi-pvr-vuplus
package/kodi/kodi-pvr-wmc
package/kodi/kodi-screensaver-asteroids
package/kodi/kodi-screensaver-biogenesis
package/kodi/kodi-screensaver-crystalmorph
package/kodi/kodi-screensaver-greynetic
package/kodi/kodi-screensaver-pingpong
package/kodi/kodi-screensaver-pyro
package/kodi/kodi-screensaver-rsxs
package/kodi/kodi-screensaver-stars
package/kodi/kodi-visualisation-shadertoy

Is it ok for you to add all these packages to package/? Please note that

https://github.com/notspiff?tab=repositories

contains 12 more visualisation packages and ~5 more screensavers, not to 
mention ~12 more audiodecoders and lots of game.libretro package which I 
haven?t touched yet. This list is likely to grow to include addons from 
other sources after the release of Kodi 15.0 due to its new binary addons 
scheme.

Regards, Bernd
