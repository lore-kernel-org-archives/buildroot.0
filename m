From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Nov 2020 23:40:54 +0100
Subject: [Buildroot] Buildroot 2020.11-rc1 released
Message-ID: <87zh3w21ah.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2020.11-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2020.11-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2020.11-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

Once more a fairly busy development cycle with more than 1100 changes and
contributions from 111 unique contributors!

Of noteworthy new features/changes we have:

- Architectures: Support for IBM s390x

- Toolchain: use Secure-PLT rather than BSS-PLT for PowerPC 32. Binutils
  2.35.1 added, now defaulting to 2.34. ARC 2020.09-release
  toolchain. GCC 7.x dropped. RISC-V support for uclibc-ng. Support for
  Bootlin external toolchains.

- SELinux support improvements: File security contexts are now set when
  the file systems are created, so there is no need to run restorecon on
  first boot / read only rootfs is supported.  An optimized / stripped
  refpolicy SELinux policy is now used. Packages can enable additional
  refpolicy modules using <pkg>_SELINUX_MODULES.

- support/scripts/cve-checker: Utility script to check for known CVEs in
  just the packages enabled in a Buildroot configuration rather than all
  packages, by passing the output of 'make show-info' to it.

- Go: Modules handling. The module name must be specified using
  <pkg>_GOMOD.

- BR2_EXTERNAL: Support for defining skeleton and init system packages
  in external trees.

- New defconfigs: Acer chromebook elm, Friendlyarm nanopc-t4 and
  nanopi-m4, Hardkernel odroid-c2, Kontron SMARC-sAL28, NXP imx8mqevk,
  Orangepi RK3399 and zero+, PCengines APU2, Pine64 rockpro64, QEMU
  s390x, Raxda rockpi-n8,

- New packages: altera-stapl, asn1c, babeltrace2, cukinia, easyframes,
  environment-setup, frr, graphicsmagick, htpdate, ipcalc, libbacktrace,
  libblockdev, libbytesize, librelp, libuev, makedumpfile, meson-tools,
  mg, mrp, multipath-tools, netcalc, odroidc2-firmware, php-xdebug,
  python-aiofiles, python-ansicolors, python-boto3, python-botocore,
  python-bsdiff4, python-crayons, python-iniconfig, python-intelhex,
  python-ipdb, python-jmespath, python-m2crypto, python-opcua-asyncio,
  python-packaging, python-piexif, python-pluggy, python-pytest,
  python-s3transfer, python-xmodem, qprint, qt5lottie, qt5remoteobjects,
  re2, redir, s390-tools, sentry-cli, sentry-native, timescaledb,
  tinyhttpd, uhd, uredir, watchdog, wayland-utils, weston-imx

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.11-rc1


Many thanks to the people contributing to this release:

