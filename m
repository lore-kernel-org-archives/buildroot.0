From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Wed, 5 Feb 2014 21:49:18 +0100
Subject: [Buildroot] [PATCH v3 0/3] Bump libdrm version to 2.4.52
Message-ID: <BLU0-SMTP36657D44A311DA07AC96CABD9950@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

thanks for your great review of the patch series!

Considering your comments on Mesa3D I decided to split work on the
Xorg 1.15.0 series, here you will find part 1, the libdrm bump.

In the next days I will have a look at the Mesa3D comments,
especially about package/opengl/libgl/.

Regards, Bernd


Bernd Kuhls (3):
  xlib_libpthread-stubs: Rename package to libpthread-stubs
  libdrm: Remove dependency towards X11
  libdrm: bump to version 2.4.52

 Config.in.legacy                                   |   15 ++++++++++++---
 package/Config.in                                  |    1 +
 package/libdrm/Config.in                           |    9 ++-------
 package/libdrm/libdrm.mk                           |    7 ++-----
 .../Config.in                                      |    2 +-
 package/libpthread-stubs/libpthread-stubs.mk       |   20 ++++++++++++++++++++
 package/x11r7/Config.in                            |    1 -
 package/x11r7/libxcb/Config.in                     |    2 +-
 package/x11r7/libxcb/libxcb.mk                     |    2 +-
 .../xlib_libpthread-stubs/xlib_libpthread-stubs.mk |   20 --------------------
 10 files changed, 40 insertions(+), 39 deletions(-)
 rename package/{x11r7/xlib_libpthread-stubs => libpthread-stubs}/Config.in (88%)
 create mode 100644 package/libpthread-stubs/libpthread-stubs.mk
 delete mode 100644 package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk

-- 
1.7.9.5
