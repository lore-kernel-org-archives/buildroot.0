From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 May 2017 17:58:39 +0200
Subject: [Buildroot] [PATCH 0/9] fs/ext2: cleanups and improvements
Message-ID: <cover.1493654310.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series brings in some cleanups about our ext2 filesystem handling,
and a few enhancements, of which the ability to reserve 0 block for root,
and set the block size.


Regards,
Yann E. MORIN.


The following changes since commit 5f14d0363248e8de253b7611e66b67eba45ce959

  package/m*/Config.in: fix ordering of statements (2017-05-01 11:56:18 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to c85507a4104956f6597a910e729118309f3ff432

  fs/ext2: add option to specify block size (2017-05-01 17:31:44 +0200)


----------------------------------------------------------------
J Evans (1):
      ext2: add help text for BR2_TARGET_ROOTFS_EXT2_BLOCKS

Yann E. MORIN (8):
      package/mke2img: check nb_blocks is specified
      package/mke2img: specifying zero inodes means auto
      fs/ext2: always pass the number of inodes
      fs/ext2: always pass the label option
      fs/ext2: allow reserving zero block for root
      fs/ext2: simplify code
      package/mke2img: add option to specify block size
      fs/ext2: add option to specify block size

 fs/ext2/Config.in       | 35 +++++++++++++++++++++++++++++++++--
 fs/ext2/ext2.mk         | 27 +++++++++++----------------
 package/mke2img/mke2img | 15 ++++++++++++---
 3 files changed, 56 insertions(+), 21 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
