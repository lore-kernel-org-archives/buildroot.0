From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Dec 2019 23:02:57 +0100
Subject: [Buildroot] Buildroot 2019.11 released
Message-ID: <87r21npuum.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2019.11 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2019.11.tar.gz

or

http://buildroot.net/downloads/buildroot-2019.11.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

This was one of the biggest development cycles we have ever had with
more than 1700 changes all over the tree and more than 130 unique
contributors! I'm once again very happy to see so many "new" people next
to the "oldtimers".

Of noteworthy new features/changes we have:

 - Dependencies: Gcc/g++ 4.8 or newer is now required on the build host.
   Ensure host has JSON::PP perl module installed if webkitgtk/wpewebkit
   packages are enabled as it is needed during their build process.

 - Toolchain: Add support for the D programming language (GCC 9.x, Glibc).

   GCC 9.x updated to 9.2.0, Glibc updated to 2.30, Musl updated to
   1.1.24, uClibc-ng updated to 1.0.32, ARC toolchain updated to
   arc-2019.09-rc1.

   Musl: Add a patch to add support for sched_{get,set}scheduler() and
   sched_{get,set}param() for compatibility.

 - New defconfigs: Beaglebone AI, FriendlyARM Nanopi NEO Plus2, Libre
   Computer "La Frite", QEMU Armv7-A with trustzone/OP-TEE, STM32MP157
   Discovery Kit

 - New packages: caps, collectl, dav1d, fstrcmp, ima-evm-utils,
   jitterentropy-library, kodi-vfs-rar, kodi-vfs-sftp,
   libavl,libhttpserver, libmspack, libnetconf2, libolm, libyang,
   linux-serial-test, lrzip, mdevd, minimodem, musl-fts, netifrc, ogre,
   openlayers, python-aioredis, python-asgiref,
   python-backports-functools-lru-cache, python-bluezero, python-brotli,
   python-channels, python-channels-redis, python-colorlog,
   python-daphne, python-django-enumfields, python-jaraco-functools,
   python-kiwisolver, python-msgfy, python-rpi-ws281x,
   python-setuptools-scm-git-archive, python-simplelogging,
   python-soupsieve, python-sqliteschema, python-sqlparse, python-tqdm,
   python-webencodings, qt5webview, restclient-cpp, ripgrep,
   snmpclitools, sunwait, sysrepo, uacme, utf8proc, uvw, ytree

 - Arch: RISC-V: Default to a sensible floating point ABI based on the
   selected ISA extensions rather than always defaulting to ILP32/64

 - Br2-external: Linux kernel extensions can now also be provided in an
   external tree by adding packages under linux/linux-ext-*.mk. See the
   manual for details.

 - Fakeroot now works correctly under Microsoft Windows 10 Services for
   Linux, which does not provide SYSV IPC support

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.11

Many thanks to the people contributing to this release:

git shortlog -s -n 2019.08..

   277	Fabrice Fontaine
   237	Bernd Kuhls
   200	Asaf Kahlon
    92	Peter Korsgaard
    77	Thomas Petazzoni
    63	Mark Corbin
    44	Carlos Santos
    43	Yann E. MORIN
    39	Francois Perrad
    39	Pierre-Jean Texier
    38	Romain Naour
    33	Matt Weber
    30	James Hilliard
    29	Peter Seiderer
    28	Christopher McCrory
    25	Adam Duskett
    25	Eric Le Bihan
    18	Giulio Benetti
    16	Petr Vorel
    15	Baruch Siach
    14	Titouan Christophe
    13	Adrian Perez de Castro
    13	Arnout Vandecappelle (Essensium/Mind)
    13	Bartosz Bilas
    13	Nicolas Carrier
    12	Fabio Estevam
    11	Jerzy Grzegorek
    11	J?rg Krause
    10	Ricardo Martincoski
    10	Sergey Matyukevich
     9	Heiko Thiery
     9	Yegor Yefremov
     8	Chris Packham
     8	Grzegorz Blach
     7	Angelo Compagnucci
     7	Etienne Carriere
     7	Marcin Niestroj
     7	Nicolas Serafini
     6	Adrien Gallou?t
     6	Gilles Talis
     5	Lubomir Rintel
     5	Micha? ?yszczek
     4	Aleksander Morgado
     4	Andr? Hentschel
     4	Evgeniy Didin
     4	Joris Offouga
     4	Michael Vetter
     4	Ryan Coe
     4	Thomas Claveirole
     4	Vivien Didelot
     3	Alexander Dahl
     3	Alexander Mukhin
     3	Alistair Francis
     3	Christian Stewart
     3	Joseph Kogut
     3	Koen Martens
     3	Louis Aussedat
     3	Louis-Paul Cordier
     3	Nicola Di Lieto
     3	Pascal de Bruijn
     3	Peter Macleod Thompson
     3	Philippe Proulx
     3	Sam Voss
     3	Sergio Prado
     3	Simon Rowe
     3	S?bastien Szymanski
     3	Thomas Preston
     3	Zoltan Gyarmati
     2	Avi Shukron
     2	Esben Haabendal
     2	Ilya Averyanov
     2	Joel Stanley
     2	Julien Grossholtz
     2	J?r?my Rosen
     2	Marcus Folkesson
     2	Max Filippov
     2	Mohana Datta Yelugoti
     2	Patrick Havelange
     2	Refik TUZAKLI
     2	Robert Hancock
     2	Samuel Mendoza-Jonas
     2	Stephan Henningsen
     2	Thomas De Schampheleire
     2	Vadim Kochan
     2	Valentin Korenblit
     2	Yann Droneaud
     1	Adrien Ricciardi
     1	Alexander Kurz
     1	Alexey Brodkin
     1	Alexey Lukyanchuk
     1	Andrey Skvortsov
     1	Anthony Viallard
     1	Atharva Lele
     1	Aussedat Louis
     1	Bartosz Golaszewski
     1	Charlie Turner
     1	Dan Walkes
     1	Einar Jon Gunnarsson
     1	Frank Hunleth
     1	Gergely Imreh
     1	Gwenhael
     1	Gwenhael Goavec-Merou
     1	Ian Haylock
     1	Ismael Luceno
     1	Jagan Teki
     1	James Byrne
     1	Joel Carlson
     1	Julien Floret
     1	Kieran Bingham
     1	Lothar Felten
     1	Luca Ceresoli
     1	Markus Mayer
     1	Martin Bark
     1	Martin Kepplinger
     1	Mauro Condarelli
     1	Maxime Madau
     1	McCabe, Robert J
     1	Mehmet Sami Tok
     1	Michael Drake
     1	Michael Walle
     1	Neil Armstrong
     1	Nicolas Cavallari
     1	Oleksandr Zhadan
     1	Paulo Matos
     1	Rapha?l M?lotte
     1	Sam Lancia
     1	Shyam Saini
     1	Stephan Hoffmann
     1	Stephen Bos
     1	S?rensen, Stefan
     1	Thomas Huth
     1	Thuan Ho
     1	Victor Huesca
     1	Waldemar Brodkorb
     1	Wolfgang Grandegger
     1	stefan.nickl at gmail.com


