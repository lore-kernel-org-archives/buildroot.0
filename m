From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 01 Dec 2018 23:31:02 +0100
Subject: [Buildroot] Buildroot 2018.11 released
Message-ID: <874lbw6frt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

Buildroot 2018.11 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2018.11.tar.gz

or

http://buildroot.net/downloads/buildroot-2018.11.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

This was another big development cycle with more close to 1400 changes all
over the tree and more than 100 unique contributors! I'm very happy to
see so many "new" people next to the "oldtimers".

Of noteworthy new features/changes we have:

- Architecture: RISC-V support (64bit) added.

- Toolchain: Glibc bumped to 2.28. Fortran support for external
  toolchains. ARM (Linaro) toolchains updated to 8.2-2018.08.

- Hardening flags (RELRO) are now handled by the toolchain wrapper
  instead of explicitly through CFLAGS/LDFLAGS, fixing a number of
  issues.

- Filesystems: Support for creating btrfs and f2fs filesystems added.

- Add a number of patches to fix build errors for host utilities on
  modern distributions using glibc-2.28.

- Workaround added for incompatibility issues between host-dtc and older
  U-Boot and Linux kernel versions.

- utils/diffconfig: Make it work for (non-Buildroot) config files not
  using the BR2_ prefix.

- FS: Drop intermediate tarball from the filesystem handling to fix an
  issue with xattrs handling related to fakeroot. Ensure tarball target
  includes xattrs.

- Download: Fix confusion in git submodule handling if dl/ is a symlink.

- New defconfigs: Amarula a64-relic, Bananapi m2 ultra, Embest
  riotboard, Hardkernel Odroid XU-4, QEMU
  riscv64-virt. olimex_a20_olinuxion_lime_mali is renamed to _legacy.

- Basic OpenCL infrastructure support added, similar to how OpenGL is
  handled.

- Linux-headers: Support for kernel headers from a custom tarball / git
  repo added.

New packages: bird, bluez5_utils-headers, btrfs-progs, checksec, davici,
duktape, ell, haproxy, libclc, libcorrect, libopencl, libopenresolv,
nss-myhostname, perl-apache-logformat-compiler, perl-appconfig,
perl-astro-suntime, perl-class-inspector, perl-class-load,
perl-class-method-modifiers, perl-class-std, perl-class-std-fast,
perl-cookie-baker, perl-data-dump, perl-data-optlist, perl-data-uuid,
perl-data-manip, perl-dbd-mysql, perl-dbi, perl-devel-globaldestruction,
perl-devel-stacktrace, perl-devel-stacktrace-ashtml,
perl-device-serialport, perl-dist-checkconflicts, perl-exporter-tiny,
perl-file-sharedir, perl-file-slurp, perl-filesys-notify-simple,
perl-hash-multivalue, perl-http-entity-parser, perl-http-headers-fast,
perl-http-multipartparser, perl-io-interface, perl-io-socket-multicast,
perl-json-maybexs, perl-mime-tools, perl-module-implementation,
perl-module-runtime, perl-moo, perl-number-bytes-human,
perl-package-stash, perl-params-util, perl-plack,
perl-posix-strftime-compiler, perl-role-tiny, perl-streams-buffered,
perl-sub-exporter-progressive, perl-sub-install, perl-sub-quote,
perl-sys-cpu, perl-sys-meminfo, perl-sys-mmap, perl-time-parsedate,
perl-type-tiny, perl-www-form-urlencoded, perl-x10, pigpio,
python-async-timeout, python-falcon, python-fire, python-mimeparse,
python-multidict, python-passlib, python-pigpio, python-pip, python-ply,
python-py, python-pyasn1, python-pyasn1-modules, python-pycryptodomex,
python-pyhamcrest, python-pysmi, python-scapy, python-semver,
python-serial-asyncio, python-typing, python-uvloop, pythonwrapt,
python-yarl, python-zeroconf, riscv-pk, sedutil, spandsp, tini, waffle,
xapian

Removed packages: bootutils, dsp-tools, expedite, gst-dsp, xloader

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2018.11

Many thanks to the people contributing to this release:

