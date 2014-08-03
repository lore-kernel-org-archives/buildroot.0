From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Aug 2014 17:32:39 +0200
Subject: [Buildroot] [PATCH 0/5 v4] Introduction of kconfig-package (branch
	yem/patrickdp/kconfig-pkg)
Message-ID: <cover.1407079864.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

From: Thomas De Schampheleire <patrickdepinguin@gmail.com>

This patch series introduces a kconfig-package infrastructure and already
converts the uclibc and busybox packages.

I believe this series is complete in the sense that it could be applied as
one whole, not yet including the conversion of linux and barebox.

In a subsequent series, linux and barebox can be converted to
kconfig-package too, but there will need to be some changes to
kconfig-package to support them.
One particular difference with uclibc/busybox is that linux/barebox use a
different method to copy the original config file: instead of simply copying
it to build_dir/.config, it is first copied to arch/.../buildroot_defconfig
and then 'make ... buildroot_defconfig' is called. I'm considering in adding
a FOO_KCONFIG_INSTALL_CONFIG_CMDS variable to support this, which defaults
to the simple copy used by busybox/uclibc, but can be overwritten
appropriately by linux and barebox.
Anyway, this part is not yet ready and will only be available for 2014.11.

Changes v3 -> v4:
  - add missing 4th argument when calling inner-kconfig-package  (Yann)


Regards,
Yann E. MORIN.


The following changes since commit 01370132c10cb2d194042e08fefbc9cec8392c66:

  gst-fsl-plugins, libfslvpuwrap: add missing select (2014-08-03 14:47:03 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/patrickdp/kconfig-pkg

for you to fetch changes up to 437a2f63b7dd1357bf859133053f4b877bc2a0e9:

  busybox: convert to kconfig-package infrastructure (2014-08-03 17:17:12 +0200)

----------------------------------------------------------------
Thomas De Schampheleire (5):
      uclibc: fixup config before calling menuconfig
      infra: introduce a kconfig-package infrastructure
      manual: add documentation for kconfig-package
      uclibc: convert to kconfig-package infrastructure
      busybox: convert to kconfig-package infrastructure

 docs/manual/adding-packages-kconfig.txt | 56 ++++++++++++++++++++++
 docs/manual/adding-packages.txt         |  2 +
 package/Makefile.in                     |  1 +
 package/busybox/busybox.mk              | 25 ++++------
 package/pkg-kconfig.mk                  | 82 +++++++++++++++++++++++++++++++++
 package/uclibc/uclibc.mk                | 34 ++++----------
 6 files changed, 160 insertions(+), 40 deletions(-)
 create mode 100644 docs/manual/adding-packages-kconfig.txt
 create mode 100644 package/pkg-kconfig.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
