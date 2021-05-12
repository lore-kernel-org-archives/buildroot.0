From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 May 2021 11:36:04 +0200
Subject: [Buildroot] Buildroot 2021.02.2 released
Message-ID: <87v97ojnuj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2021.02.2 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2021.02.2.tar.gz

or

http://buildroot.org/downloads/buildroot-2021.02.2.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2021.02.2 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2021.02.1 release.

- support/scripts/cve.py: Use the (significantly) faster yajl2
  ijson backend for older (< 2.5) ijson versions rather than the
  slow python default, speeding up pkg-stats by ~2x.

- CMake infrastructure: Use CMAKE_EXE_LINKER_FLAGS rather than
  CMAKE_CXX_FLAGS to link with libatomic to fix an compatibility issue
  with poppler.

- Infrastructure: Expose CONFIG_DIR to post-build/post-image scripts, so
  they can call the Buildroot Makefile in the correct directory for both
  in-tree / out-of-tree builds.

- CPE meta data has been added for a large number of packages

- Security fixes for bind, cifs-utils, clamav, dnsmasq, exim, ffmpeg,
  go, hostapd, libnpupnp, libupnp, nettle, openvpn, php, python-django,
  python-httplib2, python3, ruby, rust, samba4, tar, wpa_supplicant,
  xserver_xorg-server

- Fixes for download/compilation/runtime/license issues in
  at91bootstrap, bash, bridge-utils, boost, cegui, coremark-pro,
  cryptsetup, dmalloc, docker-cli, docker-engine, domoticz, efl,
  haproxy, i2c-tools, imx-vpu, gcc, genext2fs, gst1-interpipe, kexec,
  kf5-kcoreaddons, kismet, libcamera, libcurl, libdrm, libfreefare,
  libfuse, libgeos, libgpiod, libopenssl, libp11, librsync, libtomcrypt,
  localedef, lvm2, lxc, m4, makedevs, mender, mesa3d, mkpasswd,
  mkpimage, modem-manager, monkey, mpd, network-manager, nginx, numactl,
  openjdk, openjdk-bin, openldap, pipewire, python-aioconsole,
  python-asgiref, python-botocore, python-flup, python-mbstrdecoder,
  quickjs, rsyslog, samba4, sconeserver, snort, sox, sysklogd, systemd,
  timescaledb, tio, tor, usb_modeswitch, xdriver_xf86-video-ati, xen,
  xlib_libXaw,

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2021.02.2

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2021.02.1..

    45  Fabrice Fontaine
    35  Matt Weber
    29  Peter Korsgaard
    19  Bernd Kuhls
     6  Thomas Petazzoni
     5  J?rg Krause
     4  Giulio Benetti
     4  Peter Seiderer
     3  Romain Naour
     2  Mario Fink
     2  Michael Nosthoff
     2  Sergio Prado
     2  S?bastien Szymanski
     1  Adam Duskett
     1  Alexander Dahl
     1  Bartosz Bilas
     1  Christian Stewart
     1  Dick Olsson
     1  Einar Jon Gunnarsson
     1  Federico Pellegrin
     1  Francois Perrad
     1  Gleb Mazovetskiy
     1  James Hilliard
     1  Jared Bents
     1  Joachim Wiberg
     1  John Keeping
     1  Marcin Niestroj
     1  Matthew Weber
     1  Sam Voss
     1  Yann E. MORIN

-- 
Bye, Peter Korsgaard
