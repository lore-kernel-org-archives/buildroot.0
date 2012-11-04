From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Nov 2012 12:51:08 +0100
Subject: [Buildroot] [git commit] New top-level directory: system
Message-ID: <20121104115423.F3A8399A14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c3e3ad4197714ea39fcd49d572a1713f803d835
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This directory groups the following elements:
 * the default root filesystem skeleton
 * the default device tables
 * the Config.in options for system configuration (UART port for
   getty, system hostname, etc.)
 * the make rules to apply the system configuration options

Even though the skeleton and device tables could have lived in fs/, it
would have been strange to have the UART, system hostname and other
related options into fs/. A new system/ directory makes more sense.

As a consequence, this patch also removes target/Makefile.in, which
has become useless in the process.

[Peter: fixup TARGET_SKELETON settings / documentation to match]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in                                          |    2 +-
 Makefile                                           |    4 ++--
 docs/manual/customize-rootfs.txt                   |    4 ++--
 {target/generic => system}/Config.in               |    2 +-
 {target/generic => system}/device_table.txt        |    0
 {target/generic => system}/device_table_dev.txt    |    0
 {fs => system}/skeleton/bin/.empty                 |    0
 {fs => system}/skeleton/dev/log                    |    0
 {fs => system}/skeleton/dev/pts/.empty             |    0
 {fs => system}/skeleton/etc/fstab                  |    0
 {fs => system}/skeleton/etc/group                  |    0
 {fs => system}/skeleton/etc/hostname               |    0
 {fs => system}/skeleton/etc/hosts                  |    0
 {fs => system}/skeleton/etc/init.d/S20urandom      |    0
 {fs => system}/skeleton/etc/init.d/S40network      |    0
 {fs => system}/skeleton/etc/init.d/rcK             |    0
 {fs => system}/skeleton/etc/init.d/rcS             |    0
 {fs => system}/skeleton/etc/inittab                |    0
 {fs => system}/skeleton/etc/inputrc                |    0
 {fs => system}/skeleton/etc/issue                  |    0
 {fs => system}/skeleton/etc/ld.so.conf.d/.empty    |    0
 {fs => system}/skeleton/etc/mtab                   |    0
 .../skeleton/etc/network/if-down.d/.empty          |    0
 .../skeleton/etc/network/if-post-down.d/.empty     |    0
 .../skeleton/etc/network/if-pre-up.d/.empty        |    0
 {fs => system}/skeleton/etc/network/if-up.d/.empty |    0
 {fs => system}/skeleton/etc/network/interfaces     |    0
 {fs => system}/skeleton/etc/passwd                 |    0
 {fs => system}/skeleton/etc/profile                |    0
 {fs => system}/skeleton/etc/protocols              |    0
 {fs => system}/skeleton/etc/random-seed            |  Bin 512 -> 512 bytes
 {fs => system}/skeleton/etc/resolv.conf            |    0
 {fs => system}/skeleton/etc/securetty              |    0
 {fs => system}/skeleton/etc/services               |    0
 {fs => system}/skeleton/etc/shadow                 |    0
 {fs => system}/skeleton/home/ftp/.empty            |    0
 {fs => system}/skeleton/lib/.empty                 |    0
 {fs => system}/skeleton/media/.empty               |    0
 {fs => system}/skeleton/mnt/.empty                 |    0
 {fs => system}/skeleton/opt/.empty                 |    0
 {fs => system}/skeleton/proc/.empty                |    0
 {fs => system}/skeleton/root/.bash_history         |    0
 {fs => system}/skeleton/root/.bash_logout          |    0
 {fs => system}/skeleton/root/.bash_profile         |    0
 {fs => system}/skeleton/root/.empty                |    0
 {fs => system}/skeleton/run                        |    0
 {fs => system}/skeleton/sbin/.empty                |    0
 {fs => system}/skeleton/sys/.empty                 |    0
 {fs => system}/skeleton/tmp/.empty                 |    0
 {fs => system}/skeleton/usr/bin/.empty             |    0
 {fs => system}/skeleton/usr/lib/.empty             |    0
 {fs => system}/skeleton/usr/sbin/.empty            |    0
 {fs => system}/skeleton/var/cache                  |    0
 {fs => system}/skeleton/var/lib/misc               |    0
 {fs => system}/skeleton/var/lib/pcmcia             |    0
 {fs => system}/skeleton/var/lock                   |    0
 {fs => system}/skeleton/var/log                    |    0
 {fs => system}/skeleton/var/pcmcia                 |    0
 {fs => system}/skeleton/var/run                    |    0
 {fs => system}/skeleton/var/spool                  |    0
 {fs => system}/skeleton/var/tmp                    |    0
 target/generic/Makefile.in => system/system.mk     |    0
 target/Makefile.in                                 |    3 ---
 63 files changed, 6 insertions(+), 9 deletions(-)

Patch is too large, so refusing to show it
