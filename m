From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 22:19:38 +0100
Subject: [Buildroot] Buildroot 2017.02 released
Message-ID: <871suihv2t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2017.02 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2017.02.tar.gz

or

http://buildroot.net/downloads/buildroot-2017.02.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

This was another fairly big development cycle with close to 1400 changes
all over the tree and more than 100 unique contributors! I'm very happy
to see so many "new" people next to the "oldtimers".

Of noteworthy new features/changes we have:

Infrastructure:

  - Numerous improvements to support reproducible builds

  - New waf-package package infrastructure to support packages
    that use the Waf build system. 6 packages converted to
    this infrastructure.

  - Add option <pkg>_PREFER_INSTALLER to the perl package
    infrastructure.

  - Support for lzip compressed tarballs has been added.

Architecture:

  - Add support for the OpenRISC CPU architecture

  - Merge description of the ARM and ARM64 options, and add
    support for selecting a specific ARM64 core

Toolchain:

  - Major rework of the external toolchain support. It is now
    split into several packages, one per external toolchain,
    and a common infrastructure.

  - Important fix for musl to prevent a conflict between musl
    and kernel headers (fixes the build of numerous packages
    with musl)

  - uClibc-ng bumped to 1.0.22, and therefore enable uClibc
    for ARM64, mips32r6 and mips64r6

  - Add gdb 7.12.1, and switch to gdb 7.11 as the default

  - Linaro toolchains updated to 2016.11, ARC toolchain
    components updated to arc-2016.09, MIPS Codescape
    toolchains bumped to 2016.05-06, CodeSourcery AMD64 and
    NIOS2 toolchains bumped

  - Remove Analog Devices toolchain for the Blackfin
    architecture, remove pre-built musl toolchains from
    musl.codu.org

New defconfigs: Freescale i.MX23EVK, Qemu OpenRISC emulation,
Qemu NIOS2 emulation, Grinn chiliBoard, Freescale i.MX6Q
SabreSD, BeagleBoard X15, OrangePi One, ARC HS38 HAPS

 - A fair amount (60) of new packages, mainly related to
   firmware/hardware, networking and python.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2017.02

Many thanks to the people contributing to this release:

git shortlog -s -n 2016.11..

   177	Gustavo Zacarias
   111	Thomas Petazzoni
   106	Peter Korsgaard
   102	Bernd Kuhls
    91	Vicente Olivert Riera
    57	Yann E. MORIN
    56	Fabio Estevam
    50	Romain Naour
    48	Baruch Siach
    44	J?rg Krause
    44	Yegor Yefremov
    41	Adam Duskett
    38	Peter Seiderer
    36	Waldemar Brodkorb
    34	Francois Perrad
    15	Fabrice Fontaine
    15	Rahul Bedarkar
    14	J?r?me Pouiller
    13	Arnout Vandecappelle
    12	Danomi Manchego
     9	Lionel Flandrin
     9	Sam bobroff
     9	Thomas De Schampheleire
     8	Angelo Compagnucci
     8	Dagg Stompler
     8	David Bachelart
     8	Zakharov Vlad
     7	James Knight
     7	Luca Ceresoli
     6	Erico Nunes
     6	Frank Hunleth
     6	Marcin Niestroj
     6	Naumann Andreas
     6	Zoltan Gyarmati
     5	Bartosz Golaszewski
     5	Carlos Santos
     5	Chris Packham
     5	Martin Kepplinger
     5	Rahul Jain
     5	Sergey Matyukevich
     4	Alvaro G. M
     4	Eric Le Bihan
     4	Gary Bisson
     4	Gustavo Sverzut Barbieri
     4	Ryan Coe
     3	Alexey Brodkin
     3	Andy Shevchenko
     3	Ash Charles
     3	Brian Redbeard
     3	Bryce Ferguson
     3	Christian Stewart
     3	Ezequiel Garcia
     3	Gilles Chanteperdrix
     3	Jerzy Grzegorek
     3	Johan Oudinet
     3	Julien Corjon
     3	Marcus Hoffmann
     3	Martin Bark
     3	Matt Weber
     3	Maxime Hadjinlian
     3	Petr Vorel
     3	Tobias Klauser
     3	Wolfgang Grandegger
     2	Alistair Francis
     2	Andr? Hentschel
     2	Brandon Maier
     2	Clayton Shotwell
     2	Gilles Talis
     2	Jesper Baekdahl
     2	Marcin Nowakowski
     2	Matt Kraai
     2	Max Filippov
     2	Misha Komarovskiy
     2	Phil Eichinger
     1	Alexey Neyman
     1	Alvaro Gamez Machado
     1	Bimal Jacob
     1	Chris Frederick
     1	Chris Smart
     1	Christian Kellermann
     1	Daniel Mack
     1	Fabien Parent
     1	Fabio Porcedda
     1	Francesco Negri
     1	Ga?l PORTAY
     1	Guillaume GARDET
     1	Ignacy Gaw?dzki
     1	Jack Kao
     1	Jean-Baptiste Tr?dez
     1	Jens Kleintje
     1	Jordan Yelloz
     1	Judd Meinders
     1	Julien Floret
     1	Lothar Felten
     1	Matt Flax
     1	Michael Walle
     1	Mylene JOSSERAND
     1	Nicolas Cavallari
     1	Patrick Devlin
     1	Paul Cercueil
     1	Philippe Reynes
     1	Ray Kinsella
     1	Sam Mendoza-Jonas
     1	Sergio Prado
     1	Stewart Smith
     1	S?bastien Szymanski
     1	Tal Shorer
     1	Tatsuyuki Ishi
     1	Theo Debrouwere
     1	Trent Piepho

