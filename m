From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Apr 2014 14:10:12 +0200
Subject: [Buildroot] [PATCH 0/13 v2] Add virtual package for full-openGL
	(branch yem/opengl)
Message-ID: <cover.1396699629.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series introduces a virtual package for full-openGL providers.

This is still an RFC, for now. I'm posting it to get earlt feedback on
whether this is a correct approach, or if I am completely off my shoes.

Changes v1 -> v2:
  - almost complete rewrite after comments by Paul and Bernd

Regards,
Yann E. MORIN.


The following changes since commit 5729ae52d4bfcc7d02da33359971623d65fd8989:

  eudev : bump version to 1.5.3 (2014-04-04 23:47:36 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/opengl

for you to fetch changes up to 55d8bed0fa397c30345e1ba8318eeeb76fac7a3a:

  package/vlc: depends on the virtual package libgl (2014-04-05 14:06:39 +0200)

----------------------------------------------------------------
Yann E. MORIN (13):
      package/xdriver_xf86-video-ati: depends on x86
      package/x11-video-drivers: do not select, but depends on mesa3d
      package/mesa3d: fix improper dependency of blind option
      package/mesa3d: re-arrange menu items
      package/mesa3d: DRI drivers depend on X.org
      package/mesa3d: add comment for when OpenGL EGL is not available
      package/mesa3d: simplify the code enabling full-OpenGL
      package/mesa3d: only enable full OpenGL when a DRI driver is enabled
      package/xorg-server: do not force-select xf86driproto for mesa3d
      package/libgl: introduce as a new virtual package for full-openGL providers
      package/mesa3d: with a DRI driver, is a full OpenGL provider
      package/libevas: switch dependency from mesa3d to _HAS_OPENGL
      package/vlc: depends on the virtual package libgl

 package/efl/libevas/Config.in                      |  2 +-
 package/mesa3d/Config.in                           | 34 ++++++++++++++--------
 package/mesa3d/mesa3d.mk                           | 18 +++++-------
 package/opengl/Config.in                           |  1 +
 package/opengl/libgl/Config.in                     |  6 ++++
 package/opengl/libgl/libgl.mk                      | 16 ++++++++++
 package/vlc/vlc.mk                                 |  4 +--
 package/x11r7/xdriver_xf86-video-ati/Config.in     |  6 +++-
 package/x11r7/xdriver_xf86-video-glint/Config.in   |  5 +++-
 package/x11r7/xdriver_xf86-video-intel/Config.in   |  7 +++--
 package/x11r7/xdriver_xf86-video-mach64/Config.in  |  3 ++
 package/x11r7/xdriver_xf86-video-mga/Config.in     |  5 +++-
 .../x11r7/xdriver_xf86-video-openchrome/Config.in  |  5 +++-
 package/x11r7/xdriver_xf86-video-r128/Config.in    |  5 +++-
 package/x11r7/xdriver_xf86-video-savage/Config.in  |  5 +++-
 package/x11r7/xdriver_xf86-video-sis/Config.in     |  5 +++-
 package/x11r7/xdriver_xf86-video-tdfx/Config.in    |  5 +++-
 package/x11r7/xdriver_xf86-video-vmware/Config.in  |  5 +++-
 package/x11r7/xserver_xorg-server/Config.in        |  1 -
 19 files changed, 101 insertions(+), 37 deletions(-)
 create mode 100644 package/opengl/libgl/Config.in
 create mode 100644 package/opengl/libgl/libgl.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
