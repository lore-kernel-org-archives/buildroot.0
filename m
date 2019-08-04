From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Aug 2019 14:14:15 +0200
Subject: [Buildroot] [PATCH 0/5 v3] openrc: further itegration (branch
 yem/openrc)
Message-ID: <cover.1564920849.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series continues the integration of the OpenRC init system in
Buildroot:
  - legacy sysv init compatibility
  - handle remounting root read/write
  - getty support
  - netifrc package to replace openrc internal network handling

This series is a respin of patches initially from Micha?, heavily
tweaked by me. I'll soon reply to the initial patches that were left
behind.


Regards,
Yann E. MORIN.


The following changes since commit 6f79cebe6a7152f2bb83af01a8909c4e33168d45

  package/linux-headers: apply all Linux patches when BR2_KERNEL_HEADERS_AS_KERNEL=y (2019-08-04 12:53:03 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 30a72507b462c74206c354feae3887e54b96da09

  package/netifrc: add support for BR2_SYSTEM_DHCP (2019-08-04 14:02:27 +0200)


----------------------------------------------------------------
Micha? ?yszczek (5):
      package/skeleton-init-openrc: add support for starting sysv scripts
      package/skeleton-init-openrc: add support to remount rootfs as rw
      package/openrc: add support for spawning getty
      package/netifrc: new package
      package/netifrc: add support for BR2_SYSTEM_DHCP

 DEVELOPERS                                         |  1 +
 docs/manual/adding-packages-generic.txt            |  5 +-
 package/Config.in                                  |  1 +
 package/netifrc/Config.in                          | 12 +++++
 package/netifrc/netifrc.hash                       |  3 ++
 package/netifrc/netifrc.mk                         | 57 ++++++++++++++++++++++
 package/openrc/getty                               | 24 +++++++++
 package/openrc/openrc.mk                           | 29 +++++++++++
 package/openrc/sysv-rcs                            | 25 ++++++++++
 package/pkg-generic.mk                             |  3 +-
 .../skeleton-init-openrc/skeleton-init-openrc.mk   | 15 ++++++
 .../skeleton/etc/conf.d/.empty                     |  0
 package/skeleton-init-openrc/skeleton/etc/fstab    |  1 +
 .../skeleton/etc/runlevels/default/.empty          |  0
 .../skeleton/etc/runlevels/default/sysv-rcs        |  1 +
 system/Config.in                                   | 16 +++---
 16 files changed, 184 insertions(+), 9 deletions(-)
 create mode 100644 package/netifrc/Config.in
 create mode 100644 package/netifrc/netifrc.hash
 create mode 100644 package/netifrc/netifrc.mk
 create mode 100755 package/openrc/getty
 create mode 100755 package/openrc/sysv-rcs
 create mode 100644 package/skeleton-init-openrc/skeleton/etc/conf.d/.empty
 create mode 100644 package/skeleton-init-openrc/skeleton/etc/runlevels/default/.empty
 create mode 120000 package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
