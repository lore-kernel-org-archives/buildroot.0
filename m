From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Dec 2014 20:09:09 +0100
Subject: [Buildroot] [PATCH 0/2] misc guile-related fixes (branch yem/fixes)
Message-ID: <cover.1419448003.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Here are two patches intended to fix guile builds:
  - in bdwgc, detect availability of getcontext
  - add proper kconfig dependency to guile

A third patch to guile I kept in limbo until we have a way to reproduce
the autobuild failures it is supposed to fix (I was not able to reproduce
any of them).

Thanks to Samuel for the initial series. :-)

Regards,
Yann E. MORIN.


The following changes since commit 49b147ccbb807238009fde815ad68e953077bc3a:

  linux: fix breakage from d4b2b032a00c9922c9efa144b014dc086a7e48f1 (2014-12-24 15:00:48 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/fixes

for you to fetch changes up to efeb5ff2d78fb77cfd65a2e4e3bbb78ec9bef3f0:

  bdwgc: add patch automatically detecting for NO_GETCONTEXT need (2014-12-24 20:04:24 +0100)

----------------------------------------------------------------
Samuel Martin (1):
      bdwgc: add patch automatically detecting for NO_GETCONTEXT need

Yann E. MORIN (1):
      package/guile: needs libtool

 ...ac-add-check-for-NO_GETCONTEXT-definition.patch | 28 ++++++++++++++++++++++
 package/guile/Config.in                            |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 package/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
