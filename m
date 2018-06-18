From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jun 2018 20:17:16 +0200
Subject: [Buildroot] Buildroot 2018.02.3 released
Message-ID: <87r2l4ufgz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.02.3 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.02.3.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.02.3.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.02.3 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2018.02.2 release.

- Various fixes for building on modern distributions (GCC 8.x, no rpcgen
  utility).

- ARM: Default to binutils 2.28 and warn about newer binutils versions,
  which are known to cause boot failures for Linux kernels built in
  thumb mode.

- Busybox/mdev: Fix module autoloading.

- Busybox/sysvinit: inittab: Add /dev/{stdin,stdout,stderr} symlinks,
  call swapon -a to activate any configured swap devices.

- Dependencies: Check that PATH does not contain current working
  directory, which triggers a number of build failures.

- Infrastructure: Error out for packages erroneously using the 'local'
  site method but not defining a _SITE.

- Linux: Fix cuImage.<dtb> / simpleImage.<dtb> handling.  Ensure kconfig
  uses ncurses from the host to fix a ncurses/ncursesw mixup, causing
  menuconfig display corruption.

- Toolchain: Workarounds for fix-rpath issues with binutils and elf2flt.

- Util-linux: Fix blocking on getrandom() issue with recent kernels.

- Remove broken freescale_imx31_3stack, freescale_imx6sololiteevk and
  freescale_imx6ulevk defconfigs.

- Security fixes for file, git, glibc, gnupg, gnupg2, imagemagick,
  libcurl, libgcrypt, libressl, libvncserver, libvorbis, libxslt,
  mariadb, mbedtls, mpg123, nodejs, perl, procps-ng, redis, wavpack,
  wget, wireshark, xen

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.02.3

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.02.2..

    27  Baruch Siach
    15  Bernd Kuhls
    14  Peter Korsgaard
    14  Yann E. MORIN
    13  Fabio Estevam
    13  Fabrice Fontaine
    10  Carlos Santos
     8  Thomas Petazzoni
     4  Danomi Manchego
     3  Arnout Vandecappelle (Essensium/Mind)
     3  Florian La Roche
     2  J?rg Krause
     2  Martin Bark
     2  Olivier Schonken
     2  Petr Vorel
     1  Alistair Francis
     1  Angelo Compagnucci
     1  Anssi Hannula
     1  Christophe PRIOUZEAU
     1  Francois Perrad
     1  Joseph Kogut
     1  Laurent GONZALEZ
     1  Ricardo Martincoski
     1  Romain Naour
     1  Ryan Coe
     1  Waldemar Brodkorb
     1  Zoltan Gyarmati

-- 
Bye, Peter Korsgaard
