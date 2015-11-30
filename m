From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Nov 2015 23:48:01 +0100
Subject: [Buildroot] Buildroot 2015.11 released
Message-ID: <87k2ozje8u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2015.11 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2015.11.tar.gz

or

http://buildroot.net/downloads/buildroot-2015.11.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

This cycle saw a bit less activity than other recent releases, but still
quite a lot (1100+) of changes all over the tree and more than 100
unique contributors! I'm very happy to see so many "new" people next to
the "oldtimers".

Of noteworthy new features/changes we have:

Architectures:

- Support for sparc64 added (internal toolchain with glibc
  only).

- Support for mips32r6 and mips64r6 added.

- Support for Intel Quark X1000 CPU.

- Switch to EABIhf by default on ARM when a VFP is available.

Toolchains:

- glibc 2.22, gdb 7.10, use gdb 7.9 by default, musl 1.1.12,
  uclibc-ng 1.0.8, host-gdb enabled on AArch64.

- The toolchain wrapper which was used only for external toolchains is
  now also used for Buildroot internal toolchains. This allowed us to
  fix the ccache support, prepare the way for top-level parallel build
  support and remove gcc patches used to detect header/library path
  poisoning.

- Remove Analog Devices Blackfin toolchain 2012R2.

- Fix several Xtensa build failures by switching from
  text-section-literals to auto-litpools.

- Enable MIPS64 support in uClibc-ng, use uClibc on ARC rather than a
  specific fork.

- Toolchain fixes for PowerPC e5500 / e6500.

- Linaro toolchains for ARM, ARMeb and AArch64 updated to 2015.08.
  2014.09 version is kept since 2015.08 only runs on x86_64 hosts.

Bootloaders:

- Fix ARM64 support in U-Boot.

Defconfigs:

- Added: ARC HS38 VDK virtual boards, Avnet Microzed, Boundary Devices
  Nitrogen SoloX, Freescale i.MX6 SoloX Sabre SD, OLinuxino A20 Lime2,
  Qemu Sparc64, Qemu SuperH 4 big endian, Synopsys AArch64 VDK virtual
  platform.

- Updated: calao_qil_a9260, calao_usb_a9g20_lpw, ci20, cubieboad,
  freescale_imx6_*, imx53loco, imx6_vab820, mpc8315erdb, qmx6, p1010rdb,
  qemu, raspberrypi, raspberrypi2, riotboard, snps_axs10*, wandboard.

- Removed: at91rm9200df, at91sam9260dfc, at91sam9263ek,
  calao_snowball_defconfig, gnublin, integrator926_defconfig.

Infrastructure:

- Support for fetching from Mercurial tags fixed.

- Introduce LINUX_NEEDS_MODULES, which allows to enforce module support
  to be enabled in the kernel when a package builds out-of-tree kernel
  modules (through the pkg-kernel-module infrastructure or on its own).

- Improve the perl package infrastructure to automatically add the
  dependency to the perl interpreter to target perl module packages.

- Remove trailing slashes in <pkg>_SITE and addition of a check to
  ensure such trailing slashes are no longer added.

- Extend the legal infrastructure to allow packages to declare their
  actual source code. This is useful for packages for which <pkg>_SOURCE
  points to pre-built binaries (as is the case for external
  toolchains). The new <pkg>_ACTUAL_SOURCE variable allows to point to
  the source code in such cases.

- Improved ccache support, thanks to the usage of a toolchain wrapper
  for internal toolchain. Now a single cache directory can be shared
  between different Buildroot builds.

- Addition of a 'graph-size' make targets, which generates a PDF graph
  of per-package size of the root filesystem.

- Addition of <pkg>_EXCLUDES so that packages can request certain parts
  of the source code tarball to not be extracted. This feature is
  currently used by gcc and toolchain-external.

- Packages can now use the <pkg>_PKGDIR variable, provided by the
  package infrastructure, to reference their package directory, instead
  of explicitly using package/<pkg>/.

