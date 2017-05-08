From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 08 May 2017 12:41:07 +0200
Subject: [Buildroot] Buildroot 2017.05-rc1 released
Message-ID: <87pofjpr5o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2017.05-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2017.05-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2017.05-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

With 1287 changes, this cycle is almost exactly as busy as the 2017.02
cycle (1218 changes), and again a bit more than 100 different persons
contributed patches.

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
  to 2017.03-rc1, NIOSII CodeSourcery to 2017.05

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


Removed packages: cosmo, kodi-visualisation-fountain, polarssl, portmap,
xdriver_xf86-video-glide, xdriver_xf86-video-v4l, xdriver_xf86-video-wsfb

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2017.05-rc1


Many thanks to the people contributing to this release:

git shortlog -s -n 2017.02..

   137	Bernd Kuhls
   101	Vicente Olivert Riera
    94	Adam Duskett
    83	Yann E. MORIN
    81	Baruch Siach
    81	Thomas Petazzoni
    73	Rahul Bedarkar
    65	Arnout Vandecappelle
    60	Romain Naour
    58	Peter Korsgaard
    41	Gustavo Zacarias
    30	Fabrice Fontaine
    28	Fabio Estevam
    25	Martin Bark
    23	Ricardo Martincoski
    22	Thomas De Schampheleire
    16	Carlos Santos
    13	J?rg Krause
    11	Eric Le Bihan
    11	Francois Perrad
    11	Martin Kepplinger
    11	Waldemar Brodkorb
    10	Peter Seiderer
    10	Rodrigo Rebello
    10	Yegor Yefremov
     9	Zakharov Vlad
     7	Andrey Smirnov
     6	Beno?t Allard
     6	J?r?me Pouiller
     6	Matt Weber
     5	Gilles Talis
     5	Jerzy Grzegorek
     5	Max Filippov
     5	Rahul Jain
     5	Semyon Kolganov
     4	Christian Stewart
     4	Danomi Manchego
     4	Fabio Porcedda
     4	Julien BOIBESSOT
     4	Pawel Sikora
     4	Pieterjan Camerlynck
     4	Samuel Martin
     3	Abhimanyu Vishwakarma
     3	Andy Shevchenko
     3	Ga?l PORTAY
     3	Guo Ren
     3	Gwenhael Goavec-Merou
     3	Lionel Flandrin
     3	Marcus Hoffmann
     2	Alexey Brodkin
     2	Alistair Francis
     2	Angelo Compagnucci
     2	Cam Mannett
     2	Dagg Stompler
     2	Daniel Black
     2	Ilias Apalodimas
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
     1	Bartosz Golaszewski
     1	Chris Frederick
     1	Chris Packham
     1	Christian Kellermann
     1	Christophe PRIOUZEAU
     1	David Graziano
     1	Davide Viti
     1	Dustin Johnson
     1	Erwan Gautron
     1	Gary Bisson
     1	Gilad Ben-Yossef
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
     15 "Yann E. MORIN" <yann.morin.1998@free.fr>
     10 Yegor Yefremov <yegorslists@googlemail.com>
      8 Romain Naour <romain.naour@gmail.com>
      5 Samuel Martin <s.martin49@gmail.com>
      5 Matt Weber <matthew.weber@rockwellcollins.com>
      3 Alexandre Belloni <alexandre.belloni@free-electrons.com>
      2 Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
      2 Peter Seiderer <ps.report@gmx.net>
      2 Matthew Weber <matthew.weber@rockwellcollins.com>
      2 Cyril Bur <cyrilbur@gmail.com>
      2 Chris Packham <judge.packham@gmail.com>
      2 Bernd Kuhls <bernd.kuhls@t-online.de>
      2 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      1 Yann E. MORIN <yann.morin.1998@free.fr>
      1 Waldemar Brodkorb <wbx@openadk.org>
      1 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
      1 Steve Kenton <skenton@ou.edu>
      1 Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
      1 Mario J. Rugiero <mrugiero@gmail.com>
      1 Paul Cercueil <paul.cercueil@analog.com>

Like usual, I will now create a next branch and start merging in new
features, rather than wait until 2017.05 is released.

-- 
Bye, Peter Korsgaard
