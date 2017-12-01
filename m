From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Dec 2017 10:28:56 +0100
Subject: [Buildroot] Buildroot 2017.11 released
Message-ID: <877eu6lrtz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2017.11 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2017.11.tar.gz

or

http://buildroot.net/downloads/buildroot-2017.11.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

This cycle was somewhat smaller than than recent cycles, with "only"
1150 changes all over the tree, but still with more than 100 unique
contributors!

Of noteworthy new features/changes we have:

Openssl is now a virtual package, which may be provided by OpenSSL (now
renamed to libopenssl) or LibreSSL.

libssh2: there is now an explicit choice of the backend to use (mbedtls,
gnutls or openssl). Previously, the choice was implicit based on the TLS
library that was selected. Now, it is possible to choose the backend,
which is important if several TLS libraries are selected.

netsnmp: all MIB files are now installed, making the target filesystem a
bit bigger than before. To remove unneeded MIBS, you should use a
post-build script.

Toolchain: Linaro toolchains updated to 2017.08, ARC toolchain updated
to 2017.09, Glibc updated to 2.26, Glibc support for ARCv2. The
toolchain wrapper now handles SOURCE_DATE_EPOCH for older (pre-gcc7.x)
toolchains for BR2_REPRODUCIBLE.

Reproducible: Do not override SOURCE_DATE_EPOCH if already set in the
environment.

Makefiles: Workaround include order issues for certain make versions
by explicitly sorting the result of wildcard where it matters.

New defconfigs: Atmel SAM45D27, Bananapi M1 and M2 Plus, Engicam
i.CoreM6 Qt5 configuration, i.MX6 sabreauto (mainline kernel/u-boot),
i.MX6Q sabresd Qt5 configuration, i.MX7d-pico, QEMU ppc64le, Raspberry
pi3 Qt5 webengine configuration, Technologic TS-7680.

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

http://git.buildroot.net/buildroot/plain/CHANGES?id=2017.11

Many thanks to the people contributing to this release:

git shortlog -s -n 2017.08..

   242	Bernd Kuhls
   120	Peter Korsgaard
    70	Francois Perrad
    66	Baruch Siach
    63	Yann E. MORIN
    52	Thomas Petazzoni
    49	Adam Duskett
    42	Romain Naour
    36	Samuel Martin
    34	Fabio Estevam
    31	Yegor Yefremov
    17	J?rg Krause
    16	Eric Le Bihan
    16	Peter Seiderer
    15	Olivier Schonken
    13	Angelo Compagnucci
    12	Matt Weber
    11	Aleksander Morgado
    10	Arnout Vandecappelle (Essensium/Mind)
    10	Petr Vorel
     8	Adrian Perez de Castro
     8	Carlos Santos
     8	Fabrice Fontaine
     8	Jagan Teki
     8	Martin Bark
     7	Alexey Brodkin
     7	Evgeniy Didin
     7	Ga?l PORTAY
     7	Joel Stanley
     6	Martin Kepplinger
     6	Ricardo Martincoski
     5	Alexander Mukhin
     5	Andrey Smirnov
     5	Cam Hutchison
     5	Jerzy Grzegorek
     4	Erico Nunes
     4	Joshua Henderson
     4	Luca Ceresoli
     4	Mahyar Koshkouei
     4	Nicholas Sielicki
     4	Petr Kulhavy
     4	Sergey Matyukevich
     4	bradford barr
     3	Bartosz Golaszewski
     3	Julien Floret
     3	Ryan Coe
     3	Sam Voss
     3	Sergio Prado
     3	Thomas De Schampheleire
     2	Alex Suykov
     2	Alfredo Alvarez Fernandez
     2	Andrey Yurovsky
     2	Andr? Hentschel
     2	Christian Stewart
     2	Florian Fainelli
     2	Gary Bisson
     2	Joseph Kogut
     2	Maksim Salau
     2	Marcin Nowakowski
     2	Markus Mayer
     2	Nicolas Ferre
     2	Sven Haardiek
     2	Thomas Claveirole
     2	Waldemar Brodkorb
     1	Adri?n P?rez de Castro
     1	Alexey Roslyakov
     1	Antoine Tenart
     1	Arnout Vandecappelle
     1	Aur?lien Chabot
     1	Breno Lima
     1	Brock Williams
     1	B?la Becker
     1	Chris Packham
     1	Cyril Bur
     1	Danomi Manchego
     1	Dushara Jayasinghe
     1	Erik Stromdahl
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
     1	Ludovic Desroches
     1	Marcin Niestroj
     1	Marcus Folkesson
     1	Mario Lang
     1	Mathieu Audat
     1	Mauro Condarelli
     1	Max Filippov
     1	Mike Harmony
     1	Miquel Raynal
     1	Naoki Matsumoto
     1	Philippe Proulx
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

     29 "Yann E. MORIN" <yann.morin.1998@free.fr>
      6 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
      6 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      5 Samuel Martin <s.martin49@gmail.com>
      4 Olivier Schonken <olivier.schonken@gmail.com>
      2 Yegor Yefremov <yegorslists@googlemail.com>
      2 Romain Naour <romain.naour@gmail.com>
      2 Joel Stanley <joel@jms.id.au>
      2 Jan Kundr?t <jan.kundrat@cesnet.cz>
      2 Bernd Kuhls <bernd.kuhls@t-online.de>
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

Once again our autobuilders have helped us fix a huge amount of build
issues. Thanks to all the people reviewing failures and fixing issues:

for i in $(git log --format=%H 2017.08..); do \
    git show --quiet $i | grep -q http://autobuild && \
    git show --quiet --format="%an" $i ; done | sort | uniq -c | \
        sort -rn -k1

     27 Bernd Kuhls
     25 Thomas Petazzoni
     20 Baruch Siach
     14 Peter Korsgaard
     11 Yann E. MORIN
      6 Matt Weber
      6 Adam Duskett
      5 Peter Seiderer
      3 Francois Perrad
      2 Sergio Prado
      2 Samuel Martin
      2 Romain Naour
      2 Petr Vorel
      2 Olivier Schonken
      2 Luca Ceresoli
      2 Evgeniy Didin
      2 Alex Suykov
      1 Waldemar Brodkorb
      1 Philippe Proulx
      1 Marcin Niestroj
      1 Joel Stanley
      1 Gary Bisson
      1 Fabrice Fontaine
      1 Eric Le Bihan
      1 Cyril Bur
      1 Arnout Vandecappelle (Essensium/Mind)
      1 Aleksander Morgado

The next release will be 2018.02. Expect the first release candidate
soon after FOSDEM and the final release at the end of the month.

This release will be supported with security and other important fixes
until 2018.02 is out. Keep in mind that 2018.02 will become the next LTS
version, supported until February 2019 - So if you would like to see
specific features included, please contribute!

During the 2017.11 cycle we had a very nice developers meeting in
Prague, Czech Republic. Many thanks to Mind/Essenssium for sponsoring the
event and for all the participants for joining!

A report of the event is available here:

http://lists.busybox.net/pipermail/buildroot/2017-October/205429.html

The next developers meeting will take place in Brussels, right after
FOSDEM:

https://elinux.org/Buildroot:DeveloperDaysFOSDEM2018

Many thanks to Google for sponsoring the meeting location! We are still
looking for a sponsor for the dinner Monday evening and/or for travel
expenses. Contact us if you are interested.

-- 
Bye, Peter Korsgaard
