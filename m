From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Sep 2015 23:09:54 +0200
Subject: [Buildroot] [PATCH 0/3 v3] toolchain/external: add Linaro 2014.11
	for ARMv7 BE/LE EABIhf and AArch64 (branch
	yem/toolchain-linaro-2014.11)
Message-ID: <cover.1441660041.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces the Linaro 2014.11 toolchains, for ARM (LE and
BE) and AArch64.

See the commit log of patch 1 for the gory details... :-/

ARM (LE) toolchain was tested with a minimalist setup, based on
qemu_arm_vexpress_defconfig, with just a switch to use EABIhf and this
toolchain (rather than the default EABI and internal toolchain), while
the AArch64 toolchain was tested in a similar way, based on
qemu_aarch64_virt_defconfig.

Notes: I haven't had the opportunity to report the issues to Linaro for
now. :-/ I'll try to do that soon...


Changes v2 -> v3:
  - fix comments about secondary tarball  (Thomas)
  - expand comments about post-extract hooks  (Thomas)
  - fix typoes  (Thomas)

Changes v1 -> v2:
  - remove stray backup file


Regards,
Yann E. MORIN.


The following changes since commit 3cd209bfaf4c7af47ce9ddfe1fd2b0d82d30909d:

  docs: website: update for 2015.08.1 (2015-09-06 23:09:12 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/toolchain-linaro-2014.11

for you to fetch changes up to 7d7abe73fcf0fc9420ba27ec0b069ad97f747b63:

  toolchain/external: add Linaro AArch64 2014.11 (2015-09-06 23:11:37 +0200)

----------------------------------------------------------------
Yann E. MORIN (3):
      toolchain/external: add Linaro ARM 2014.11 ARMv7 EABIhf
      toolchain/external: add Linaro ARM BE 2014.11 ARMv7 EABIhf
      toolchain/external: add Linaro AArch64 2014.11

 toolchain/toolchain-external/Config.in             | 63 +++++++++++++++-----
 .../toolchain-external/toolchain-external.hash     |  6 ++
 toolchain/toolchain-external/toolchain-external.mk | 69 ++++++++++++++--------
 3 files changed, 100 insertions(+), 38 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
