From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Oct 2013 23:05:17 +0200
Subject: [Buildroot] [pull request v3] Pull request for branch
	yem/rpi-wayland
Message-ID: <cover.1381438785.git.yann.morin.1998@free.fr>
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

Please pay special attention to commit logs of patches 4 and 7, they are
tricky. I can add more details, or reworks them, if need be.

Changes v2 -> v3:
  - drop patch 9 due to it being dead code for now  (Thomas)
  - fix weston build without EGL  (Peter)
  - fix rpi-compositor missing dependency

Changes v1 -> v2:
  - drop host-wayland, isntall manually-built wayland-scanner to $(HOST)
    (Thomas)
  - drop applied patches  (Peter)
  - fix typoes in commit logs

Regards,
Yann E. MORIN.


The following changes since commit 92af118d82a6031c7d9750959d6dc07a82a54ac4:

  vde2: needs mmu (2013-10-09 23:40:29 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/rpi-wayland

for you to fetch changes up to 76866368cc2a600d5878de11146201ee7bc3b1a6:

  package/weston: add RPi compositor (2013-10-10 21:54:43 +0200)

----------------------------------------------------------------
Yann E. MORIN (8):
      package/wayland: bump version
      package/weston: bump version
      package/wayland: install wayland-scanner to $(HOST)
      package/weston: fix configure.ac to check for wayland-scanner
      package/weston: fix configure.ac for fbdev compositor
      package/weston: introduce infrastructure to select other compositors
      package/rpi-userland: add patch to remove faulty assert()
      package/weston: add RPi compositor

 .../rpi-userland-002-remove-faulty-assert.patch    | 21 +++++++++++++++++
 package/wayland/wayland.mk                         |  5 +++--
 package/weston/Config.in                           | 20 +++++++++++++++--
 ...02-fix-configure.ac-check-wayland-scanner.patch | 26 ++++++++++++++++++++++
 ...ompositor-fbdev-drop-dependency-on-libdrm.patch | 22 ++++++++++++++++++
 package/weston/weston.mk                           | 21 +++++++++++++++--
 6 files changed, 109 insertions(+), 6 deletions(-)
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
