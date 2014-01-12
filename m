From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Jan 2014 18:53:14 +0100
Subject: [Buildroot] [PATCH 00/14] Introducing XBMC
Message-ID: <1389549208-19078-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

After a long long time, here is a series introducing XBMC.
There are many packages needed by XBMC to work properly.

Also, it seems it can only build easily with external toolchain (a missing
bitdefs.h files).
It doesn't seems that uClibc is supported also.

Maxime Hadjinlian (14):
  jasper: new package
  libenca: new package
  libass: new package
  libbluray: new package
  libcdio: new package
  libmodplug: new package
  libnfs: new package
  libplist: new package
  librtmp: new package
  libshairplay: new package
  tinyxml: new package
  sdl: add host version
  sdl_image: add host version
  xbmc: new package

 package/Config.in                                  |  12 ++
 package/jasper/Config.in                           |   7 +
 package/jasper/jasper.mk                           |  15 ++
 package/libass/Config.in                           |  10 +
 package/libass/libass.mk                           |  14 ++
 package/libbluray/Config.in                        |   6 +
 package/libbluray/libbluray.mk                     |  14 ++
 package/libcdio/Config.in                          |  11 ++
 package/libcdio/libcdio.mk                         |  18 ++
 package/libenca/Config.in                          |   6 +
 package/libenca/libenca-1.9-dont-build-tools.patch |  33 ++++
 package/libenca/libenca-1.9-fix-clean.patch        |  22 +++
 package/libenca/libenca-1.9-fix-prefix.patch       |  19 ++
 package/libenca/libenca.mk                         |  26 +++
 package/libmodplug/Config.in                       |  10 +
 package/libmodplug/libmodplug.mk                   |  12 ++
 package/libnfs/Config.in                           |  11 ++
 package/libnfs/libnfs.mk                           |  16 ++
 package/libplist/Config.in                         |  12 ++
 package/libplist/libplist.mk                       |  15 ++
 package/librtmp/Config.in                          |   8 +
 package/librtmp/librtmp.mk                         |  51 ++++++
 package/libshairplay/Config.in                     |  12 ++
 package/libshairplay/libshairplay.mk               |  13 ++
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
 34 files changed, 1082 insertions(+)
 create mode 100644 package/jasper/Config.in
 create mode 100644 package/jasper/jasper.mk
 create mode 100644 package/libass/Config.in
 create mode 100644 package/libass/libass.mk
 create mode 100644 package/libbluray/Config.in
 create mode 100644 package/libbluray/libbluray.mk
 create mode 100644 package/libcdio/Config.in
 create mode 100644 package/libcdio/libcdio.mk
 create mode 100644 package/libenca/Config.in
 create mode 100644 package/libenca/libenca-1.9-dont-build-tools.patch
 create mode 100644 package/libenca/libenca-1.9-fix-clean.patch
 create mode 100644 package/libenca/libenca-1.9-fix-prefix.patch
 create mode 100644 package/libenca/libenca.mk
 create mode 100644 package/libmodplug/Config.in
 create mode 100644 package/libmodplug/libmodplug.mk
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
