From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 10:14:04 +0200
Subject: [Buildroot] Buildroot 2017.05 released
Message-ID: <87inkgm8fn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2017.05 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2017.05.tar.gz

or

http://buildroot.net/downloads/buildroot-2017.05.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

This was another big development cycle with more than 1400 changes all
over the tree and more than 100 unique contributors! I'm very happy to
see so many "new" people next to the "oldtimers".

Of noteworthy new features/changes we have:

Infrastructure:

- Installed binaries are now checked for correct architecture to catch
  natively built binaries or binaries built for other architecture
  variants.

- Automatic ext2 rootfs size calculation has been removed. The logic was
  not working working reliable in all setups as it depends on the host
  filesystem behaviour, so instead now the size has to be specified
  explicitly (defaults to 60MB).

- Luarocks infrastructure improvements to extraction handling,
  support for upstream name != Buildroot package name.

- A script to check for common style issues in new packages before
  submitting has been added in support/scripts/check-package

- Infrastructure for runtime testing has been added to support/testing


Toolchain:

- External linaro toolchains updated to 2017.02, ARC toolchain updated
  to 2017.03, NIOSII CodeSourcery to 2017.05

- A number of fixes and improvements to the external toolchain handling,
  including C library detection, multilib and ld.so handling

- Glibc 2.25 and uClibc-ng 1.0.24 added, wordexp support enabled for uClibc-ng

- Binutils 2.28 added and default changed to 2.27


Architectures:

- Support for the C-SKY architecture has been added.


License handling:

- The package license markings for legal info now uses the SPDX short
  identifiers for the license string where possible.


New defconfigs: AT91sam9x5ek dev/mmc/mmc-dev, banana pro, Nationalchip
gx6605s, MIPS creator ci40, nexbox a95x, 64bit defconfig for raspberry
pi 3, stm32f429-disc1.

The raspberry pi zero-w and rpi3 compute module are now also supported
by the rpi0 / rpi3 defconfigs, beaglebone green is supported by the
beaglebone defconfig.

New packages: arp-scan, atest, augeas, bluez-tools, daemon, dc3dd,
dieharder, execline, fmt, ghostscript, gqrx, gst1-vaapi, jo, keepalived,
kmscube, kodi-jsonschemabuilder, kodi-skin-confluence,
kodi-texturepacker, lensfun, leptonica, libbson, libcsv, libgphoto2,
libkcapi, libmaxminddb, libmediaart, libnpth, libscrypt, lua-bit32,
lua-resty-http, lugaru, memtool, mpir, nanomsg, physfs, phytool,
pngquant, python-decorator, python-simplegeneric,
python-sortedcontainers, rpi-bt-firmware, rpi-wifi-firmware, s6, s6-dns,
s6-linux-init, s6-linux-utils, s6-networking, s6-portable-utils, s6-rc,
supertux, tesseract-ocr, uccp420wlan, wilink-bt-firmware

Removed packages: cosmo, firejail, kodi-visualisation-fountain, ola,
polarssl, portmap, xdriver_xf86-video-glide, xdriver_xf86-video-v4l,
xdriver_xf86-video-wsfb

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2017.05

Many thanks to the people contributing to this release:

git shortlog -s -n 2017.02..

   164	Bernd Kuhls
   108	Vicente Olivert Riera
   104	Thomas Petazzoni
    95	Adam Duskett
    89	Baruch Siach
    89	Yann E. MORIN
    80	Romain Naour
    75	Peter Korsgaard
    73	Rahul Bedarkar
    65	Arnout Vandecappelle
    41	Gustavo Zacarias
    30	Fabrice Fontaine
    28	Fabio Estevam
    25	Martin Bark
    23	Ricardo Martincoski
    22	Thomas De Schampheleire
    16	Carlos Santos
    14	Luca Ceresoli
    13	J?rg Krause
    11	Eric Le Bihan
    11	Francois Perrad
    11	Martin Kepplinger
    11	Peter Seiderer
    11	Waldemar Brodkorb
    10	Rodrigo Rebello
    10	Yegor Yefremov
     9	Matt Weber
     9	Zakharov Vlad
     7	Alexey Brodkin
     7	Andrey Smirnov
     6	Beno?t Allard
     6	J?r?me Pouiller
     5	Alistair Francis
     5	Christian Stewart
     5	Gilles Talis
     5	Jerzy Grzegorek
     5	Max Filippov
     5	Rahul Jain
     5	Samuel Martin
     5	Semyon Kolganov
     4	Danomi Manchego
     4	Fabio Porcedda
     4	Gwenhael Goavec-Merou
     4	Julien BOIBESSOT
     4	Pawel Sikora
     4	Pieterjan Camerlynck
     3	Abhimanyu Vishwakarma
     3	Andy Shevchenko
     3	Ga?l PORTAY
     3	Guo Ren
     3	Ilias Apalodimas
     3	Lionel Flandrin
     3	Marcus Hoffmann
     2	Angelo Compagnucci
     2	Bartosz Golaszewski
     2	Cam Mannett
     2	Dagg Stompler
     2	Daniel Black
     2	Dustin Johnson
     2	J Evans
     2	James Balean
     2	Jeroen Roovers
     2	Kurt Van Dijck
     2	Marcin Nowakowski
     2	Matthias Fritzsche
     2	Michael Trimarchi
     2	Paul Cercueil
     2	Philipp Skadorov
     2	Stefan S?rensen
     2	Wolfgang Grandegger
     2	Zoltan Gyarmati
     1	Andrey Yurovsky
     1	Chris Frederick
     1	Chris Packham
     1	Christian Kellermann
     1	Christophe PRIOUZEAU
     1	Daniel Sabogal
     1	David Graziano
     1	Davide Viti
     1	Erwan Gautron
     1	Frank Hunleth
     1	Gary Bisson
     1	Gilad Ben-Yossef
     1	Gon?alo Salazar
     1	Ignacy Gaw?dzki
     1	Ilya Kuzmich
     1	Jack Breese
     1	Jagan Teki
     1	Jan Kundr?t
     1	Joeri Barbarien
     1	Julien Beraud
     1	Julien Viard de Galbert
     1	Karoly Pados
     1	Kevin JOLY
     1	Krzysztof Konopko
     1	Ludovic Desroches
     1	Mario J. Rugiero
     1	Matthew Fornero
     1	Michael Heinemann
     1	Oleg Kitain
     1	Phelip Etienne
     1	Ryan Coe
     1	Sam Mendoza-Jonas
     1	Sam bobroff
     1	Steve Kenton
     1	S?bastien Szymanski
     1	Vlad Zakharov
     1	Wojciech Nizi?ski
     1	gilles.talis at gmail.com

