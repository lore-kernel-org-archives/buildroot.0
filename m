From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Feb 2019 10:42:23 +0100
Subject: [Buildroot] Buildroot 2019.02-rc1 released
Message-ID: <87imxorpmo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2019.02-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2019.02-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2019.02-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

Again an active development cycle with close to 1200 changes and
contributions from more than 100 unique contributors!

Of noteworthy new features/changes we have:

- Dependencies: Require Python >= 2.7 as it is needed for E.G. building
  libglib2. Ensure GNU gzip is used for reproducible tarballs (instead
  of pigz)


- Infrastructure: The package list infrastructure now correctly handles
  packages installing files with old mtime.

  BR2_SYSTEM_DEFAULT_PATH setting to customize the default path
  for processes.

  The custom skeleton logic will now populate the needed /bin, /lib,
  /sbin directories/symlinks if not present. Merged /usr can now be used
  with a custom skeleton.

  Rootfs overlays can now override symbolic links from packages. This
  was disabled to ensure the correct symbolic links are present when
  merged /usr is used. Instead validate that the rootfs overlays do not
  include invalid /bin, /sbin and /lib entries.

  Various improvements to the meson infrastructure.

  Luarocks: A Buildroot addon has been added to automate creating a
  Buildroot package from luarocks, similar to scancpan and scanpypi.

  scanpypi: protect against zip-slip vulnerability in zip/tar handling

  kconfig: Fix for make linux-menuconfig / uboot-menuconfig from a clean
  tree when ccache is enabled.

  Default to sha256 password encoding, drop md5 support.


- Architecture: Support for RISC-V 32bit architecture, ARM A55, 75 and
  Saphira variants, MIPS support for mips32r3, mips64r3 and Marvell
  Octeon II/III variants.


- Toolchain: ARC toolchain 2018.09, ARM 8.2-2018.11, Codescape IMG/MTI
  MIPS 2018.09-02, MUSL 1.1.21, GCC 6.5.0 / 7.4.0, GDB 8.2.1


- Packages: Bump openssl to 1.1.1x series, bringing TLSv1.3 support and
  long term support. Split fftw into
  fftw-{single,double,long-double,quad} packages for the different data
  precision options. linux: Support building device tree blobs with the
  -@ option for device tree overlays. The weston-imx i.MX variant of
  weston is now used when imx-gpu-viv is enabled.
  Update to pkgconf 1.5.3, which brings support for --define-prefix
  (used by GStreamer).


- New defconfigs: Aarch64 EFI, Orangepi one plus, Orangepi lite 2, QEMU
  RISC-V 32bit virt, Rock64


- New packages: brcm-patchram-plus, clinfo, cunit, docker-cli,
  erlang-p1-eimp, exempi, fail2ban, fftw-double, fftw-double-long,
  fftw-quad, fftw-single, gerbera, grpc, gst1-shark, intel-gmmlib, iwd,
  kf5-kcoreaddons, libeastl, libpackagekite, libtorrent-rasterbar,
  lua-std-debug, lua-std-normalize, mini-snmpd, netsurf, pamtester,
  pcm-tools, python-aiodns, python-aiohttp, python-aiohttp-jinja2,
  python-aiohttp-remotes, python-aiohttp-security,
  python-aiohttp-session, python-aiohttpd-sse, python-aiojobs,
  python-cchardet, python-pycares, python-sentry-sdk, python-wtforms,
  python3-setuptools, rcw, rtc-tools, shim, utp_com, vmtouch,
  websocketpp

- Removed packages: fftw, lua 5.2.x, luacrypto, perl-time-hires,
  python-pyqt, qt, qtuio, tn5250


And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.02-rc1


Many thanks to the people contributing to this release:

