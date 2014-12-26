From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Dec 2014 22:07:58 +0100
Subject: [Buildroot] [PATCH 0/3 v2] kismet: fix static builds (branch
	yem/fixes)
Message-ID: <cover.1419627979.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series contains fixes to kismet when doing a static-only build:

  - first patch is the same as what Vicente proposed, but done in
    configure.in instead of configure, and thus needs an autoreconf;
    it fixes static linking against ncurses libs;

  - second patch removes unsafe host paths from the include search dirs;

  - third patch is what Vicente provided, but with the ncurses bits
    removed since it is now handled differently in its own patch.

Changes v1 -> v2:
  - split unsafe host paths removal to is own patch  (Thomas)


Regards,
Yann E. MORIN.


The following changes since commit 21d6e4ea459b0b3a436c7936a94a917f085919e6:

  util-linux: Add an option to compile 'nsenter' binary. (2014-12-26 20:09:34 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/fixes

for you to fetch changes up to 0595c07a5d923887ee61e9a3a5084da616b92329:

  kismet: Fix static build (2014-12-26 22:06:03 +0100)

----------------------------------------------------------------
Vicente Olivert Riera (1):
      kismet: Fix static build

Yann E. MORIN (2):
      package/kismet: fix ncurses static build
      package/kismet: do not use host headers

 package/kismet/0003-fix-curses-libs-ordering.patch | 42 ++++++++++++++++++++++
 package/kismet/0004-no-include-host-paths.patch    | 23 ++++++++++++
 package/kismet/kismet.mk                           |  7 ++++
 3 files changed, 72 insertions(+)
 create mode 100644 package/kismet/0003-fix-curses-libs-ordering.patch
 create mode 100644 package/kismet/0004-no-include-host-paths.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
