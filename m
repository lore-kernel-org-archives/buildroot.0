From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Aug 2020 23:23:29 +0200
Subject: [Buildroot] Buildroot 2020.08-rc1 released
Message-ID: <20200806232329.3aafced8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2020.08-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2020.08-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2020.08-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

With 989 commits since 2020.05, we're quite significantly below the
activity of previous cycles. Probably not due to the lack of
submission, as we still have 480-500 patches waiting in patchwork, but
mainly due to the lack of review, testing and integration bandwidth.
These contributions came from 117 contributors, which is a stable count
compared to previous development cycles.

Besides the usual significant amount of package updates, this release
brings a number of other changes:

 - Toolchain:
   - GCC 10.x added, GCC 9.x is the default
   - binutils 2.34 added, binutils 2.33 is the default, binutils
     2.31 removed
   - glibc updated to 2.31
   - ARC toolchain components updated to 2020.03-release.
   - Enable uClibc-ng usage for RISC-V 64-bit

 - Infrastructure:
   - qmake-package was fixed to be compatible with
   BR2_PER_PACKAGE_DIRECTORIES
   - complete rewrite of the Gitlab CI Yaml configuration file,
   now generated directly by the Gitlab CI pipeline itselfs

 - Misc:
   - cargo and cargo-bin packages removed, as cargo is now part
   of Rust itself

 - Filesystem: ubinize configuration files can now use
   BINARIES_DIR to refer to the $(O)/images directory.

 - New packages: bitwise, earlyoom, fuse-overlayfs, gloox,
   kodi-pvr-octonet, kodi-pvr-zattoo, libabseil-cpp, libcutl, libnids,
   libnpupnp, libodb, libodb-boost, libodb-mysql, libodb-pgsql,
   mbpfan, netopeer2, odb, parprouted, python-colorzero,
   python-gpiozero, python-pybind, python-yatl, python3-decorator,
   qt5quicktimeline, resiprocate, ttyd, unclutter-xfixes,
   urandom-scripts,

 - New defconfigs: bananapi_m2_zero, freescale_imx8mnevk,
   globalscale_espressobin, imx6ullevk, microchip_sama5d27_wlsom1_ek,
   rock_pi_4, rock_pi_n10

 - Removed packages: cargo, cargo-bin, kodi-peripheral-steamcontroller

See the CHANGES file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.08-rc1

