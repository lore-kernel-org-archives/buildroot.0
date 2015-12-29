From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Dec 2015 00:10:35 +0100
Subject: [Buildroot] [PATCH 0/3] core: add kconfigsymbols to packages
	(branch yem/check-target-packages)
Message-ID: <cover.1451430505.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Since we check that packages in _DEPENDENCIES are enabled at the Kconfig
level, it means all the target packages need to have a Kconfig symbol.

This is currently not the case for quite a few of them:
  - linux-headers
  - netbsd-queue
  - virtual packages
  - a few more...

This series fixes the most critical ones (the three identified in the
list above); others will be fixed in later patches when the autobulders
find them.


Regards,
Yann E. MORIN.


The following changes since commit 5203541aa62c1d77d1e85662961bd7ab313813bc:

  package/xtables-addons: require kernel modules from Kconfig (2015-12-29 23:53:04 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/check-target-packages

for you to fetch changes up to 7048b92dbba0ba35f610d7863f0c599eca3e3399:

  core/pkg-virtual: do not check they are neabled (2015-12-30 00:07:09 +0100)

----------------------------------------------------------------
Yann E. MORIN (3):
      package/c-libraries: need linux-headers
      package/netbsd-queue: add Kconfig symbol like for all target packages
      core/pkg-virtual: do not check they are neabled

 package/glibc/Config.in                 | 4 ++--
 package/linux-headers/Config.in         | 2 ++
 package/musl/Config.in                  | 3 ++-
 package/netbsd-queue/Config.in          | 2 ++
 package/pkg-generic.mk                  | 5 ++++-
 package/pkg-virtual.mk                  | 2 ++
 package/uclibc/Config.in                | 2 +-
 toolchain/toolchain-buildroot/Config.in | 1 +
 8 files changed, 16 insertions(+), 5 deletions(-)
 create mode 100644 package/linux-headers/Config.in
 create mode 100644 package/netbsd-queue/Config.in

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
