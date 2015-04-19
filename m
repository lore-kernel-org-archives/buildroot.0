From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Apr 2015 14:44:55 +0200
Subject: [Buildroot] [PATCH 0/7 v5] toolchain: better handle hashes (branch
	yem/dl-hash-toolchains)
Message-ID: <cover.1429447148.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series makes it so we can download custom external toolchains, and
still have mandatory checks of hashes.

It also adds the long-awaited-for hashes for gcc and binutils.


Changes v4 -> v5:
  - drop patch #8, that errored-out when an excluded file did have
    one or more associated hashes  (Arnout)
  - typoes  (Arnout)

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


The following changes since commit 81e22ebd5ee3b9aa36fcbc86602a8fc5bfe87c17:

  package/python-m2crypto: add hash (2015-04-19 14:25:28 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/dl-hash-toolchains

for you to fetch changes up to 92db9d9c24d6a53fa0db2aa7b3bff1456498d690:

  support/download: restore mandatory check of hashes (2015-04-19 14:35:03 +0200)

----------------------------------------------------------------
Yann E. MORIN (7):
      package/gcc: add hashes
      package/binutils: add hashes
      package/uclibc: add missing hash for eXtensa
      support/download: add possibility to not fail on missing hash
      toolchain/external: ignore missing hash for custom downloaded toolchain
      package/uclibc: ignore missing hash for snapshots
      support/download: restore mandatory check of hashes

 package/binutils/binutils.hash                     |  7 +++++++
 package/gcc/gcc-final/gcc-final.hash               |  1 +
 package/gcc/gcc-initial/gcc-initial.hash           |  1 +
 package/gcc/gcc.hash                               | 10 ++++++++++
 package/pkg-download.mk                            |  3 +++
 package/uclibc/uclibc.hash                         |  3 +++
 package/uclibc/uclibc.mk                           |  1 +
 support/download/check-hash                        |  8 +++++++-
 toolchain/toolchain-external/toolchain-external.mk |  2 ++
 9 files changed, 35 insertions(+), 1 deletion(-)
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
