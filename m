From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 17 Jul 2014 07:42:52 +0200
Subject: [Buildroot] [PATCH 0/8] Various OpenGL-related updates
Message-ID: <1405575780-26496-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this series was split off my xbmc series, as requested by Thomas:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/89549

It fixes a DRI3-related build error in mesa3d by adding the needed dependencies,
eases mesa3d dependencies, bumps mesa3d and xdriver_xf86-video-intel and adds
libglu/libglew, which are needed to enable OpenGl support in xbmc.

Regards, Bernd


Bernd Kuhls (8):
  xlib_libxshmfence: New package
  package/mesa3d: Fix optional DRI3 support
  package/mesa3d: Depend on xorg meta package instead of
    xserver_xorg-server
  package/mesa3d: Remove dependency for the libxml2 module of
    host-python
  package/mesa3d: Bump to version 10.2.3
  libglu: New package
  libglew: New package
  xdriver_xf86-video-intel: Bump version to 2.99.911

 package/Config.in                                  |    2 ++
 package/libglew/Config.in                          |   19 +++++++++++
 package/libglew/libglew.mk                         |   36 ++++++++++++++++++++
 package/libglu/Config.in                           |   10 ++++++
 package/libglu/libglu.mk                           |   17 +++++++++
 package/libxml2/Config.in                          |    3 --
 package/libxml2/libxml2-python2.patch              |   27 ---------------
 package/libxml2/libxml2.mk                         |   16 +--------
 package/mesa3d/Config.in                           |   23 ++++++-------
 package/mesa3d/mesa3d.mk                           |   13 ++++---
 package/x11r7/Config.in                            |    1 +
 package/x11r7/xdriver_xf86-video-intel/Config.in   |    5 +--
 .../xdriver_xf86-video-intel.mk                    |   27 +++++++++++----
 package/x11r7/xlib_libxshmfence/Config.in          |    5 +++
 .../x11r7/xlib_libxshmfence/xlib_libxshmfence.mk   |   15 ++++++++
 15 files changed, 150 insertions(+), 69 deletions(-)
 create mode 100644 package/libglew/Config.in
 create mode 100644 package/libglew/libglew.mk
 create mode 100644 package/libglu/Config.in
 create mode 100644 package/libglu/libglu.mk
 delete mode 100644 package/libxml2/libxml2-python2.patch
 create mode 100644 package/x11r7/xlib_libxshmfence/Config.in
 create mode 100644 package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk

-- 
1.7.10.4
