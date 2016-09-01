From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Sep 2016 11:59:06 +0200
Subject: [Buildroot] Buildroot 2016.08 released
Message-ID: <87oa48vt3p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2016.08 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2016.08.tar.gz

or

http://buildroot.net/downloads/buildroot-2016.08.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

This was another big development cycle with more than 1800 changes
all over the tree and more than 120 unique contributors! I'm very happy
to see so many "new" people next to the "oldtimers".

Of noteworthy new features/changes we have:

 - Toolchain: Fortran support added. eglibc support removed, musl
   support no longer experimental. Blackfin and Microblaze support for
   internal uClibc-ng toolchain, m68k/coldfire improvements. The check
   for unsafe (build host) directories access (/usr/include and
   /usr/lib) is now enabled by default.  Unused locales are now purged
   by default to save space (and the default list of locales
   shrunk). The option to control this has now moved from the toolchain
   menu to system configuration.

 - Legal info improvements: sources are now hardlinked instead of copied
   if possible to save space. Patches and extra downloads are also saved.

 - An experimental configuration knob (BR2_REPRODUCIBLE) has been added
   to make the builds more reproducible (E.G. less differences in the
   binary output between builds of the same configuration). This is
   still work in progress.

 - An option to execute a custom script inside the fakeroot environment
   used to the generate the filesystem (E.G. to tweak permissions or
   similar) has been added.

 - Git support now supports git submodules if <pkg>_GIT_SUBMODULES is
   enabled.

 - Hash files for integritry validation have been added for all
   packages using the wget download method.

 - Dependencies for host packages are no longer derrived from the
   corresponding target package but has to be explicitly defined.

 - New defconfigs: Arcturus uCP1020, Atmel sama5d{2,3,4} xplained
   development configs, Blackfin GDB simulator, Linksprite pcDuino,
   Minnow Board Max graphical demo, NXP i.MX25 PDK, i.MX51 EVK, i.MX6UL
   Pico, i.MX7 sabresd, QEMU MIPS32r6{,el} and MIPS64r6{,el} malta,
   Roseapple Pi, Samsung Snow chromebook, Toradex Apalis i.MX6 COM,
   TS-4800, x86-64 PC BIOS and EFI demos. A number of defconfigs have
   been updated and extended to generate SD card images. Synopsys HS38
   VDK defconfig removed.

 - Lots (104) of new packages, mainly related to virtualization /
   containerization and python.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2016.08


Many thanks to the people contributing to this release:

git shortlog -s -n 2016.05..

   255	Yann E. MORIN
   179	Bernd Kuhls
   177	Thomas Petazzoni
   171	Gustavo Zacarias
   117	Romain Naour
    92	Peter Korsgaard
    75	Vicente Olivert Riera
    74	Julien Floret
    63	Yegor Yefremov
    61	Waldemar Brodkorb
    37	Fabio Estevam
    29	Maxime Hadjinlian
    23	Baruch Siach
    22	Fabrice Fontaine
    19	Samuel Martin
    18	Gabe Evans
    18	Rahul Bedarkar
    16	Francois Perrad
    16	Jerzy Grzegorek
    16	J?rg Krause
    15	Martin Bark
    14	Andrew Webster
    12	Adam Duskett
    12	Christian Stewart
    12	Peter Seiderer
    11	Erico Nunes
    11	Zakharov Vlad
    10	Angelo Compagnucci
    10	Dagg Stompler
    10	Frank Hunleth
    10	Gary Bisson
     9	Ludovic Desroches
     8	Alexey Brodkin
     8	Masahiro Yamada
     8	Matt Weber
     7	Ezequiel Garcia
     6	Arnout Vandecappelle
     6	Luca Ceresoli
     6	Paul Cercueil
     5	Akihiko Odaki
     5	Marcin Nowakowski
     5	Sergio Prado
     5	universe II
     4	Carlos Santos
     4	Eric Le Bihan
     4	Gilles Chanteperdrix
     4	Gwenhael Goavec-Merou
     4	Lothar Felten
     3	Alex Suykov
     3	Andr? Hentschel
     3	Bartosz Golaszewski
     3	Charles Hardin
     3	Damien Lanson
     3	James Knight
     3	Joao Pinto
     3	Marcin Niestroj
     3	Peter Thompson
     3	Ricardo Martincoski
     3	Simon Maes
     3	Vivien Didelot
     3	Vlad Zakharov
     3	Yugendra Sai Babu Nadupuru
     2	Alexander Dahl
     2	Alexander Shiyan
     2	Alistair Francis
     2	Andy Shevchenko
     2	Atul Singh
     2	Benjamin Kamath
     2	Bimal Jacob
     2	David Raeman
     2	Geoff Levand
     2	Joris Lijssens
     2	Julien CORJON
     2	Martin Kelly
     2	Matthew Fornero
     2	Nathaniel Roach
     2	Olivier Singla
     2	Patrick Keroulas
     2	Romain Perier
     2	S?bastien Szymanski
     2	Thomas Claveirole
     2	Wojciech Nizi?ski
     1	Adrien Decostre
     1	Andreas Ehmanns
     1	Cam Hutchison
     1	Danomi Manchego
     1	David Glessner
     1	Denis THULIN
     1	Enrique Oca?a Gonz?lez
     1	Erik Stromdahl
     1	Fabio Porcedda
     1	Georges Savoundararadj
     1	He Chunhui
     1	Hubert Sokolowski
     1	Ilya A. Volynets-Evenbakh
     1	Jaap Crezee
     1	Jason Abele
     1	Jiri Novotny
     1	Joel Stanley
     1	Jonathan Ben Avraham
     1	Jordan Yelloz
     1	Judd Meinders
     1	Kieran Bingham
     1	Kurt Van Dijck
     1	Marc Khouri
     1	Max Filippov
     1	Maxime Ripard
     1	No? Rubinstein
     1	Ofer Heifetz
     1	Oleksandr G Zhadan
     1	Philippe Reynes
     1	Rapha?l Poggi
     1	Robert Sohn
     1	Rodrigo Rebello
     1	Roland Franke
     1	Sergey Matyukevich
     1	Sergi Granell
     1	Stanislas Bach
     1	Thomas De Schampheleire
     1	Vicente Bergas
     1	Vincent Stehl?
     1	Zoltan Gyarmati
     1	guillaume william brs

