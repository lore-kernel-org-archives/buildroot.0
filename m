From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Apr 2015 18:57:19 +0200
Subject: [Buildroot] [PATCH 0/8 v4] toolchain: better handle hashes (branch
	yem/dl-hash-toolchains)
Message-ID: <cover.1428512075.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series makes it so we can download custom external toolchains, and
still have mandatory checks of hashes.

It also adds the long-awaited-for hashes for gcc and binutils.


Changes v3 -> v4:
  - add missing fake-hash for uClibc eXtensa git snapshot; add uClibc
    daily snapshots to exclusion list  (Arnout)
  - drop using a magic value; use a list of excluded files  (Arnout)

Changes v2 -> v3:
  - add hashes for gcc and binutils
  - fix a few more typoes

Changes v1 -> v2:
  - fix a few typoes


Regards,
Yann E. MORIN.


The following changes since commit 2552729232b4d9c5cb63ad247d6d94ab83e48e49:

  package/mplayer: add optional libenca support (2015-04-07 23:27:23 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/dl-hash-toolchains

for you to fetch changes up to ee02447feb64c265dcf5e7a60dddb630c7dc9402:

  support/download: do not accept exlcuded files with ashes (2015-04-08 18:54:13 +0200)

----------------------------------------------------------------
Yann E. MORIN (8):
      package/gcc: add hashes
      package/binutils: add hashes
      package/uclibc: add missing hash for eXtensa
      support/download: add possibility to not fail on missing hash
      toolchain/external: ignore missing hash for custom downloaded toolchain
      package/uclibc: ignore missing hash for snapshots
      support/download: restore mandatory check of hashes
      support/download: do not accept exlcuded files with ashes

 package/binutils/binutils.hash                     |  7 +++++++
 package/gcc/gcc-final/gcc-final.hash               |  1 +
 package/gcc/gcc-initial/gcc-initial.hash           |  1 +
 package/gcc/gcc.hash                               |  7 +++++++
 package/pkg-download.mk                            |  3 +++
 package/uclibc/uclibc.hash                         |  3 +++
 package/uclibc/uclibc.mk                           |  1 +
 support/download/check-hash                        | 17 ++++++++++++++++-
 toolchain/toolchain-external/toolchain-external.mk |  2 ++
 9 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 package/binutils/binutils.hash
 create mode 120000 package/gcc/gcc-final/gcc-final.hash
 create mode 120000 package/gcc/gcc-initial/gcc-initial.hash
 create mode 100644 package/gcc/gcc.hash

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
