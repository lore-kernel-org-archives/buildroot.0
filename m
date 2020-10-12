From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Oct 2020 23:56:27 +0200
Subject: [Buildroot] Buildroot 2020.02.7 released
Message-ID: <87v9ffqfas.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2020.02.7 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2020.02.7.tar.gz

or

http://buildroot.org/downloads/buildroot-2020.02.7.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2020.02.7 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2020.02.6 release. The 2020.02.x series is
supported until April 2021.

- meson: Correct SDK cross-compilation.conf file when per-package builds
  were used to build SDK.

- systemd: Use /run rather than /var/run for PID files in units.

- Toolchain: use Secure-PLT rather than BSS-PLT for PowerPC 32.

- support/script/pycompile: Rework logic to ensure .pyc files contain
  absolute target paths, fixing code inspection at runtime when
  executed with cwd != '/'.

- support/scripts/setlocalversion: Correct Mercurial output to match
  behaviour with Git.

- support/scripts/apply-patches.sh: Use patch --no-backup-if-mismatch,
  so we no longer blindly have to remove *.orig files after patching,
  fixing issues with packages containing such files.

- Security fixes for brotli, cifs-utils, ghostscript, gnutls, go,
  ipmitool, libraw, libssh, libxml2, memcached, minidlna, nodejs, php,
  runc, samba4, suricata, wireshark, zeromq

- Fixes for download/compilation/runtime/license issues in bandwidthd,
  barebox, bash, bison, brotli, cryptsetup, dhcpcd, dhcpdump,
  docker-cli, docker-engine, ecryptfs-utils, efl, fail2ban, freetype,
  gcc, gdb, ghostscript, gst-plugins-base, libxml-parser-perl,
  localedef, lua, mesa3d, meson, minidlna, nginx, nss-pam-ldap,
  openvmtools, php, postgresql, python, python-aenum, python-autobahn,
  python-engineio, python-fire, python-pymodbus, python-scapy,
  python-semver, python-sentry-sdk, python-socketio, python-texttable,
  python-tinyrpc, python-txtorcon, python3, qt5base, strace, supertux,
  systemd, vlc, wayland-protocols, wireguard-linux-compat,
  xserver_xorg-server, zstd

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2020.02.7

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2020.02.6..

    29  Fabrice Fontaine
    28  Peter Korsgaard
     8  Michael Nosthoff
     6  Brandon Maier
     5  Thomas Petazzoni
     3  Christian Stewart
     3  Heiko Thiery
     3  Norbert Lange
     3  Robin Jarry
     3  Yann E. MORIN
     2  Bernd Kuhls
     2  Francois Perrad
     2  James Hilliard
     2  Peter Seiderer
     2  Ryan Barnett
     2  Thomas De Schampheleire
     2  Titouan Christophe
     1  Adrian Perez de Castro
     1  Antoine Tenart
     1  Baruch Siach
     1  Gary Bisson
     1  Joseph Kogut
     1  Matt Weber
     1  Maxim Kochetkov
     1  Romain Naour

-- 
Bye, Peter Korsgaard
