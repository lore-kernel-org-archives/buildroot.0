From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  6 Jun 2016 22:43:40 +0200
Subject: [Buildroot] [PATCH 0/7] fs: cleanups (branch yem/fs-fixes)
Message-ID: <cover.1465245732.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This short series pre-emptively fixes the fs infra when generating the
fakeroot script and the users, devices and permissions tables.

This allows a few cosmetic simplifications in some of our filesystem
commands.

Regards,
Yann E. MORIN.


The following changes since commit 7dcec609ee0f4a17a25533c443f1db3483abe720

  uclibc: the internal toolchain only uses uClibc-ng (2016-06-06 22:26:08 +0200)


are available in the git repository at:

  https://git.busybox.net/~ymorin/git/buildroot

for you to fetch changes up to d4b5c7f0315f28e792a014983c78b1fe4958eb9f

  fs/squashfs: remove useless chmod (2016-06-06 22:32:59 +0200)


----------------------------------------------------------------
Yann E. MORIN (7):
      core/pkg-utils: add macro to escape-and-printf
      fs: properly escape commands when generating fakeroot script
      fs/cloop: split long line
      fs/jffs2: split commands
      fs/squashfs: split commands
      fs/ubifs: fix the UBI commands
      fs/squashfs: remove useless chmod

 fs/cloop/cloop.mk       |  5 +++--
 fs/common.mk            |  8 ++++----
 fs/jffs2/jffs2.mk       |  4 ++--
 fs/squashfs/squashfs.mk |  3 +--
 fs/ubifs/ubi.mk         |  6 +++---
 package/pkg-utils.mk    | 37 +++++++++++++++++++++++++++++++++++++
 6 files changed, 50 insertions(+), 13 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
