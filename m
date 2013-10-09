From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 Oct 2013 23:44:16 +0200
Subject: [Buildroot] [pull request v2] Pull request for branch
	yem/rpi-wayland
Message-ID: <cover.1381354867.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series makes it possible to run weston on the raspberrypi.

The series:
  - bumps wayland and weston (patches 1 and 2)
  - installs wayland-scanner to $(HOST) (patch 3)
  - fixes weston configure.ac with patches from upstream (patches 4 and 5)
  - modifies weston to build more than one compositor (patch 6)
  - fixes rpi-userland (patch 7)
  - actualy enables the rpi compoisotor in weston (path 8)
  - prepares EGL support for compositors (patch 9)

Please pay special attention to commit logs of patches 6 and 9, they are
tricky. I can add more details, or reworks them, if need be.

Regards,
Yann E. MORIN.

Changes v1 -> v2:
  - drop host-wayland, isntall manually-built wayland-scanner to $(HOST)
    (Thomas)
  - drop applied patches  (Peter)
  - fix typoes in commit logs


The following changes since commit f8a7c46ea3beca928705f01b31b75017ba8484ac:

  qt5: remove configure options from module packages (2013-10-09 23:13:59 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/rpi-wayland

for you to fetch changes up to 7e31b6ba4a2f05ab5ba1b1114863e7d102fa5a17:

  package/weston: add option to enable EGL (2013-10-09 23:40:11 +0200)

----------------------------------------------------------------
Yann E. MORIN (9):
      package/wayland: bump version
      package/weston: bump version
      package/wayland: install wayland-scanner to $(HOST)
      package/weston: fix configure.ac to check for wayland-scanner
      package/weston: fix configure.ac for fbdev compositor
      package/weston: introduce infrastructure to select other compositors
      package/rpi-userland: add patch to remove faulty assert()
      package/weston: add RPi compositor
      package/weston: add option to enable EGL

 .../rpi-userland-002-remove-faulty-assert.patch    | 21 +++++++++++++++++
 package/wayland/wayland.mk                         |  5 +++--
 package/weston/Config.in                           | 23 +++++++++++++++++--
 ...02-fix-configure.ac-check-wayland-scanner.patch | 26 ++++++++++++++++++++++
 ...ompositor-fbdev-drop-dependency-on-libdrm.patch | 22 ++++++++++++++++++
 package/weston/weston.mk                           | 26 ++++++++++++++++++++--
 6 files changed, 117 insertions(+), 6 deletions(-)
 create mode 100644 package/rpi-userland/rpi-userland-002-remove-faulty-assert.patch
 create mode 100644 package/weston/weston-0002-fix-configure.ac-check-wayland-scanner.patch
 create mode 100644 package/weston/weston-0003-compositor-fbdev-drop-dependency-on-libdrm.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
