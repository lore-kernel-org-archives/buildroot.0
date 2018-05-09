From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 May 2018 23:13:18 +0200
Subject: [Buildroot] Buildroot 2018.05-rc1 released
Message-ID: <20180509231318.5e7879ee@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2018.05-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2018.05-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2018.05-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

After a slightly small 2018.02 release (990 commits for 2018.02-rc1),
we're back to a more normal activity level with 1266 commits for
2018.05-rc1. This time 110 developers contributed, which is also in
line with our usual number of contributors.

Of noteworthy new features/changes we have:

  Toolchain: glibc bumped to 2.27, musl bumped to 1.1.19,
  uClibc-ng 1.0.30, Linux kernel headers bumped to 4.16.x.

  Architecture: support for the Blackfin architecture has been
  removed, as it was removed from Linux upstream, poorly
  maintained in binutils/gdb, and abandoned by Analog Devices.

  Numerous packages updated to have hashes for their license
  files.

  Systemd can now be built with uClibc toolchains.

  Linux: addition of BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF and
  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL to support building Linux
  kernel configurations that need libelf on the host or openssl
  on the host.

  Coding style:
  - all Python scripts are now verified with flake8
  - check-package extended to check all Config.in and .mk files
    in tree, not only the ones in package/

  Infrastructure:

  - The download infrastructure has seen a major overhaul, with
    the main visible new feature being Git caching: a package
    fetched from Git no longer needs to be re-cloned entirely
    everytime its version is changed. Anoter visible change is
    that the download folder now has subfolders per package. See
    http://lists.busybox.net/pipermail/buildroot/2018-April/217923.html
    for more details about those changes.

  - The logic that generates the root filesystem images has been
    reworked, with the main goal of allowing several filesystem
    images to be produced in parallel, also a requirement for
    top-level parallel build. Now, a .tar filesystem image is
    always created, and re-extracted in a private directory to
    create each format-specific filesystem image.

  - A new package infrastructure was introduced for Go-based
    packages: golang-package.

  - Dependencies on extraction tools are now handled as proper
    per-package dependencies, using
    <pkg>_EXTRACT_DEPENDENCIES. Beyond a cleanup, this is also a
    preparation step for top-level parallel build support.

  - When a file being downloaded is part of a package with a
    .hash file, but there is no hash listed for this file, the
    file is now preserved in the download directory rather than
    removed. This helps when updating a package, as it gives the
    ability to easily calculate the hash of the file.

  - Addition of '<pkg>-show-recursive-depends' and
    '<pkg>-show-recursive-rdepends' make targets, to
    respectively display the recursive list of dependencies and
    the recursive list of reverse dependencies of a given
    package.

  - The /etc/shells file is now automatically generated with the
    list of shell programs installed on the system.

  - Addition of -Ofast optimization level as an available
    option.

  Major updates: Go updated to 1.10, Erlang bumped to 20.3, Qt5
  bumped to 5.10.1.

  New packages: 18xx-ti-utils, abootimg, bluez-alsa, brotli,
  chipmunk, clang, docker-compose, docker-proxy, flare-engine,
  flare-game, gst1-interpipe, gstreamer1-editing-services,
  hackrf, i2pd, imx-alsa-plugins, imx-mkimage, libcdio-paranoia,
  libkrb5, llvm, pixiewps, python-backports-ssl-match-hostname,
  python-cached-property, python-cython, python-docker,
  python-dockerpty, python-docker-pycreds,
  python-flask-sqlalchemy, python-functools32, python-influxdb,
  python-json-models, python-libusb1, python-networkx,
  python-psycopg2, python-pymodbus, python-sqlalchemy,
  python-subprocess32, python-texttable,
  python-websocket-client, python-yieldfrom, quotatool, reaver,
  snort, sunxi-mali-mainline, sunxi-mali-mainline-driver, tk,
  tpm2-abrmd, tpm2-tools, tpm2-tss, udftools, vte, woff2.

  New defconfigs: ARC HS Development Kit, Arcturus ucls1012a,
  Freescale i.MX6UL EVK (with vendor kernel), Freescale i.MX6
  SoloLite EVK (with vendor kernel), Freescale i.MX31 3Stack,
  Freescale i.MX8Q EVK Freescale p1025twr, Freescale t1040d4rdb,
  Qemu PPC64 E5500, SolidRun ClearFog Base, Tinker RK3288, Vyasa
  RK3288,

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2018.05-rc1

Many thanks to the people contributing to this release:

