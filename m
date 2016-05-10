From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 May 2016 23:37:17 +0200
Subject: [Buildroot] Buildroot 2016.05-rc1 released
Message-ID: <87shxpk31u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2016.05-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2016.05-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2016.05-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

This was another fairly big development cycle with more than 1200 changes
all over the tree and more than 100 unique contributors! I'm very happy
to see so many "new" people next to the "oldtimers".

Of noteworthy new features/changes we have:

- Architectures: new ARM variants: Cortex A17 and M4, improved nonmmu
  (cortex-M) support, m68k has been re-enabled with support for
  ColdFire. For x86, support for the i386 variant has been dropped.

- Toolchain: Add GCC 6 support, remove GCC 4.5, mark GCC 4.7 as
  deprecated. Go programming language support, Add Binutils 2.26
  support. Old Sourcery PowerPC external toolchains removed, Sourcery
  MIPS 2016.06-8, AMD64 2015.11-139, NiosII 2015.11-130 added, Linaro
  ARM/ARMeb/Aarch64 toolchains updated.

- New defconfigs: Firefly RK3288, Boundary Devices i.MX7 Nitrogen7,
  STM32F429 and STM32F469 Discovery boards, Hardkernel ODROID-C2,
  Raspberry Pi Zero and Raspberry Pi 3. Some Qemu defconfigs were
  added for m68k, eXtensa-nommu and ColdFire.

- Lots (89) of new packages, mainly related to kodi and python.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2016.05-rc1


Many thanks to the people contributing to this release:

git shortlog -s -n 2016.02..

   355	Gustavo Zacarias
   176	Bernd Kuhls
    70	Thomas Petazzoni
    52	J?rg Krause
    44	Peter Korsgaard
    39	Vicente Olivert Riera
    34	Yegor Yefremov
    32	Martin Bark
    28	Yann E. MORIN
    23	Baruch Siach
    23	Frank Hunleth
    21	Gary Bisson
    21	Romain Naour
    19	Luca Ceresoli
    17	Waldemar Brodkorb
    16	Mauro Condarelli
    14	Jerzy Grzegorek
    14	Peter Seiderer
    13	Gabe Evans
    13	Max Filippov
    11	Francois Perrad
     8	Arnout Vandecappelle
     8	Ezequiel Garc?a
     8	Fabio Porcedda
     7	Julian Scheel
     6	Jan Viktorin
     6	Ludovic Desroches
     6	Samuel Martin
     6	Thomas De Schampheleire
     5	Julien CORJON
     5	Pieter Smith
     5	Romain Izard
     5	ludovic.desroches at atmel.com
     4	Alexander Dahl
     4	Beno?t Allard
     4	Ricardo Martincoski
     4	Rodrigo Rebello
     4	Sergio Prado
     3	Alan Ott
     3	Angelo Compagnucci
     3	Beno?t Mauduit
     3	Carlos Santos
     3	Danomi Manchego
     3	David PICARD
     3	Geoff Levand
     3	Gwenhael Goavec-Merou
     3	Julien Corjon
     3	Lee Jones
     3	Maxime Hadjinlian
     2	Andr? Hentschel
     2	Ariel D'Alessandro
     2	Christian Stewart
     2	Cyril Bur
     2	Fabio Estevam
     2	Joris Lijssens
     2	Marcin Niestroj
     2	Masahiro Yamada
     2	Matt Weber
     2	Mike Williams
     2	Olivier Schonken
     2	Pauli Sundberg
     2	Petr Vorel
     2	Phil Eichinger
     2	Ubaldo Porcheddu
     2	Vasant Hegde
     2	Vincent Stehl?
     2	Zoltan Gyarmati
     1	Alexey Brodkin
     1	Alistair Francis
     1	Antoine T?nart
     1	Arnout Vandecappelle (Essensium/Mind)
     1	Atul Singh
     1	Ben Boeckel
     1	Brendan Heading
     1	Brian 'redbeard' Harrington
     1	Brian Kim
     1	Damien Riegel
     1	Doug Kehn
     1	Erdem MEYDANLI
     1	Ian Haylock
     1	Ignacy Gaw?dzki
     1	Jason Abele
     1	Johan Sagaert
     1	Joshua Henderson
     1	Julien BOIBESSOT
     1	Mamatha Inamdar
     1	Marc Gonzalez
     1	Matthew Shyu
     1	Matthew Starr
     1	Maxime Coquelin
     1	Michel Marti
     1	Nicolas Cavallari
     1	Nicolas Dichtel
     1	Niels Skou Olsen
     1	Niranjan Reddy
     1	Nitin Mendiratta
     1	Paulo Zaneti
     1	Rahul Bedarkar
     1	Roland Franke
     1	Sam bobroff
     1	Samuel Mendoza-Jonas
     1	Santosh Multhalli
     1	Schenk, Michael
     1	Sebastian Frias
     1	Stanislav Vasic
     1	Steve Calfee
     1	Tiago Brusamarello
     1	Trent Piepho
     1	Vivien Didelot
     1	kei-k at ca2.so-net.ne.jp
     1	niranjan.reddy

And a special thanks to our patch reviewers:

git log 2016.02.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     47 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
     32 "Yann E. MORIN" <yann.morin.1998@free.fr>
     22 Romain Naour <romain.naour@gmail.com>
     20 Yegor Yefremov <yegorslists@googlemail.com>
      5 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
      4 Julien Corjon <corjon.j@ecagroup.com>
      2 Vicente Olivert Riera <Vincent.Riera@imgtec.com>
      2 Samuel Martin <s.martin49@gmail.com>
      2 Matt Weber <matt@thewebers.ws>
      2 Gustavo Zacarias <gustavo@zacarias.com.ar>
      2 Bernd Kuhls <bernd.kuhls@t-online.de>
      1 Ricardo Martincoski <ricardo.martincoski@gmail.com>
      1 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
      1 Julien Boibessot <julien.boibessot@armadeus.com>
      1 Geoff Levand <geoff@infradead.org>

Like usual, I will now create a next branch and start merging in new
features, rather than wait until 2016.05 is released.

-- 
Bye, Peter Korsgaard
