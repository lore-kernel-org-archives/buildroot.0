From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Nov 2012 19:27:57 +0100
Subject: [Buildroot] [pull request] Pull request for branch remove-target-dir
Message-ID: <cover.1351967245.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes since last posting:

 * Rebase on current master (mostly take into account the arrival of
   aarch64)

 * Add Arnout's Acked-by on the first patch

Thomas

The following changes since commit 51f3425e3d6c69758c071b9327eecaa14b5e053a:

  use avr32linux.org mirror (2012-11-03 18:11:49 +0100)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git remove-target-dir

for you to fetch changes up to 9b972f2db74b874534b3548249241f5bccc1d7cf:

  arch: improve definition of gcc mtune, mcpu, etc. (2012-11-03 19:27:02 +0100)

----------------------------------------------------------------
Thomas Petazzoni (3):
      New top-level directory: system
      Split target/Config.in.arch into multiple Config.in.* in arch/
      arch: improve definition of gcc mtune, mcpu, etc.

 Config.in                                          |    4 +-
 Makefile                                           |    2 +-
 arch/Config.in                                     |  212 +++++
 arch/Config.in.aarch64                             |    5 +
 arch/Config.in.arm                                 |  114 +++
 arch/Config.in.avr32                               |    5 +
 arch/Config.in.bfin                                |   16 +
 arch/Config.in.m68k                                |   21 +
 arch/Config.in.microblaze                          |   10 +
 arch/Config.in.mips                                |   79 ++
 arch/Config.in.powerpc                             |  128 +++
 arch/Config.in.sh                                  |   41 +
 arch/Config.in.sparc                               |   69 ++
 arch/Config.in.x86                                 |  235 ++++++
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
 target/Config.in.arch                              |  830 --------------------
 target/Makefile.in                                 |    3 -
 75 files changed, 939 insertions(+), 837 deletions(-)
 create mode 100644 arch/Config.in
 create mode 100644 arch/Config.in.aarch64
 create mode 100644 arch/Config.in.arm
 create mode 100644 arch/Config.in.avr32
 create mode 100644 arch/Config.in.bfin
 create mode 100644 arch/Config.in.m68k
 create mode 100644 arch/Config.in.microblaze
 create mode 100644 arch/Config.in.mips
 create mode 100644 arch/Config.in.powerpc
 create mode 100644 arch/Config.in.sh
 create mode 100644 arch/Config.in.sparc
 create mode 100644 arch/Config.in.x86
 rename {target/generic => system}/Config.in (99%)
 rename {target/generic => system}/device_table.txt (100%)
 rename {target/generic => system}/device_table_dev.txt (100%)
 rename {fs => system}/skeleton/bin/.empty (100%)
 rename {fs => system}/skeleton/dev/log (100%)
 rename {fs => system}/skeleton/dev/pts/.empty (100%)
 rename {fs => system}/skeleton/etc/fstab (100%)
 rename {fs => system}/skeleton/etc/group (100%)
 rename {fs => system}/skeleton/etc/hostname (100%)
 rename {fs => system}/skeleton/etc/hosts (100%)
 rename {fs => system}/skeleton/etc/init.d/S20urandom (100%)
 rename {fs => system}/skeleton/etc/init.d/S40network (100%)
 rename {fs => system}/skeleton/etc/init.d/rcK (100%)
 rename {fs => system}/skeleton/etc/init.d/rcS (100%)
 rename {fs => system}/skeleton/etc/inittab (100%)
 rename {fs => system}/skeleton/etc/inputrc (100%)
 rename {fs => system}/skeleton/etc/issue (100%)
 rename {fs => system}/skeleton/etc/ld.so.conf.d/.empty (100%)
 rename {fs => system}/skeleton/etc/mtab (100%)
 rename {fs => system}/skeleton/etc/network/if-down.d/.empty (100%)
 rename {fs => system}/skeleton/etc/network/if-post-down.d/.empty (100%)
 rename {fs => system}/skeleton/etc/network/if-pre-up.d/.empty (100%)
 rename {fs => system}/skeleton/etc/network/if-up.d/.empty (100%)
 rename {fs => system}/skeleton/etc/network/interfaces (100%)
 rename {fs => system}/skeleton/etc/passwd (100%)
 rename {fs => system}/skeleton/etc/profile (100%)
 rename {fs => system}/skeleton/etc/protocols (100%)
 rename {fs => system}/skeleton/etc/random-seed (100%)
 rename {fs => system}/skeleton/etc/resolv.conf (100%)
 rename {fs => system}/skeleton/etc/securetty (100%)
 rename {fs => system}/skeleton/etc/services (100%)
 rename {fs => system}/skeleton/etc/shadow (100%)
 rename {fs => system}/skeleton/home/ftp/.empty (100%)
 rename {fs => system}/skeleton/lib/.empty (100%)
 rename {fs => system}/skeleton/media/.empty (100%)
 rename {fs => system}/skeleton/mnt/.empty (100%)
 rename {fs => system}/skeleton/opt/.empty (100%)
 rename {fs => system}/skeleton/proc/.empty (100%)
 rename {fs => system}/skeleton/root/.bash_history (100%)
 rename {fs => system}/skeleton/root/.bash_logout (100%)
 rename {fs => system}/skeleton/root/.bash_profile (100%)
 rename {fs => system}/skeleton/root/.empty (100%)
 rename {fs => system}/skeleton/run (100%)
 rename {fs => system}/skeleton/sbin/.empty (100%)
 rename {fs => system}/skeleton/sys/.empty (100%)
 rename {fs => system}/skeleton/tmp/.empty (100%)
 rename {fs => system}/skeleton/usr/bin/.empty (100%)
 rename {fs => system}/skeleton/usr/lib/.empty (100%)
 rename {fs => system}/skeleton/usr/sbin/.empty (100%)
 rename {fs => system}/skeleton/var/cache (100%)
 rename {fs => system}/skeleton/var/lib/misc (100%)
 rename {fs => system}/skeleton/var/lib/pcmcia (100%)
 rename {fs => system}/skeleton/var/lock (100%)
 rename {fs => system}/skeleton/var/log (100%)
 rename {fs => system}/skeleton/var/pcmcia (100%)
 rename {fs => system}/skeleton/var/run (100%)
 rename {fs => system}/skeleton/var/spool (100%)
 rename {fs => system}/skeleton/var/tmp (100%)
 rename target/generic/Makefile.in => system/system.mk (100%)
 delete mode 100644 target/Config.in.arch
 delete mode 100644 target/Makefile.in

Thanks,
-- 
Thomas Petazzoni
