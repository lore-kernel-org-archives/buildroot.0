From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Jun 2021 11:12:39 +0200
Subject: [Buildroot] Buildroot 2021.05 released
Message-ID: <87a6o2xcl4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2021.05 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2021.05.tar.gz

or

http://buildroot.net/downloads/buildroot-2021.05.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or bug
tracker.

This was another fairly big development cycle with more than 1300
changes all over the tree and 96 unique contributors! I'm once again
very happy to see so many "new" people next to the "oldtimers".

Of noteworthy new features/changes we have:

- FORTIFY_SOURCE, PIC/PIE, RELRO and SSP security hardening options are
  now enabled by default.

- CMake infrastructure: Use CMAKE_EXE_LINKER_FLAGS rather than
  CMAKE_CXX_FLAGS to link with libatomic to fix an compatibility issue
  with poppler. Bump minimal host cmake version to 3.16 (from 3.15) to
  fix a compatibility issue with domoticz.

- Meson: Use correct C++ host compiler (rather than C compiler)

- support/download: Fix tarball generation (from git/svn repos)
  including symlinks pointing to ./<something>. Fix svn download for
  <1.9 clients or repos using CVS-style keywords.

- Infrastructure: Expose CONFIG_DIR to post-build/post-image scripts, so
  they can call the Buildroot Makefile in the correct directory
  for both in-tree / out-of-tree builds.

- support/scripts/gen-missing-cpe: A script to query the list of CPE IDs
  for the packages enabled in the current configuration and:

  - for CPE IDs that do not have any matching entry in the CPE
    database, it emits a warning

  - for CPE IDs that do have a matching entry, but not with the same
    version, it generates a snippet of XML that can be used to propose
    an updated version to NIST.

- support/scripts/cve.py: Use the (significantly) faster yajl2 ijson
  backend for older (< 2.5) ijson versions rather than the slow python
  default, speeding up pkg-stats by ~2x.

- CPE meta data has been added for a large number of packages

- Python{,3}: Fix byte compiling python files with short (single
  character before .py) file names.

- New defconfigs: Acme Systems Acqua A5 (256/512MB), Beagleboard
  BeagleV, Boundary devices Nitrogen8M Plus SOM, NXP i.MX 8M Plus EVK,
  QEMU PPC e500mc

- New packages: beaglev-ddrinit, beaglev-secondboot, janet,
  kodi-inputstream-ffmpegdirect, kodi-vfs-libarchive,
  kodi-visualisation-matrix, libxcrypt, libqrtr-glib, log4qt, mawk,
  perl-parse-yapp, postgis, protozero, python-flask-wtf, python-iwlib,
  python-semantic-version, python-setuptools-rust, python-toml,
  riscv64-elf-toolchain, siproxyd, uftrace, zfs

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.05

Many thanks to the people contributing to this release:

