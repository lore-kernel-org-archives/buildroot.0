From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Dec 2014 17:04:36 +0100
Subject: [Buildroot] [PATCH 0/5] gpsd: fix shared-only build (branch
	yem/autobuild)
Message-ID: <cover.1418572993.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fixes gpsd for the shared-only case.

The real culprit is in fact ncurses, that does not install the appropriate
symlinks for pkg-config files when it is configured for wide-chars

Regards,
Yann E. MORIN.


The following changes since commit 2fbf0a98ad3f4ae10f0c0d76d4181d2271d9789d:

  package/nmap: fix shared-only build (2014-12-14 12:51:26 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/autobuild

for you to fetch changes up to 50b4b144f7de56b1d0a60ec133c6fbf89c265dc3:

  pckage/ncurses: fix pkg-config files for ncursesw (2014-12-14 17:02:35 +0100)

----------------------------------------------------------------
Yann E. MORIN (5):
      package/gpsd: remove duplicate dependency
      package/ncurses: fix shared-only libs
      package/ncurses: slight code re-arrangement
      package/ncurses: trim leading 'lib' from definition of libs to install
      pckage/ncurses: fix pkg-config files for ncursesw

 package/gpsd/gpsd.mk       |  2 +-
 package/ncurses/ncurses.mk | 46 +++++++++++++++++++++++++++-------------------
 2 files changed, 28 insertions(+), 20 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
