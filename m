From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2015 23:15:12 +0200
Subject: [Buildroot] Buildroot 2015.08 released
Message-ID: <87zj17qhwf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2015.08 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2015.08.tar.gz

or

http://buildroot.net/downloads/buildroot-2015.08.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

This was again a busy cycle with close to 1500 changes all over the tree
and more than 100 unique contributors! I'm very happy to see so many
"new" people next to the "oldtimers".

Of noteworthy new features/changes we have:

Architectures:

 - Refactor how the availability of an MMU is described.
 - Minimal support for Cortex-M3
 - Minimal support for AArch64 big-endian

Toolchains:

 - Add CodeSourcery MIPS 2015.05, remove MIPS 2013.11
 - Use uClibc-ng as the default uClibc version, instead of the
   official uClibc, which hasn't done any release since 3+
   years
 - eglibc is now marked as deprecated
 - GCC: gcc 4.9.x is now the default and was updated to 4.9.3,
   support for gcc 5.x added.
 - Binutils: use Binutils 2.24 as the default, 2.25.x series
   bumped to 2.25.1, remove old Binutils 2.22.
 - Update ARC toolchain components to 2015.06
 - Add support for Fortran when building gcc

Bootloaders:

 - Support for using the kconfig configuration system in
   U-Boot

New Defconfigs:

 - VIA VAB-820/AMOS-820
 - OLimex OLinuxino A20 Lime
 - Many new defconfigs for Atmel evaluation boards:
   at91sam9rlek, at91sam9x5ek, sama5d3xek, sama5d4ek, sama5d4
   Xplained Ultra, sama5d3 Xplained.
 - ACME Systems Aria G25
 - WarPboard
 - Altera Cyclone 5 Development Board
 - Xilinx zc706
 - ARC AXS101 and AXS103 Software Development Platforms
 - Significant updates to Raspberry Pi / Raspberry Pi 2

Infrastructure:

 - Buildroot takes better care now of generating predictable
   permissions in the target filesystem. However, existing
   permissions on a custom skeleton or rootfs overlay will no
   longer be preserved. Therefore, it is necessary to add a
   permission table (BR2_ROOTFS_DEVICE_TABLE) to set the
   required permissions.
 - Add support for kconfig fragments.
 - No longer pass --{enable,disable}-debug to autotools
   packages depending on the value of
   BR2_ENABLE_DEBUG. BR2_ENABLE_DEBUG now only controls
   whether we build with -g or not.
 - Support for extracting archives in .lzma in the generic
   package infrastructure.
 - Remove random-seed file from the default skeleton, since
   seeding the entropy pool with a known seed makes more harm
   than good.
 - In the CVS download helper, add support to use a date as
   the version.
 - Add support for a per-package <pkg>_STRIP_COMPONENTS
   variable, which packages can use to specify how many path
   components should be stripped when extracting the tarball.
 - Addition of a 'kernel-module' package infrastructure, which
   simplifies the packaging of external kernel modules. Many
   existing packages are converted to use it.
 - Allow bootloaders to be implemented in $(BR2_EXTERNAL)
 - Remove /etc/securetty from the default skeleton.
 - Migration of sysV initscripts from the default skeleton to
   a package called 'initscripts', installed only when Busbox
   init or sysvinit are used.
 - Migration of the skeleton logic to a proper 'skeleton'
   package.
 - Addition of a 'linux-tools' infrastructure in the 'linux'
   package, to support building user-space tools bundled
   within the Linux kernel sources, such as perf and cpupower.
 - Usage of backticks instead of make $(shell ...) to execute
   shell commands. This allows to delay the evaluation of such
   commands when actually needed, and not when expanding the
   variables. It is useful to make 'make printvars' less
   noisy, and as a preparation to support top-level parallel
   build.
 - Libtool .la files are not mungled for all package types,
   instead of being handled only for packages using the
   autotools-package infrastructure.
 - Add mechanism to allow packages to express a dependency on
   gcc versions. This is needed for packages that use C++11 or
   C11 support for example.

