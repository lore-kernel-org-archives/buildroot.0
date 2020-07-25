From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Jul 2020 10:39:24 +0200
Subject: [Buildroot] Buildroot 2020.05.1 released
Message-ID: <87imecyon7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2020.05.1 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2020.05.1.tar.gz

or

http://buildroot.org/downloads/buildroot-2020.05.1.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2020.05.1 is a bugfix release, fixing a number of important /
security related issues discovered since the 2020.05 release.

- Toolchain:
  - Make external toolchain version check also work for toolchains
    configured with --with-gcc-major-version-only
  - Do not handle SOURCE_DATE_EPOCH in toolchain wrapper if the compiler
    supports it, fixing an issue with precompiled headers
  - Ensure debug libs from external toolchains are not installed into
    target if debugging is disabled

- Download:
  - Correct reproducibility issue in handling of git submodules for
    older git versions.
  - Fix file locking over NFS

- Per-package:
  - Fix an issue with python3 sysconfig data not getting correctly
    expanded
  - Fix per-package building for packages using the qmake infrastructure

- Br2-external: Fix error reporting for invalid br2-external trees

- Security fixes for asterisk, bind, clamav, dbus, docker-cli,
  docker-engine, freerdp, gnutls, go, gupnp, intel-microcode, libcurl,
  libmicrohttpd, libvncserver, mbedtls, mongodb, mutt, nghttp2, ngircd,
  nodejs, ntp, php, putty, python-urllib3, python3, sqlite, squid,
  tcpreplay, tinydtls, upx, vlc, webkitgtk, wireshark, wpewebkit, znc

- Fixes for download/compilation/runtime/license issues in brltty,
  cdrkit, cryptodev-linux, dbus, e2fsprogs, exim, exiv2, gdb,
  gdk-pixbuf, gerbera, go, granite, grub2, gst1-plugins-good,
  gst1-plugins-ugly, iproute2, irrlicht, iwd, jq, libcamera, libcec,
  libconfuse, libevdev, libhttpserver, libnss, libopenssl, libressl,
  libxmlrpc, lxc, mesa3d, meson, minizip, mtools, nano, network-manager,
  nodejs, open-plc-utils, openjdk-bin, openssh, oracle-mysql,
  paho-mqtt-c, pango, php, prosody, python-greenlet, python-validators,
  redis, rpi-firmware, samba4, sdl2, squid, strace,
  sunxi-mali-mainline-driver, syslog-ng, systemd,
  wireguard-linux-compat, wpebackend-fdo, x11vnc, zstd

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2020.05.1

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2020.05..

    44  Fabrice Fontaine
    16  Bernd Kuhls
     7  Adam Duskett
     7  Peter Korsgaard
     6  Norbert Lange
     5  Baruch Siach
     5  Christian Stewart
     5  Romain Naour
     4  Danomi Manchego
     4  James Hilliard
     4  Peter Seiderer
     4  Yann E. MORIN
     3  Adrian Perez de Castro
     3  Nicolas Robin
     3  Stefan S?rensen
     2  Alejandro Gonz?lez
     2  Martin Bark
     2  Matt Weber
     2  Sergio Prado
     2  Yegor Yefremov
     1  Aaron Sierra
     1  Andreas Naumann
     1  Antoine Tenart
     1  Asaf Kahlon
     1  Bartosz Bilas
     1  Felix Vollmer
     1  Frank Hunleth
     1  Giulio Benetti
     1  Gregory CLEMENT
     1  Heiko Thiery
     1  John Keeping
     1  Joris Offouga
     1  Joseph Kogut
     1  Julien Olivain
     1  Lyle Franklin
     1  Maxim Cournoyer
     1  Myl?ne Josserand
     1  Nicolas Dufresne
     1  Pierre-Jean Texier
     1  Sam Voss
     1  St?phane Veyret
     1  Thomas De Schampheleire
     1  Thomas Petazzoni
     1  Titouan Christophe
     1  Urja Rannikko
     1  Yi Zheng
     1  Yurii Monakov

-- 
Bye, Peter Korsgaard