git shortlog -s -n 2018.02..

   193  Fabrice Fontaine
   139  Thomas Petazzoni
   119  Bernd Kuhls
   102  Baruch Siach
    77  Peter Korsgaard
    59  Yann E. MORIN
    58  Carlos Santos
    49  Ricardo Martincoski
    48  Fabio Estevam
    40  Romain Naour
    24  J?rg Krause
    21  Adam Duskett
    18  Maxime Hadjinlian
    15  Peter Seiderer
    13  Asaf Kahlon
    12  Valentin Korenblit
    11  Eric Le Bihan
    11  Ga?l PORTAY
    11  Joshua Henderson
    11  Martin Bark
    10  Erik Larsson
    10  Yegor Yefremov
     9  Waldemar Brodkorb
     8  Andr? Hentschel
     8  Francois Perrad
     8  Stefan Becker
     7  Adrian Perez de Castro
     7  Rahul Bedarkar
     6  Angelo Compagnucci
     6  Arnout Vandecappelle (Essensium/Mind)
     6  Matt Weber
     6  Ryan Coe
     5  Giulio Benetti
     4  Anssi Hannula
     4  Guillaume W. Bres
     4  Jan Kundr?t
     4  John Keeping
     4  Marcin Niestroj
     4  Vincent Stehl?
     3  Alex Baldwin
     3  Alexander Mukhin
     3  Chris Lesiak
     3  Christian Stewart
     3  Christopher McCrory
     3  Danomi Manchego
     3  Evgeniy Didin
     3  Jared Bents
     3  Joseph Kogut
     3  Marcus Folkesson
     3  Sven Haardiek
     3  Timo Ketola
     3  Vivien Didelot
     2  Alex Suykov
     2  Alexey Brodkin
     2  Bartosz Golaszewski
     2  Chris Brandt
     2  Eugene Tarassov
     2  George Redivo
     2  Jagan Teki
     2  James Byrne
     2  James Knight
     2  Jerzy Grzegorek
     2  Julien BOIBESSOT
     2  Lothar Felten
     2  Luca Ceresoli
     2  Martin Kepplinger
     2  Olivier Schonken
     2  Rafal Susz
     2  Sergey Matyukevich
     2  Stefan S?rensen
     1  Alexander Dahl
     1  Alistair Francis
     1  Andre Renaud
     1  Antoine Tenart
     1  Bartosz Bilas
     1  Blomme, Maarten
     1  Calin Crisan
     1  Cam Hutchison
     1  Ciro Santilli
     1  Dagg Stompler
     1  David Barbion
     1  Ezequiel Garcia
     1  Falco Hyfing
     1  Florian La Roche
     1  Gwenhael Goavec-Merou
     1  Jaap Crezee
     1  Jason A. Donenfeld
     1  Jason Pruitt
     1  Jeremy Rosen
     1  Jim Brennan
     1  Joel Stanley
     1  Jonas Zaddach
     1  Julien Corjon
     1  Lionel Flandrin
     1  Manfred Schlaegl
     1  Micha? Kalbarczyk
     1  Nicolas Cavallari
     1  Oleksandr Zhadan
     1  Prasanthi Chellakumar
     1  Romain Reignier
     1  Sasha Shyrokov
     1  Scott Fan
     1  Sergio Prado
     1  Simon van der Veldt
     1  Stefan Fr?berg
     1  Steve Kenton
     1  Tarek El-Sherbiny
     1  Thomas De Schampheleire
     1  Trent Piepho
     1  Yves Deweerdt

And a special thanks to our patch reviewers:

git log 2018.02.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     76 "Yann E. MORIN" <yann.morin.1998@free.fr>
     27 Yegor Yefremov <yegorslists@googlemail.com>
     13 Ricardo Martincoski <ricardo.martincoski@gmail.com>
      4 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
      4 Sam Voss <sam.voss@rockwellcollins.com>
      4 Luca Ceresoli <luca@lucaceresoli.net>
      3 Samuel Martin <s.martin49@gmail.com>
      3 Romain Naour <romain.naour@gmail.com>
      3 Petr Vorel <petr.vorel@gmail.com>
      3 Olivier Schonken <olivier.schonken@gmail.com>
      3 Matt Weber <matthew.weber@rockwellcollins.com>
      2 Valentin Korenblit <valentin.korenblit@smile.fr>
      2 Romain Naour <romain.naour@smile.fr>
      2 Gary Bisson <gary.bisson@boundarydevices.com>
      2 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      2 Adrian Perez de Castro <aperez@igalia.com>
      1 "Yann E. MORIN" <yann.morin.1998@free.fr>o
      1 Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
      1 Rahul Bedarkar <rahulbedarkar89@gmail.com>
      1 Peter Seiderer <ps.report@gmx.net>
      1 Peter Korsgaard <peter@korsgaard.com>
      1 Maxime Ripard <maxime.ripard@free-electrons.com>
      1 Martin Hicks <mort@bork.org>
      1 J?rg Krause <joerg.krause@embedded.rocks>
      1 Jan Kundr?t <jan.kundrat@cesnet.cz>
      1 Fabio Estevam <festevam@gmail.com>
      1 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
      1 Carlos Santos <casantos@datacom.ind.br>
      1 Bernd Kuhls <bernd.kuhls@t-online.de>
      1 Baruch Siach <baruch@tkos.co.il>

Like usual, I will now create a next branch and start merging in new
features, rather than wait until 2018.05 is released.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