git shortlog -s -n 2020.08..

   287	Fabrice Fontaine
    85	Francois Perrad
    60	Bernd Kuhls
    59	Thomas Petazzoni
    54	Peter Seiderer
    47	Peter Korsgaard
    33	Michael Nosthoff
    26	Yann E. MORIN
    25	Antoine Tenart
    24	Alexander Egorenkov
    23	Adam Duskett
    22	Christian Stewart
    21	James Hilliard
    19	Heiko Thiery
    18	Marcin Niestroj
    16	Adrian Perez de Castro
    15	Romain Naour
    11	Asaf Kahlon
    11	Jugurtha BELKALEM
    11	Petr Vorel
    10	Angelo Compagnucci
    10	Baruch Siach
     9	Grzegorz Blach
     9	Norbert Lange
     8	Waldemar Brodkorb
     7	Arnout Vandecappelle (Essensium/Mind)
     7	Dagg Stompler
     7	Gwenhael Goavec-Merou
     7	Matt Weber
     7	Sergio Prado
     6	Brandon Maier
     6	Etienne Carriere
     6	Fabio Estevam
     6	Giulio Benetti
     6	Joseph Kogut
     6	Maxim Kochetkov
     6	Pierre-Jean Texier
     5	Alejandro Gonz?lez
     5	Bartosz Bilas
     5	Gary Bisson
     5	Gregory CLEMENT
     5	Jianhui Zhao
     5	Suniel Mahesh
     5	Titouan Christophe
     4	Carlos Santos
     4	David GOUARIN
     4	Horatiu Vultur
     4	J?rg Krause
     4	Michael Vetter
     4	Michael Walle
     4	Paul Cercueil
     4	Rapha?l M?lotte
     4	Robin Jarry
     4	Ryan Barnett
     4	Sergey Matyukevich
     3	Alistair Francis
     3	Bilal Wasim
     3	Chris Packham
     3	Florian La Roche
     3	Ignacy Gaw?dzki
     3	Michael Fischer
     3	Shlomi Vaknin
     3	Tian Yuanhao
     2	Doug Kehn
     2	Joachim Wiberg
     2	Kieran Bingham
     2	Lubomir Rintel
     2	Nicolas Cavallari
     2	Sven Oliver Moll
     2	Thomas Claveirole
     2	Thomas De Schampheleire
     2	Vadim Kochan
     2	Zoltan Gyarmati
     1	Aleksander Morgado
     1	Alexey Brodkin
     1	Andr? Hentschel
     1	Andy Shevchenko
     1	Augustin Thiercelin
     1	Avi Shukron
     1	Charles Hardin
     1	Conrad Ratschan
     1	Damien Le Moal
     1	Danilo Bargen
     1	Derrick Lyndon Pallas
     1	Evgeniy Didin
     1	Frank Hunleth
     1	Gustavo Heinz
     1	Jochen Baltes
     1	Joel Stanley
     1	John Keeping
     1	Julien Floret
     1	Julien Viard de Galbert
     1	Koen Martens
     1	Luca Ceresoli
     1	Marcus Folkesson
     1	Mauro Meneghin
     1	Michael Durrant
     1	Miken Valabdas
     1	Nicolas Carrier
     1	Philippe Proulx
     1	Rafa? Mi?ecki
     1	Robert Hancock
     1	Ryan Coe
     1	Shyam Saini
     1	Simon Rowe
     1	Stefan Ott
     1	Sven Fischer
     1	Tibault Damman
     1	Vadym Kochan
     1	Vineet Gupta
     1	Yair Ben-Avraham

And a special thanks to our patch reviewers:

git log 2020.08.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     11 Romain Naour <romain.naour@gmail.com>
     10 Peter Seiderer <ps.report@gmx.net>
      8 Jagan Teki <jagan@amarulasolutions.com>
      6 Titouan Christophe <titouan.christophe@railnova.eu>
      4 Yegor Yefremov <yegorslists@googlemail.com>
      3 Michael Nosthoff <buildroot@heine.tech>
      3 Heiko Thiery <heiko.thiery@gmail.com>
      3 Asaf Kahlon <asafka7@gmail.com>
      2 Petr Vorel <petr.vorel@gmail.com>
      2 Matthew Weber <matthew.weber@rockwellcollins.com>
      2 Bernd Kuhls <bernd.kuhls@t-online.de>
      2 Adam Duskett <aduskett@gmail.com>
      1 Yann E. MORIN <yann.morin.1998@free.fr>
      1 Romain Naour <romain.naour@smile.fr>
      1 Michael Nosthoff<buildroot@heine.tech>
      1 Marcin Niestroj <m.niestroj@grinn-global.com>
      1 Joel Carlson <JoelsonCarl@gmail.com>
      1 Joachim Wiberg <troglobit@gmail.com>
      1 Horatiu Vultur <horatiu.vultur@microchip.com>
      1 Herve Codina <Herve.CODINA@celad.com>
      1 Gary Bisson <gary.bisson@boundarydevices.com>
      1 Fabio Estevam <festevam@gmail.com>
      1 Erico Nunes <nunes.erico@gmail.com>
      1 Alistair Francis <alistair.francis@wdc.com>
      1 Alexander Dahl <post@lespocky.de>
      1 Adrian Perez de Castro <aperez@igalia.com>

I will now create a next branch and start merging new features for
2021.02 already in parallel with the 2020.11 stabilization.

-- 
Bye, Peter Korsgaard