- LD_LIBRARY_PATH is no longer used to ensure host binaries find their
  libraries, fixing issues on recent Fedora.

- Apply-patches.sh now correctly applies all files listed in series
  files.

Filesystems:

- Add high lz4 compression to squashfs.

- Simplification of shell profile files in the default skeleton.

- Remove ftp user and /home/ftp from the skeleton, and let ftp server
  packages create these when needed.

- Add support for /bin, /sbin and /lib to be symlinks to their
  corresponding directories in /usr. This is enforced for systemd
  configurations, and optional for other configurations.

- Support for AXFS filesystem image generation added.

- New options to add extra space/inodes to ext2/3/4 images.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.11


Many thanks to the people contributing to this release:

git shortlog -s -n 2015.08..

   223  Gustavo Zacarias
    95  Vicente Olivert Riera
    83  Bernd Kuhls
    82  Thomas Petazzoni
    69  Peter Korsgaard
    65  Yann E. MORIN
    41  Arnout Vandecappelle
    41  J?rg Krause
    37  Baruch Siach
    34  Peter Seiderer
    24  Francois Perrad
    20  Maxime Hadjinlian
    19  Gary Bisson
    17  Waldemar Brodkorb
    16  Luca Ceresoli
    14  Beno?t Th?baudeau
    14  Chris Packham
    14  James Knight
    13  Jerzy Grzegorek
    10  Rodrigo Rebello
     8  Christophe Vu-Brugier
     7  Martin Bark
     7  Max Filippov
     6  Alexey Brodkin
     6  Romain Naour
     6  kei-k at ca2.so-net.ne.jp
     5  Ben Shelton
     5  Brendan Heading
     5  Gwenhael Goavec-Merou
     5  Jonathan Ben Avraham
     5  J?r?me Pouiller
     5  Ryan Barnett
     5  Sergio Prado
     5  Steven Noonan
     4  Alex Suykov
     4  Petr Vorel
     4  Thijs Vermeir
     4  Thomas De Schampheleire
     4  Tom Sparks
     4  Yegor Yefremov
     3  Anders Roxell
     3  David du Colombier
     3  Nikolay Dimitrov
     3  Rahul Bedarkar
     2  Alexander Dahl
     2  Andr? Hentschel
     2  Ariel D'Alessandro
     2  Bj?rn Forsman
     2  Carlos Santos
     2  Charles Duffy
     2  Danomi Manchego
     2  Davide Viti
     2  Doug Kehn
     2  Douglas RAILLARD
     2  Fabio Porcedda
     2  Francesco Nwokeka
     2  Gabe Evans
     2  Giovanni Zantedeschi
     2  Jeremy Kerr
     2  Johan Oudinet
     2  Julian Scheel
     2  Mike Williams
     2  No? Rubinstein
     2  Peter Rosin
     2  Scott Fan
     2  jpinto
     1  Alexander Lukichev
     1  Andreas Wetzel
     1  Angelo Compagnucci
     1  Aur?lien Chabot
     1  Bartosz Golaszewski
     1  Ben Boeckel
     1  Chris Lesiak
     1  Cyril Bur
     1  C?dric Marie
     1  Dale Ghent
     1  Daniel Nystr?m
     1  David Kosir
     1  Ed Swierk
     1  Edson Siqueira
     1  Ezequiel Garc?a
     1  Frank Hunleth
     1  Gergely Imreh
     1  Guillaume GARDET
     1  Herve Codina
     1  Jan Viktorin
     1  Joao Pinto
     1  Julien Boibessot
     1  Julien CORJON
     1  Lada Trimasova
     1  Marc
     1  Matt Weber
     1  Matthias Weisser
     1  Nicolas Cavallari
     1  Parnell Springmeyer
     1  Phil Eichinger
     1  Ray Kinsella
     1  Remi Pommarel
     1  Renaud AUBIN
     1  Ronak Desai
     1  Samuel Martin
     1  Stephen Agate
     1  Steve Calfee
     1  Trent Piepho
     1  Viallard Anthony
     1  Vincent Stehl?
     1  guillaume william brs
     1  vicencb at gmail.com

