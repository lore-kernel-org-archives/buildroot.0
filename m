From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Jun 2020 23:30:40 +0200
Subject: [Buildroot] Buildroot 2020.05 released
Message-ID: <87367efp8f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2020.05 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2020.05.tar.gz

or

http://buildroot.net/downloads/buildroot-2020.05.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

This was another big development cycle with more than 1400 changes all
over the tree and 125 unique contributors! I'm once again very happy to
see so many "new" people next to the "oldtimers".

Of noteworthy new features/changes we have:

 - Addition of support for gobject-introspection: both the
   gobject-introspection package itself, but also introspection
   support was enabled in a number of other packages.

 - Support for Qt 5.6 was dropped as its support was dropped
   upstream, only one version of Qt is supported at the moment:
   Qt 5.14.2.

 - Addition of support for the apparmor Linux security module, by
   adding the necessary user-space packages.

 - Addition of a qmake package infrastructure, now used by most
   Qt-related packages.

 - The Luarocks package infrastructure has been extended to
   support build host packages.

 - The package infrastructure was improved to allow each package
   to indicate the Linux kernel configuration options it needs.

 - Addition of support for generating filesystem images using the
   EROFS filesystem.

 - The logic that calculates the list of files installed by each
   package was reworked to be compatible with the top-level
   parallel build functionality.

 - Addition of a package for a pre-compiled ARM32 bare-metal
   toolchain, which can be used to build ARM32 code in ARM64
   configurations, such as firmware/bootloader code.

 - The Qemu defconfigs are now boot-tested in Qemu as part of the
   Gitlab continuous integration.

 - Toolchain: gcc 9.x bumped to 9.3.0, gcc 8.x bumped to 8.4.0,
   gdb bumped to 8.3.1.

 - New packages: apcupsd, apparmor, arm-gnu-a-toolchain, bearssl,
   belle-sip, belr, cage, chartjs, erofs-utils, exfatprogs,
   gobject-introspection, ibm-sw-tpm2, imx-seco, jbig2dec, libapparmor,
   libiberty, libfuse3, libtextstyle, libudfread, libuhttpd, libuwsc,
   lua-lyaml, matio, mbuffer, netdata, openfpgaloader, perl-i18n,
   perl-locale-maketext-lexicon, perl-lwp-protocol-https,
   perl-mojolicious-plugin-authorization,
   perl-mojolicious-plugin-cspheader, perl-mojolicious-plugin-i18n,
   perl-mojolicious-plugin-securityheader, perl-mozilla-ca,
   perl-path-class, pistache, pkcs11-helper, prelink-cross,
   python-argon2-cffi, python-canopen, python-cbor2, python-filelock,
   python-flatbuffers, python-greenlet, python-modbus-tk, python-pyalsa,
   python-pysftp, python-regex, python-snappy, python3-pyelftools, rtty,
   tinyproxy, udev-gentoo-scripts, unbound, vuejs, wlroots.

 - Removed packages: ezxml, mtdev2tuio, python-pycrypto, wiringpi

 - New defconfigs: freescale_imx6ullevk, freescale_imx8qmmek,
   nanopi_neo4, nanopi_r1, nitrogen8mm, nitrogen8mn, olpc_xo1,
   olpc_xo175, roc_rk3399_pc, stm32mp157a_dk1, zynq_qmtech

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.05

Many thanks to the people contributing to this release:

git shortlog -s -n 2020.02..

   235	Fabrice Fontaine
   141	Bernd Kuhls
   134	James Hilliard
    90	Adam Duskett
    76	Thomas Petazzoni
    71	Peter Korsgaard
    62	Romain Naour
    58	Yann E. MORIN
    51	Peter Seiderer
    36	Francois Perrad
    27	Heiko Thiery
    22	Carlos Santos
    18	Bartosz Bilas
    16	Asaf Kahlon
    16	Gary Bisson
    16	Matt Weber
    15	Ryan Barnett
    14	Andreas Naumann
    14	Fabio Estevam
    13	J?rg Krause
    12	Angelo Compagnucci
    12	Baruch Siach
    12	Thomas De Schampheleire
    11	Pierre-Jean Texier
    10	Julien Olivain
    10	Titouan Christophe
    10	Yegor Yefremov
     9	Jianhui Zhao
     8	Marcin Niestroj
     7	Gilles Talis
     7	Giulio Benetti
     7	Joeri Barbarien
     7	Maeva Manuel
     7	Ryan Coe
     6	Grzegorz Blach
     6	Lubomir Rintel
     6	Petr Vorel
     5	Adrian Perez de Castro
     5	Andr? Hentschel
     5	Cl?ment P?ron
     5	Frank Vanbever
     5	Gwenhael Goavec-Merou
     5	Nicola Di Lieto
     5	Pascal de Bruijn
     4	Alexander Dahl
     4	Christian Stewart
     4	Gao Xiang
     4	Stephan Hoffmann
     3	Alexander Mukhin
     3	Alexey Lukyanchuk
     3	Antoine Tenart
     3	Charlie Turner
     3	Chris Packham
     3	Jared Bents
     3	John Keeping
     3	Joseph Kogut
     3	Louis Aussedat
     3	Louis-Paul CORDIER
     3	Max Filippov
     3	Michael Fischer
     3	Sergio Prado
     3	Stefan S?rensen
     3	Suniel Mahesh
     3	S?bastien Szymanski
     3	Timo Ketola
     3	Vincent Fazio
     2	Adrien Gallou?t
     2	Danomi Manchego
     2	Davide Viti
     2	Eugen Hristev
     2	Evgeniy Didin
     2	Geoff Levand
     2	Gleb Mazovetskiy
     2	Jagan Teki
     2	Joao Marcos Costa
     2	Jugurtha BELKALEM
     2	Laurent GAUTHIER
     2	Laurent Hartanerot
     2	Louis-Paul Cordier
     2	Luca Ceresoli
     2	Sergey Matyukevich
     2	Stefan Ott
     1	Aleksander Morgado
     1	Alexander Sverdlin
     1	Anatoly Borodin
     1	Attila Wagner
     1	Bin Meng
     1	Cody Guldner
     1	Dagg Stompler
     1	Fabrice Goucem
     1	Graham Rhodes
     1	Heiko Stuebner
     1	Ismael Luceno
     1	Jean Burgat
     1	Joachim Nilsson
     1	Johan Oudinet
     1	Julien Boibessot
     1	Julien Grossholtz
     1	J?r?my Rosen
     1	K?vin L'h?pital
     1	Lecopzer Chen
     1	Marcus Folkesson
     1	Marek Belisko
     1	Mark Corbin
     1	Merlin B?ge
     1	Michele Comignano
     1	Mircea Gliga
     1	Nayna Jain
     1	Naz?m Gediz AYDINDO?MU?
     1	Nicolas Carrier
     1	Nicolas Cavallari
     1	Norbert Lange
     1	Philippe Reynes
     1	Ramon Fried
     1	Rapha?l M?lotte
     1	Refik Tuzakli
     1	Robert Hancock
     1	Ryan Steffens
     1	Sam Voss
     1	Thomas Claveirole
     1	Thomas Ruschival
     1	Vadym Kochan
     1	Waldemar Brodkorb
     1	Yaroslav Syrytsia
     1	Zoltan Gyarmati

And a special thanks to our patch reviewers (we would need more!):

git log 2020.02.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     12 Romain Naour <romain.naour@gmail.com>
      7 Peter Seiderer <ps.report@gmx.net>
      5 Julien Olivain <julien.olivain@oss.nxp.com>
      4 Yegor Yefremov <yegorslists@googlemail.com>
      3 S?bastien Szymanski <sebastien.szymanski@armadeus.com>
      3 Ryan Barnett <ryan.barnett@rockwellcollins.com>
      3 Petr Vorel <petr.vorel@gmail.com>
      2 Matt Weber <matthew.weber@rockwellcollins.com>
      2 Fabio Estevam <festevam@gmail.com>
      2 Asaf Kahlon <asafka7@gmail.com>
      2 Adrian Perez de Castro <aperez@igalia.com>
      2 Adam Duskett <aduskett@gmail.com>
      1 Yann E. MORIN <yann.morin.1998@free.fr>
      1 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
      1 Sam Voss <sam.voss@gmail.com>
      1 Matthew Weber <matthew.weber@rockwellcollins.com>
      1 Maeva Manuel <maeva.manuel@oss.nxp.com>
      1 John Faith <jfaith@impinj.com>
      1 Giulio Benetti <giulio.benetti@benettiengineering.com>
      1 Gilles Talis <gilles.talis@gmail.com>
      1 Gary Bisson <gary.bisson@boundarydevices.com>
      1 David Pierret <david.pierret@smile.fr>
      1 Cl?ment P?ron <peron.clem@gmail.com>
      1 Chris Packham <judge.packham@gmail.com>
      1 Carlos Santos <unixmania@gmail.com>
      1 Antoine Tenart <antoine.tenart@bootlin.com>
      1 Alistair Francis <alistair.francis@wdc.com>

The next release will be 2020.08. Expect the first release candidate at
the beginning of August and the final release at the end of the month.

This release will be supported with security and other important fixes
until 2020.08 is out. If you need longer support then consider using our
long term support release (2020.02.x) instead which will be supported
until March 2021.

-- 
Bye, Peter Korsgaard
