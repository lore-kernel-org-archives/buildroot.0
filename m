From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  6 Nov 2017 22:14:09 +0100
Subject: [Buildroot] [PATCH 0/4 v2] package/freerdp: fix fallout after
 version bump
Message-ID: <cover.1510002833.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Add a few patches to fix FreeRDP dependencies and build:

  - pkg-config is now used for more than gstreamer-0.x, so make it a
    mandatory dependency;

  - FreeRDP can now log to systemd's journald, so add proper dependency
    and options;

  - backport an upstream patch to fix detection of gstreamer-1.x;

  - fix build of the wayland client, by adding a missing dependency and
    pointing to the correct wayland-scanner tool.

Changes v1 -> v2:
  - reorder patches, pkg-confif first
  - fix typo in variable name  (Arnout)
  - add patches 3 and 4


Regards,
Yann E. MORIN.


The following changes since commit a7e1971cc60b43160e5d8ce418f7811d4d32b0ba

  Update for 2017.11-rc1 (2017-11-06 22:03:32 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to acb107d38bfc324e8108f58f192a9dc05c5098bd

  package/freerdp: fix build of wayland client (2017-11-06 22:07:38 +0100)


----------------------------------------------------------------
Yann E. MORIN (4):
      package/freerdp: drop dependency on host-pkgconf
      package/freerdp: optional systemd's journald support
      package/freerdp: fix gstreamer-1.x detection
      package/freerdp: fix build of wayland client

 .../freerdp/0001-Fix-gstreamer-1.0-detection.patch | 28 ++++++++++++++++++++++
 package/freerdp/Config.in                          |  1 +
 package/freerdp/freerdp.mk                         | 16 ++++++++++---
 3 files changed, 42 insertions(+), 3 deletions(-)
 create mode 100644 package/freerdp/0001-Fix-gstreamer-1.0-detection.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
