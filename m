From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Apr 2014 18:04:21 +0200
Subject: [Buildroot] [PATCH 0/14 v3] Add virtual package for full-openGL
	(branch yem/opengl)
Message-ID: <cover.1397750571.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series introduces a virtual package for full-openGL providers.

Changes v2 -> v3:
  - libdrm does not depend on x86  (Thomas P.)
  - do not make libdrm a hard-deps of xdriver_xf86-video-ati  (Thomas P.)
  - convert xapp-xdriinfo over to depend on libgl  (Bernd)
  - fix comment dependency in xdriver_xf86-video-intel
  - some typoes fixed in some commit-logs

Changes v1 -> v2:
  - almost complete rewrite after comments by Paul and Bernd


Regards,
Yann E. MORIN.


The following changes since commit 2b4b0ce9f2a51e8c1d3d467b7360668baa9a4ae8:

  libsigsegv: not available on Microblaze (2014-04-16 20:59:14 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/opengl

for you to fetch changes up to fe9609b515ce099c8679a377896ea168b201bb39:

  xapp_xdriinfo: depends on the virtual package libgl (2014-04-17 18:01:43 +0200)

----------------------------------------------------------------
Bernd Kuhls (1):
      xapp_xdriinfo: depends on the virtual package libgl

Yann E. MORIN (13):
      package/libdrm: radeon does not depend on x86
      package/xdriver_xf86-video-ati: only select libdrm if the DRI driver is enabled
      package/x11-video-drivers: do not select, but depends on mesa3d
      package/mesa3d: re-arrange menu items
      package/mesa3d: DRI drivers depend on X.org
      package/mesa3d: add comment for when OpenGL EGL is not available
      package/mesa3d: simplify the code enabling full-OpenGL
      package/mesa3d: only enable full OpenGL when a DRI driver is enabled
      package/xorg-server: do not force-select xf86driproto for mesa3d
      package/libgl: introduce as a new virtual package for full-openGL providers
      package/mesa3d: with a DRI driver, is a full OpenGL provider
      package/libevas: switch dependency from mesa3d to _HAS_LIBGL
      package/vlc: depends on the virtual package libgl

 package/efl/libevas/Config.in                      |  2 +-
 package/libdrm/Config.in                           |  1 -
 package/mesa3d/Config.in                           | 33 +++++++++++++---------
 package/mesa3d/mesa3d.mk                           | 18 ++++++------
 package/opengl/Config.in                           |  1 +
 package/opengl/libgl/Config.in                     |  6 ++++
 package/opengl/libgl/libgl.mk                      |  7 +++++
 package/vlc/vlc.mk                                 |  4 +--
 package/x11r7/xapp_xdriinfo/Config.in              |  5 +++-
 package/x11r7/xdriver_xf86-video-ati/Config.in     |  9 ++++--
 package/x11r7/xdriver_xf86-video-glint/Config.in   |  5 +++-
 package/x11r7/xdriver_xf86-video-intel/Config.in   |  8 ++++--
 package/x11r7/xdriver_xf86-video-mach64/Config.in  |  3 ++
 package/x11r7/xdriver_xf86-video-mga/Config.in     |  5 +++-
 .../x11r7/xdriver_xf86-video-openchrome/Config.in  |  5 +++-
 package/x11r7/xdriver_xf86-video-r128/Config.in    |  5 +++-
 package/x11r7/xdriver_xf86-video-savage/Config.in  |  5 +++-
 package/x11r7/xdriver_xf86-video-sis/Config.in     |  5 +++-
 package/x11r7/xdriver_xf86-video-tdfx/Config.in    |  5 +++-
 package/x11r7/xdriver_xf86-video-vmware/Config.in  |  5 +++-
 package/x11r7/xserver_xorg-server/Config.in        |  1 -
 21 files changed, 96 insertions(+), 42 deletions(-)
 create mode 100644 package/opengl/libgl/Config.in
 create mode 100644 package/opengl/libgl/libgl.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
