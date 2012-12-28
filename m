From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Dec 2012 20:41:53 +0100
Subject: [Buildroot] [pull request] Pull request for branch e17
Message-ID: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
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

Best regards,

Thomas

The following changes since commit 4848386446b937d4d0d9d3e9489932ca3fcb1003:

  libffi: fix mips build failures (2012-12-28 16:55:09 +0100)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git e17

for you to fetch changes up to df0808d07efd1959cfca0558857283d2e7240f4a:

  enlightenment: new package (2012-12-28 20:41:35 +0100)

----------------------------------------------------------------
Thomas Petazzoni (20):
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
      efl/expedite: bump to 1.7.4
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
 package/efl/libeio/Config.in                       |   15 ++++
 package/efl/libeio/libeio.mk                       |   15 ++++
 package/efl/libelementary/libelementary.mk         |    4 +-
 package/efl/libembryo/libembryo.mk                 |    2 +-
 package/efl/libethumb/libethumb.mk                 |    4 +-
 package/efl/libevas-generic-loaders/Config.in      |   21 +++++
 .../libevas-generic-loaders.mk                     |   31 +++++++
 package/efl/libevas/Config.in                      |    6 +-
 package/efl/libevas/libevas.mk                     |   18 ++--
 package/enlightenment/Config.in                    |   29 ++++++
 .../enlightenment/enlightenment-no-execinfo.patch  |   27 ++++++
 package/enlightenment/enlightenment.mk             |   40 +++++++++
 package/librsvg/Config.in                          |    2 +-
 package/librsvg/librsvg.mk                         |    8 +-
 package/x11r7/Config.in                            |    1 +
 package/x11r7/xcb-util-keysyms/Config.in           |   14 +++
 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk |   12 +++
 27 files changed, 239 insertions(+), 121 deletions(-)
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
