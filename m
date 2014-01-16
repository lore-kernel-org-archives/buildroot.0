From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 16 Jan 2014 01:15:43 +0100
Subject: [Buildroot] [PATCH v2 00/12] Introducing XBMC
Message-ID: <1389831355-19983-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the v2 of the series introducing XBMC with the different comments taken
into accounts.
Note that the packages already commited were ommited this time.

Maxime Hadjinlian (12):
  libass: new package
  libbluray: new package
  libcdio: new package
  libnfs: new package
  libplist: new package
  librtmp: new package
  libshairplay: new package
  tinyxml: new package
  sdl: add host version
  sdl_image: add host version
  libenca: new package
  xbmc: new package

 package/Config.in                                  |  10 +
 package/libass/Config.in                           |  10 +
 package/libass/libass.mk                           |  14 ++
 package/libbluray/Config.in                        |   6 +
 package/libbluray/libbluray.mk                     |  19 ++
 package/libcdio/Config.in                          |  11 ++
 package/libcdio/libcdio.mk                         |  18 ++
 package/libenca/Config.in                          |   6 +
 .../libenca/libenca-000-do-not-build-tools.patch   |  44 +++++
 .../libenca-001-fix-installation-error.patch       |  44 +++++
 ...benca-002-remove-prefix-hack-in-configure.patch |  33 ++++
 package/libenca/libenca.mk                         |  36 ++++
 package/libnfs/Config.in                           |  11 ++
 package/libnfs/libnfs.mk                           |  16 ++
 package/libplist/Config.in                         |  12 ++
 package/libplist/libplist.mk                       |  15 ++
 package/librtmp/Config.in                          |   8 +
 package/librtmp/librtmp.mk                         |  51 ++++++
 package/libshairplay/Config.in                     |  12 ++
 package/libshairplay/libshairplay.mk               |  14 ++
 package/sdl/sdl.mk                                 |   2 +
 package/sdl_image/sdl_image.mk                     |  11 ++
 package/tinyxml/Config.in                          |  11 ++
 package/tinyxml/tinyxml.mk                         |  15 ++
 package/xbmc/Config.in                             | 202 +++++++++++++++++++++
 package/xbmc/S99xbmc.default                       |  24 +++
 package/xbmc/S99xbmc.raspberrypi                   |  31 ++++
 package/xbmc/xbmc-0001-Fixup-include-path.patch    |  79 ++++++++
 .../xbmc-0002-RaspberryPi-Default-Settings.patch   | 167 +++++++++++++++++
 package/xbmc/xbmc.mk                               | 167 +++++++++++++++++
 30 files changed, 1099 insertions(+)
 create mode 100644 package/libass/Config.in
 create mode 100644 package/libass/libass.mk
 create mode 100644 package/libbluray/Config.in
 create mode 100644 package/libbluray/libbluray.mk
 create mode 100644 package/libcdio/Config.in
 create mode 100644 package/libcdio/libcdio.mk
 create mode 100644 package/libenca/Config.in
 create mode 100644 package/libenca/libenca-000-do-not-build-tools.patch
 create mode 100644 package/libenca/libenca-001-fix-installation-error.patch
 create mode 100644 package/libenca/libenca-002-remove-prefix-hack-in-configure.patch
 create mode 100644 package/libenca/libenca.mk
 create mode 100644 package/libnfs/Config.in
 create mode 100644 package/libnfs/libnfs.mk
 create mode 100644 package/libplist/Config.in
 create mode 100644 package/libplist/libplist.mk
 create mode 100644 package/librtmp/Config.in
 create mode 100644 package/librtmp/librtmp.mk
 create mode 100644 package/libshairplay/Config.in
 create mode 100644 package/libshairplay/libshairplay.mk
 create mode 100644 package/tinyxml/Config.in
 create mode 100644 package/tinyxml/tinyxml.mk
 create mode 100644 package/xbmc/Config.in
 create mode 100755 package/xbmc/S99xbmc.default
 create mode 100755 package/xbmc/S99xbmc.raspberrypi
 create mode 100644 package/xbmc/xbmc-0001-Fixup-include-path.patch
 create mode 100644 package/xbmc/xbmc-0002-RaspberryPi-Default-Settings.patch
 create mode 100644 package/xbmc/xbmc.mk

--
1.8.5.2
