From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Aug 2016 11:52:20 +0200
Subject: [Buildroot] Buildroot 2016.08-rc1 released
Message-ID: <87lh0a9qcr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2016.08-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2016.08-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2016.08-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

This was another big development cycle with more than 1600 changes
all over the tree and more than 100 unique contributors! I'm very happy
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
   packages.

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

http://git.buildroot.net/buildroot/plain/CHANGES?id=2016.08-rc1


Many thanks to the people contributing to this release:

git shortlog -s -n 2016.05..

   215	Yann E. MORIN
   173	Bernd Kuhls
   158	Gustavo Zacarias
   126	Thomas Petazzoni
   104	Romain Naour
    79	Peter Korsgaard
    74	Julien Floret
    74	Vicente Olivert Riera
    62	Yegor Yefremov
    43	Waldemar Brodkorb
    36	Fabio Estevam
    29	Maxime Hadjinlian
    18	Gabe Evans
    18	Samuel Martin
    17	Fabrice Fontaine
    16	Baruch Siach
    16	Francois Perrad
    16	Jerzy Grzegorek
    15	Martin Bark
    14	Andrew Webster
    13	J?rg Krause
    12	Adam Duskett
    11	Peter Seiderer
    10	Angelo Compagnucci
    10	Christian Stewart
     9	Dagg Stompler
     9	Erico Nunes
     9	Frank Hunleth
     9	Ludovic Desroches
     8	Alexey Brodkin
     8	Gary Bisson
     8	Matt Weber
     7	Ezequiel Garcia
     7	Masahiro Yamada
     7	Rahul Bedarkar
     5	Akihiko Odaki
     5	Marcin Nowakowski
     5	Sergio Prado
     5	Zakharov Vlad
     5	universe II
     4	Carlos Santos
     4	Eric Le Bihan
     4	Gilles Chanteperdrix
     4	Lothar Felten
     4	Luca Ceresoli
     3	Alex Suykov
     3	Andr? Hentschel
     3	Bartosz Golaszewski
     3	Charles Hardin
     3	Damien Lanson
     3	Gwenhael Goavec-Merou
     3	James Knight
     3	Joao Pinto
     3	Marcin Niestroj
     3	Paul Cercueil
     3	Peter Thompson
     3	Ricardo Martincoski
     3	Simon Maes
     3	Vivien Didelot
     3	Yugendra Sai Babu Nadupuru
     2	Alexander Dahl
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
     1	Alistair Francis
     1	Andreas Ehmanns
     1	Arnout Vandecappelle
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
     1	Max Filippov
     1	Maxime Ripard
     1	Ofer Heifetz
     1	Oleksandr G Zhadan
     1	Philippe Reynes
     1	Robert Sohn
     1	Roland Franke
     1	Sergey Matyukevich
     1	Sergi Granell
     1	Stanislas Bach
     1	Thomas De Schampheleire
     1	Vincent Stehl?
     1	Vlad Zakharov
     1	Zoltan Gyarmati

And a special thanks to our patch reviewers:

git log 2016.05.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     62 "Yann E. MORIN" <yann.morin.1998@free.fr>
     37 Romain Naour <romain.naour@gmail.com>
     30 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
     13 Gary Bisson <gary.bisson@boundarydevices.com>
     11 Matt Weber <matthew.weber@rockwellcollins.com>
     10 Samuel Martin <s.martin49@gmail.com>
      8 Luca Ceresoli <luca@lucaceresoli.net>
      6 Marcin Nowakowski <marcin.nowakowski@imgtec.com>
      5 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
      4 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
      4 Matt Weber <matt@thewebers.ws>
      3 Yegor Yefremov <yegorslists@googlemail.com>
      2 Gustavo Zacarias <gustavo@zacarias.com.ar>
      1 Romain Naour <romain.naour@smile.fr>
      1 Peter Seiderer <ps.report@gmx.net>
      1 Peter Korsgaard <peter@korsgaard.com>
      1 Khem Raj <raj.khem@gmail.com>
      1 Baruch Siach <baruch@tkos.co.il>

Like usual, I will now create a next branch and start merging in new
features, rather than wait until 2016.08 is released.

-- 
Venlig hilsen,
Peter Korsgaard 
