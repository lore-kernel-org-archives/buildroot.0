From: Dmytro Milinevskyy <milinevskyy@gmail.com>
Date: Tue, 15 Jun 2010 04:50:53 +0300
Subject: [Buildroot] [PATCH 0/2] skeleton reorganization patchset
In-Reply-To: <4c114460.cc3ddf0a.33d2.14c9@mx.google.com>
References: <4c114460.cc3ddf0a.33d2.14c9@mx.google.com>
Message-ID: <AANLkTikki1Ttxd51_ex_Ah6ofDtBV7wbjQ-3CFpAK2UC@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I wonder whether this patchset attracted any attention.

Regards,

-- Dima

On Thu, Jun 10, 2010 at 10:58 PM, Dmytro Milinevskyy
<milinevskyy@gmail.com>wrote:

> Hi!
>
> This patchset is intended to reorganize target rootfs skeleton.
>
> Regards,
>
> -- Dmytro Milinevskyy
>
> Dmytro Milinevskyy (2):
>  [skeleton] move default skeleton to fs/ and drop busybox skeleton
>  [skeleton] option to define path to custom rootfs skeleton
>
>  Makefile                                           |    6 +
>  configs/at91rm9200df_defconfig                     |    1 -
>  configs/at91rm9200df_ext_defconfig                 |    1 -
>  configs/at91sam9260dfc_defconfig                   |    1 -
>  configs/at91sam9260dfc_ext_defconfig               |    1 -
>  configs/at91sam9260pf_defconfig                    |    1 -
>  configs/at91sam9261ek_defconfig                    |    1 -
>  configs/at91sam9261ek_ext_defconfig                |    1 -
>  configs/at91sam9263ek_defconfig                    |    1 -
>  configs/at91sam9263ek_ext_defconfig                |    1 -
>  configs/at91sam9g20dfc_defconfig                   |    1 -
>  configs/at91sam9g20dfc_ext_defconfig               |    1 -
>  configs/atngw100-base_defconfig                    |    1 -
>  configs/atngw100_defconfig                         |    1 -
>  configs/atstk1005_defconfig                        |    1 -
>  configs/atstk100x_defconfig                        |    1 -
>  configs/i386_defconfig                             |    1 -
>  configs/i686_defconfig                             |    1 -
>  configs/integrator926_defconfig                    |    1 -
>  configs/integrator926_huge_defconfig               |    1 -
>  configs/kb9202_defconfig                           |    1 -
>  configs/v100sc2_defconfig                          |    1 -
>  fs/Config.in                                       |   24 ++
>  .../dev => fs/skeleton/bin}/.empty                 |    0
>  .../target_skeleton => fs/skeleton}/dev/log        |    0
>  .../proc => fs/skeleton/dev/pts}/.empty            |    0
>  .../target_busybox_skeleton => fs/skeleton}/etc/TZ |    0
>  .../skeleton}/etc/fstab                            |    0
>  .../target_skeleton => fs/skeleton}/etc/group      |    0
>  .../skeleton}/etc/hostname                         |    0
>  .../skeleton}/etc/hosts                            |    0
>  .../skeleton}/etc/init.d/S20urandom                |    0
>  .../skeleton}/etc/init.d/S40network                |    0
>  .../skeleton}/etc/init.d/rcS                       |    0
>  .../target_skeleton => fs/skeleton}/etc/inittab    |    0
>  .../skeleton}/etc/inputrc                          |    0
>  .../skeleton}/etc/issue                            |    0
>  .../root => fs/skeleton/etc/ld.so.conf.d}/.empty   |    0
>  .../skeleton}/etc/mtab                             |    0
>  .../skeleton}/etc/network/interfaces               |    0
>  .../skeleton}/etc/passwd                           |    0
>  .../skeleton}/etc/profile                          |    0
>  .../skeleton}/etc/protocols                        |    0
>  .../skeleton}/etc/random-seed                      |  Bin 512 -> 512 bytes
>  .../skeleton}/etc/resolv.conf                      |    0
>  .../skeleton}/etc/securetty                        |    0
>  .../skeleton}/etc/services                         |    0
>  .../skeleton}/etc/shadow                           |    0
>  .../sys => fs/skeleton/home}/.empty                |    0
>  .../tmp => fs/skeleton/lib}/.empty                 |    0
>  .../usr/sbin => fs/skeleton/mnt}/.empty            |    0
>  .../target_skeleton/bin => fs/skeleton/opt}/.empty |    0
>  .../dev/pts => fs/skeleton/proc}/.empty            |    0
>  .../skeleton}/root/.bash_history                   |    0
>  .../skeleton}/root/.bash_logout                    |    0
>  .../skeleton}/root/.bash_profile                   |    0
>  .../target_skeleton => fs/skeleton}/root/.bashrc   |    0
>  .../etc/ld.so.conf.d => fs/skeleton/root}/.empty   |    0
>  .../home => fs/skeleton/sbin}/.empty               |    0
>  .../target_skeleton/lib => fs/skeleton/sys}/.empty |    0
>  .../target_skeleton/mnt => fs/skeleton/tmp}/.empty |    0
>  .../opt => fs/skeleton/usr/bin}/.empty             |    0
>  .../proc => fs/skeleton/usr/lib}/.empty            |    0
>  .../root => fs/skeleton/usr/sbin}/.empty           |    0
>  .../skeleton}/usr/share/udhcpc/default.script      |    0
>  .../skeleton}/var/cache                            |    0
>  .../skeleton}/var/lib/pcmcia                       |    0
>  .../skeleton}/var/lock                             |    0
>  .../skeleton}/var/log                              |    0
>  .../skeleton}/var/pcmcia                           |    0
>  .../skeleton}/var/run                              |    0
>  .../skeleton}/var/spool                            |    0
>  .../skeleton}/var/tmp                              |    0
>  package/busybox/Config.in                          |    6 -
>  package/busybox/busybox.mk                         |    4 -
>  target/generic/Makefile.in                         |    7 -
>  target/generic/target_busybox_skeleton/etc/group   |   16 -
>  target/generic/target_busybox_skeleton/etc/inittab |   51 ----
>  target/generic/target_skeleton/etc/TZ              |    1 -
>  target/generic/target_skeleton/etc/fstab           |    8 -
>  target/generic/target_skeleton/etc/hostname        |    1 -
>  target/generic/target_skeleton/etc/hosts           |    1 -
>  .../generic/target_skeleton/etc/init.d/S20urandom  |   54 ----
>  .../generic/target_skeleton/etc/init.d/S40network  |   25 --
>  target/generic/target_skeleton/etc/init.d/rcS      |   27 --
>  target/generic/target_skeleton/etc/inputrc         |   44 ---
>  target/generic/target_skeleton/etc/issue           |    3 -
>  target/generic/target_skeleton/etc/mtab            |    1 -
>  .../generic/target_skeleton/etc/network/interfaces |    4 -
>  target/generic/target_skeleton/etc/passwd          |   15 -
>  target/generic/target_skeleton/etc/profile         |   48 ---
>  target/generic/target_skeleton/etc/protocols       |   31 --
>  target/generic/target_skeleton/etc/random-seed     |  Bin 512 -> 0 bytes
>  target/generic/target_skeleton/etc/resolv.conf     |    1 -
>  target/generic/target_skeleton/etc/securetty       |   35 ---
>  target/generic/target_skeleton/etc/services        |  302
> --------------------
>  target/generic/target_skeleton/etc/shadow          |   12 -
>  target/generic/target_skeleton/var/cache           |    1 -
>  target/generic/target_skeleton/var/lib/pcmcia      |    1 -
>  target/generic/target_skeleton/var/lock            |    1 -
>  target/generic/target_skeleton/var/log             |    1 -
>  target/generic/target_skeleton/var/pcmcia          |    1 -
>  target/generic/target_skeleton/var/run             |    1 -
>  target/generic/target_skeleton/var/spool           |    1 -
>  target/generic/target_skeleton/var/tmp             |    1 -
>  105 files changed, 30 insertions(+), 726 deletions(-)
>  rename {target/generic/target_busybox_skeleton/dev =>
> fs/skeleton/bin}/.empty (100%)
>  rename {target/generic/target_skeleton => fs/skeleton}/dev/log (100%)
>  rename {target/generic/target_busybox_skeleton/proc =>
> fs/skeleton/dev/pts}/.empty (100%)
>  rename {target/generic/target_busybox_skeleton => fs/skeleton}/etc/TZ
> (100%)
>  rename {target/generic/target_busybox_skeleton => fs/skeleton}/etc/fstab
> (100%)
>  rename {target/generic/target_skeleton => fs/skeleton}/etc/group (100%)
>  rename {target/generic/target_busybox_skeleton =>
> fs/skeleton}/etc/hostname (100%)
>  rename {target/generic/target_busybox_skeleton => fs/skeleton}/etc/hosts
> (100%)
>  rename {target/generic/target_busybox_skeleton =>
> fs/skeleton}/etc/init.d/S20urandom (100%)
>  rename {target/generic/target_busybox_skeleton =>
> fs/skeleton}/etc/init.d/S40network (100%)
>  rename {target/generic/target_busybox_skeleton =>
> fs/skeleton}/etc/init.d/rcS (100%)
>  rename {target/generic/target_skeleton => fs/skeleton}/etc/inittab (100%)
>  rename {target/generic/target_busybox_skeleton => fs/skeleton}/etc/inputrc
> (100%)
>  rename {target/generic/target_busybox_skeleton => fs/skeleton}/etc/issue
> (100%)
>  rename {target/generic/target_busybox_skeleton/root =>
> fs/skeleton/etc/ld.so.conf.d}/.empty (100%)
>  rename {target/generic/target_busybox_skeleton => fs/skeleton}/etc/mtab
> (100%)
>  rename {target/generic/target_busybox_skeleton =>
> fs/skeleton}/etc/network/interfaces (100%)
>  rename {target/generic/target_busybox_skeleton => fs/skeleton}/etc/passwd
> (100%)
>  rename {target/generic/target_busybox_skeleton => fs/skeleton}/etc/profile
> (100%)
>  rename {target/generic/target_busybox_skeleton =>
> fs/skeleton}/etc/protocols (100%)
>  rename {target/generic/target_busybox_skeleton =>
> fs/skeleton}/etc/random-seed (100%)
>  rename {target/generic/target_busybox_skeleton =>
> fs/skeleton}/etc/resolv.conf (100%)
>  rename {target/generic/target_busybox_skeleton =>
> fs/skeleton}/etc/securetty (100%)
>  rename {target/generic/target_busybox_skeleton =>
> fs/skeleton}/etc/services (100%)
>  rename {target/generic/target_busybox_skeleton => fs/skeleton}/etc/shadow
> (100%)
>  rename {target/generic/target_busybox_skeleton/sys =>
> fs/skeleton/home}/.empty (100%)
>  rename {target/generic/target_busybox_skeleton/tmp =>
> fs/skeleton/lib}/.empty (100%)
>  rename {target/generic/target_busybox_skeleton/usr/sbin =>
> fs/skeleton/mnt}/.empty (100%)
>  rename {target/generic/target_skeleton/bin => fs/skeleton/opt}/.empty
> (100%)
>  rename {target/generic/target_skeleton/dev/pts => fs/skeleton/proc}/.empty
> (100%)
>  rename {target/generic/target_skeleton => fs/skeleton}/root/.bash_history
> (100%)
>  rename {target/generic/target_skeleton => fs/skeleton}/root/.bash_logout
> (100%)
>  rename {target/generic/target_skeleton => fs/skeleton}/root/.bash_profile
> (100%)
>  rename {target/generic/target_skeleton => fs/skeleton}/root/.bashrc (100%)
>  rename {target/generic/target_skeleton/etc/ld.so.conf.d =>
> fs/skeleton/root}/.empty (100%)
>  rename {target/generic/target_skeleton/home => fs/skeleton/sbin}/.empty
> (100%)
>  rename {target/generic/target_skeleton/lib => fs/skeleton/sys}/.empty
> (100%)
>  rename {target/generic/target_skeleton/mnt => fs/skeleton/tmp}/.empty
> (100%)
>  rename {target/generic/target_skeleton/opt => fs/skeleton/usr/bin}/.empty
> (100%)
>  rename {target/generic/target_skeleton/proc => fs/skeleton/usr/lib}/.empty
> (100%)
>  rename {target/generic/target_skeleton/root =>
> fs/skeleton/usr/sbin}/.empty (100%)
>  rename {target/generic/target_skeleton =>
> fs/skeleton}/usr/share/udhcpc/default.script (100%)
>  rename {target/generic/target_busybox_skeleton => fs/skeleton}/var/cache
> (100%)
>  rename {target/generic/target_busybox_skeleton =>
> fs/skeleton}/var/lib/pcmcia (100%)
>  rename {target/generic/target_busybox_skeleton => fs/skeleton}/var/lock
> (100%)
>  rename {target/generic/target_busybox_skeleton => fs/skeleton}/var/log
> (100%)
>  rename {target/generic/target_busybox_skeleton => fs/skeleton}/var/pcmcia
> (100%)
>  rename {target/generic/target_busybox_skeleton => fs/skeleton}/var/run
> (100%)
>  rename {target/generic/target_busybox_skeleton => fs/skeleton}/var/spool
> (100%)
>  rename {target/generic/target_busybox_skeleton => fs/skeleton}/var/tmp
> (100%)
>  delete mode 100644 target/generic/target_busybox_skeleton/etc/group
>  delete mode 100644 target/generic/target_busybox_skeleton/etc/inittab
>  delete mode 100644 target/generic/target_skeleton/etc/TZ
>  delete mode 100644 target/generic/target_skeleton/etc/fstab
>  delete mode 100644 target/generic/target_skeleton/etc/hostname
>  delete mode 100644 target/generic/target_skeleton/etc/hosts
>  delete mode 100755 target/generic/target_skeleton/etc/init.d/S20urandom
>  delete mode 100755 target/generic/target_skeleton/etc/init.d/S40network
>  delete mode 100755 target/generic/target_skeleton/etc/init.d/rcS
>  delete mode 100644 target/generic/target_skeleton/etc/inputrc
>  delete mode 100644 target/generic/target_skeleton/etc/issue
>  delete mode 120000 target/generic/target_skeleton/etc/mtab
>  delete mode 100644 target/generic/target_skeleton/etc/network/interfaces
>  delete mode 100644 target/generic/target_skeleton/etc/passwd
>  delete mode 100644 target/generic/target_skeleton/etc/profile
>  delete mode 100644 target/generic/target_skeleton/etc/protocols
>  delete mode 100644 target/generic/target_skeleton/etc/random-seed
>  delete mode 120000 target/generic/target_skeleton/etc/resolv.conf
>  delete mode 100644 target/generic/target_skeleton/etc/securetty
>  delete mode 100644 target/generic/target_skeleton/etc/services
>  delete mode 100644 target/generic/target_skeleton/etc/shadow
>  delete mode 100644 target/generic/target_skeleton/sbin/.empty
>  delete mode 100644 target/generic/target_skeleton/sys/.empty
>  delete mode 100644 target/generic/target_skeleton/tmp/.empty
>  delete mode 100644 target/generic/target_skeleton/usr/bin/.empty
>  delete mode 100644 target/generic/target_skeleton/usr/lib/.empty
>  delete mode 100644 target/generic/target_skeleton/usr/sbin/.empty
>  delete mode 120000 target/generic/target_skeleton/var/cache
>  delete mode 120000 target/generic/target_skeleton/var/lib/pcmcia
>  delete mode 120000 target/generic/target_skeleton/var/lock
>  delete mode 120000 target/generic/target_skeleton/var/log
>  delete mode 120000 target/generic/target_skeleton/var/pcmcia
>  delete mode 120000 target/generic/target_skeleton/var/run
>  delete mode 120000 target/generic/target_skeleton/var/spool
>  delete mode 120000 target/generic/target_skeleton/var/tmp
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100615/8303be78/attachment-0001.html>
