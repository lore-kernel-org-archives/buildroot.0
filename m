From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jul 2015 12:32:00 +0200
Subject: [Buildroot] [PATCH 0/7 v2] core/kconfig: fix display of custom
	error messages (branch yem/misc)
Message-ID: <cover.1436783490.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fixes the display of our custom error messages when
defconfig/.config files do not exist, and also adds such messages to
busybox and uClibc.


Changes v1 -> v2:
  - check BR_BUILDING in its own ifeq() in new tests
  - fix commit logs


Regards,
Yann E. MORIN.


The following changes since commit 5284dcf7de769e8612da3d4f1c4d12b4582870d5:

  Document the 72 char limit on package description. (2015-07-13 12:16:45 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/misc

for you to fetch changes up to a3dfb23b0341c6a442dfe5f06aef393d2a0f4ecc:

  package/uclibc: check for config file (2015-07-13 12:22:59 +0200)

----------------------------------------------------------------
Yann E. MORIN (7):
      core/pkg-kconfig: don't enforce check for config file when not building
      package/linux: don't enforce check for DTS when not building
      package/linux: check for config file before calling kconfig-package
      boot/at91boostrap3: check for config file before calling kconfig-package
      boot/barebox: check for config file before calling kconfig-package
      package/busybox: check for config file
      package/uclibc: check for config file

 boot/at91bootstrap3/at91bootstrap3.mk |  7 +++++--
 boot/barebox/barebox.mk               |  6 ++++--
 linux/linux.mk                        | 32 ++++++++++++++++----------------
 package/busybox/busybox.mk            |  8 ++++++++
 package/pkg-kconfig.mk                |  2 ++
 package/uclibc/uclibc.mk              |  8 ++++++++
 6 files changed, 43 insertions(+), 20 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
