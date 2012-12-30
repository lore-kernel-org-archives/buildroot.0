From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Dec 2012 07:31:38 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch e17
Message-ID: <cover.1356849033.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of patches bumps all the EFL (Enlightenment Foundation
Libraries) packages to the latest version 1.7.4 which was released on
December, 21st with E17.

It also adds a package for E17 itself, in order to provide a
demonstration of a lightweight desktop environment in Buildroot.

It has been tested on ARM Glibc (Linaro toolchain) and uClibc
(internal toolchain), booted under X.org in Qemu, and it starts fine.

Of course, some additional improvements and tests can be made later:
test with the XCB backend (only the X11 backend has been tested), test
with the OpenGL backend, test more features, etc.

Changes since v1:

 * Fix typo in libeio help text.

 * Add dependencies on libeet, libecore and libeina in the libeio
   package. I have now properly build tested a simple libeio build.

 * Add an help text for the enlightenment package.

 * Properly squash the expedite version bump patches

Best regards,

Thomas

The following changes since commit 2c5b4ddc1932e7dedec1e412a5c5465f4fbe6f8b:

  wavpack: fix broken link on newer binutils (2012-12-29 14:30:59 +0100)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git e17

for you to fetch changes up to 473af436480f08e78377154783276b1c348b2625:

  enlightenment: new package (2012-12-30 07:24:10 +0100)

----------------------------------------------------------------
Thomas Petazzoni (19):
      efl/libecore: bump version to 1.7.4
      efl/expedite: bump to version 1.7.4
      efl/libedbus: bump to version 1.7.4
      efl/libedje: bump to version 1.7.4
      efl/libeet: bump to version 1.7.4
      efl/libefreet: bump to version 1.7.4
      efl/libeina: bump to version 1.7.4
      efl/libelementary: bump to version 1.7.4 and change download location
      efl/libembryo: bump to version 1.7.4
      efl/libevas: bump to version 1.7.4
      efl/libevas: remove SVG support
      efl/libevas: adjust dependency on X11 libraries
      efl/libevas: remove examples source code from target filesystem
      efl/libeio: new package
      efl/libethumb: bump to 1.7.4 and change download location
      librsvg: relax dependency on Gtk, add gdk-pixbuf dependency
      efl/libevas-generic-loaders: new package
      xcb-util-keysyms: new package
      enlightenment: new package

 package/Config.in                                  |    1 +
 package/efl/Config.in                              |    2 +
 package/efl/expedite/expedite.mk                   |    2 +-
 ...ecore-ecore_exe-fix-build-with-glibc-2-16.patch |   94 --------------------
 package/efl/libecore/libecore.mk                   |    2 +-
 package/efl/libedbus/libedbus.mk                   |    2 +-
 package/efl/libedje/libedje.mk                     |    2 +-
 package/efl/libeet/libeet.mk                       |    2 +-
 package/efl/libefreet/libefreet.mk                 |    2 +-
 package/efl/libeina/libeina.mk                     |    2 +-
 package/efl/libeio/Config.in                       |   18 ++++
 package/efl/libeio/libeio.mk                       |   16 ++++
 package/efl/libelementary/libelementary.mk         |    4 +-
 package/efl/libembryo/libembryo.mk                 |    2 +-
 package/efl/libethumb/libethumb.mk                 |    4 +-
 package/efl/libevas-generic-loaders/Config.in      |   21 +++++
 .../libevas-generic-loaders.mk                     |   31 +++++++
 package/efl/libevas/Config.in                      |    6 +-
 package/efl/libevas/libevas.mk                     |   18 ++--
 package/enlightenment/Config.in                    |   37 ++++++++
 .../enlightenment/enlightenment-no-execinfo.patch  |   27 ++++++
 package/enlightenment/enlightenment.mk             |   40 +++++++++
 package/librsvg/Config.in                          |    2 +-
 package/librsvg/librsvg.mk                         |    8 +-
 package/x11r7/Config.in                            |    1 +
 package/x11r7/xcb-util-keysyms/Config.in           |   14 +++
 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk |   12 +++
 27 files changed, 251 insertions(+), 121 deletions(-)
 delete mode 100644 package/efl/libecore/libecore-ecore_exe-fix-build-with-glibc-2-16.patch
 create mode 100644 package/efl/libeio/Config.in
 create mode 100644 package/efl/libeio/libeio.mk
 create mode 100644 package/efl/libevas-generic-loaders/Config.in
 create mode 100644 package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
 create mode 100644 package/enlightenment/Config.in
 create mode 100644 package/enlightenment/enlightenment-no-execinfo.patch
 create mode 100644 package/enlightenment/enlightenment.mk
 create mode 100644 package/x11r7/xcb-util-keysyms/Config.in
 create mode 100644 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk

Thanks,
-- 
Thomas Petazzoni
