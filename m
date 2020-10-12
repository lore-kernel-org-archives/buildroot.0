From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Oct 2020 15:57:24 +0200
Subject: [Buildroot] Buildroot 2020.08.1 released
Message-ID: <874kmzsg1n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2020.08.1 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2020.08.1.tar.gz

or

http://buildroot.org/downloads/buildroot-2020.08.1.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2020.08.1 is a bugfix release, fixing a number of important /
security related issues discovered since the 2020.08 release.

- Fixes for various compilation issues with GCC 10.x.

- meson: Correct SDK cross-compilation.conf file when per-package builds
  were used to build SDK.

- systemd: Use /run rather than /var/run for PID files in units.

- Toolchain: use Secure-PLT rather than BSS-PLT for PowerPC 32.

- Fakeroot scripts (BR2_ROOTFS_POST_FAKEROOT_SCRIPT) are now run
  after all finalization hooks (including pre-rootfs) to ensure
  they can override any late configuration done by packages.

- support/script/pycompile: Rework logic to ensure .pyc files contain
  absolute target paths, fixing code inspection at runtime when
  executed with cwd != '/'.

- support/scripts/setlocalversion: Correct Mercurial output to match
  behaviour with Git.

- support/scripts/apply-patches.sh: Use patch --no-backup-if-mismatch,
  so we no longer blindly have to remove *.orig files after patching,
  fixing issues with packages containing such files.

- fs/jffs2: Now correctly handle xattrs

- Security fixes for brotli, cifs-utils, ghostscript, gnupg2, gnutls,
  go, ipmitool, libraw, libssh, libxml2, live555, memcached, mongodb,
  nodejs, php, redis, runc, samba4, suricata, wireshark, zeromq

- Fixes for download/compilation/runtime/license issues in acpica,
  afboot-stm32, alsa-utils, apparmor, bandwidthd, barebox, bash, bison,
  cups, dhcpcd, dhcpdump, docker-cli, docker-engine, ecryptfs-utils,
  efl, fail2ban, fbterm, ffmpeg, fontconfig, freetype, gcc, gdb,
  ghostscript, gst1-plugins-base, gst1-plugins-ugly, gqview, kexec,
  lcdproc, libxml-parser-perl, libzip, linux-headers, live555,
  localedef, ltp-testsuite, lua, matchbox, memcached, memtester, mesa3d,
  meson, minidlna, mongrel2, motion, mraa, mtd, musepack, neardal,
  netatalk, netperf, netsniff-ng, nginx, nss-pam-ldapd, open-plc-utils,
  openswan, opentyrian, openvmtools, php, postgresql, python,
  python-aenum, python-engineio, python-fire, python-pymodbus,
  python-scapy, python-semver, python-sentry-sdk, python-socketio,
  python-texttable, python-tinyrpc, python-txtorcon, python3, qt5base,
  quagga, read-edid, rsh-redone, socketcand, strace, supertux, systemd,
  ti-utils, trinity, uclibc, usb_modeswitch, vlc, wampcc,
  wayland-protocols, wireguard-linux-compat, wlroots, wolfssl, w_scan,
  xerces, xfsprogs, xdriver-xf86-video-ati, xserver_xorg-server, ympd,
  zlib-ng, zstd

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2020.08.1

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2020.08..

    70  Fabrice Fontaine
    25  Peter Korsgaard
     9  Michael Nosthoff
     9  Thomas Petazzoni
     5  Bernd Kuhls
     4  Heiko Thiery
     4  Norbert Lange
     4  Titouan Christophe
     3  Antoine Tenart
     3  Christian Stewart
     3  Peter Seiderer
     3  Robin Jarry
     3  Romain Naour
     2  Adrian Perez de Castro
     2  Angelo Compagnucci
     2  Francois Perrad
     2  James Hilliard
     2  Petr Vorel
     2  Thomas De Schampheleire
     2  Yann E. MORIN
     1  Andy Shevchenko
     1  Arnout Vandecappelle (Essensium/Mind)
     1  Baruch Siach
     1  Brandon Maier
     1  Charles Hardin
     1  Gary Bisson
     1  John Keeping
     1  Joseph Kogut
     1  Kieran Bingham
     1  Matt Weber
     1  Maxim Kochetkov
     1  Paul Cercueil
     1  Ryan Barnett

-- 
Bye, Peter Korsgaard
