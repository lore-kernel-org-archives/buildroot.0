From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 11 Jan 2014 20:28:57 +0100
Subject: [Buildroot] [PATCH 0/6] xorg: Finally bump xserver_xorg-server
	version to 1.15.0
Message-ID: <BLU0-SMTP30016302819EB8819E5610D9B20@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These patches depend on each other to bump xserver_xorg-server to 1.15.0:

- mesa3d requires libdrm >= 2.4.49 when the intel driver is selected
- xorg requires mesa3d >= 9.2.0

This patch series supersedes the previous versions of the corresponding
patches, patchworks was also updated to reflect this.

Bernd Kuhls (6):
  xlib_libpthread-stubs: Rename package to libpthread-stubs
  libdrm: Remove dependency towards X11
  libdrm: bump to version 2.4.51
  mesa3d: pull out from x11
  mesa3d: modularize and bump to version 10.0.2
  xorg: Bump xserver_xorg-server version to 1.15.0

 Config.in.legacy                                   |   15 +-
 package/Config.in                                  |    2 +
 package/libdrm/Config.in                           |    8 +-
 package/libdrm/libdrm.mk                           |    4 +-
 .../Config.in                                      |    2 +-
 package/libpthread-stubs/libpthread-stubs.mk       |   20 +++
 package/mesa3d/Config.in                           |  182 ++++++++++++++++++++
 package/mesa3d/mesa3d.mk                           |  122 +++++++++++++
 package/opengl/Config.in                           |    1 +
 package/opengl/libegl/libegl.mk                    |    4 +
 package/opengl/libgl/Config.in                     |    6 +
 package/opengl/libgl/libgl.mk                      |   21 +++
 package/opengl/libgles/libgles.mk                  |    4 +
 package/opengl/libopenvg/libopenvg.mk              |    4 +
 package/x11r7/Config.in                            |    2 -
 package/x11r7/libxcb/Config.in                     |    2 +-
 package/x11r7/libxcb/libxcb.mk                     |    2 +-
 package/x11r7/mesa3d/Config.in                     |   14 --
 package/x11r7/mesa3d/mesa3d-uclibc-locale.patch    |   56 ------
 package/x11r7/mesa3d/mesa3d.mk                     |   40 -----
 .../xlib_libpthread-stubs/xlib_libpthread-stubs.mk |   20 ---
 package/x11r7/xserver_xorg-server/Config.in        |    1 +
 .../xserver_xorg-server-02-cve-2013-1940.patch     |   34 ----
 ...ut-allocate-enough-space-for-null-charact.patch |   59 -------
 .../xserver_xorg-server/xserver_xorg-server.mk     |    7 +-
 25 files changed, 393 insertions(+), 239 deletions(-)
 rename package/{x11r7/xlib_libpthread-stubs => libpthread-stubs}/Config.in (88%)
 create mode 100644 package/libpthread-stubs/libpthread-stubs.mk
 create mode 100644 package/mesa3d/Config.in
 create mode 100644 package/mesa3d/mesa3d.mk
 create mode 100644 package/opengl/libgl/Config.in
 create mode 100644 package/opengl/libgl/libgl.mk
 delete mode 100644 package/x11r7/mesa3d/Config.in
 delete mode 100644 package/x11r7/mesa3d/mesa3d-uclibc-locale.patch
 delete mode 100644 package/x11r7/mesa3d/mesa3d.mk
 delete mode 100644 package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
 delete mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-02-cve-2013-1940.patch
 delete mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-03-Revert-kinput-allocate-enough-space-for-null-charact.patch

-- 
1.7.10.4
