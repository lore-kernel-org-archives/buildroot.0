From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 23:43:48 +0200
Subject: [Buildroot] [PATCH 0/21 v2] A bunch of bumps (branch yem/bumps)
Message-ID: <cover.1401658972.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series has been sitting here waiting for the last release to be out.
It is now, so here are the bumps.


Changes v1 -> v2:
  - apply a fixup to procps that I forgot in the previous round...


Regards,
Yann E. MORIN.


The following changes since commit 21dd304ec5cb70e2b24705dce3519e395802121e:

  package/nut: bump to latest stable (2014-06-01 23:14:15 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git 

for you to fetch changes up to 6e3e424b836e09ce9a880897d7983b543ae2f765:

  [WIP] package/weston: add support for the RDP compositor (2014-06-01 23:31:58 +0200)

----------------------------------------------------------------
Yann E. MORIN (21):
      package/tzdata: bump version for some new timezones
      package/zic: bump version for misc fixes
      package/dtv-scan-tables: bump version
      package/tvheadend: bump version
      package/w_scan: do not line-up variables
      package/w_scan: bump version
      package/libbsd: do not line-up variables
      package/libbsd: bump version
      package/snappy: do not line-up variables
      package/snappy: bump version
      package/libevdev: bump version
      package/procps: bump version and rename to procps-ng
      package/wayland: bump version
      package/weston: bump version
      package/weston: libxkbcommon is optional
      package/libinput: new package
      package/weston: add support for libinput
      package/freerdp: not forcibly depend on X.Org
      pacakge/freerdp: disable building the manpages
      package/freerdp: add options to enable/disable server and/or client
      [WIP] package/weston: add support for the RDP compositor

 package/Config.in                                  |  5 +-
 package/dtv-scan-tables/dtv-scan-tables.mk         |  4 +-
 package/freerdp/Config.in                          | 31 ++++++++++--
 package/freerdp/freerdp.mk                         | 32 ++++++++++--
 package/libbsd/libbsd.mk                           |  9 ++--
 package/libevdev/libevdev.mk                       |  2 +-
 package/libinput/Config.in                         | 17 +++++++
 package/libinput/libinput.mk                       | 19 ++++++++
 package/{procps => procps-ng}/Config.in            |  6 +--
 package/procps-ng/procps-0000-remove-index.patch   | 16 ++++++
 package/procps-ng/procps.mk                        | 15 ++++++
 package/procps/procps-make-3.82.patch              | 23 ---------
 package/procps/procps-remove-flags.patch           | 26 ----------
 package/procps/procps-remove-index.patch           | 21 --------
 package/procps/procps-wchar.patch                  | 29 -----------
 package/procps/procps.mk                           | 25 ----------
 package/snappy/snappy.mk                           | 10 ++--
 package/tvheadend/tvheadend.mk                     |  2 +-
 package/tzdata/tzdata.mk                           |  2 +-
 package/w_scan/w_scan.mk                           | 14 +++---
 package/wayland/wayland.mk                         |  4 +-
 package/weston/Config.in                           | 16 +++++-
 ...0-compositor-rpi-fix-input-initialization.patch | 57 ----------------------
 package/weston/weston-0000-safe-foreach.patch      | 36 ++++++++++++++
 package/weston/weston-0003-dont-build-tests.patch  | 17 -------
 package/weston/weston.mk                           | 28 +++++++++--
 package/zic/zic.mk                                 |  2 +-
 27 files changed, 226 insertions(+), 242 deletions(-)
 create mode 100644 package/libinput/Config.in
 create mode 100644 package/libinput/libinput.mk
 rename package/{procps => procps-ng}/Config.in (63%)
 create mode 100644 package/procps-ng/procps-0000-remove-index.patch
 create mode 100644 package/procps-ng/procps.mk
 delete mode 100644 package/procps/procps-make-3.82.patch
 delete mode 100644 package/procps/procps-remove-flags.patch
 delete mode 100644 package/procps/procps-remove-index.patch
 delete mode 100644 package/procps/procps-wchar.patch
 delete mode 100644 package/procps/procps.mk
 delete mode 100644 package/weston/weston-0000-compositor-rpi-fix-input-initialization.patch
 create mode 100644 package/weston/weston-0000-safe-foreach.patch
 delete mode 100644 package/weston/weston-0003-dont-build-tests.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
