From: Will Wagner <will_wagner@carallon.com>
Date: Tue, 09 Mar 2010 22:50:05 +0000
Subject: [Buildroot] Pull request for branch x11r75patches
Message-ID: <4B96D09D.4070100@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have setup a repository with my x11r7.5 changes merged into Paulius's 
changes that have already been commited.

Most just bump things to newer version, but also have converted mesa3d 
to autotools and added more option support when building xserver.

Regards
Will

The following changes since commit 32ae5854dd1a1c77c9019932f248eb2dc1f1d565:
   Peter Korsgaard (1):
         busybox: additional 1.16.0 fixes

are available in the git repository at:

   git://gitorious.org/willw-buildroot/willw-buildroot.git x11r75patches

Will Wagner (17):
       libdrm: bump version
       pixman: bump version
       correct name of xapp_xinput.mk
       mesa3d: bump version and convert to autotools
       xlib_libXau: remove duplicate dependancies
       pthread-stubs: bump version
       xdriver_xf86-video-intel: bump version Signed-off-by: Will Wagner 
<will_wagner@carallon.com>
       xproto_dri2proto: bump version
       xproto_fontcacheproto: bump version
       xproto_xf86miscproto: bump version
       xlib_libpciaccess: bump version
       xlib_libXfontcache: bump version
       xdriver_xf86-video-sunleo: correct version Signed-off-by: Will 
Wagner <will_wagner@carallon.com>
       xkeyboard-config: bump version
       xproto_evieext: bump version
       xlib_libXxf86misc: bump version
       xserver_xorg-server: bump version, improve option support

  package/libdrm/libdrm.mk                           |    3 +-
  package/pixman/pixman.mk                           |    2 +-
  package/x11r7/mesa3d/Config.in                     |    6 +-
  package/x11r7/mesa3d/mesa3d-gen_matypes-fix.patch  |   12 ---
  package/x11r7/mesa3d/mesa3d.mk                     |   98 
++------------------
  package/x11r7/pthread-stubs/pthread-stubs.mk       |    3 +-
  .../{xapp_xbacklight.mk => xapp_xinput.mk}         |    0
  package/x11r7/xdriver_xf86-video-intel/Config.in   |    5 +-
  ...ver_xf86-video-intel-2.10.0-cross-compile.patch |   11 ++
  .../xdriver_xf86-video-intel.mk                    |    6 +-
  package/x11r7/xdriver_xf86-video-sunleo/Config.in  |    2 +-
  package/x11r7/xkeyboard-config/xkeyboard-config.mk |    2 +-
  package/x11r7/xlib_libXau/Config.in                |    1 -
  package/x11r7/xlib_libXau/xlib_libXau.mk           |    2 +-
  package/x11r7/xlib_libXfontcache/Config.in         |    2 +-
  .../x11r7/xlib_libXfontcache/xlib_libXfontcache.mk |    2 +-
  package/x11r7/xlib_libXxf86misc/Config.in          |    2 +-
  .../x11r7/xlib_libXxf86misc/xlib_libXxf86misc.mk   |    2 +-
  package/x11r7/xlib_libpciaccess/Config.in          |    2 +-
  .../x11r7/xlib_libpciaccess/xlib_libpciaccess.mk   |    2 +-
  package/x11r7/xproto_dri2proto/Config.in           |    2 +-
  package/x11r7/xproto_dri2proto/xproto_dri2proto.mk |    2 +-
  package/x11r7/xproto_evieext/Config.in             |    2 +-
  package/x11r7/xproto_evieext/xproto_evieext.mk     |    2 +-
  package/x11r7/xproto_fontcacheproto/Config.in      |    2 +-
  .../xproto_fontcacheproto/xproto_fontcacheproto.mk |    2 +-
  package/x11r7/xproto_xf86miscproto/Config.in       |    2 +-
  .../xproto_xf86miscproto/xproto_xf86miscproto.mk   |    2 +-
  package/x11r7/xserver_xorg-server/Config.in        |   36 ++++----
  .../xserver_xorg-server/xserver_xorg-server.mk     |   34 +++++--
  30 files changed, 91 insertions(+), 160 deletions(-)
  delete mode 100644 package/x11r7/mesa3d/mesa3d-gen_matypes-fix.patch
  rename package/x11r7/xapp_xinput/{xapp_xbacklight.mk => 
xapp_xinput.mk} (100%)
  create mode 100644 
package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.10.0-cross-compile.patch
