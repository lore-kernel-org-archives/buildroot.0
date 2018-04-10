From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Apr 2018 15:26:09 +0200
Subject: [Buildroot] Buildroot 2018.02.1 released
Message-ID: <874lkj8a6m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.02.1 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.02.1.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.02.1.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.02.1 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2018.02 release.

- Infrastructure: Speed up instrumentation for package size by
  comparing timestamps instead of md5 checksums, as doing checksums
  could lead to up to 25% longer build time for big configurations.

- Add a better fix for build issues for autotools based packages
  checking for C++ support on toolchains without C++ support.

- Build host-tar if tar is older than 1.27 on the build machine to work
  around reproducibility issues with git archives containing long paths.

- check-unique-files: Fix for filenames not representable in the users'
  locale.

- Check-bin-arch: Add support for per-package ignore paths
  (<pkg>_BIN_ARCH_EXCLUDE).

- linux: Add _NEEDS_HOST_OPENSSL / LIBELF options to ensure these
  dependencies are available for Linux configurations needing these
  dependencies, similar to how it is done for U-Boot.

- linux: Support custom (not in tree) device tree files in addition to
  in-tree ones.

- Removed unmaintained defconfigs: Creator Ci40, Firefly rk3288,
  Freescale mpc8315erdb / p1010rdb_pa, Riotboard, Teliv EVK Pro3.

- Security fixes for apache, imagemagick, irssi, libcurl, libopenssl,
  libpjsip, libvorbis, memcached, nodejs, ntp, patch, python-webpy,
  samba4, tremor, wireshark, xerces

- Fixes for download/compilation/runtime issues in busybox, c-ares,
  cmake, docker-engine, enlightenment, eudev, fbgrab, freescale-imx,
  gtest, intel-microcode, jimtcl, kmod, kodi, ktap, libcoap, libfcgi,
  libhttpparser, libminiupnpc, libss7, libssh2, libupnp, libupnpp,
  libuv, motion, musl, nodejs, ntp, openblas, opencv3, openocd,
  opus-tools, php, pkgconf, postgresql, powerpc-utils,
  python-jsonschema, python-webpy, qemu, qt5bsae, qt5script, qt5webkit,
  rapidjson, rauc, sam-ba, sngrep, systemd, uboot-tools, uclibc-ng-test,
  upmpdcli, xterm, zstd.

- New packages: docker-proxy, python-functools32

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.02.1

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.02..

    38  Thomas Petazzoni
    19  Fabio Estevam
    19  Peter Korsgaard
    12  Baruch Siach
    10  Yann E. MORIN
     7  Bernd Kuhls
     7  Fabrice Fontaine
     4  Martin Bark
     3  Ga?l PORTAY
     3  Joshua Henderson
     3  Rahul Bedarkar
     3  Stefan Becker
     3  Timo Ketola
     3  Vivien Didelot
     2  Arnout Vandecappelle (Essensium/Mind)
     2  Christian Stewart
     2  Christopher McCrory
     2  Jan Kundr?t
     1  Adam Duskett
     1  Alexander Dahl
     1  Andr? Hentschel
     1  Anssi Hannula
     1  Carlos Santos
     1  Ezequiel Garcia
     1  Giulio Benetti
     1  Joel Stanley
     1  J?rg Krause
     1  Matt Weber
     1  Rafal Susz
     1  Romain Naour
     1  Sasha Shyrokov
     1  Simon van der Veldt
     1  Thomas De Schampheleire
     1  Trent Piepho
     1  Valentin Korenblit
     1  Waldemar Brodkorb

-- 
Bye, Peter Korsgaard