And a special thanks to our patch reviewers:

git log 2019.08.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     16 Ricardo Martincoski <ricardo.martincoski@gmail.com>
     10 Yann E. MORIN <yann.morin.1998@free.fr>
      6 Yegor Yefremov <yegorslists@googlemail.com>
      5 Petr Vorel <petr.vorel@gmail.com>
      4 Matt Weber <matthew.weber@rockwellcollins.com>
      3 Romain Naour <romain.naour@smile.fr>
      3 Romain Naour <romain.naour@gmail.com>
      3 Giulio Benetti <giulio.benetti@benettiengineering.com>
      3 Bernd Kuhls <bernd.kuhls@t-online.de>
      3 Adrian Perez de Castro <aperez@igalia.com>
      2 Pierre-Jean Texier <pjtexier@koncepto.io>
      2 Peter Seiderer <ps.report@gmx.net>
      2 Giulio Benetti <giulio.benetti@micronovasrl.com>
      2 Fabio Estevam <festevam@gmail.com>
      2 Chris Packham <judge.packham@gmail.com>
      2 Carlos Santos <unixmania@gmail.com>
      1 Yann E. MORIN <yann.morin@orange.com>
      1 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
      1 Sergey Matyukevich <geomatsi@gmail.com>
      1 Paul Cercueil <paul@crapouillou.net>
      1 Palmer Dabbelt <palmer@sifive.com>
      1 Matthew Weber <matthew.weber@rockwellcollins.com>
      1 J?rg Krause <joerg.krause@embedded.rocks>
      1 J?r?my Rosen <jeremy.rosen@smile.fr>
      1 James Hilliard <james.hilliard1@gmail.com>
      1 Heiko Thiery <heiko.thiery@kontron.com>
      1 Gerome Burlats <gerome.burlats@smile.fr>
      1 Francois Perrad <francois.perrad@gadz.org>
      1 Erico Nunes <nunes.erico@gmail.com>
      1 Baruch Siach <baruch@tkos.co.il>
      1 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      1 Alexander Dahl <post@lespocky.de>
      1 Aleksander Morgado <aleksander@aleksander.es>


Once again our autobuilders have helped us fix a huge amount of build
issues. Thanks to all the people reviewing failures and fixing issues:

for i in $(git log --format=%H 2019.08..); do \
    git show --quiet $i | grep -q http://autobuild && \
    git show --quiet --format="%an" $i ; done | sort | uniq -c | \
        sort -rn -k1

    124 Fabrice Fontaine
     20 Bernd Kuhls
     10 Thomas Petazzoni
      8 Peter Seiderer
      6 Asaf Kahlon
      5 Matt Weber
      4 Giulio Benetti
      3 Sergey Matyukevich
      3 Baruch Siach
      2 Romain Naour
      2 Petr Vorel
      2 Peter Korsgaard
      2 Carlos Santos
      1 Yegor Yefremov
      1 Vadim Kochan
      1 Titouan Christophe
      1 Thomas Claveirole
      1 Nicola Di Lieto
      1 Joseph Kogut
      1 Joel Carlson
      1 Heiko Thiery
      1 Grzegorz Blach
      1 Evgeniy Didin
      1 Chris Packham
      1 Arnout Vandecappelle (Essensium/Mind)
      1 Adam Duskett


The next release will be 2020.02. Expect the first release candidate at
the beginning of February and the final release at the end of the month.

This release will be supported with security and other important fixes
until 2020.02 is out. 2020.02 will become the next long term support
release (supported until February 2021).

Enjoy!

-- 
Bye, Peter Korsgaard
