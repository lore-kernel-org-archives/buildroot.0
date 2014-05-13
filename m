From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 May 2014 10:55:30 +0200
Subject: [Buildroot] Buildroot 2014.05-rc1 released
Message-ID: <87iopaukfx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2014.05-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2014.05-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2014.05-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -s -n 2014.02..

   178	Gustavo Zacarias
   137	Yann E. MORIN
   132	Bernd Kuhls
   124	Thomas Petazzoni
    64	Peter Korsgaard
    48	Samuel Martin
    43	Francois Perrad
    31	Baruch Siach
    29	Jerzy Grzegorek
    28	Fabio Porcedda
    27	Maxime Hadjinlian
    25	Eric Le Bihan
    25	Thomas De Schampheleire
    22	Yegor Yefremov
    19	Max Filippov
    19	Vicente Olivert Riera
    16	Romain Naour
    13	Ryan Barnett
    11	Anton Kolesov
    11	Luca Ceresoli
    10	Peter Seiderer
     7	Arnout Vandecappelle
     7	Frank Hunleth
     6	Axel Lin
     6	Simon Dawson
     5	Clayton Shotwell
     5	Danomi Manchego
     5	Davide Viti
     5	Ezequiel Garc?a
     5	Sagaert Johan
     4	Alexey Brodkin
     4	Hadrien Boutteville
     4	Waldemar Brodkorb
     3	Alexandre Belloni
     3	Alvaro G. M
     3	Fatih A??c?
     3	Ivan Sergeev
     3	Jeremy Kerr
     3	Jer?nimo Lopes
     3	Maarten ter Huurne
     3	Marcelo Gutierrez
     3	Phil Eichinger
     3	Sven Neumann
     2	Andrew Ruder
     2	Brian Beattie
     2	Eric Nelson
     2	Johan Derycke
     2	Matt Weber
     2	Mischa Jonker
     2	Paul Cercueil
     2	Peter K?mmel
     2	Will Wagner
     2	alex.bennee at linaro.org
     1	ANDY KENNEDY
     1	Alexander Khryukin
     1	Andreas Ehmanns
     1	Andrew Barnes
     1	Arnaud Aujon
     1	Arnaud R?billout
     1	Charles Manning
     1	Christophe Vu-Brugier
     1	C?dric Ch?pied
     1	Dan Moulding
     1	Daniel Nystr?m
     1	Denis Bodor
     1	Derycke, Johan
     1	Dima Zavin
     1	Jan Drazil
     1	Jouko Nikula
     1	Julien Boibessot
     1	Lionel Orry
     1	Lucile Quirion
     1	L?vai Tam?s
     1	Marcin Bis
     1	Martin Bark
     1	Noam Camus
     1	Oscar Hellstr?m
     1	Peter Meerwald
     1	Philip Paeps
     1	Przemyslaw Wrzos
     1	Rohan Fletcher
     1	Ryan Coe
     1	Sebastien Bourdelin
     1	Stefan S?rensen
     1	Uwe Kindler
     1	Vincent Stehl?
     1	Wojciech M. Zabolotny

And a special thanks to our patch reviewers:

git log 2014.02.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     50 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
     42 "Yann E. MORIN" <yann.morin.1998@free.fr>
     30 Samuel Martin <s.martin49@gmail.com>
     16 Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
      9 Gustavo Zacarias <gustavo@zacarias.com.ar>
      9 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
      4 Bernd Kuhls <bernd.kuhls@t-online.de>
      3 Markos Chandras <Markos.Chandras@imgtec.com>
      3 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
      2 Markos Chandras <markos.chandras@imgtec.com>
      2 Fatih A??c? <fatih.asici@gmail.com>
      2 Eric Le Bihan <eric.le.bihan.dev@free.fr>
      2 Romain Naour <romain.naour@openwide.fr>
      1 Simon Dawson <spdawson@gmail.com>
      1 Luca Ceresoli <luca@lucaceresoli.net>
      1 Jeremy Kerr <jk@ozlabs.org>
      1 Fabio Porcedda <fabio.porcedda@gmail.com>
      1 Chris Packham <judge.packham@gmail.com>
      1 Baruch Siach <baruch@tkos.co.il>
      1 Paul Cercueil <paul@crapouillou.net>
      1 Maarten ter Huurne <maarten@treewalker.org>

This time again we had more than 80 unique contributors! I'm very happy
to see so many "new" people next to the "oldtimers". It was also a very
busy cycle with close to 1200 commits (a new record I believe) and
changes all over the tree.

Of noteworthy new features we have:

 - Toolchains: Musl C library support. GCC 4.9.x and Glibc 2.19 support.
   Environment variable to control debug output of toolchain wrapper
   renamed to BR2_DEBUG_WRAPPER to match the other variables. Toolchain
   tuple vendor name can now be customized. A GDB gdbinit file is now
   generated for external toolchains to automatically set the correct
   sysroot. Updated Linaro external toolchains and support for ARMEB
   variant. Internal toolchain support for Aarch64 and Microblaze.

 - Kconfig handling for minimum kernel headers version required for
   packages. Now packages needing specific kernel header features can
   specify these requirements in Kconfig.

 - Python package infrastructure extended to handle Python 3.x. Perl and
   virtual package infrastructure support. See user manual for details.

 - Support for (but disabled as it leads to unreproducible builds)
   toplevel parallel builds. See the comment at the top of Makefile for
   details about how to enable it and what the problems are if you want
   to test it.

 - Modern (v212) Systemd version and support for eudev.

 - Large number of new packages (77):
   Big: postgresql, samba4, xbmc. Bootloaders: gnu-efi, grub2, gummiboot.
   Mail: exim, fetchmail. Filesystem: btrfs-progs, e2tools, yaffsutils.
   Lua/Perl/Php/Python related: ljlinenoise, lpeg, lpty, lrandom,
   lsqlite3, lualogging, lua-messagepack, lua-testmore, lunit, lua-coat,
   lua-coatpersistent, lua-csnappy, luajson, perl-module-build,
   php-gnupg, php-imagick, php-ssh2, php-yaml, php-zmq,
   python-libconfig, python-pypcap, python-pyrex

 - New defconfigs: Minnowboard and Altera SoCkit added, updates to a
   bunch of our existing configs.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.05-rc1

Like usual, I will now create a next branch and start merging in new
features, rather than wait until 2014.05 is released.

-- 
Bye, Peter Korsgaard
