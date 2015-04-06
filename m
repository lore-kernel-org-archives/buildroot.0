From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  6 Apr 2015 14:13:07 +0200
Subject: [Buildroot] [PATCH 0/6 v3] toolchain: better handle hashes (branch
	yem/dl-hash-toolchains)
Message-ID: <cover.1428322317.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series makes it so we can download custom external toolchains, and
still have mandatory checks of hashes.

It also adds the long-awaited-for hashes for gcc and binutils.

Finally, it fixes a slightly annoying warning message when downloading
from a repository.


Changes v2 -> v3:
  - add hashes for gcc and binutils
  - fix a few more typoes

Changes v1 -> v2:
  - fix a few typoes


Regards,
Yann E. MORIN.


The following changes since commit ca735d8a0b86b7ad274319774df2bca0abfe4ee9:

  package/ipmiutil: do not build doc (2015-04-06 12:42:54 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/dl-hash-toolchains

for you to fetch changes up to 21c6a4cd9d79b9279ba50426a2d0baaa1bc3f0b0:

  support/download: restore mandatory check of hashes (2015-04-06 14:11:45 +0200)

----------------------------------------------------------------
Yann E. MORIN (6):
      support/download: do not warn about missing hash file for repositories
      package/gcc: add hashes
      package/binutils: add hashes
      support/download: add possibility to not fail on missing hash
      toolchain/external: ignore missing hash for custom downloaded toolchain
      support/download: restore mandatory check of hashes

 package/binutils/binutils.hash                     |  7 +++++++
 package/gcc/gcc-final/gcc-final.hash               |  1 +
 package/gcc/gcc-initial/gcc-initial.hash           |  1 +
 package/gcc/gcc.hash                               |  7 +++++++
 package/pkg-download.mk                            |  4 ++++
 support/download/check-hash                        | 12 ++++++++++--
 toolchain/toolchain-external/toolchain-external.mk |  2 ++
 7 files changed, 32 insertions(+), 2 deletions(-)
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
