From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Aug 2017 17:53:56 +0200
Subject: [Buildroot] [PATCH 0/2] package/grub: drop grub-legacy
Message-ID: <cover.1504194830.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This two-patch series removes grub, aka grub-legacy.

The reasioning is explained in the first patch, which actually gets rid
of grub.

The second patch then removes grub support in the iso8660 filesystem, as
grub is no longer available then.


Regards,
Yann E. MORIN.


The following changes since commit 0ea3d7ba0e162c68990919e3187749f24268866d

  CHANGES: start preparing for the final 2017.08 (2017-08-30 22:18:57 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 89462d4b3d365f2c6585eefeb35175813b5a8af2

  fs/iso9660: remove support for grub (2017-08-31 17:49:12 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      boot/grub: remove
      fs/iso9660: remove support for grub

 Config.in.legacy                              |     9 +
 boot/Config.in                                |     1 -
 boot/grub/Config.in                           |   200 -
 boot/grub/grub.200-fix_mbr_handling.patch     |    13 -
 boot/grub/grub.300-honor_UCLIBC_HAS_LFS.patch |    36 -
 boot/grub/grub.400-nic_update2.patch          | 47064 ------------------------
 boot/grub/grub.hash                           |     3 -
 boot/grub/grub.mk                             |   109 -
 boot/grub/menu.lst                            |    16 -
 boot/grub/splash.xpm.gz                       |   Bin 16466 -> 0 bytes
 fs/iso9660/Config.in                          |    16 +-
 fs/iso9660/grub.cfg                           |     7 -
 fs/iso9660/iso9660.mk                         |    32 +-
 support/testing/tests/fs/test_iso9660.py      |    37 -
 14 files changed, 14 insertions(+), 47529 deletions(-)
 delete mode 100644 boot/grub/Config.in
 delete mode 100644 boot/grub/grub.200-fix_mbr_handling.patch
 delete mode 100644 boot/grub/grub.300-honor_UCLIBC_HAS_LFS.patch
 delete mode 100644 boot/grub/grub.400-nic_update2.patch
 delete mode 100644 boot/grub/grub.hash
 delete mode 100644 boot/grub/grub.mk
 delete mode 100644 boot/grub/menu.lst
 delete mode 100644 boot/grub/splash.xpm.gz
 delete mode 100644 fs/iso9660/grub.cfg

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