And a special thanks to our patch reviewers:

git log 2016.05.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     78 "Yann E. MORIN" <yann.morin.1998@free.fr>
     44 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
     38 Romain Naour <romain.naour@gmail.com>
     13 Gary Bisson <gary.bisson@boundarydevices.com>
     12 Matt Weber <matthew.weber@rockwellcollins.com>
     11 Samuel Martin <s.martin49@gmail.com>
      8 Luca Ceresoli <luca@lucaceresoli.net>
      6 Marcin Nowakowski <marcin.nowakowski@imgtec.com>
      5 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
      4 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
      4 Matt Weber <matt@thewebers.ws>
      3 Yegor Yefremov <yegorslists@googlemail.com>
      3 Gustavo Zacarias <gustavo@zacarias.com.ar>
      1  "Yann E. MORIN" <yann.morin.1998@free.fr>
      1 Romain Naour <romain.naour@smile.fr>
      1 Peter Seiderer <ps.report@gmx.net>
      1 Peter Korsgaard <peter@korsgaard.com>
      1 Khem Raj <raj.khem@gmail.com>
      1 Baruch Siach <baruch@tkos.co.il>

Once again our autobuilders have helped us fix a huge amount of build
issues. Thanks to all the people reviewing failures and fixing issues:

for i in $(git log --format=%H 2016.05..); do \
    git show --quiet $i | grep -q http://autobuild && \
    git show --quiet --format="%an" $i ; done | sort | uniq -c | \
        sort -rn -k1

     65 Thomas Petazzoni
     49 Peter Korsgaard
     37 Yann E. MORIN
     35 Waldemar Brodkorb
     34 Romain Naour
     31 Bernd Kuhls
     13 Baruch Siach
     11 Gustavo Zacarias
      8 Rahul Bedarkar
      6 Yegor Yefremov
      6 Peter Seiderer
      5 Zakharov Vlad
      5 Vicente Olivert Riera
      4 J?rg Krause
      3 Vlad Zakharov
      3 Paul Cercueil
      3 Maxime Hadjinlian
      3 Fabrice Fontaine
      2 Samuel Martin
      2 Frank Hunleth
      2 Erico Nunes
      2 Arnout Vandecappelle
      1 Thomas Claveirole
      1 Sergio Prado
      1 Ricardo Martincoski
      1 Olivier Singla
      1 No? Rubinstein
      1 Max Filippov
      1 Matt Weber
      1 Matthew Fornero
      1 Martin Bark
      1 Luca Ceresoli
      1 Gwenhael Goavec-Merou
      1 Gary Bisson
      1 Francois Perrad
      1 Eric Le Bihan
      1 Bimal Jacob
      1 Angelo Compagnucci

The next release will be 2016.11. Expect the first release candidate in
early November, and the final release at the end of the month.

The next developers meeting will take place just after the Embedded
Linux Conference Europe in Berlin, Germany:

http://elinux.org/Buildroot:DeveloperDaysELCE2016

Enjoy!

-- 
Bye, Peter Korsgaard