And a special thanks to our patch reviewers:

git log 2017.02.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     30 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
     17 "Yann E. MORIN" <yann.morin.1998@free.fr>
     10 Yegor Yefremov <yegorslists@googlemail.com>
      9 Romain Naour <romain.naour@gmail.com>
      5 Samuel Martin <s.martin49@gmail.com>
      5 Matt Weber <matthew.weber@rockwellcollins.com>
      3 Bernd Kuhls <bernd.kuhls@t-online.de>
      3 Alexandre Belloni <alexandre.belloni@free-electrons.com>
      2 Waldemar Brodkorb <wbx@openadk.org>
      2 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
      2 Ricardo Martincoski <ricardo.martincoski@gmail.com>
      2 Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
      2 Peter Seiderer <ps.report@gmx.net>
      2 Matthew Weber <matthew.weber@rockwellcollins.com>
      2 Erico Nunes <nunes.erico@gmail.com>
      2 Cyril Bur <cyrilbur@gmail.com>
      2 Chris Packham <judge.packham@gmail.com>
      2 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      2 Angelo Compagnucci <angelo.compagnucci@gmail.com>
      1 Yann E. MORIN <yann.morin.1998@free.fr>
      1 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
      1 Steve Kenton <skenton@ou.edu>
      1 Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
      1 Mario J. Rugiero <mrugiero@gmail.com>
      1 Francois Perrad <francois.perrad@gadz.org>
      1 Paul Cercueil <paul.cercueil@analog.com>

Once again our autobuilders have helped us fix a huge amount of build
issues. Thanks to all the people reviewing failures and fixing issues:

for i in $(git log --format=%H 2017.02..); do \
    git show --quiet $i | grep -q http://autobuild && \
    git show --quiet --format="%an" $i ; done | sort | uniq -c | \
        sort -rn -k1

     53 Thomas Petazzoni
     27 Romain Naour
     22 Baruch Siach
     21 Bernd Kuhls
     11 Yann E. MORIN
      6 Rahul Bedarkar
      5 Peter Seiderer
      5 Matt Weber
      4 Alistair Francis
      3 Yegor Yefremov
      3 Vicente Olivert Riera
      3 Rodrigo Rebello
      2 Zakharov Vlad
      2 Waldemar Brodkorb
      2 Pieterjan Camerlynck
      2 Martin Bark
      2 Gilles Talis
      2 Fabrice Fontaine
      2 Fabio Estevam
      2 Arnout Vandecappelle
      2 Alexey Brodkin
      1 Thomas De Schampheleire
      1 Stefan S?rensen
      1 Semyon Kolganov
      1 Samuel Martin
      1 Sam bobroff
      1 Paul Cercueil
      1 Max Filippov
      1 Martin Kepplinger
      1 Marcus Hoffmann
      1 Marcin Nowakowski
      1 Julien BOIBESSOT
      1 Ilias Apalodimas
      1 Gwenhael Goavec-Merou
      1 Francois Perrad
      1 Eric Le Bihan
      1 Dagg Stompler
      1 Bartosz Golaszewski

The next release will be 2017.08. Expect the first release candidate at
the beginning of August and the final release at the end of the month.

This release will be supported with security and other important fixes
until 2017.08 is out. If you need longer support then consider using our
long term support release (2017.02.x) instead which will be supported
until 2018.02.

-- 
Bye, Peter Korsgaard