git shortlog -s -n 2021.02..

   439	Fabrice Fontaine
   171	Bernd Kuhls
    92	Peter Seiderer
    70	Peter Korsgaard
    39	Francois Perrad
    38	Matt Weber
    38	Thomas Petazzoni
    29	Dick Olsson
    23	Yann E. MORIN
    21	Giulio Benetti
    18	Romain Naour
    17	Adam Duskett
    17	J?rg Krause
    11	Christian Stewart
    11	Heiko Thiery
    11	Michael Nosthoff
    10	Adrian Perez de Castro
    10	Grzegorz Blach
     9	James Hilliard
     9	Maxime Chevallier
     9	Petr Vorel
     9	Stephane Viau
     9	S?bastien Szymanski
     9	Thomas De Schampheleire
     8	Etienne Carriere
     7	Bartosz Bilas
     7	Baruch Siach
     6	Alexander Dahl
     6	Arnout Vandecappelle (Essensium/Mind)
     6	Gary Bisson
     6	Guillaume W. Bres
     6	Matthew Weber
     6	Michael Walle
     6	Norbert Lange
     6	Ryan Barnett
     6	Titouan Christophe
     5	Chan, Donald
     5	Gleb Mazovetskiy
     5	Maxim Kochetkov
     5	Nicolas Cavallari
     5	Vincent Stehl?
     4	Pierre-Jean Texier
     4	Sergio Prado
     3	Alexander Egorenkov
     3	Asaf Kahlon
     3	Edgar Bonet
     3	Joachim Wiberg
     3	John Keeping
     3	Marcin Niestroj
     3	Sergey Matyukevich
     2	Charles Hardin
     2	Chris Packham
     2	Drew Fustini
     2	Einar Jon Gunnarsson
     2	Fabio Estevam
     2	Henri Roosen
     2	Ismael Luceno
     2	Jared Bents
     2	Jianhui Zhao
     2	Mario Fink
     2	Michael Vetter
     2	Sam Voss
     2	Tian Yuanhao
     2	Vineet Gupta
     2	Waldemar Brodkorb
     2	Yegor Yefremov
     1	Adrian Sweet
     1	Aleksander Morgado
     1	Alexander Sverdlin
     1	Andreas Ziegler
     1	Andr? Hentschel
     1	Antoine Tenart
     1	Bert Outtier
     1	Bin Meng
     1	Brandon Maier
     1	David GOUARIN
     1	Dimitrij Kotrev
     1	Federico Pellegrin
     1	Filip Skoneczny
     1	Gilles Talis
     1	Gustavo Heinz
     1	Jack Cripps
     1	Jean-pierre Cartal
     1	Jos? Luis Salvador Rufo
     1	Julien Olivain
     1	Leon Anavi
     1	Marcus Folkesson
     1	Markus Mayer
     1	Mircea GLIGA
     1	Nicolas Serafini
     1	Nicolas Toromanoff
     1	Ramon Fried
     1	Stefan Agner
     1	Stefan S?rensen
     1	Thomas Huth
     1	Vadym Kochan

And a special thanks to our patch reviewers (we would need more!):

git log 2021.02.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

      7 Bin Meng <bmeng.cn@gmail.com>
      6 Stephane Viau <stephane.viau@oss.nxp.com>
      6 Peter Seiderer <ps.report@gmx.net>
      6 Gary Bisson <gary.bisson@boundarydevices.com>
      6 Alistair Francis <alistair.francis@wdc.com>
      5 Maxim Kochetkov <fido_max@inbox.ru>
      4 Marcin Niestroj <m.niestroj@grinn-global.com>
      3 Romain Naour <romain.naour@gmail.com>
      2 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
      2 Petr Vorel <petr.vorel@gmail.com>
      2 Matthew Weber <matthew.weber@collins.com>
      2 Christian Stewart <christian@paral.in>
      2 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      2 Alexander Dahl <post@lespocky.de>
      1 Ryan Barnett <ryan.barnett@rockwellcollins.com>
      1 Peter Korsgaard <peter@korsgaard.com>
      1 Matthew Weber <matthew.weber@rockwellcollins.com>
      1 Matthew Weber <Matthew.Weber@collins.com>
      1 Luca Ceresoli <luca@lucaceresoli.net>
      1 Heiko Thiery <heiko.thiery@gmail.com>
      1 Fabio Estevam <festevam@gmail.com>
      1 Etienne Carriere <etienne.carriere@linaro.org>
      1 Erico Nunes <nunes.erico@gmail.com>
      1 Baruch Siach <baruch@tkos.co.il>
      1 Bartosz Bilas<b.bilas@grinn-global.com>
      1 Asaf Kahlon <asafka7@gmail.com>
      1 Alexander Sverdlin <alexander.sverdlin@gmail.com>
      1 Alexander Egorenkov <egorenar@linux.ibm.com>
      1 Aleksander Morgado <aleksander@aleksander.es>
      1 Vincent Fazio <vfazio@xes-inc.com>

The next release will be 2021.08. Expect the first release candidate at
the beginning of August and the final release at the end of the month.

This release will be supported with security and other important fixes
until 2021.08 is out. For longer support, consider our long term support
release (2021.02.x) instead, which will be supported until April 2022.

-- 
Bye, Peter Korsgaard
