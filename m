From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 May 2015 21:43:56 +0200
Subject: [Buildroot] Buildroot 2015.05-rc1 released
Message-ID: <87vbg8p1qb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2015.05-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2015.05-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2015.05-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -s -n 2015.02..

   389	Bernd Kuhls
   389	Gustavo Zacarias
   113	Yann E. MORIN
   112	Thomas Petazzoni
    49	Peter Korsgaard
    32	Fabio Porcedda
    29	Andr? Hentschel
    29	Romain Naour
    28	Francois Perrad
    24	Peter Seiderer
    22	Baruch Siach
    21	Jerzy Grzegorek
    20	Mike Williams
    20	Vicente Olivert Riera
    16	J?r?me Pouiller
    15	Bartosz Golaszewski
    14	J?rg Krause
    14	Yegor Yefremov
    13	Arnout Vandecappelle
    12	Angelo Compagnucci
    11	Gwenhael Goavec-Merou
    11	Steven Noonan
    11	Thomas De Schampheleire
    10	Max Filippov
     8	Frank Hunleth
     8	Petr Vorel
     7	Johan Sagaert
     6	Ezequiel Garc?a
     6	Floris Bos
     6	Karoly Kasza
     6	Luca Ceresoli
     6	Samuel Martin
     6	Vincent Stehl?
     6	Waldemar Brodkorb
     5	Philippe Proulx
     4	Alexey Brodkin
     4	Johan Oudinet
     4	Julien Boibessot
     4	Maxim Mikityanskiy
     4	Maxime Hadjinlian
     4	Nikolay Dimitrov
     4	Olivier Schonken
     4	Stefan S?rensen
     4	Steve Kenton
     4	Will Wagner
     3	Alex Suykov
     3	Davide Viti
     3	Markos Chandras
     3	Masahiro Yamada
     3	Matt Weber
     3	Mauro Condarelli
     3	Nicolas Serafini
     3	Peter K?mmel
     3	Ryan Barnett
     3	erico.nunes
     2	Antoine T?nart
     2	Aur?lien Chabot
     2	Beno?t Th?baudeau
     2	Christophe Vu-Brugier
     2	Clayton Shotwell
     2	C?dric Marie
     2	James Hebden
     2	Jerome Oufella
     2	Lionel Orry
     2	Robert P. J. Day
     2	Ryan Coe
     2	S?bastien Szymanski
     1	Alexandre Belloni
     1	Alexey Mednyy
     1	Andrew Parlane
     1	Baptiste Moraine
     1	Carlos Santos
     1	Dale Ghent
     1	Damien Lanson
     1	Daniel Sangue
     1	David Bachelart
     1	David Graziano
     1	Doug Kehn
     1	Gary Bisson
     1	Ivo Slanina
     1	Jan Heylen
     1	Jens Rosenboom
     1	Jens Zettelmeyer
     1	John Keeping
     1	Julien D'Ascenzio
     1	J?r?me Oufella
     1	Lahoudere Fabien
     1	Marcin Bis
     1	Matthew Bastian
     1	Michael Trimarchi
     1	Nicolas Cavallari
     1	No? Rubinstein
     1	Philippe Reynes
     1	Rhys Williams
     1	Richard Genoud
     1	R?mi R?rolle
     1	Sebastien Bourdelin
     1	Simon Marchi
     1	Sonic Zhang
     1	Steve James
     1	Vanya Sergeev
     1	Vivien Didelot
     1	Yann E. Morin
     1	Yannick Kiekens
     1	david.barbion at ext.leroymerlin.fr

And a special thanks to our patch reviewers:

git log 2015.02.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     89 "Yann E. MORIN" <yann.morin.1998@free.fr>
     59 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
     25 Samuel Martin <s.martin49@gmail.com>
     10 Romain Naour <romain.naour@openwide.fr>
     10 Gustavo Zacarias <gustavo@zacarias.com.ar>
      9 Yegor Yefremov <yegorslists@googlemail.com>
      7 Gary Bisson <gary.bisson@boundarydevices.com>
      6 Bernd Kuhls <bernd.kuhls@t-online.de>
      5 Vicente Olivert Riera <Vincent.Riera@imgtec.com>
      4 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
      2 Ryan Barnett <ryan.barnett@rockwellcollins.com>
      2 Fabio Porcedda <fabio.porcedda@gmail.com>
      2 Andr? Hentschel <nerv@dawncrow.de>
      1 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
      1 Mike Williams <mike@mikebwilliams.com>
      1 Luca Ceresoli <luca@lucaceresoli.net>
      1 J?rg Krause <joerg.krause@embedded.rocks>
      1 Francois Perrad <francois.perrad@gadz.org>
      1 Floris Bos <bos@je-eigen-domein.nl>
      1 Baruch Siach <baruch@tkos.co.il>
      1 Angelo Compagnucci <angelo.compagnucci@gmail.com>

This was a *BIG* cycle! We had more than 1600 (a new record!) changes
all over the tree and more than 100 unique contributors! I'm very happy
to see so many "new" people next to the "oldtimers".

Of noteworthy new features/changes we have:

 - Architectures: Removed AVR32 support, deprecate SH64, added support
   for steamroller, corei7-avx and core-avx2 x86 variants.

 - Toolchains: IPv6 and Largefile support now enforced for
   uClibc. Corresponding Kconfig symbols removed.
   Internal toolchain support for Nios2 added, Blackfin
   removed. Aarch64 and sh musl support. uClibc-ng support added.

 - Libatomic is now handled for internal and external toolchains. Link
   time optimization (LTO) support.

 - Defconfigs: Freescale i.MX28 EVK, i.MX31 PDK and SABRE Auto,
   Raspberry Pi 2 and RIoTboard added.

 - Infrastructure: Hashes for a large number of packages have been
   added. Missing hashes now stop the build unless explicitly disabled.

 - Large number of new packages (96): Perl and Python modules, Apache,
   GNURadio, NVIDIA + Tegra GPU drivers, Tor, Wine, ..

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.05-rc1

Like usual, I will now create a next branch and start merging in new
features, rather than wait until 2015.05 is released.

-- 
Bye, Peter Korsgaard