Important package updates:

 - Complete rework of the matchbox packaging
 - Lots of fixes in packages for compatibility with musl and
   gcc 5.
 - Hash files added to a large number of packages.
 - Update a significant number of packages to use a new
   hosting, after the announcement of Google Code and
   Gitorious closing.
 - Major packages needed for SELinux support have been merged,
   but the support is not complete yet.
 - Significant update of OpenCV to version 3.0, and addition
   of lots of eatures.
 - Significant update of all packages supporting the GPU and
   VPU of i.MX ARM processors.
 - Addition of systemd support in a significant number of
   packages.
 - Qt5 updated to 5.5.0
 - Use modular X.org server by default instead of KDrive

Filesystems:

 - Complete overhaul of the iso9660 support. Now allows to use
   directly IS9660 as the root filesystem format and not only
   an initrd, and supports Grub 2 and isolinux in addition to
   Grub.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.08

Many thanks to the people contributing to this release, and a special
thanks to Thomas Petazzoni for handling most of the maintainer duties
this cycle!

git shortlog -s -n 2015.05..

   315	Gustavo Zacarias
   141	Bernd Kuhls
   125	Yann E. MORIN
   113	Thomas Petazzoni
    64	Francois Perrad
    42	Baruch Siach
    41	Romain Naour
    40	J?rg Krause
    36	Vicente Olivert Riera
    30	Maxime Hadjinlian
    27	Peter Korsgaard
    24	Fabio Porcedda
    23	Alexey Brodkin
    22	Alex Suykov
    22	Samuel Martin
    21	Jerzy Grzegorek
    20	Luca Ceresoli
    16	Yegor Yefremov
    15	Johan Oudinet
    15	Martin Bark
    15	Thomas De Schampheleire
    14	Angelo Compagnucci
    14	Brendan Heading
    14	Clayton Shotwell
    12	Gary Bisson
    12	Petr Vorel
    11	Guido Mart?nez
    11	Waldemar Brodkorb
    10	Arnout Vandecappelle
     9	Alexandre Belloni
     9	Beno?t Th?baudeau
     9	Danomi Manchego
     9	Jan Viktorin
     9	Matt Weber
     7	Aur?lien Chabot
     7	Floris Bos
     7	Julien CORJON
     6	Peter Seiderer
     5	James Knight
     5	Maxim Mikityanskiy
     5	Rahul Bedarkar
     5	Steven Noonan
     5	Vanya Sergeev
     4	Christian Stewart
     4	Karoly Kasza
     4	Nathaniel Roach
     4	Nikolay Dimitrov
     4	Ryan Barnett
     4	Sam bobroff
     4	Ulf Magnusson
     3	Bartosz Golaszewski
     3	Gergely Imreh
     3	Guillaume GARDET
     3	Jonathan Ben Avraham
     3	J?r?me Pouiller
     3	No? Rubinstein
     3	Paul Cercueil
     3	Sebastien Bourdelin
     2	C?dric Marie
     2	Doug Kehn
     2	Frank Hunleth
     2	Geoffrey Ragot
     2	Gwenhael Goavec-Merou
     2	Hollis Blanchard
     2	Max Filippov
     2	Nimai Mahajan
     2	Scott Fan
     2	Simon Marchi
     2	Thomas Claveirole
     2	Vivien Didelot
     2	kyak
     1	Albert Lee
     1	Antoine Tenart
     1	Arthur LAMBERT
     1	Bai Yingjie
     1	Bamvor Jian Zhang
     1	Charles Manning
     1	Christophe Vu-Brugier
     1	Colleen
     1	David Kessler
     1	David du Colombier
     1	Eric Le Bihan
     1	Eric Limpens
     1	Herve Codina
     1	Hoang Tran
     1	Ignacy Gaw?dzki
     1	Jordan Yelloz
     1	Jordi Montagne
     1	Julien Viard de Galbert
     1	Kinsella, Ray
     1	Lorenzo Catucci
     1	Marc-Andr? Ch?nier
     1	Matthew Shyu
     1	Matthew Starr
     1	Maxime Ripard
     1	Mikhail Peselnik
     1	Morgan Delestre
     1	Pascal de Bruijn
     1	Peter Bouda
     1	Robert Sohn
     1	Sylvain Raybaud
     1	S?bastien Szymanski
     1	Tal Zilcer
     1	Valentine Barshak
     1	Viallard Anthony
     1	Will Wagner
     1	Zoltan Gyarmati
     1	florent valette

