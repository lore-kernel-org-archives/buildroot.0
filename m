From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Oct 2020 23:03:14 +0200
Subject: [Buildroot] Buildroot 2020.05.3 released
Message-ID: <87zh4rqhrh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2020.05.3 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2020.05.3.tar.gz

or

http://buildroot.org/downloads/buildroot-2020.05.3.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2020.05.3 is a bugfix release, fixing a number of important /
security related issues discovered since the 2020.05.2 release.

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

- Security fixes for brotli, cifs-utils, cups, ghostscript, gnutls, go,
  graphite2, imagemagick, ipmitool, libraw, libssh, libxml2, mbedtls,
  memcached, minidlna, mongodb, nodejs, php, python-django, runc,
  samba4, suricata, wireshark, zeromq

- Fixes for download/compilation/runtime/license issues in alsa-utils,
  apparmor, avahi, bandwidthd, barebox, bash, bison, busybox,
  cryptsetup, cups, dhcpcd, dhcpdump, docker-cli, docker-engine,
  ecryptfs-utils, efl, fail2ban, freetype, gcc, gdb, ghostscript,
  gst1-plugins-base, libxml-parser-perl, linux-headers, localedef, lua,
  minidlna, memcached, mesa3d, meson, nginx, nss-pam-ldapd, openvmtools,
  paho-mqtt-c, php, postgresql, python, python-aenum, python-engineio,
  python-fire, python-pymodbus, python-scapy, python-semver,
  python-sentry-sdk, python-socketio, python-texttable, python-tinyrpc,
  python-txtorcon, python3, qt5base, rsh-redone, strace, supertux,
  systemd, uclibc, usb_modeswitch, vlc, wayland-protocols,
  wireguard-linux-compat, wlroots, wolfssl, xserver_xorg-server, zstd

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2020.05.3

Users of the affected packages are strongly encouraged to upgrade.

Notice that the 2020.05.x series is now end of life. Please migrate to
the 2020.08.x series instead which will be supported until December
2020.

Many thanks to all the people contributing to this release:

git shortlog -sn 2020.05.2..

    40  Fabrice Fontaine
    30  Peter Korsgaard
     8  Michael Nosthoff
     7  Thomas Petazzoni
     4  Norbert Lange
     4  Yann E. MORIN
     3  Angelo Compagnucci
     3  Christian Stewart
     3  Heiko Thiery
     3  Robin Jarry
     2  Adrian Perez de Castro
     2  Bernd Kuhls
     2  Francois Perrad
     2  Iulian Onofrei
     2  James Hilliard
     2  Peter Seiderer
     2  Thomas De Schampheleire
     2  Titouan Christophe
     1  Antoine Tenart
     1  Arnout Vandecappelle (Essensium/Mind)
     1  Baruch Siach
     1  Brandon Maier
     1  Charles Hardin
     1  Gary Bisson
     1  John Keeping
     1  Joseph Kogut
     1  Julien Grossholtz
     1  Lukasz Tekieli
     1  Matt Weber
     1  Maxim Kochetkov
     1  Romain Naour
     1  Ryan Barnett

-- 
Bye, Peter Korsgaard