And a special thanks to our patch reviewers:

git log 2016.11.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     43 Romain Naour <romain.naour@gmail.com>
     22 "Yann E. MORIN" <yann.morin.1998@free.fr>
     10 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      9 Yegor Yefremov <yegorslists@googlemail.com>
      8 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
      5 Luca Ceresoli <luca@lucaceresoli.net>
      4 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
      4 Samuel Martin <s.martin49@gmail.com>
      3 Bernd Kuhls <bernd.kuhls@t-online.de>
      2 Gustavo Zacarias <gustavo@zacarias.com.ar>
      2 Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
      1 Steven Rostedt <rostedt@goodmis.org>
      1 Sam Bobroff <sam.bobroff@au1.ibm.com>
      1 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
      1 Mark Charlebois <charlebm@gmail.com>
      1 Julien Corjon <corjon.j@ecagroup.com>
      1 J?rg Krause <joerg.krause@embedded.rocks>
      1 Joel Stanley <joel@jms.id.au>
      1 Gary Bisson <gary.bisson@boundarydevices.com>
      1 Francois Perrad <francois.perrad@gadz.org>
      1 Carlos Santos <casantos@datacom.ind.br>
      1 Alexey Brodkin <abrodkin@synopsys.com>

Once again our autobuilders have helped us fix a huge amount of build
issues. Thanks to all the people reviewing failures and fixing issues:

for i in $(git log --format=%H 2016.11..); do \
    git show --quiet $i | grep -q http://autobuild && \
    git show --quiet --format="%an" $i ; done | sort | uniq -c | \
        sort -rn -k1

     41 Thomas Petazzoni
     20 Peter Korsgaard
     18 Waldemar Brodkorb
     17 Bernd Kuhls
     12 Yann E. MORIN
     12 Baruch Siach
     10 Peter Seiderer
      9 Rahul Bedarkar
      8 J?rg Krause
      6 Gustavo Zacarias
      4 Sam bobroff
      4 Romain Naour
      3 Zakharov Vlad
      3 Carlos Santos
      2 Yegor Yefremov
      2 Vicente Olivert Riera
      2 Johan Oudinet
      2 Francois Perrad
      1 Zoltan Gyarmati
      1 Sergio Prado
      1 Rahul Jain
      1 Maxime Hadjinlian
      1 Matt Weber
      1 Jack Kao
      1 Guillaume GARDET
      1 Gary Bisson
      1 Fabrice Fontaine
      1 Eric Le Bihan
      1 Arnout Vandecappelle
      1 Alvaro Gamez Machado
      1 Alistair Francis
      1 Adam Duskett

This release will become our first long term support release, which
means that we aim to maintain it with security and other important fixes
until 2018.02. We will do regular point releases (2017.02.x) within the
support period.

The next release will be 2017.05. Expect the first release candidate at
the beginning of May and the final release at the end of the month.

The next developers meeting will take place just after FOSDEM in
Brussels, Belgium:

http://elinux.org/Buildroot:DeveloperDaysFOSDEM2017

Many thanks to Google for sponsoring the meeting location! We are still
looking for a sponsor for the dinner Monday evening. Contact us if you
are interested.

During the 2016.11 cycle we had a very nice developers meeting in
Brussels, Belgium. Many thanks to Google and Mind/Essenssium for
sponsoring the event and for all the participants for joining!

A report of the event is available here:

http://lists.busybox.net/pipermail/buildroot/2017-February/183844.html

-- 
Bye, Peter Korsgaard
