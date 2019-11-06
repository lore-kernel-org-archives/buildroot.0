From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Nov 2019 15:38:59 +0100
Subject: [Buildroot] Buildroot 2019.11-rc1 released
Message-ID: <87h83hdq7w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2019.11-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2019.11-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2019.11-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

Once more a very busy development cycle with more than 1500 changes and
contributions from 130 unique contributors!

Of noteworthy new features/changes we have:

 - Dependencies: Gcc/g++ 4.8 or newer is now required on the build host.
   Ensure host has JSON::PP perl module installed if webkitgtk/wpewebkit
   packages are enabled as it is needed during their build process.

 - Toolchain: Add support for the D programming language (GCC 9.x, Glibc).

   GCC 9.x updated to 9.2.0, Glibc updated to 2.30, Musl updated to
   1.1.24, uClibc-ng updated to 1.0.32, ARC toolchain updated to
   arc-2019.09-eng002.

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

http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.11-rc1


Many thanks to the people contributing to this release:

git shortlog -s -n 2019.08..

   241	Fabrice Fontaine
   220	Bernd Kuhls
   200	Asaf Kahlon
    64	Peter Korsgaard
    63	Thomas Petazzoni
    42	Carlos Santos
    39	Francois Perrad
    39	Pierre-Jean Texier
    37	Romain Naour
    34	Yann E. MORIN
    32	Matt Weber
    29	James Hilliard
    28	Christopher McCrory
    26	Peter Seiderer
    25	Eric Le Bihan
    22	Adam Duskett
    17	Giulio Benetti
    15	Baruch Siach
    13	Nicolas Carrier
    13	Petr Vorel
    12	Arnout Vandecappelle (Essensium/Mind)
    12	Fabio Estevam
    12	Titouan Christophe
    11	Adrian Perez de Castro
    11	Bartosz Bilas
    11	Jerzy Grzegorek
    10	J?rg Krause
    10	Ricardo Martincoski
    10	Sergey Matyukevich
     9	Heiko Thiery
     8	Chris Packham
     8	Grzegorz Blach
     7	Angelo Compagnucci
     7	Etienne Carriere
     7	Marcin Niestroj
     7	Nicolas Serafini
     7	Yegor Yefremov
     6	Adrien Gallou?t
     6	Gilles Talis
     5	Lubomir Rintel
     5	Micha? ?yszczek
     4	Andr? Hentschel
     4	Joris Offouga
     4	Ryan Coe
     4	Thomas Claveirole
     4	Vivien Didelot
     3	Aleksander Morgado
     3	Alexander Dahl
     3	Alexander Mukhin
     3	Alistair Francis
     3	Evgeniy Didin
     3	Joseph Kogut
     3	Koen Martens
     3	Louis Aussedat
     3	Louis-Paul Cordier
     3	Nicola Di Lieto
     3	Peter Macleod Thompson
     3	Philippe Proulx
     3	Sam Voss
     3	Sergio Prado
     3	Simon Rowe
     3	S?bastien Szymanski
     3	Zoltan Gyarmati
     2	Esben Haabendal
     2	Ilya Averyanov
     2	Joel Stanley
     2	Julien Grossholtz
     2	Marcus Folkesson
     2	Max Filippov
     2	Mohana Datta Yelugoti
     2	Patrick Havelange
     2	Refik TUZAKLI
     2	Robert Hancock
     2	Samuel Mendoza-Jonas
     2	Stephan Henningsen
     2	Thomas De Schampheleire
     2	Thomas Preston
     2	Vadim Kochan
     2	Valentin Korenblit
     2	Yann Droneaud
     1	Adrien Ricciardi
     1	Alexander Kurz
     1	Alexey Brodkin
     1	Alexey Lukyanchuk
     1	Andrey Skvortsov
     1	Atharva Lele
     1	Aussedat Louis
     1	Bartosz Golaszewski
     1	Charlie Turner
     1	Christian Stewart
     1	Dan Walkes
     1	Einar Jon Gunnarsson
     1	Frank Hunleth
     1	Gergely Imreh
     1	Gwenhael
     1	Gwenhael Goavec-Merou
     1	Ian Haylock
     1	Ismael Luceno
     1	Jagan Teki
     1	Joel Carlson
     1	Julien Floret
     1	J?r?my Rosen
     1	Kieran Bingham
     1	Lothar Felten
     1	Luca Ceresoli
     1	Mark Corbin
     1	Markus Mayer
     1	Martin Bark
     1	Martin Kepplinger
     1	Mauro Condarelli
     1	Maxime Madau
     1	McCabe, Robert J
     1	Mehmet Sami Tok
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
      9 Yann E. MORIN <yann.morin.1998@free.fr>
      5 Yegor Yefremov <yegorslists@googlemail.com>
      4 Petr Vorel <petr.vorel@gmail.com>
      4 Matt Weber <matthew.weber@rockwellcollins.com>
      3 Romain Naour <romain.naour@smile.fr>
      3 Romain Naour <romain.naour@gmail.com>
      3 Giulio Benetti <giulio.benetti@benettiengineering.com>
      3 Bernd Kuhls <bernd.kuhls@t-online.de>
      3 Adrian Perez de Castro <aperez@igalia.com>
      2 Pierre-Jean Texier <pjtexier@koncepto.io>
      2 Giulio Benetti <giulio.benetti@micronovasrl.com>
      2 Fabio Estevam <festevam@gmail.com>
      2 Chris Packham <judge.packham@gmail.com>
      1 Yann E. MORIN <yann.morin@orange.com>
      1 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
      1 Sergey Matyukevich <geomatsi@gmail.com>
      1 Peter Seiderer <ps.report@gmx.net>
      1 Paul Cercueil <paul@crapouillou.net>
      1 Palmer Dabbelt <palmer@sifive.com>
      1 J?rg Krause <joerg.krause@embedded.rocks>
      1 James Hilliard <james.hilliard1@gmail.com>
      1 Heiko Thiery <heiko.thiery@kontron.com>
      1 Gerome Burlats <gerome.burlats@smile.fr>
      1 Erico Nunes <nunes.erico@gmail.com>
      1 Carlos Santos <unixmania@gmail.com>
      1 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      1 Aleksander Morgado <aleksander@aleksander.es>

I will now create a next branch and start merging new features for
2020.02 already in parallel with the 2019.11 stabilization.

-- 
Bye, Peter Korsgaard