And a special thanks to our patch reviewers:

git log 2015.08.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     84 Vicente Olivert Riera <Vincent.Riera@imgtec.com>
     65 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
     38 "Yann E. MORIN" <yann.morin.1998@free.fr>
     23 Romain Naour <romain.naour@openwide.fr>
     10 Gustavo Zacarias <gustavo@zacarias.com.ar>
      8 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
      6 Samuel Martin <s.martin49@gmail.com>
      4 Bernd Kuhls <bernd.kuhls@t-online.de>
      3 Marcin Nowakowski <marcin.nowakowski@imgtec.com>
      3 Luca Ceresoli <luca@lucaceresoli.net>
      3 J?rg Krause <joerg.krause@embedded.rocks>
      3 "James Knight" <james.knight@rockwellcollins.com>
      2 "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
      2 Baruch Siach <baruch@tkos.co.il>
      1 Yegor Yefremov <yegorslists@googlemail.com>
      1 Vivien Didelot <vivien.didelot@savoirfairelinux.com>
      1 Ryan Barnett <ryanbarnett3@gmail.com>
      1 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
      1 "James Knight" <james.d.knight@live.com>
      1 Gary Bisson <gary.bisson@boundarydevices.com>
      1 Francois Perrad <francois.perrad@gadz.org>
      1 Alexey Brodkin <abrodkin@synopsys.com>
      1 Alexander Dahl <post@lespocky.de>
      1 Waldemar Brodkorb <wbx@uclibc-ng.org>
      1 Jan Viktorin <viktorin@rehivetech.com>

Once again our autobuilders have helped us fix a huge amount of build
issues. Thanks to all the people reviewing failures and fixing issues:

for i in $(git log --format=%H 2015.08..); do \
    git show --quiet $i | grep -q http://autobuild && \
    git show --quiet --format="%an" $i ; done | sort | uniq -c | \
        sort -rn -k1

     25 Thomas Petazzoni
     22 Gustavo Zacarias
     18 Vicente Olivert Riera
     17 Bernd Kuhls
     16 Peter Korsgaard
     16 Baruch Siach
     12 Yann E. MORIN
      8 J?rg Krause
      7 Peter Seiderer
      6 Rodrigo Rebello
      5 Waldemar Brodkorb
      5 Brendan Heading
      4 kei-k at ca2.so-net.ne.jp
      3 Yegor Yefremov
      3 Francois Perrad
      3 Chris Packham
      2 Sergio Prado
      2 Max Filippov
      2 Alex Suykov
      1 Steven Noonan
      1 Ryan Barnett
      1 Romain Naour
      1 Lada Trimasova
      1 Julien CORJON
      1 J?r?me Pouiller
      1 Gwenhael Goavec-Merou
      1 Christophe Vu-Brugier
      1 Arnout Vandecappelle
      1 Alexander Lukichev

The next release will be 2016.02. Expect the first release candidate
shortly after the developers meeting, and the final release at the end
of February.

The next developers meeting will take place just after FOSDEM in
Brussels, Belgium:

http://elinux.org/Buildroot:DeveloperDaysFOSDEM2016

Many thanks to Google for sponsoring the meeting location! We are still
looking for a sponsor for the dinner Monday evening. Contact us if you
are interested.

During the 2015.11 cycle we had a very nice developers meeting in
Dublin, Ireland. Many thanks to Orange Business Services for sponsoring
the event and for all the participants for joining!

http://elinux.org/Buildroot:DeveloperDaysFOSDEM2015

Enjoy!

-- 
Bye, Peter Korsgaard
