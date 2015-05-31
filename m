From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2015 23:32:02 +0200
Subject: [Buildroot] Buildroot 2015.05 released
Message-ID: <87mw0kv3fx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2015.05 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2015.05.tar.gz

or

http://buildroot.net/downloads/buildroot-2015.05.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

This was a *BIG* cycle! We had exactly 1800 (a new record!) changes all
over the tree and more than 100 unique contributors! I'm very happy to
see so many "new" people next to the "oldtimers".

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

http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.05


Many thanks to the people contributing to this release:

git shortlog -s -n 2015.02..

   397	Bernd Kuhls
   393	Gustavo Zacarias
   142	Thomas Petazzoni
   128	Yann E. MORIN
    99	Peter Korsgaard
    47	Fabio Porcedda
    45	Romain Naour
    39	Baruch Siach
    29	Andr? Hentschel
    28	Francois Perrad
    24	Peter Seiderer
    21	Jerzy Grzegorek
    20	Max Filippov
    20	Mike Williams
    20	Vicente Olivert Riera
    16	J?r?me Pouiller
    15	Angelo Compagnucci
    15	Bartosz Golaszewski
    15	Gwenhael Goavec-Merou
    14	J?rg Krause
    14	Yegor Yefremov
    13	Arnout Vandecappelle
    12	Floris Bos
    11	Steven Noonan
    11	Thomas De Schampheleire
    10	Samuel Martin
     8	Frank Hunleth
     8	Petr Vorel
     7	Johan Sagaert
     7	Waldemar Brodkorb
     6	Ezequiel Garc?a
     6	Karoly Kasza
     6	Luca Ceresoli
     6	Vincent Stehl?
     5	Alexey Brodkin
     5	Philippe Proulx
     4	Johan Oudinet
     4	Julien Boibessot
     4	Maxim Mikityanskiy
     4	Maxime Hadjinlian
     4	Nikolay Dimitrov
     4	Olivier Schonken
     4	Stefan S?rensen
     4	Steve Kenton
     4	Will Wagner
     4	erico.nunes
     3	Alex Suykov
     3	Davide Viti
     3	Lionel Orry
     3	Markos Chandras
     3	Masahiro Yamada
     3	Matt Weber
     3	Mauro Condarelli
     3	Nicolas Serafini
     3	Peter K?mmel
     3	Ryan Barnett
     2	Antoine T?nart
     2	Aur?lien Chabot
     2	Beno?t Th?baudeau
     2	Christophe Vu-Brugier
     2	Clayton Shotwell
     2	C?dric Marie
     2	Doug Kehn
     2	Gergely Imreh
     2	James Hebden
     2	Jerome Oufella
     2	Robert P. J. Day
     2	Ryan Coe
     2	S?bastien Szymanski
     1	Alexandre Belloni
     1	Alexey Mednyy
     1	Andrew Parlane
     1	Baptiste Moraine
     1	Carlos Santos
     1	Christian Artin
     1	Dale Ghent
     1	Damien Lanson
     1	Daniel Sangue
     1	Danomi Manchego
     1	David Bachelart
     1	David Graziano
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
     1	Micha? Le?niewski
     1	Mirko Langisch
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
     1	florent valette

And a special thanks to our patch reviewers:

git log 2015.02.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     91 "Yann E. MORIN" <yann.morin.1998@free.fr>
     61 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
     26 Samuel Martin <s.martin49@gmail.com>
     13 Romain Naour <romain.naour@openwide.fr>
     11 Gustavo Zacarias <gustavo@zacarias.com.ar>
      9 Yegor Yefremov <yegorslists@googlemail.com>
      7 Gary Bisson <gary.bisson@boundarydevices.com>
      7 Bernd Kuhls <bernd.kuhls@t-online.de>
      5 Vicente Olivert Riera <Vincent.Riera@imgtec.com>
      4 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
      2 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
      2 Ryan Barnett <ryan.barnett@rockwellcollins.com>
      2 Fabio Porcedda <fabio.porcedda@gmail.com>
      2 Baruch Siach <baruch@tkos.co.il>
      2 Andr? Hentschel <nerv@dawncrow.de>
      1 Peter Seiderer <ps.report@gmx.net>
      1 Mike Williams <mike@mikebwilliams.com>
      1 Luca Ceresoli <luca@lucaceresoli.net>
      1 J?rg Krause <joerg.krause@embedded.rocks>
      1 Jaap Crezee <jaap@jcz.nl>
      1 Francois Perrad <francois.perrad@gadz.org>
      1 Floris Bos <bos@je-eigen-domein.nl>
      1 Angelo Compagnucci <angelo.compagnucci@gmail.com>
      1 Alexey Brodkin <abrodkin@synopsys.com>

Once again our autobuilders have helped us fix a huge amount of build
issues. Thanks to all the people reviewing failures and fixing issues:

for i in $(git log --format=%H 2015.02..); do \
    git show --quiet $i | grep -q http://autobuild && \
    git show --quiet --format="%an" $i ; done | sort | uniq -c | \
        sort -rn -k1

     52 Thomas Petazzoni
     42 Peter Korsgaard
     30 Bernd Kuhls
     24 Romain Naour
     19 Baruch Siach
     18 Gustavo Zacarias
     13 Yann E. MORIN
      7 Peter Seiderer
      7 Max Filippov
      6 Samuel Martin
      5 Gwenhael Goavec-Merou
      4 Fabio Porcedda
      3 Alex Suykov
      2 Vicente Olivert Riera
      2 J?rg Krause
      1 Yegor Yefremov
      1 Waldemar Brodkorb
      1 Lionel Orry
      1 Karoly Kasza
      1 Gergely Imreh
      1 Francois Perrad
      1 Angelo Compagnucci
      1 Andr? Hentschel
      1 Alexey Brodkin

Next release will be 2015.08. Expect the first release candidate early
August and the final release at the end of the month.

-- 
Bye, Peter Korsgaard