git shortlog -s -n 2018.11..

   176	Fabrice Fontaine
   123	Peter Korsgaard
   112	Thomas Petazzoni
    70	Francois Perrad
    58	Asaf Kahlon
    47	Baruch Siach
    46	Ricardo Martincoski
    44	Bernd Kuhls
    44	Carlos Santos
    32	James Hilliard
    28	Matt Weber
    28	Yann E. MORIN
    23	Peter Seiderer
    23	Romain Naour
    22	Adam Duskett
    20	Johan Oudinet
    20	Thomas De Schampheleire
    16	Gwenhael Goavec-Merou
    14	J?rg Krause
    12	Angelo Compagnucci
    10	Vadim Kochan
     9	Christian Stewart
     9	Gilles Talis
     7	Arnout Vandecappelle (Essensium/Mind)
     7	Evgeniy Didin
     7	Trent Piepho
     6	Mark Corbin
     6	Ryan Coe
     5	Bartosz Golaszewski
     5	Erico Nunes
     5	Jared Bents
     4	Andr? Hentschel
     4	Chris Packham
     4	Fabio Estevam
     4	Grzegorz Blach
     4	Joseph Kogut
     4	Lionel Orry
     4	Markus Mayer
     4	Nasser Afshin
     4	Nicolas Serafini
     4	Petr Vorel
     4	Valentin Korenblit
     3	Alexander Sverdlin
     3	Alexey Brodkin
     3	DUPONCHEEL S?bastien
     3	David Lechner
     3	Jagan Teki
     3	Marcin Niestroj
     3	Martin Kepplinger
     3	Micha? ?yszczek
     2	Adrian Perez de Castro
     2	Alex Kaplan
     2	Chris Lesiak
     2	David J. Fogle
     2	Frank Hunleth
     2	Gerome Burlats
     2	Giulio Benetti
     2	Gr?goire Delattre
     2	Ilya Averyanov
     2	Joel Stanley
     2	Lionel Flandrin
     2	Max Filippov
     2	Patrick Havelange
     2	Paul Burton
     2	Robert Rose
     2	Ryan Barnett
     2	Sergio Prado
     2	Titouan Christophe
     2	Yegor Yefremov
     2	Zenichi Amano
     1	Adrien Gallou?t
     1	Bartosz Bilas
     1	Brandon Maier
     1	Bryce Ferguson
     1	Charles Hardin
     1	Clayton Shotwell
     1	Damien Th?bault
     1	David Picard
     1	Eric Le Bihan
     1	Etienne Carriere
     1	Ezequiel Garcia
     1	Florian La Roche
     1	Gary Bisson
     1	Ga?l PORTAY
     1	Gustavo Pimentel
     1	Jan Heylen
     1	Jim Brennan
     1	Joel Carlson
     1	John Faith
     1	John Keeping
     1	Julien Grossholtz
     1	Julien Olivain
     1	Louis-Paul Cordier
     1	Mathias De Mare
     1	Matt Wood
     1	Mikael Eliasson
     1	Nicolas Cavallari
     1	NikitaSobolev
     1	Paresh Chaudhary
     1	Philipp Richter
     1	Pierre Ducroquet
     1	S?bastien Szymanski
     1	Vincent Prince
     1	Vivien Didelot
     1	Waldemar Brodkorb
     1	Wouter Vermeiren


And a special thanks to our patch reviewers:

git log 2018.11.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     58 "Yann E. MORIN" <yann.morin.1998@free.fr>
     16 Yegor Yefremov <yegorslists@googlemail.com>
     11 Matt Weber <matthew.weber@rockwellcollins.com>
      9 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      8 Ricardo Martincoski <ricardo.martincoski@gmail.com>
      7 Francois Perrad <francois.perrad@gadz.org>
      5 Matthew Weber <matthew.weber@rockwellcollins.com>
      5 <aduskett@gmail.com>
      4 Titouan Christophe <titouan.christophe@railnova.eu>
      4 Petr Vorel <petr.vorel@gmail.com>
      3 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
      3 Romain Naour <romain.naour@gmail.com>
      3 Peter Seiderer <ps.report@gmx.net>
      3 Baruch Siach <baruch@tkos.co.il>
      3 <angelo@amarulasolutions.com>
      2 Ryan Barnett <ryan.barnett@rockwellcollins.com>
      2 Marcus Folkesson <marcus.folkesson@gmail.com>
      2 Erico Nunes <nunes.erico@gmail.com>
      2 Carlos Santos <casantos@datacom.com.br>
      2 Bernd Kuhls <bernd.kuhls@t-online.de>
      2 Asaf Kahlon <asafka7@gmail.com>
      2 Adrian Perez de Castro <aperez@igalia.com>
      1 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
      1 Romain Naour <romain.naour@smile.fr>
      1 Robert Rose <robertroyrose@gmail.com>
      1 Peter Korsgaard <peter@korsgaard.com>
      1 Matt Weber <matthew.weber@rockwellcollin.com>
      1 Matthew Weber <matthew.weber@rockwellcollins.con>
      1 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
      1 Gilles Talis <gilles.talis@gmail.com>
      1 Christian Stewart <christian@paral.in>
      1 Chris Packham <judge.packham@gmail.com>
      1 Anisse Astier <anisse@astier.eu>

We had a very nice developers' meeting in Brussels last week with lots
of work getting done:

https://elinux.org/Buildroot:DeveloperDaysFOSDEM2019

Many thanks to the participants and sponsors!


A next branch has already been created, and changes for the 2019.05 have
started to get merged.


Keep in mind that 2019.02 will become the new long term support release,
replacing 2018.02.

-- 
Bye, Peter Korsgaard
