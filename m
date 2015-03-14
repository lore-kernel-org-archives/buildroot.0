From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2015 15:25:17 +0100
Subject: [Buildroot] [PATCH 0/5 v2] linux: fix using extensions (branch
	yem/kernel-ext)
Message-ID: <cover.1426342904.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series is an attempt at fixing the use of extensions, which
broke unnoticeably since we switched to using the kconfig-package
infrastructure for the linux package.

  - patches 1-2: introduce patch-dependencies (code and manual)
  - patch 3    : actually fix the extensions
  - patches 4-5: simplify adding new extensions

Changes v1 -> v2:
  - introduce patch-dependencies  (Thomas P.)
  - use that instead of custom-written rules on .stamp_patched
  - split out the 'extensions infra' from the actual extensions fix

Regards,
Yann E. MORIN.


The following changes since commit 3fd2c4d25f727c5364e52abf65c37f19fe461433:

  iotop: new package (2015-03-13 23:16:38 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/kernel-ext

for you to fetch changes up to 724c084b0e9f1d98670184ab5e77a2381e04d67c:

  linux: migrate extensions to use the new infrastructure (2015-03-14 15:19:31 +0100)

----------------------------------------------------------------
Yann E. MORIN (5):
      package infra: add patch-dependencies
      docs/manual: add _PATCH_DEPENDENCIES
      linux: fix extensions
      linux: simplify adding new extensions
      linux: migrate extensions to use the new infrastructure

 docs/manual/adding-packages-generic.txt | 9 +++++++++
 linux/linux-ext-fbtft.mk                | 8 +-------
 linux/linux-ext-rtai.mk                 | 8 +-------
 linux/linux-ext-xenomai.mk              | 8 +-------
 linux/linux.mk                          | 7 +++++++
 package/pkg-generic.mk                  | 9 ++++++++-
 6 files changed, 27 insertions(+), 22 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
