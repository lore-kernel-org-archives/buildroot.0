From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Dec 2019 16:45:05 +0100
Subject: [Buildroot] Buildroot 2019.08.3 released
Message-ID: <87k178kum6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2019.08.3 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2019.08.3.tar.gz

or

http://buildroot.org/downloads/buildroot-2019.08.3.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2019.08.3 is a bugfix release, fixing a number of important /
security related issues discovered since the 2019.08.2 release.

- Infrastructure: Make HOST_<pkg>_DL_OPTS inherit from
  <pkg>_DL_OPTS by default, just like it is done for a number of
  other package variables

  Add <pkg>_KEEP_PY_FILES to exclude specific python .py files
  from the removal done by BR2_PACKAGE_PYTHON{,3}_PYC_ONLY for
  the (rare) case where the .py files are needed at runtime
  rather than .pyc.

  Fix <pkg>-reconfigure handling for packages using the kconfig
  infrastructure.

- Toolchain: ensure external toolchain kernel headers version check
  correctly stop the build on mismatch

- Security fixes for asterisk, bind, clamav, haproxy, intel-microcode,
  jasper, jpeg-turbo, libnss, oniguruma, python-django, rabbitmq-c,
  spice, tiff, webkitgtk

- Fixes for download/compilation/runtime/license issues in am33x-cm3,
  chrony, cmocka, collectd, connman, dhcp, dropwatch, faifa,
  gettext-tiny, gob2, ipsec-tools, jailhouse, kodi, kvm-unit-tests,
  libftdi, libftdi1, libressl, libstrophe, libsvgtiny, lvm2, lzma,
  mariadb, minicom, mosquitto, ninja, neardal, nodejs, opencv3, openvmtools,
  oracle-mysql, perl-gdgraph, perl-gdtextutil, php, postgresql, prosody,
  python-cchardet, qt5wayland, rauc, redis, rpcbind, socat, spice, tftpd,

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2019.08.3

Users of the affected packages are strongly encouraged to upgrade.

Notice that the 2019.08.x series is now end of life. Please migrate to
either the 2019.11 series instead which will be supported until March
2020.

Many thanks to all the people contributing to this release:

git shortlog -sn 2019.08.2..

    60  Mark Corbin
    22  Peter Korsgaard
    19  Fabrice Fontaine
    12  Thomas Petazzoni
    11  Bernd Kuhls
     7  Michael Vetter
     6  Yann E. MORIN
     4  Adrian Perez de Castro
     4  Pascal de Bruijn
     4  Titouan Christophe
     2  Adam Duskett
     2  Carlos Santos
     1  Angelo Compagnucci
     1  Arnout Vandecappelle (Essensium/Mind)
     1  Avi Shukron
     1  Bartosz Bilas
     1  Giulio Benetti
     1  James Byrne
     1  James Hilliard
     1  Matt Weber
     1  Michael Drake

-- 
Bye, Peter Korsgaard
