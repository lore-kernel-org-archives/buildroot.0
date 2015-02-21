From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Feb 2015 23:36:19 +0100
Subject: [Buildroot] [PATCH 0/11 v5] weston: new freerdp backend (branch
	yem/freerdp)
Message-ID: <cover.1424558036.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds the RDP backend to Weston. As a side effect, it cleans
up and enhances FreeRDP.


Changes v4 -> v5:
  - bump version to fix builds against newer cmake  (Thomas)
  - add more conditional options  (parts from Thomas)
  - get rid of a developer-related comment  (Thomas)

Changes v3 -> v4:
  - re-order arch-specific options for ease of review
  - rebase; drop applied patch about man pages  (Thomas)

Changes v2 -> v3:
  - rework completely the depednencies on X11 libraries  (Samuel)
  - only install keys when the server is enabled  (Samuel)

Changes v1 -> v2:
  - new package python-lxml, needed for opengl-registry (Tomas P.)
  - cleanup opengl-registry and nvidia-driver  (Thomas P.)
  - drop applied patches  (Thomas P.)


Regards,
Yann E. MORIN.


The following changes since commit 7b9285a8748cb4bd6f301603ef688eb6be025a39:

  package/nvidia-driver: build the kernel module (2015-02-21 23:28:51 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/freerdp

for you to fetch changes up to 3c9c14cd7d1baa7a1fbe865c0df0a8a7e2541b4b:

  package/weston: add support for the RDP compositor (2015-02-21 23:31:43 +0100)

----------------------------------------------------------------
Yann E. MORIN (11):
      package/freerdp: bump version
      package/freerdp: conditionally build gstreamer support
      package/freerdp: conditionally build support for libXi
      package/freerdp: conditionally build support for libXrender
      package/freerdp: avoid development warning
      package/freerdp: do not forcibly depend on X.Org
      package/freerdp: move architecture-specific block
      package/freerdp: add options to enable/disable server and/or client
      package/freerdp: also install to staging
      package/freerdp: install server key and certificate
      package/weston: add support for the RDP compositor

 package/Config.in                                  |   2 +-
 package/freerdp/Config.in                          |  29 ++++-
 .../freerdp-0002-fix-building-shared-libs.patch    |  23 ++++
 package/freerdp/freerdp.mk                         | 131 ++++++++++++++++++---
 package/weston/Config.in                           |  17 +++
 package/weston/weston.mk                           |   7 ++
 6 files changed, 187 insertions(+), 22 deletions(-)
 create mode 100644 package/freerdp/freerdp-0002-fix-building-shared-libs.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
