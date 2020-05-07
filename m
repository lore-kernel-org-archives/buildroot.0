From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 May 2020 22:58:58 +0200
Subject: [Buildroot] Buildroot 2020.05-rc1 released
Message-ID: <20200507225858.0cdf8db0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2020.05-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2020.05-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2020.05-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

With 1297 changes, we're a bit lower than the previous cycle that had a
bit more than 1400 changes, but we're still very active. These
contributions came from 119 contributors, a number that is stable
compared to our previous release. This seems to be very much in line
with how Buildroot has been developed over the past few years, through
a continuous and regular stream of contributions, coming from a
significant contributor base.

Of noteworthy new features/changes in this release we have:

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
   gobject-introspection, ibm-sw-tpm2, imx-seco, jbig2dec,
   libapparmor, libiberty, libfuse3, libtextstyle, libudfread,
   libuhttpd, libuwsc, lua-lyaml, matio, mbuffer, netdata,
   openfpgaloader, perl-i18n, perl-locale-maketext-lexicon,
   perl-lwp-protocol-https,
   perl-mojolicious-plugin-authorization,
   perl-mojolicious-plugin-cspheader,
   perl-mojolicious-plugin-i18n,
   perl-mojolicious-plugin-securityheader, perl-mozilla-ca,
   perl-path-class, pistache, pkcs11-helper, prelink-cross,
   python-argon2-cffi, python-canopen, python-cbor2,
   python-filelock, python-flatbuffers, python-greenlet,
   python-modbus-tk, python-pyalsa, python-pysftp, python-regex,
   python-snappy, rtty, tinyproxy, udev-gentoo-scripts, unbound,
   vuejs, wlroots.

 - New defconfigs: freescale_imx6ullevk, freescale_imx8qmmek,
   nanopi_neo4, nanopi_r1, nitrogen8mm, nitrogen8mn, olpc_xo1,
   olpc_xo175, roc_rk3399_pc, stm32mp157a_dk1, zynq_qmtech

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.05-rc1

Many thanks to the people contributing to this release:

git shortlog -s -n 2020.02..

   194	Fabrice Fontaine
   137	Bernd Kuhls
   127	James Hilliard
    85	Adam Duskett
    62	Thomas Petazzoni
    59	Peter Korsgaard
    48	Yann E. MORIN
    47	Romain Naour
    42	Peter Seiderer
    36	Francois Perrad
    21	Carlos Santos
    20	Heiko Thiery
    18	Bartosz Bilas
    16	Gary Bisson
    15	Asaf Kahlon
    15	Ryan Barnett
    14	Andreas Naumann
    13	Fabio Estevam
    13	J?rg Krause
    13	Matt Weber
    12	Baruch Siach
    12	Thomas De Schampheleire
    11	Pierre-Jean Texier
    10	Julien Olivain
    10	Titouan Christophe
     9	Jianhui Zhao
     9	Yegor Yefremov
     8	Angelo Compagnucci
     8	Marcin Niestroj
     7	Gilles Talis
     7	Giulio Benetti
     7	Grzegorz Blach
     7	Joeri Barbarien
     7	Maeva Manuel
     6	Lubomir Rintel
     6	Petr Vorel
     6	Ryan Coe
     5	Adrian Perez de Castro
     5	Andr? Hentschel
     5	Cl?ment P?ron
     5	Frank Vanbever
     5	Gwenhael Goavec-Merou
     5	Pascal de Bruijn
     4	Alexander Dahl
     4	Gao Xiang
     4	Nicola Di Lieto
     3	Alexander Mukhin
     3	Alexey Lukyanchuk
     3	Antoine Tenart
     3	Charlie Turner
     3	Chris Packham
     3	Jared Bents
     3	John Keeping
     3	Louis-Paul CORDIER
     3	Michael Fischer
     3	Sergio Prado
     3	Suniel Mahesh
     3	S?bastien Szymanski
     3	Timo Ketola
     3	Vincent Fazio
     2	Adrien Gallou?t
     2	Christian Stewart
     2	Davide Viti
     2	Eugen Hristev
     2	Evgeniy Didin
     2	Geoff Levand
     2	Gleb Mazovetskiy
     2	Jagan Teki
     2	Joao Marcos Costa
     2	Joseph Kogut
     2	Jugurtha BELKALEM
     2	Laurent GAUTHIER
     2	Laurent Hartanerot
     2	Louis Aussedat
     2	Luca Ceresoli
     2	Max Filippov
     2	Sergey Matyukevich
     2	Stephan Hoffmann
     1	Aleksander Morgado
     1	Alexander Sverdlin
     1	Anatoly Borodin
     1	Attila Wagner
     1	Bin Meng
     1	Cody Guldner
     1	Dagg Stompler
     1	Danomi Manchego
     1	Fabrice Goucem
     1	Graham Rhodes
     1	Heiko Stuebner
     1	Ismael Luceno
     1	Jean Burgat
     1	Johan Oudinet
     1	Julien Boibessot
     1	Julien Grossholtz
     1	K?vin L'h?pital
     1	Louis-Paul Cordier
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
     1	Philippe Reynes
     1	Ramon Fried
     1	Rapha?l M?lotte
     1	Refik Tuzakli
     1	Robert Hancock
     1	Ryan Steffens
     1	Sam Voss
     1	Stefan Ott
     1	Stefan S?rensen
     1	Thomas Claveirole
     1	Thomas Ruschival
     1	Yaroslav Syrytsia
     1	Zoltan Gyarmati

And a special thanks to our patch reviewers (we would need more!):

git log 2020.02.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

      9 Romain Naour <romain.naour@gmail.com>
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
      1 Maeva Manuel <maeva.manuel@oss.nxp.com>
      1 John Faith <jfaith@impinj.com>
      1 Giulio Benetti <giulio.benetti@benettiengineering.com>
      1 Gilles Talis <gilles.talis@gmail.com>
      1 Gary Bisson <gary.bisson@boundarydevices.com>
      1 David Pierret <david.pierret@smile.fr>
      1 Chris Packham <judge.packham@gmail.com>
      1 Carlos Santos <unixmania@gmail.com>
      1 Antoine Tenart <antoine.tenart@bootlin.com>
      1 Alistair Francis <alistair.francis@wdc.com>

You can expect the final 2020.05 release by the end of May. Since -rc1
has been released, we will now only merge fixes into the master branch,
which will become the final 2020.05 release at the end of May. However,
in order to not stop the merging of new features for 2020.08, we have
also opened a 'next' branch in which new features and version bumps
that are not security updates will be merged.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
