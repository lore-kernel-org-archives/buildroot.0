From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  4 Dec 2014 23:01:10 +0100
Subject: [Buildroot] [PATCH 0/3 v2] fs/ext2: misc enhancements (branch
	yem/fs-vol-id)
Message-ID: <cover.1417730349.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series enhances the fs/ext2 generation.
Not much to say beside the individual commit logs... ;-)

Changes v1 -> v2:
  - move our genext2fs.sh wrapper and make it a proper host package,
    with extensive tweaks to the code  (Thomas)

Regards,
Yann E. MORIN.


The following changes since commit c5f0e93d2cc6107cce249e1f11158aeccb4a3449:

  rp-pppoe: install default conf file (2014-12-03 23:26:21 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/fs-vol-id

for you to fetch changes up to d98afa0b717cf9585358913fd3d97ba6101d2a2b:

  fs/ext2: add option to specify a filesystem label (2014-12-04 22:48:55 +0100)

----------------------------------------------------------------
Yann E. MORIN (3):
      package/mke2img: new package
      fs/ext2: use the new mke2img host package
      fs/ext2: add option to specify a filesystem label

 fs/ext2/Config.in          |   3 +
 fs/ext2/ext2.mk            |  17 +++---
 fs/ext2/genext2fs.sh       | 121 ------------------------------------
 package/mke2img/mke2img    | 148 +++++++++++++++++++++++++++++++++++++++++++++
 package/mke2img/mke2img.mk |  14 +++++
 5 files changed, 175 insertions(+), 128 deletions(-)
 delete mode 100755 fs/ext2/genext2fs.sh
 create mode 100755 package/mke2img/mke2img
 create mode 100644 package/mke2img/mke2img.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
