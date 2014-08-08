From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 09 Aug 2014 00:05:03 +0200
Subject: [Buildroot] Buildroot 2014.08-rc1 released
Message-ID: <87y4uy8wog.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2014.08-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2014.08-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2014.08-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -s -n 2014.05..

   427	Gustavo Zacarias
   112	Yann E. MORIN
   101	Thomas Petazzoni
    86	Bernd Kuhls
    48	Francois Perrad
    39	Peter Korsgaard
    32	Thomas De Schampheleire
    26	Baruch Siach
    24	Samuel Martin
    15	Gary Bisson
    15	Waldemar Brodkorb
    13	Fatih A??c?
    12	Eric Le Bihan
    12	Yegor Yefremov
    11	Danomi Manchego
    10	Alexey Brodkin
    10	Fabio Porcedda
    10	Hadrien Boutteville
     9	Cody P Schafer
     9	Jerzy Grzegorek
     9	Maxime Hadjinlian
     8	Anton Kolesov
     8	Beno?t Th?baudeau
     8	Max Filippov
     8	Peter Seiderer
     7	Arnout Vandecappelle
     7	Vicente Olivert Riera
     6	Simon Dawson
     4	Davide Viti
     4	J?r?me Pouiller
     4	Marcelo Guti?rrez(UTN/FRH)
     4	Matt Weber
     4	Philippe Proulx
     4	Sagaert Johan
     4	Vivien Didelot
     3	Arnaud Aujon
     3	David Bachelart
     3	Ezequiel Garc?a
     3	Oli Vogt
     3	Romain Naour
     3	Steve Thomas
     3	Vincent
     3	Yuvaraj Patil
     2	Alexandre Belloni
     2	Alvaro G. M
     2	Heiko Abraham
     2	Ivan Sergeev
     2	James Hogan
     2	Jeremy Kerr
     2	Joerg Krause
     2	Jordi Llonch
     2	Luca Ceresoli
     2	Nathaniel Roach
     2	Pascal Huerst
     2	Peter K?mmel
     2	Ryan Barnett
     2	Stephan Hoffmann
     2	Sven Neumann
     1	Alvaro Gamez
     1	Andreas Naumann
     1	Angelo Compagnucci
     1	Arnaud R?billout
     1	Clayton Shotwell
     1	Colin Didier
     1	Eric Limpens
     1	Eric Nelson
     1	Henry Margies
     1	Jason Pruitt
     1	Javier Domingo Cansino
     1	Jean-Baptiste Theou
     1	Jeff Bailey
     1	Johan Derycke
     1	Karoly Kasza
     1	Kim De Mey
     1	Marcin Bis
     1	Massimo Callegari
     1	Mischa Jonker
     1	Phil Eichinger
     1	Pieter De Gendt
     1	Rick Taylor
     1	Spenser Gilliland
     1	Xh Xiao
     1	alex.bennee at linaro.org

And a special thanks to our patch reviewers:

git log 2014.05.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

    131 "Yann E. MORIN" <yann.morin.1998@free.fr>
     23 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
     22 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
     19 Samuel Martin <s.martin49@gmail.com>
     13 Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
     12 Gustavo Zacarias <gustavo@zacarias.com.ar>
      5 Markos Chandras <Markos.Chandras@imgtec.com>
      4 Luca Ceresoli <luca@lucaceresoli.net>
      4 Bernd Kuhls <bernd.kuhls@t-online.de>
      2 "Spenser Gilliland" <spenser@gillilanding.com>
      2 Baruch Siach <baruch@tkos.co.il>
      1 Vivien Didelot <vivien.didelot@savoirfairelinux.com>
      1 Ryan Barnett <ryan.barnett@rockwellcollins.com>
      1 Markos Chandras <markos.chandras@imgtec.com>
      1 Eric Le Bihan <eric.le.bihan.dev@free.fr>

This time again we had more than 80 unique contributors! I'm very happy
to see so many "new" people next to the "oldtimers". It was also a very
busy cycle with close to 1200 commits and changes all over the tree.

Of noteworthy new features we have:

 - Architecture: Powerpc64 BE/LE added, AVR32 deprecated.
   Improved altivec / SPE /atomic instructions handling. Additional
   PowerPC CPU variants added.

 - Defconfigs: Atmel SAMA5D3, Congatec QMX6, Lego ev3, TS-5x00,
   qemu-system-xtensa, qemu-aarch64-virt added. A number of tweaks to
   existing ones. lpc32xx defconfigs removed.

 - Toolchain: Microblaze support for internal musl toolchain.
   Default to GCC 4.8 for internal toolchain, remove deprecated 4.3 and
   4.6 versions.
   External CodeSourcery / Linaro toolchain updates, option to copy
   gconv libraries for external toolchains.

 - Infrastructure: graph-depends: misc fixes, transitive dependencies
   are not drawn by default. Download handling is now done using helper
   scripts. Integrity of downloads can now be verified using sha*
   hashes. Subversion download now uses peg revisions for robustness.

   Legal-info: License info of local or overridden packages are saved as
   well. Toolchain packages are also taken into account.
   autotools: Static linking with libtool / v1.5 improvements.
   Gettextize support, similar to autoreconf.

   kconfig package infrastructure added.

 - Large number of new packages (64):
   Multimedia: imx-vpu, libglew, libglu, libmpdclient, libva,
   libva-intel-driver, ncmpc, opencore-amr, sox, twolame
   Perl extensions: perl-datetime-tiny, perl-gd, perl-gdgraph,
   perl-gdtextutil, perl-io-socket-ssl, perl-json-tiny, perl-mojolicious,
   perl-net-ssleay, perl-path-tiny, perl-try-tiny, perl-xml-libxml,
   perl-xml-namespacesupport, perl-xml-sax, perl-xml-sax-base,
   Python extensions: python-cffi, python-daemon, python-flup,
   python-ipython, python-numpy
   Networking: flickcurl, geoip, linux-zigbee, sshpass, whois
   Misc: gnupg2, kexec-lite, memcached, patchelf, ..

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.08-rc1

Like usual, I will now create a next branch and start merging in new
features, rather than wait until 2014.08 is released.

-- 
Bye, Peter Korsgaard
