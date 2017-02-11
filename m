From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Feb 2017 16:24:18 +0100
Subject: [Buildroot] Buildroot 2017.02-rc1 released
Message-ID: <20170211162418.6b76579b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2017.02-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2017.02-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2017.02-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

With 1218 changes, this cycle is almost exactly as busy as the
2016.11-rc1 cycle, and again a bit more than 100 different persons
contributed patches.

Important changes and improvements
==================================

Infrastructure:

  - numerous improvements to support reproducible builds

  - new waf-package package infrastructure to support packages
    that use the Waf build system. 6 packages converted to
    this infrastructure.

  - add option <pkg>_PREFER_INSTALLER to the perl package
    infrastructure

Architecture:

  - add support for the OpenRISC CPU architecture

  - merge description of the ARM and ARM64 options, and add
    support for selecting a specific ARM64 core

Toolchain:

  - major rework of the external toolchain support. It is now
    split into several packages, one per external toolchain,
    and a common infrastructure.

  - important fix for musl to prevent a conflict between musl
    and kernel headers (fixes the build of numerous packages
    with musl)

  - uClibc-ng bumped to 1.0.22, and therefore enable uClibc
    for ARM64, mips32r6 and mips64r6

  - add gdb 7.12.1, and switch to gdb 7.11 as the default

  - Linaro toolchains updated to 2016.11, ARC toolchain
    components updated to arc-2016.09, MIPS Codescape
    toolchains bumped to 2016.05-06, CodeSourcery AMD64 and
    NIOS2 toolchains bumped

  - remove Analog Devices toolchain for the Blackfin
    architecture, remove pre-built musl toolchains from
    musl.codu.org

New defconfigs: Freescale i.MX23EVK, Qemu OpenRISC emulation,
Qemu NIOS2 emulation, Grinn chiliBoard, Freescale i.MX6Q
SabreSD, BeagleBoard X15, OrangePi One, ARC HS38 HAPS

New packages: angular-websocket, aubio, bctoolbox, darkhttpd,
ddrescue, easydbus, fakedate, git-crypt, hiredis, ifenslave,
jsmn, libgpiod, libgsm, linux-syscall-support, mariadb, mimic,
nginx-dav-ext, nmon, opkg-utils, policycoreutils,
pru-software-support, python-arrow, python-attrs,
python-babel, python-bitstring, python-chardet,
python-constantly, python-flask-babel, python-gunicorn,
python-incremental, python-jsonschema, python-logbook,
python-markdown2, python-mbstrdecoder, python-mutagen,
python-pathpy, python-pudb, python-pyqrcode,
python-pytablereader, python-setuptools-scm, python-sh,
python-toml, python-vcversioner, python-whoosh,
raspberrypi-usbboot, riemann-c-client, rtl8723bs, skalibs,
sslh, sngrep, ti-cgt-pru, uclibc-ng-test, udpxy, uhttpd,
upower, ustream-ssl, waf, xlib_libXfont2

Removed packages: perl-db-file, snowball-hdmiservice,
snowball-init

Tooling: addition of a test-pkg script to help contributors
build test their package.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2017.02-rc1

Statistics
==========

Many thanks to the people contributing to this release:

git shortlog -s -n 2016.11..

   163  Gustavo Zacarias
   102  Bernd Kuhls
    92  Peter Korsgaard
    90  Vicente Olivert Riera
    83  Thomas Petazzoni
    49  Fabio Estevam
    48  Romain Naour
    43  Yegor Yefremov
    42  Baruch Siach
    41  Adam Duskett
    36  J?rg Krause
    35  Yann E. MORIN
    34  Francois Perrad
    28  Peter Seiderer
    20  Waldemar Brodkorb
    15  Fabrice Fontaine
    15  Rahul Bedarkar
    14  J?r?me Pouiller
    12  Arnout Vandecappelle
    10  Danomi Manchego
     9  Lionel Flandrin
     9  Thomas De Schampheleire
     8  Dagg Stompler
     8  David Bachelart
     8  Sam bobroff
     7  James Knight
     6  Angelo Compagnucci
     6  Erico Nunes
     6  Luca Ceresoli
     6  Marcin Niestroj
     6  Naumann Andreas
     6  Zoltan Gyarmati
     5  Chris Packham
     5  Frank Hunleth
     5  Martin Kepplinger
     5  Rahul Jain
     5  Sergey Matyukevich
     5  Zakharov Vlad
     4  Alvaro G. M
     4  Bartosz Golaszewski
     4  Carlos Santos
     4  Eric Le Bihan
     4  Gustavo Sverzut Barbieri
     4  Ryan Coe
     3  Alexey Brodkin
     3  Andy Shevchenko
     3  Ash Charles
     3  Brian Redbeard
     3  Bryce Ferguson
     3  Christian Stewart
     3  Ezequiel Garcia
     3  Gary Bisson
     3  Gilles Chanteperdrix
     3  Jerzy Grzegorek
     3  Johan Oudinet
     3  Julien Corjon
     3  Martin Bark
     3  Matt Weber
     3  Maxime Hadjinlian
     3  Petr Vorel
     3  Tobias Klauser
     3  Wolfgang Grandegger
     2  Alistair Francis
     2  Andr? Hentschel
     2  Brandon Maier
     2  Clayton Shotwell
     2  Gilles Talis
     2  Marcin Nowakowski
     2  Matt Kraai
     2  Max Filippov
     2  Misha Komarovskiy
     2  Phil Eichinger
     1  Alexey Neyman
     1  Alvaro Gamez Machado
     1  Bimal Jacob
     1  Chris Frederick
     1  Christian Kellermann
     1  Daniel Mack
     1  Fabien Parent
     1  Fabio Porcedda
     1  Francesco Negri
     1  Ga?l PORTAY
     1  Guillaume GARDET
     1  Jack Kao
     1  Jean-Baptiste Tr?dez
     1  Jens Kleintje
     1  Jordan Yelloz
     1  Judd Meinders
     1  Julien Floret
     1  Lothar Felten
     1  Marcus Hoffmann
     1  Matt Flax
     1  Michael Walle
     1  Nicolas Cavallari
     1  Patrick Devlin
     1  Paul Cercueil
     1  Ray Kinsella
     1  Sam Mendoza-Jonas
     1  Sergio Prado
     1  Stewart Smith
     1  S?bastien Szymanski
     1  Tal Shorer
     1  Tatsuyuki Ishi
     1  Theo Debrouwere
     1  Trent Piepho

And a special thanks to our patch reviewers:

git log 2016.11.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     43 Romain Naour <romain.naour@gmail.com>
     16 "Yann E. MORIN" <yann.morin.1998@free.fr>
      9 Yegor Yefremov <yegorslists@googlemail.com>
      9 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      7 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
      5 Luca Ceresoli <luca@lucaceresoli.net>
      4 Samuel Martin <s.martin49@gmail.com>
      3 Bernd Kuhls <bernd.kuhls@t-online.de>
      2 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
      2 Gustavo Zacarias <gustavo@zacarias.com.ar>
      2 Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
      1 Steven Rostedt <rostedt@goodmis.org>
      1 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
      1 Mark Charlebois <charlebm@gmail.com>
      1 Julien Corjon <corjon.j@ecagroup.com>
      1 Joel Stanley <joel@jms.id.au>
      1 Francois Perrad <francois.perrad@gadz.org>
      1 Carlos Santos <casantos@datacom.ind.br>
      1 Alexey Brodkin <abrodkin@synopsys.com>

Like usual, I will now create a next branch and start merging in new
features, rather than wait until 2017.02 is released.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
