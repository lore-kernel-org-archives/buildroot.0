From: Darius Augulis <augulis.darius@gmail.com>
Date: Mon, 12 Jul 2010 23:48:20 +0300
Subject: [Buildroot] [PATCH 0/2] Add support for Alix2d3 board from PC
	Engines
Message-ID: <20100712204654.17842.63829.stgit@darius-desktop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds support for Alix2d3 board from PC Engines.
Two patches add board specific files to build system,
also optimized target skeleton and
configuration files for uclibc, busybox and kernel.
It provides minimal configuration needed for wireless
home router based on Buildroot.

---

Darius Augulis (2):
      Add support for Alix2d3 board from PC Engines
      Add target skeleton for Alix2d3


 configs/alix2d3_defconfig                          |  892 +++++++++++
 target/device/Config.in                            |    1 
 target/device/pcengines/Config.in                  |   20 
 target/device/pcengines/Makefile.in                |    4 
 target/device/pcengines/alix2d3/Makefile.in        |    5 
 target/device/pcengines/alix2d3/busybox.config     |  920 +++++++++++
 .../pcengines/alix2d3/linux-2.6-alix2d3.config     | 1601 ++++++++++++++++++++
 .../pcengines/alix2d3/target_skeleton/bin/.empty   |    0 
 .../alix2d3/target_skeleton/boot/grub/grub.conf    |    9 
 .../alix2d3/target_skeleton/boot/grub/menu.lst     |    9 
 .../pcengines/alix2d3/target_skeleton/dev/log      |    1 
 .../alix2d3/target_skeleton/dev/pts/.empty         |    0 
 .../pcengines/alix2d3/target_skeleton/etc/TZ       |    1 
 .../pcengines/alix2d3/target_skeleton/etc/fstab    |    7 
 .../pcengines/alix2d3/target_skeleton/etc/group    |   17 
 .../pcengines/alix2d3/target_skeleton/etc/hostname |    1 
 .../pcengines/alix2d3/target_skeleton/etc/hosts    |    1 
 .../alix2d3/target_skeleton/etc/init.d/S20urandom  |   54 +
 .../alix2d3/target_skeleton/etc/init.d/S40network  |   25 
 .../alix2d3/target_skeleton/etc/init.d/rcS         |   27 
 .../pcengines/alix2d3/target_skeleton/etc/inittab  |   43 +
 .../pcengines/alix2d3/target_skeleton/etc/inputrc  |   44 +
 .../pcengines/alix2d3/target_skeleton/etc/issue    |    3 
 .../target_skeleton/etc/ld.so.conf.d/.empty        |    0 
 .../pcengines/alix2d3/target_skeleton/etc/mtab     |    1 
 .../alix2d3/target_skeleton/etc/network/interfaces |    4 
 .../pcengines/alix2d3/target_skeleton/etc/passwd   |   15 
 .../pcengines/alix2d3/target_skeleton/etc/profile  |   48 +
 .../alix2d3/target_skeleton/etc/protocols          |   31 
 .../alix2d3/target_skeleton/etc/random-seed        |  Bin
 .../alix2d3/target_skeleton/etc/resolv.conf        |    1 
 .../alix2d3/target_skeleton/etc/securetty          |   35 
 .../pcengines/alix2d3/target_skeleton/etc/services |  302 ++++
 .../pcengines/alix2d3/target_skeleton/etc/shadow   |   12 
 .../pcengines/alix2d3/target_skeleton/home/.empty  |    0 
 .../pcengines/alix2d3/target_skeleton/lib/.empty   |    0 
 .../pcengines/alix2d3/target_skeleton/mnt/.empty   |    0 
 .../pcengines/alix2d3/target_skeleton/opt/.empty   |    0 
 .../pcengines/alix2d3/target_skeleton/proc/.empty  |    0 
 .../alix2d3/target_skeleton/root/.bash_history     |    0 
 .../alix2d3/target_skeleton/root/.bash_logout      |    7 
 .../alix2d3/target_skeleton/root/.bash_profile     |   15 
 .../pcengines/alix2d3/target_skeleton/root/.bashrc |   48 +
 .../pcengines/alix2d3/target_skeleton/root/.empty  |    0 
 .../pcengines/alix2d3/target_skeleton/sbin/.empty  |    0 
 .../pcengines/alix2d3/target_skeleton/sys/.empty   |    0 
 .../pcengines/alix2d3/target_skeleton/tmp/.empty   |    0 
 .../alix2d3/target_skeleton/usr/bin/.empty         |    0 
 .../alix2d3/target_skeleton/usr/lib/.empty         |    0 
 .../alix2d3/target_skeleton/usr/sbin/.empty        |    0 
 .../usr/share/udhcpc/default.script                |   39 
 .../pcengines/alix2d3/target_skeleton/var/cache    |    1 
 .../alix2d3/target_skeleton/var/lib/pcmcia         |    1 
 .../pcengines/alix2d3/target_skeleton/var/lock     |    1 
 .../pcengines/alix2d3/target_skeleton/var/log      |    1 
 .../pcengines/alix2d3/target_skeleton/var/pcmcia   |    1 
 .../pcengines/alix2d3/target_skeleton/var/run      |    1 
 .../pcengines/alix2d3/target_skeleton/var/spool    |    1 
 .../pcengines/alix2d3/target_skeleton/var/tmp      |    1 
 target/device/pcengines/alix2d3/uclibc.config      |  248 +++
 60 files changed, 4499 insertions(+), 0 deletions(-)
 create mode 100644 configs/alix2d3_defconfig
 create mode 100644 target/device/pcengines/Config.in
 create mode 100644 target/device/pcengines/Makefile.in
 create mode 100644 target/device/pcengines/alix2d3/Makefile.in
 create mode 100755 target/device/pcengines/alix2d3/busybox.config
 create mode 100644 target/device/pcengines/alix2d3/linux-2.6-alix2d3.config
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/bin/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/boot/grub/grub.conf
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/boot/grub/menu.lst
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/dev/log
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/dev/pts/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/TZ
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/fstab
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/group
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/hostname
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/hosts
 create mode 100755 target/device/pcengines/alix2d3/target_skeleton/etc/init.d/S20urandom
 create mode 100755 target/device/pcengines/alix2d3/target_skeleton/etc/init.d/S40network
 create mode 100755 target/device/pcengines/alix2d3/target_skeleton/etc/init.d/rcS
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/inittab
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/inputrc
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/issue
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/ld.so.conf.d/.empty
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/etc/mtab
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/network/interfaces
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/passwd
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/profile
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/protocols
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/random-seed
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/etc/resolv.conf
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/securetty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/services
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/etc/shadow
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/home/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/lib/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/mnt/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/opt/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/proc/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/root/.bash_history
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/root/.bash_logout
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/root/.bash_profile
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/root/.bashrc
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/root/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/sbin/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/sys/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/tmp/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/usr/bin/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/usr/lib/.empty
 create mode 100644 target/device/pcengines/alix2d3/target_skeleton/usr/sbin/.empty
 create mode 100755 target/device/pcengines/alix2d3/target_skeleton/usr/share/udhcpc/default.script
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/var/cache
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/var/lib/pcmcia
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/var/lock
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/var/log
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/var/pcmcia
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/var/run
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/var/spool
 create mode 120000 target/device/pcengines/alix2d3/target_skeleton/var/tmp
 create mode 100755 target/device/pcengines/alix2d3/uclibc.config

-- 
Signature
