From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jul 2015 14:11:25 +0200
Subject: [Buildroot] [PATCH 0/7] core/kconfig: fix display of custom error
	messages (branch yem/misc)
Message-ID: <cover.1436702899.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fixes the display of our custom error messages when
defconfig/.config files do not exist, and also adds such messages to
busybox and uClibc.

Regards,
Yann E. MORIN.


The following changes since commit 22ed697d11e033914cab7631fba899ba436a5a5b:

  packages: do not use TAR_STRIP_COMPONENTS, but directly --strip-components (2015-07-12 13:51:59 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/misc

for you to fetch changes up to 62fed5cb399404addb30c60c3dc128f46333c9ec:

  package/uclibc: check for config file before calling kconfig-package (2015-07-12 14:02:05 +0200)

----------------------------------------------------------------
Yann E. MORIN (7):
      core/pkg-kconfig: don't enforce check for config file when not building
      package/linux: don't enforce check for DTS when not building
      boot/at91boostrap3: check for config file before calling kconfig-package
      boot/barebox: check for config file before calling kconfig-package
      package/linux: check for config file before calling kconfig-package
      package/busybox: check for config file before calling kconfig-package
      package/uclibc: check for config file before calling kconfig-package

 boot/at91bootstrap3/at91bootstrap3.mk |  7 +++++--
 boot/barebox/barebox.mk               |  6 ++++--
 linux/linux.mk                        | 38 ++++++++++++++++++-----------------
 package/busybox/busybox.mk            |  6 ++++++
 package/pkg-kconfig.mk                |  2 +-
 package/uclibc/uclibc.mk              |  6 ++++++
 6 files changed, 42 insertions(+), 23 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
