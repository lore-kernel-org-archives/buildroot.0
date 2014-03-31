From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Mar 2014 23:59:57 +0200
Subject: [Buildroot] [PATCH 0/6] Add virtual package for full-openGL (branch
	yem/fixes)
Message-ID: <cover.1396302677.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series introduces a virtual package for full-openGL providers.

  - to start with, patch #1 introduces a quick fix to the current circular
    dependency hell observed after the mesa3d move outside of X.org.

  - then, patch 2 introduces a virtual package for full-openGL providers.

  - next, in patch 3, mesa3d is converted to a provider for full-openGL.

  - patch 4 converts vlc to use this full-openGL virtual package.

  - finally, patches 5 and 6 fix the dependency on mesa3d for x11 drivers,
    and the X11 server.

In all this series, patch 1 is really an urgent workaround, and should be
applied asap, while the rest of the series is being hammered on, since it
fixes a real problem we're having right now, and for which the complete
solution is not trivial.

I'd like to thank Paul for his very helpful comments on IRC while I was
banging my head in despair on my keyboard (which will not help my
keyboard-dislexia, by-the-way!) Thanks! :-)

Regards,
Yann E. MORIN.


The following changes since commit ba53265b9c2d1d54bdde96becee20613f6d688c3:

  ifplugd: fix typo introduced in previous commit (2014-03-30 17:32:46 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/fixes

for you to fetch changes up to 1b076cbf2210b52a525e05b9a560f6b916561938:

  package/xorg-server: do not force-select xf86driproto for mesa3d (2014-03-31 23:44:19 +0200)

----------------------------------------------------------------
Yann E. MORIN (6):
      package/libevas: quick fix to get rid of circular deps
      package/libgl: introduce as a new virtual package for full-openGL providers
      package/mesa3d: is a full-openGL provider if X.org is present
      package/vlc: depends on the virtual package libgl
      package/x11-video-drivers: do not select, but depends on mesa3d
      package/xorg-server: do not force-select xf86driproto for mesa3d

 package/efl/libevas/Config.in                         |  2 +-
 package/mesa3d/Config.in                              |  4 ++++
 package/opengl/Config.in                              |  1 +
 package/opengl/libgl/Config.in                        |  6 ++++++
 package/opengl/libgl/libgl.mk                         | 16 ++++++++++++++++
 package/vlc/vlc.mk                                    |  4 ++--
 package/x11r7/xdriver_xf86-video-ati/Config.in        |  5 ++++-
 package/x11r7/xdriver_xf86-video-glint/Config.in      |  5 ++++-
 package/x11r7/xdriver_xf86-video-intel/Config.in      |  7 +++++--
 package/x11r7/xdriver_xf86-video-mach64/Config.in     |  3 +++
 package/x11r7/xdriver_xf86-video-mga/Config.in        |  5 ++++-
 package/x11r7/xdriver_xf86-video-openchrome/Config.in |  5 ++++-
 package/x11r7/xdriver_xf86-video-r128/Config.in       |  5 ++++-
 package/x11r7/xdriver_xf86-video-savage/Config.in     |  5 ++++-
 package/x11r7/xdriver_xf86-video-sis/Config.in        |  5 ++++-
 package/x11r7/xdriver_xf86-video-tdfx/Config.in       |  5 ++++-
 package/x11r7/xdriver_xf86-video-vmware/Config.in     |  5 ++++-
 package/x11r7/xserver_xorg-server/Config.in           |  1 -
 18 files changed, 74 insertions(+), 15 deletions(-)
 create mode 100644 package/opengl/libgl/Config.in
 create mode 100644 package/opengl/libgl/libgl.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
