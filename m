From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Nov 2017 22:19:20 +0100
Subject: [Buildroot] Buildroot 2017.11-rc1 released
Message-ID: <874lq7w1ev.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2017.11-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2017.11-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2017.11-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

Slightly smaller (1026 changes) than other recent cycles, but still a
lot of activity and contributions from more than 100 unique
contributors!

Of noteworthy new features/changes we have:

- Openssl is now a virtual package, which may be provided by OpenSSL
  (now renamed to libopenssl) or LibreSSL.

- libssh2: there is now an explicit choice of the backend to use
  (mbedtls, gnutls or openssl). Previously, the choice was implicit
  based on the TLS library that was selected. Now, it is possible to
  choose the backend, which is important if several TLS libraries are
  selected.

- netsnmp: all MIB files are now installed, making the target filesystem
  a bit bigger than before. To remove unneeded MIBS, you should use a
  post-build script.

- New defconfigs: Atmel SAM45D27, Bananapi M1 and M2 Plus, Engicam
  i.CoreM6 Qt5 configuration, i.MX6 sabreauto (mainline kernel/u-boot),
  i.MX6Q sabresd Qt5 configuration, i.MX7d-pico, QEMU ppc64le, Raspberry
  pi3 Qt5 webengine configuration, Technologic TS-7680.

- Linaro ARM(eb) 2017.08 support, Glibc 2.26, Glibc support for ARCv2

- Reproducible: SOURCE_DATE_EPOCH handling in the toolchain wrapper for
  older (pre-gcc7) compilers.


New packages: asterisk, azmq, bcg729, boinc, dahdi-linux, dahdi-tools,
freeswitch-mod-bcg729, fscryptctl, libb64, libpri, libss7, lua-basexx,
lua-compat53, lua-cqueues, lua-curl, lua-datafile, lua-fifo, lua-httpd,
lua-lpeg-patterns, lua-markdown, lua-sailor, lua-value, luksmeta,
minetest, minetest-game, pdmenu, prosody, python-aiocoap,
python-automat, python-ibmiotf, python-iso8601, python-m2r,
python-simplesqlite, python-websockets, python-xmltodict, qt5wayland,
qt5webengine, restorecond, selinux-python, semodule-utils, uhubctl,
wireguard, wsapi-fcgi, wsapi-xavante

Removed packages: aiccu, rfkill, sepolgen

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2017.11-rc1


Many thanks to the people contributing to this release:

git shortlog -s -n 2017.08..

   223	Bernd Kuhls
   102	Peter Korsgaard
    70	Francois Perrad
    62	Baruch Siach
    50	Yann E. MORIN
    44	Adam Duskett
    40	Romain Naour
    36	Samuel Martin
    34	Thomas Petazzoni
    32	Fabio Estevam
    31	Yegor Yefremov
    16	Eric Le Bihan
    16	J?rg Krause
    15	Olivier Schonken
    12	Angelo Compagnucci
    12	Peter Seiderer
    11	Aleksander Morgado
     9	Matt Weber
     8	Arnout Vandecappelle (Essensium/Mind)
     8	Petr Vorel
     7	Alexey Brodkin
     7	Carlos Santos
     7	Jagan Teki
     6	Ga?l PORTAY
     6	Martin Bark
     6	Martin Kepplinger
     6	Ricardo Martincoski
     5	Adrian Perez de Castro
     5	Alexander Mukhin
     5	Cam Hutchison
     5	Fabrice Fontaine
     5	Jerzy Grzegorek
     5	Joel Stanley
     4	Andrey Smirnov
     4	Erico Nunes
     4	Evgeniy Didin
     4	Joshua Henderson
     4	Mahyar Koshkouei
     4	Nicholas Sielicki
     4	Petr Kulhavy
     4	Sergey Matyukevich
     4	bradford barr
     3	Bartosz Golaszewski
     3	Julien Floret
     3	Ryan Coe
     3	Sergio Prado
     3	Thomas De Schampheleire
     2	Alfredo Alvarez Fernandez
     2	Christian Stewart
     2	Florian Fainelli
     2	Joseph Kogut
     2	Luca Ceresoli
     2	Maksim Salau
     2	Marcin Nowakowski
     2	Markus Mayer
     2	Nicolas Ferre
     2	Sam Voss
     2	Sven Haardiek
     2	Thomas Claveirole
     2	Waldemar Brodkorb
     1	Adri?n P?rez de Castro
     1	Alex Suykov
     1	Alexey Roslyakov
     1	Andr? Hentschel
     1	Antoine Tenart
     1	Arnout Vandecappelle
     1	Aur?lien Chabot
     1	Breno Lima
     1	Brock Williams
     1	B?la Becker
     1	Chris Packham
     1	Dushara Jayasinghe
     1	Erik Stromdahl
     1	Gary Bisson
     1	Guo Ren
     1	Gustavo Zacarias
     1	Jason A. Donenfeld
     1	Joe Lin
     1	Johan Oudinet
     1	Julien BOIBESSOT
     1	Julien Corjon
     1	Julien Grossholtz
     1	Kurt Van Dijck
     1	Lothar Felten
     1	Marcin Niestroj
     1	Marcus Folkesson
     1	Mathieu Audat
     1	Mauro Condarelli
     1	Max Filippov
     1	Mike Harmony
     1	Miquel Raynal
     1	Naoki Matsumoto
     1	RJ Ascani
     1	Robin Jarry
     1	Sam Mendoza-Jonas
     1	Samuel Mendoza-Jonas
     1	Scott Ellis
     1	Thomas Faivre
     1	Thomas Preston
     1	Timothy Lee
     1	Vanessa Maegima
     1	Vicente Olivert Riera
     1	Wolfgang Grandegger

And a special thanks to our patch reviewers:

git log 2017.08.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     24 "Yann E. MORIN" <yann.morin.1998@free.fr>
      6 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      4 Olivier Schonken <olivier.schonken@gmail.com>
      2 Yegor Yefremov <yegorslists@googlemail.com>
      2 Romain Naour <romain.naour@gmail.com>
      2 Joel Stanley <joel@jms.id.au>
      2 Jan Kundr?t <jan.kundrat@cesnet.cz>
      2 Bernd Kuhls <bernd.kuhls@t-online.de>
      1 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
      1 Samuel Martin <s.martin49@gmail.com>
      1 Rahul Bedarkar <rahulbedarkar89@gmail.com>
      1 Peter Seiderer <ps.report@gmx.net>
      1 J?rg Krause <joerg.krause@embedded.rocks>
      1 "J?rg Krause <joerg.krause@embedded.rocks>"
      1 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
      1 Dagg <daggs@gmx.com>
      1 Christian Stewart <christian@paral.in>
      1 Carlos Santos <casantos@datacom.ind.br>
      1 Andr? Hentschel <nerv@dawncrow.de>
      1 Alistair Francis <alistair.francis@xilinx.com>

Like usual, I will now create a next branch and start merging in new
features, rather than wait until 2017.11 is released.

-- 
Bye, Peter Korsgaard