And a special thanks to our patch reviewers:

git log 2015.05.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

    122 "Yann E. MORIN" <yann.morin.1998@free.fr>
     75 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
     17 Samuel Martin <s.martin49@gmail.com>
     13 Romain Naour <romain.naour@openwide.fr>
     10 Gustavo Zacarias <gustavo@zacarias.com.ar>
      4 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
      4 Vicente Olivert Riera <Vincent.Riera@imgtec.com>
      2 Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
      2 Marcin Nowakowski <marcin.nowakowski@imgtec.com>
      2 Lionel Orry <lionel.orry@gmail.com>
      2 Bernd Kuhls <bernd.kuhls@t-online.de>
      2 Abhimanyu Vishwakarma <abhimanyu.v@imgtec.com>
      1 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
      1 Sam Bobroff <sam.bobroff@au1.ibm.com>
      1 Max Filippov <jcmvbkbc@gmail.com>
      1 "Lorenzo M. Catucci" <lorenzo@sancho.ccd.uniroma2.it>
      1 Karoly Kasza <kaszak@gmail.com>
      1 Jaap Crezee <jaap@jcz.nl>
      1 Gary Bisson <gary.bisson@boundarydevices.com>
      1 Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
      1 "Christian Stewart" <christian@paral.in>
      1 Baruch Siach <baruch@tkos.co.il>

Once again our autobuilders have helped us fix a huge amount of build
issues. Thanks to all the people reviewing failures and fixing issues:

for i in $(git log --format=%H 2015.05..); do \
    git show --quiet $i | grep -q http://autobuild && \
    git show --quiet --format="%an" $i ; done | sort | uniq -c | \
        sort -rn -k1
     42 Thomas Petazzoni
     22 Yann E. MORIN
     17 Baruch Siach
     16 Bernd Kuhls
     15 J?rg Krause
     15 Gustavo Zacarias
     14 Brendan Heading
     11 Romain Naour
      9 Alexey Brodkin
      5 Waldemar Brodkorb
      5 Peter Korsgaard
      4 Vicente Olivert Riera
      3 Rahul Bedarkar
      3 Clayton Shotwell
      2 Yegor Yefremov
      2 Julien CORJON
      2 Angelo Compagnucci
      1 Simon Marchi
      1 Paul Cercueil
      1 Nathaniel Roach
      1 Maxime Hadjinlian
      1 Karoly Kasza
      1 J?r?me Pouiller
      1 Gwenhael Goavec-Merou
      1 Guillaume GARDET
      1 Gergely Imreh
      1 Francois Perrad
      1 Beno?t Th?baudeau
      1 Alex Suykov

Next release will be 2015.11. Expect the first release candidate early
November and the final release at the end of the month.

The next developers meeting will take place just before the Embedded
Linux Conference Europe in Dublin, Ireland:

http://elinux.org/Buildroot:DeveloperDaysELCE2015

We are still looking for companies willing to sponsor this Developers
Meeting. The budget is in the 250-500 EUR range, so it's fairly cheap
for most companies, but allows us to cover the various expenses related
to the meeting.

-- 
Bye, Peter Korsgaard