git shortlog -s -n 2018.08..

   216	Fabrice Fontaine
   188	Bernd Kuhls
   126	Thomas Petazzoni
   117	Asaf Kahlon
    78	Peter Korsgaard
    75	Francois Perrad
    64	Peter Seiderer
    46	Baruch Siach
    38	Yann E. MORIN
    34	Christopher McCrory
    29	Matt Weber
    26	Giulio Benetti
    23	Romain Naour
    19	Grzegorz Blach
    14	Yegor Yefremov
    13	J?rg Krause
    12	Angelo Compagnucci
    11	Carlos Santos
    10	Adrian Perez de Castro
    10	Mark Corbin
    10	Petr Vorel
     9	Fabio Estevam
     8	Adam Duskett
     8	Alexey Brodkin
     8	Christian Stewart
     7	Eric Le Bihan
     7	Gilles Talis
     7	Ricardo Martincoski
     6	Ferdinand van Aartsen
     6	Gary Bisson
     6	Marcin Niestroj
     5	James Hilliard
     4	Arnout Vandecappelle (Essensium/Mind)
     4	Jagan Teki
     4	Joseph Kogut
     4	Lothar Felten
     4	Marcel Patzlaff
     4	Martin Bark
     4	Valentin Korenblit
     3	Brad Love
     3	Danomi Manchego
     3	Erico Nunes
     3	Jared Bents
     3	Joel Carlson
     3	Joel Stanley
     3	Luca Ceresoli
     3	Olivier Schonken
     3	Paresh Chaudhary
     3	Serj Kalichev
     2	Alexander Sverdlin
     2	Artyom Panfilov
     2	David Pierret
     2	Florian La Roche
     2	Frank Hunleth
     2	Gustavo Pimentel
     2	Marcus Folkesson
     2	Michal Sojka
     2	Nikolay Dimitrov
     2	Robert J. Heywood
     2	Sam Voss
     2	Stefan S?rensen
     2	Trent Piepho
     2	Vincent Prince
     2	Zoltan Gyarmati
     1	Adrien Gallou?t
     1	Alexander 'z33ky' Hirsch
     1	Alistair Francis
     1	Andreas Naumann
     1	Andr? Hentschel
     1	Andy Shevchenko
     1	Antoine Tenart
     1	Bartosz Golaszewski
     1	Benjamin Calderon
     1	Chris Packham
     1	DUPONCHEEL S?bastien
     1	Dan Riegsecker
     1	Daniel Fahlgren
     1	David Lechner
     1	Evgeniy Didin
     1	Florian Fainelli
     1	Floris Bos
     1	Francois Beerten
     1	Francois Gerin
     1	Geert Visser
     1	Gr?goire Delattre
     1	Gwenhael Goavec-Merou
     1	Johan Oudinet
     1	Joshua Henderson
     1	Laurent Cans
     1	Martin Kepplinger
     1	Matt Flax
     1	Max Filippov
     1	Mirza Krak
     1	Nicolas Cavallari
     1	Petr Kulhavy
     1	Philipp Wagner
     1	Pierre CROKAERT
     1	Pieterjan Camerlynck
     1	Ryan Coe
     1	Sergio Prado
     1	Sumit Garg
     1	S?bastien Szymanski
     1	Thomas Claveirole
     1	Titouan Christophe
     1	Tobias Klauser
     1	William Wennerstr?m

And a special thanks to our patch reviewers:

git log 2018.08.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     45 Yegor Yefremov <yegorslists@googlemail.com>
     31 Francois Perrad <francois.perrad@gadz.org>
     28 "Yann E. MORIN" <yann.morin.1998@free.fr>
     10 Matt Weber <matthew.weber@rockwellcollins.com>
      7 Luca Ceresoli <luca@lucaceresoli.net>
      6 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      5 Romain Naour <romain.naour@gmail.com>
      5 Petr Vorel <petr.vorel@gmail.com>
      4 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
      4 Asaf Kahlon <asafka7@gmail.com>
      3 Romain Naour <romain.naour@smile.fr>
      3 Ricardo Martincoski <ricardo.martincoski@gmail.com>
      3 Peter Seiderer <ps.report@gmx.net>
      1 Valentin Korenblit<valentinkorenblit@gmail.com>
      1 Titouan Christophe <titouan.christophe@railnova.eu>
      1 Stefan Becker <chemobejk@gmail.com>
      1 "Robert J. Heywood" <robert.heywood@codethink.co.uk>
      1 Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
      1 Matt Weber <mailto:matthew.weber@rockwellcollins.com>
      1 Marcin Niestroj <m.niestroj@grinn-global.com>
      1 Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
      1 Jagan Teki <jagan@amarulasolutions.com>
      1 Gary Bisson <gary.bisson@boundarydevices.com>
      1 Francois Perrad <francois.perrad at gadz.org
      1 Ferdinand van Aartsen <ferdinand@ombud.nl>
      1 Fabrice Fontaine <fontaine.fabrice@gmail.com>
      1  Fabio Estevam <festevam@gmail.com>
      1 Erico Nunes <nunes.erico@gmail.com>
      1 Eric Le Bihan <eric.le.bihan.dev@free.fr>
      1 Anisse Astier <anisse@astier.eu>
      1 Adrian Perez de Castro <aperez@igalia.com>

Once again our autobuilders have helped us fix a huge amount of build
issues. Thanks to all the people reviewing failures and fixing issues:

for i in $(git log --format=%H 2018.08..); do \
    git show --quiet $i | grep -q http://autobuild && \
    git show --quiet --format="%an" $i ; done | sort | uniq -c | \
        sort -rn -k1

    102 Fabrice Fontaine
     28 Bernd Kuhls
     23 Baruch Siach
     16 Peter Seiderer
     14 Giulio Benetti
     10 Thomas Petazzoni
      9 Asaf Kahlon
      6 Yann E. MORIN
      6 Peter Korsgaard
      3 Yegor Yefremov
      2 J?rg Krause
      2 Francois Perrad
      2 Christopher McCrory
      2 Adrian Perez de Castro
      2 Adam Duskett
      1 Sergio Prado
      1 S?bastien Szymanski
      1 Romain Naour
      1 Pieterjan Camerlynck
      1 Petr Vorel
      1 Joseph Kogut
      1 Joel Carlson
      1 Gwenhael Goavec-Merou
      1 Grzegorz Blach
      1 Gary Bisson
      1 Frank Hunleth
      1 Angelo Compagnucci
      1 Alistair Francis
      1 Alexey Brodkin

The next release will be 2019.02. Expect the first release candidate at
the beginning of February and the final release at the end of the month.

This release will be supported with security and other important fixes
until 2019.02 is out. 2019.02 will become the next long term support
release (supported until February 2020).

-- 
Bye, Peter Korsgaard
