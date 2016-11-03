From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 23:45:57 +0100
Subject: [Buildroot] Buildroot 2016.11-rc1 released
Message-ID: <20161103234557.304553a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2016.11-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2016.11-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2016.11-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

With about 1200 changes, it is a slightly more quiet cycle than
2016.08-rc1, which received more than 1600 changes. Almost one hundred
different developers contributed to this release.

Of noteworthy new features/changes we have:

 - It is now possible to specify multiple BR2_EXTERNAL
   directories. The required files in a BR2_EXTERNAL directory
   have changed to accomodate this feature. Refer to the
   documentation for details of how to update them. External
   trees now have a name and a description. Also, it is possible
   to override a defconfig in the external tree.

 - The default skeleton now uses UID 65534 for the "nobody"
   user instead of UID 99, like most distros do. See
   https://lwn.net/Articles/695478/ for a complete discussion.
   Programs and configuration files that explicitly refer to UID
   99 will have to be updated.

 - When the build environment already has a suitable cmake version
   (3.1 or later), that one will be used instead of building
   host-cmake. This can speed up the build significantly.

 - The ExtUtils::MakeMaker perl module is now required in the
   build environment.

 - An additional check is done during the build that files are
   not installed in the output directory within the output
   directory. This happens e.g. when the target directory is
   contained both in --prefix and in DESTDIR. The build will
   terminate with an error message that specifies which package
   and which file caused the failure.

 - The concept of "deprecated packages" and the BR2_DEPRECATED
   option have been removed. Instead, packages are removed
   immediately. Packages are only removed when they don't work
   for some reason. If you still need a removed package and
   you have a solution for the problem(s) that caused the
   removal, please contribute it.

 - Architecture: support for sh64 removed, improved support for
   MIPS core selection.

 - Toolchain: support for musl powerpc64le, mips64 and mipsr6
   toolchains, ARC toolchain components updates, gcc 6.x series
   bumped to 6.2.0, default binutils version switched to 2.26,
   default gcc version switched to gcc 5.x, Linaro toolchains
   updated, uclibc-ng bumped to 1.0.19. GCC is now always built
   with TLS support. Checking of unsafe compiler options (that
   point to host directories) has been extended with -isystem,
   -idirafter and -iquote.

 - Package infrastructure: new variable $(PKG)_DL_OPTS, addition
   of <pkg>-show-rdepends to list reverse dependencies, and
   <pkg>-graph-rdepends to graph reverse dependencies. Linux tools
   are now in a separate linux-tools package instead of in the
   kernel build. Fakeroot has been replaced by pseudo.

 - CMake support: the toolchainfile.cmake file now provides a
   definition of the CMAKE_BUILD_TYPE variable. The
   toolchainfile.cmake also no longer forces the compiler/linker
   flags defined by Buildroot.

 - New defconfigs: WaRP7, Solidrun's MX6 Cubox/Hummingboard,
   TS-4900, Grinn's liteBoard, Udoo MX6Q/DL, Qemu ARM noMMU,
   BeagleBone Qt5 demo, Digilent Zybo, FriendlyARM Nanopi NEO.

 - New packages: arm-trusted-firmware, amd-catalyst, atop, aufs,
   aufs-util, fwts, gst1-rtsp-server, libglob, libite, mfgtools,
   mksh, motion, paho-mqtt-c, php-amqp, pseudo, python-couchdb,
   python-crcmod, python-cssutils, python-docutils,
   python-futures, python-mwclient, python-mwscrape,
   python-mwscrape2slob, python-pyelftools, python-pyicu,
   python-pylru, python-pyqt5, python-requests-toolbelt,
   python-simpleaudio, python-slob, rabbitmq-server, shapelib,
   vdr, vdr-plugin-vnsiserver, vexpress-firmware, xvisor, iio and
   gpio linux tools.

 - Removed packages: binutils 2.24, gcc 4.7, ipkg,
   kodi-addon-xvdr, libgail, sstrip, torsmo, webkit, webkitgtk24,
   wvdial, wvstreams.

 - Documentation: the list of packages that was present in the
   Buildroot manual has been removed.

 - Legal info: the "licenses.txt" file that concatenates all
   license texts is no longer generated - it was not considered
   useful. The manifest.csv contains an empty cell instead of
   "not saved" when no license file is available.

 - Other: addition of a DEVELOPERS file listing developers taking
   care of packages or architectures.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2016.11-rc1

