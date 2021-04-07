From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Apr 2021 13:32:36 +0200
Subject: [Buildroot] Buildroot 2021.02.1 released
Message-ID: <878s5ucotn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2021.02.1 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2021.02.1.tar.gz

or

http://buildroot.org/downloads/buildroot-2021.02.1.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2021.02.1 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2021.02 release.

- Dependencies: Explicitly detect and bail out if PATH contains spaces
  or tabs. A number of packages fail to build in such setups, so
  explicitly inform about this.

- utils/scanpypi: Explicitly use python3 for compatibility with packages
  using python3 syntax in setup.py

- support/download: Fix tarball generation (from git/svn repos)
  including symlinks pointing to ./<something>. Fix svn download
  for <1.9 clients or repos using CVS-style keywords.

- Meson: Use correct C++ host compiler (rather than C compiler)

- Python{,3}: Fix byte compiling python files with short (single
  character before .py) file names.

- CPE meta data has been added for a large number of packages

- SELinux handling for alsa-utils, bridge-utils, dmidecode, hwloc,
  kexec, kexec-lite, kismet, logrotate and mcelog

- Security fixes for busybox, docker-containerd, git, gnutls, go, grub2,
  gst1-libav, gst1-plugins-bad, gst1-plugins-base, gst1-plugins-good,
  gst1-plugins-ugly, haserl, libcurl, libglib2, libopenssl, libressl,
  libupnp, lldpd, mariadb, mbedtls, mongoose, mosquitto, nodejs,
  openssh, python-django, python-jinja2, python-lxml, python-py,
  python-pygments, python-urllib3, python3, rpm, samba4, sqlcipher,
  squid, tor, upx, webkitgtk, wireshark, wpewebkit, xen, zstd

- Fixes for download/compilation/runtime/license issues in
  at91bootstrap3, batman-adv, binutils, botan, ca-certificates, cog,
  coreutils, docker-cli, docker-engine, efivar, fetchmail, frr,
  genimage, gst-omx, gst1-devtools, gst1-python, gst1-rtsp-server,
  gst1-vaapi, gstreamer1, gstreamer1-editing-services, haproxy,
  irqbalance, jasper, kodi, libfreeglut, libgcrypt, libgeos, libqmi,
  libupnp, libvips, libwebsockets, lttng-libust, lttng-tools, mender,
  micropython, mpd, netsnmp, openvpn, opkg-utils, optee-client,
  optee-test, perl, php, proftpd, protobuf, python-rpi-ws281x,
  qt5webkit, qwt, sconeserver, sdl2, shim, squid, sysklogd, syslinux,
  sysvinit, transmission, tzdata, uboot, uclibc, wpebackend-fdo

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2021.02.1

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2021.02..

    86  Fabrice Fontaine
    25  Peter Seiderer
    13  Peter Korsgaard
    11  Bernd Kuhls
    11  Thomas Petazzoni
     9  Maxime Chevallier
     6  Adrian Perez de Castro
     6  Giulio Benetti
     5  Ryan Barnett
     4  Christian Stewart
     4  Yann E. MORIN
     3  Adam Duskett
     2  Alexander Dahl
     2  Henri Roosen
     2  Joachim Wiberg
     2  J?rg Krause
     2  Michael Nosthoff
     2  Michael Vetter
     2  Norbert Lange
     2  Petr Vorel
     2  Titouan Christophe
     1  Alexander Egorenkov
     1  Baruch Siach
     1  Bert Outtier
     1  Chris Packham
     1  Edgar Bonet
     1  Etienne Carriere
     1  Filip Skoneczny
     1  Francois Perrad
     1  Grzegorz Blach
     1  Heiko Thiery
     1  Ismael Luceno
     1  Jean-pierre Cartal
     1  John Keeping
     1  Nicolas Cavallari
     1  Nicolas Serafini
     1  Nicolas Toromanoff
     1  Pierre-Jean Texier
     1  Stefan S?rensen
     1  Vadym Kochan
     1  Waldemar Brodkorb

-- 
Bye, Peter Korsgaard
