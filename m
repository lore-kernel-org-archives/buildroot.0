From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 13 Feb 2014 23:59:49 +0100
Subject: [Buildroot] [PATCH v5 0/5] Introducing XBMC
Message-ID: <1392332394-27935-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This is a new version of the series of patch introducing XBMC.
A new one appeared, which add the dependencies of Java on the host machine for
XBMC.
Also, the $(MAKE1) for XBMC has been removed. After doing a loop of 50 builds
and no trouble so far to report, I assumed it was safe, at least for now.

As always, I wait for your reviews and comments !

Maxime Hadjinlian (5):
  sdl: fix autoreconf timing issue
  sdl: add host version
  sdl_image: add host version
  dependencies.sh: XBMC needs java on the host
  xbmc: new package

 package/Config.in                                  |   1 +
 .../sdl/sdl-0001-use-correct-directfb-config.patch |  19 +-
 package/sdl/sdl.mk                                 |   2 +
 package/sdl_image/sdl_image.mk                     |  11 ++
 package/xbmc/Config.in                             | 202 +++++++++++++++++++++
 package/xbmc/S50xbmc                               |  41 +++++
 package/xbmc/xbmc-0001-Fixup-include-path.patch    |  79 ++++++++
 .../xbmc-0002-RaspberryPi-Default-Settings.patch   | 167 +++++++++++++++++
 package/xbmc/xbmc.mk                               | 175 ++++++++++++++++++
 package/xbmc/xbmc.service                          |  12 ++
 support/dependencies/dependencies.sh               |  10 +
 11 files changed, 702 insertions(+), 17 deletions(-)
 create mode 100644 package/xbmc/Config.in
 create mode 100755 package/xbmc/S50xbmc
 create mode 100644 package/xbmc/xbmc-0001-Fixup-include-path.patch
 create mode 100644 package/xbmc/xbmc-0002-RaspberryPi-Default-Settings.patch
 create mode 100644 package/xbmc/xbmc.mk
 create mode 100644 package/xbmc/xbmc.service

--
1.8.5.3
