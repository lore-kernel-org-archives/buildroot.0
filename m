From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Jan 2014 22:38:56 +0100
Subject: [Buildroot] [PATCH v4 0/5] Introducing XBMC
Message-ID: <1390772341-6790-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This is a new version (trimmed down), to the series of patch introducing XBMC.
A few changes has been made to libenca, where I merged the patch from Bernd
Kuhls (http://patchwork.ozlabs.org/patch/312284/).
And also XBMC, where I have reworked the init script, and added one for systemd.

As always, I wait for your reviews and comments !

Maxime Hadjinlian (5):
  sdl: add host version
  sdl_image: add host version
  libenca: new package
  libass: new package
  xbmc: new package

 package/Config.in                                  |   3 +
 package/libass/Config.in                           |  11 ++
 package/libass/libass.mk                           |  14 ++
 package/libenca/Config.in                          |   7 +
 .../libenca/libenca-000-do-not-build-tools.patch   |  44 +++++
 .../libenca-001-fix-installation-error.patch       |  44 +++++
 ...benca-002-remove-prefix-hack-in-configure.patch |  33 ++++
 package/libenca/libenca-003-iconv.patch            |  15 ++
 package/libenca/libenca.mk                         |  33 ++++
 package/sdl/sdl.mk                                 |   2 +
 package/sdl_image/sdl_image.mk                     |  11 ++
 package/xbmc/Config.in                             | 202 +++++++++++++++++++++
 package/xbmc/S50xbmc                               |  41 +++++
 package/xbmc/xbmc-0001-Fixup-include-path.patch    |  79 ++++++++
 .../xbmc-0002-RaspberryPi-Default-Settings.patch   | 167 +++++++++++++++++
 package/xbmc/xbmc.mk                               | 176 ++++++++++++++++++
 package/xbmc/xbmc.service                          |  12 ++
 17 files changed, 894 insertions(+)
 create mode 100644 package/libass/Config.in
 create mode 100644 package/libass/libass.mk
 create mode 100644 package/libenca/Config.in
 create mode 100644 package/libenca/libenca-000-do-not-build-tools.patch
 create mode 100644 package/libenca/libenca-001-fix-installation-error.patch
 create mode 100644 package/libenca/libenca-002-remove-prefix-hack-in-configure.patch
 create mode 100644 package/libenca/libenca-003-iconv.patch
 create mode 100644 package/libenca/libenca.mk
 create mode 100644 package/xbmc/Config.in
 create mode 100755 package/xbmc/S50xbmc
 create mode 100644 package/xbmc/xbmc-0001-Fixup-include-path.patch
 create mode 100644 package/xbmc/xbmc-0002-RaspberryPi-Default-Settings.patch
 create mode 100644 package/xbmc/xbmc.mk
 create mode 100644 package/xbmc/xbmc.service

--
1.8.5.2