git shortlog -s -n 2020.05..
   182	Fabrice Fontaine
    95	Bernd Kuhls
    54	Romain Naour
    43	Adam Duskett
    36	Francois Perrad
    35	James Hilliard
    34	Peter Seiderer
    29	Norbert Lange
    28	Thomas Petazzoni
    27	Peter Korsgaard
    27	Sergio Prado
    22	Heiko Thiery
    19	Pierre-Jean Texier
    18	Yann E. MORIN
    17	Lubomir Rintel
    16	Baruch Siach
    15	Angelo Compagnucci
    15	Antoine Tenart
    12	Asaf Kahlon
    11	Stephane Viau
    10	Giulio Benetti
     9	Joris Offouga
     8	Grzegorz Blach
     8	Gwenhael Goavec-Merou
     8	Julien Olivain
     7	Bartosz Bilas
     7	Christian Stewart
     7	Eric Le Bihan
     7	Matt Weber
     7	Petr Vorel
     7	Titouan Christophe
     6	Gary Bisson
     6	Guillaume W. Bres
     6	Yegor Yefremov
     5	Adrian Perez de Castro
     5	Etienne Carriere
     5	Joseph Kogut
     5	J?rg Krause
     5	Paul Cercueil
     5	Stefan S?rensen
     4	Aleksander Morgado
     4	Danomi Manchego
     4	Fabio Estevam
     4	Jared Bents
     4	Kamel Bouhara
     4	Maeva Manuel
     4	Mark Corbin
     3	Brandon Maier
     3	Gilles Talis
     3	Nicolas Robin
     3	Yair Ben-Avraham
     2	Alejandro Gonz?lez
     2	Chris Packham
     2	Eugen Hristev
     2	Evgeniy Didin
     2	Frank Hunleth
     2	Gon?alo Salazar
     2	Joachim Nilsson
     2	John Keeping
     2	Martin Bark
     2	Michael Walle
     2	Nicola Di Lieto
     2	Patrick Havelange
     2	Ryan Barnett
     2	Suniel Mahesh
     2	S?bastien Szymanski
     2	Thomas De Schampheleire
     1	Aaron Sierra
     1	Alexander Dahl
     1	Alexandre Belloni
     1	Andreas Naumann
     1	Arnout Vandecappelle (Essensium/Mind)
     1	Ash Charles
     1	Christoph Muellner
     1	Christoph M?llner
     1	Christopher Pelloux
     1	Dick Olsson
     1	Ed Spiridonov
     1	Eloi Bail
     1	Felix Vollmer
     1	Gao Xiang
     1	Gregory CLEMENT
     1	Ignacy Gaw?dzki
     1	Ismael Luceno
     1	Jan Kiszka
     1	Jianhui Zhao
     1	Joel Stanley
     1	Luca Ceresoli
     1	Lyle Franklin
     1	Mario Mintel
     1	Martin Elshuber
     1	Martin Kepplinger
     1	Masahiro Yamada
     1	Maxim Cournoyer
     1	Michael Nosthoff
     1	Michael Trimarchi
     1	Michael Vetter
     1	Myl?ne Josserand
     1	Nicolas Cavallari
     1	Nicolas Dufresne
     1	Nicolas Serafini
     1	Owen Walpole
     1	Pieterjan Camerlynck
     1	Ramon Fried
     1	Robert Hancock
     1	Sam Voss
     1	Santosh Multhalli
     1	Sergey Matyukevich
     1	Stefan Ott
     1	St?phane Veyret
     1	Thomas Ruschival
     1	Tian Yuanhao
     1	Tom Marcuzzi
     1	Urja Rannikko
     1	Vincent Stehl?
     1	Yi Zheng
     1	Yurii Monakov

And a special thanks to our patch reviewers (we would need more!):

git log 2020.05.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r
      7 David Pierret <david.pierret@smile.fr>
      6 Romain Naour <romain.naour@gmail.com>
      5 Gary Bisson <gary.bisson@boundarydevices.com>
      4 Maeva Manuel <maeva.manuel@oss.nxp.com>
      4 Julien Olivain <julien.olivain@oss.nxp.com>
      3 Luca Ceresoli <luca@lucaceresoli.net>
      3 J?r?my Rosen <jeremy.rosen@smile.fr>
      3 Alexander Dahl <post@lespocky.de>
      2 Stephan Hoffmann <sho@relinux.de>
      2 Petr Vorel <petr.vorel@gmail.com>
      1 Yegor Yefremov <yegorslists@googlemail.com>
      1 Yann E. MORIN <yann.morin.1998@free.fr>
      1 Titouan Christophe <titouan.christophe@railnova.eu>
      1 Matthew Weber <matthew.weber@rockwellcollins.com>
      1 Marcin Niestroj <m.niestroj@grinn-global.com>
      1 Kieran Bingham <kieran.bingham@ideasonboard.com>
      1 J?r?my ROSEN <jeremy.rosen@smile.fr>
      1 Etienne Carriere <etienne.carriere@linaro.org>
      1 Christian Stewart <christian@paral.in>
      1 Asaf Kahlon <asafka7@gmail.com>
      1 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      1 Alistair Francis <alistair.francis@wdc.com>

You can expect the final 2020.08 release by the end of August. Since
-rc1 has been released, we will now only merge fixes into the master
branch, which will become the final 2020.08 release at the end of
August. However, in order to not stop the merging of new features for
2020.11, we will open a 'next' branch in which new features and version
bumps that are not security updates will be merged.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