Many thanks to the people contributing to this release:

git shortlog -s -n 2016.08..

   327  Gustavo Zacarias
   134  Bernd Kuhls
    78  Yann E. MORIN
    77  Thomas Petazzoni
    68  Vicente Olivert Riera
    41  Fabio Estevam
    33  Romain Naour
    28  Rahul Bedarkar
    25  Baruch Siach
    24  J?rg Krause
    24  Peter Korsgaard
    23  Arnout Vandecappelle
    21  Samuel Martin
    21  Waldemar Brodkorb
    20  Peter Seiderer
    19  Fabrice Fontaine
    19  Gary Bisson
    13  Yegor Yefremov
    12  Erico Nunes
    12  Jerzy Grzegorek
     9  Christian Stewart
     9  Philippe Proulx
     8  Chris Packham
     7  Frank Hunleth
     7  Romain Perier
     6  Andr? Hentschel
     6  Carlos Santos
     6  Francois Perrad
     6  Matt Kraai
     6  Petr Vorel
     6  Thomas De Schampheleire
     5  David Lechner
     5  Georges Savoundararadj
     5  Luca Ceresoli
     5  Ryan Coe
     4  Angelo Compagnucci
     4  Biagio Montaruli
     4  Cyril Bur
     4  Danomi Manchego
     4  Floris Bos
     4  Manuel V?gele
     3  Alexey Brodkin
     3  Christophe Vu-Brugier
     3  Eric Le Bihan
     3  Joao Pinto
     3  Jordan Yelloz
     3  Julien BOIBESSOT
     3  J?r?me Pouiller
     3  Lothar Felten
     3  Marcin Niestroj
     3  Theo Debrouwere
     3  Zakharov Vlad
     2  Alistair Francis
     2  Chris Frederick
     2  Dagg Stompler
     2  Ezequiel Garcia
     2  Jeroen Roovers
     2  Joel Stanley
     2  Judd Meinders
     2  Julien Floret
     2  Ludovic Desroches
     2  Marcin Nowakowski
     2  Martin Bark
     2  Mathieu Audat
     2  Maxime Hadjinlian
     2  Padraig James Connolly
     2  Pranit Sirsat
     2  Rahul Jain
     2  Ricardo Martincoski
     2  Rodrigo Rebello
     2  Stefan Nickl
     1  Charles Hardin
     1  Eloi BAIL
     1  Hollis Blanchard
     1  James Knight
     1  Jan Heylen
     1  Johan Derycke
     1  Masahiro Yamada
     1  Max Filippov
     1  Olivier Matz
     1  Petr Kulhavy
     1  Petri Gynther
     1  Piotr Nakraszewicz
     1  Rapha?l Poggi
     1  Sam bobroff
     1  Sebastien Van Cauwenberghe
     1  Tatsuyuki Ishi
     1  Thomas Claveirole
     1  Vincent Stehl?
     1  Vivien Didelot
     1  Volkov Viacheslav
     1  Zoltan Gyarmati
     1  daggs

And a special thanks to our patch reviewers:

git log 2016.08.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

    168 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
     24 "Yann E. MORIN" <yann.morin.1998@free.fr>
     10 Romain Naour <romain.naour@gmail.com>
      6 Rahul Bedarkar <rahul.bedarkar@imgtec.com>
      4 Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
      3 Yegor Yefremov <yegorslists@googlemail.com>
      3 Luca Ceresoli <luca@lucaceresoli.net>
      3 Fabio Estevam <festevam@gmail.com>
      2 Samuel Martin <s.martin49@gmail.com>
      2 Angelo Compagnucci <angelo.compagnucci@gmail.com>
      2 Alistair Francis <alistair.francis@xilinx.com>
      1 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
      1 Peter Seiderer <ps.report@gmx.net>
      1 Francois Perrad <francois.perrad@gadz.org>

Like usual, I will now create a next branch and start merging in new
features, rather than wait until 2016.11 is released.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
