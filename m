From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Sep 2015 21:54:18 +0200
Subject: [Buildroot] [PATCH 0/5] package/freedp: bump version (branch
	yem/freerdp)
Message-ID: <cover.1441569038.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

With this series comes a big bump of FreeRDP.

This was prompted by the weston's RDP backend, that requires a recent
version of FreeRDP.

Basically, FreeRDP's API has changed somewhat in thier master branch,
and some packages (e.g. weston) have started to use it uncoditionally.

So this series:

  - bumps FreeRDP to the currently latest (and greates?) FreeRDP
  - restores the weston RDP ackend
  - upgrades and enhances the gstreamer support in FreeRDP
  - introduces the wayland client in FreeRDP

Regards,
Yann E. MORIN.


The following changes since commit dd7bac42c201a14b844d1ef99e55c0ef2c33ddcb:

  dos2unix: update homepage link (2015-09-06 11:41:36 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/freerdp

for you to fetch changes up to cfef88063641104f06cac70e48390a1ea06305b9:

  package/freerdp: introduce the wayland client (2015-09-06 20:52:17 +0200)

----------------------------------------------------------------
Yann E. MORIN (5):
      package/freerdp: bump to master
      package/weston: restore the freerdp backend
      package/freerdp: re-add support for gstreamer
      package/freerdp: prepare for adding another client
      package/freerdp: introduce the wayland client

 Config.in.legacy                                   |  10 ++
 package/freerdp/0001-add-support-for-uclibc.patch  | 127 ---------------------
 ...s.patch => 0001-fix-building-shared-libs.patch} |   7 +-
 ...patch => 0002-add-support-for-tz-package.patch} |   0
 .../0003-dont-use-unavailable-c99-math.patch       |  95 ---------------
 package/freerdp/Config.in                          |  47 ++++++--
 package/freerdp/freerdp.mk                         | 114 ++++++++++++++----
 package/weston/Config.in                           |   6 +-
 8 files changed, 149 insertions(+), 257 deletions(-)
 delete mode 100644 package/freerdp/0001-add-support-for-uclibc.patch
 rename package/freerdp/{0002-fix-building-shared-libs.patch => 0001-fix-building-shared-libs.patch} (92%)
 rename package/freerdp/{0004-add-support-for-tz-package.patch => 0002-add-support-for-tz-package.patch} (100%)
 delete mode 100644 package/freerdp/0003-dont-use-unavailable-c99-math.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
