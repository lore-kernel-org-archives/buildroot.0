From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Dec 2019 21:12:08 +0100
Subject: [Buildroot] Buildroot 2019.02.8 released
Message-ID: <87fthvlwtj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2019.02.8 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2019.02.8.tar.gz

or

http://buildroot.org/downloads/buildroot-2019.02.8.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2019.02.8 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2019.02.7 release. The 2019.02.x series is
supported until March 2020.

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
  chrony, collectd, connman, faifa, gob2, ipsec-tools, kodi,
  kvm-unit-tests, libftdi, libftdi1, libstrophe, libsvgtiny, lvm2, lzma,
  mariadb, minicom, neardal, nodejs, opencv3, openvmtools, oracle-mysql,
  perl-gdgraph, perl-gdtextutil, php, postgresql, prosody, rauc, redis,
  rpcbind, socat, spice, tftpd

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2019.02.8

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2019.02.7..

    57  Mark Corbin
    22  Peter Korsgaard
    17  Fabrice Fontaine
    11  Bernd Kuhls
    11  Thomas Petazzoni
     7  Michael Vetter
     4  Adrian Perez de Castro
     4  Pascal de Bruijn
     4  Yann E. MORIN
     1  Angelo Compagnucci
     1  Arnout Vandecappelle (Essensium/Mind)
     1  Bartosz Bilas
     1  Carlos Santos
     1  Giulio Benetti
     1  James Byrne
     1  Matt Weber
     1  Michael Drake
     1  Titouan Christophe

-- 
Bye, Peter Korsgaard
