From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Dec 2014 23:40:02 +0100
Subject: [Buildroot] [PATCH 0/3 v4] fs/ext2: misc enhancements (branch
	yem/fs-vol-id)
Message-ID: <cover.1417905401.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series enhances the fs/ext2 generation.
Not much to say beside the individual commit logs... ;-)

Changes v3 -> v4:
  - help + slight fixes in the new mke2img script  (Thomas, me)

Changes v2 -> v3:
  - fix quoting for labels with a space in them  (K?roly)

Changes v1 -> v2:
  - move our genext2fs.sh wrapper and make it a proper host package,
    with extensive tweaks to the code  (Thomas)

Regards,
Yann E. MORIN.


The following changes since commit c5f0e93d2cc6107cce249e1f11158aeccb4a3449:

  rp-pppoe: install default conf file (2014-12-03 23:26:21 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/fs-vol-id

for you to fetch changes up to 7dfc8f18b87384622f5e99d73f9efe274a4539ff:

  fs/ext2: add option to specify a filesystem label (2014-12-06 23:29:46 +0100)

----------------------------------------------------------------
Yann E. MORIN (3):
      package/mke2img: new package
      fs/ext2: use the new mke2img host package
      fs/ext2: add option to specify a filesystem label

 fs/ext2/Config.in              |   6 +-
 fs/ext2/ext2.mk                |  19 ++--
 fs/ext2/genext2fs.sh           | 121 ------------------------
 package/Config.in.host         |   1 +
 package/mke2img/Config.in.host |   9 ++
 package/mke2img/mke2img        | 206 +++++++++++++++++++++++++++++++++++++++++
 package/mke2img/mke2img.mk     |  14 +++
 7 files changed, 246 insertions(+), 130 deletions(-)
 delete mode 100755 fs/ext2/genext2fs.sh
 create mode 100644 package/mke2img/Config.in.host
 create mode 100755 package/mke2img/mke2img
 create mode 100644 package/mke2img/mke2img.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
