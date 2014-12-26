From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Dec 2014 18:33:05 +0100
Subject: [Buildroot] [PATCH 0/2] kismet: fix static builds (branch yem/fixes)
Message-ID: <cover.1419615048.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

These two patches are fixes to kismet when doing a static-only build:

  - first patch is the same as what Vicente proposed, but done in
    configure.in instead of configure, and thus needs an autoreconf;
    it fixes static linking against ncurses libs;

  - second patch is what Vicente provided, but with the ncurses bits
    removed since it is now handled differently in its own patch.

Regards,
Yann E. MORIN.


The following changes since commit 1696f254aa2c68a274956902cfac7b7e9a607b11:

  libvncserver: bump version to 0.9.10 (2014-12-26 17:39:43 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/fixes

for you to fetch changes up to 6c3f1a6f597ba9282340782273af01cef607bfe1:

  kismet: Fix static build (2014-12-26 18:28:26 +0100)

----------------------------------------------------------------
Vicente Olivert Riera (1):
      kismet: Fix static build

Yann E. MORIN (1):
      package/kismet: fix ncurses static build

 package/kismet/0003-fix-curses-libs-ordering.patch | 52 ++++++++++++++++++++++
 package/kismet/kismet.mk                           |  7 +++
 2 files changed, 59 insertions(+)
 create mode 100644 package/kismet/0003-fix-curses-libs-ordering.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
