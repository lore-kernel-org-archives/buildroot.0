From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Apr 2015 19:16:26 +0200
Subject: [Buildroot] [PATCH 0/4] toolchain/external: do not fail on missig
	hash for custom downloaded toolchain (branch yem/dl-hash-toolchains)
Message-ID: <cover.1428081325.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series makes it so we can download custom external toolchains, and
still have mandatory checks of hashes.

It also fixes a slightly annoying warning message when downloading from
a repository.

Regards,
Yann E. MORIN.


The following changes since commit 0eb659d04e7854a25be09c5358212a7bfcc39b2b:

  config: Add defconfig for Freescale i.MX28 EVK (2015-04-03 17:26:00 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/dl-hash-toolchains

for you to fetch changes up to b3d829351f7593b214a93a3503b789113d3d63ca:

  support/download: do not warn about missing hash file for repositories (2015-04-03 19:08:46 +0200)

----------------------------------------------------------------
Yann E. MORIN (4):
      support/download: add possibility to not fail on missing hash
      toolchain/external: ginore missig hash for custom downloaded toolchain
      support/download: restore mandatory check of hashes
      support/download: do not warn about missing hash file for repositories

 package/pkg-download.mk                            |  4 ++++
 support/download/check-hash                        | 12 ++++++++++--
 toolchain/toolchain-external/toolchain-external.mk |  2 ++
 3 files changed, 16 insertions(+), 2 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
