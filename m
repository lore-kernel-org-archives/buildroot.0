From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Nov 2014 23:39:22 +0100
Subject: [Buildroot] Buildroot 2014.11-rc1 released
Message-ID: <87k330jb6t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2014.11-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2014.11-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2014.11-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -s -n 2014.08..

   289  Gustavo Zacarias
   126  Thomas Petazzoni
   104  Bernd Kuhls
    78  Peter Korsgaard
    71  Yann E. MORIN
    53  Maxime Hadjinlian
    44  Vicente Olivert Riera
    42  J?rg Krause
    32  J?r?me Pouiller
    32  Samuel Martin
    32  Thomas De Schampheleire
    27  Francois Perrad
    21  Karoly Kasza
    19  Waldemar Brodkorb
    16  Alexey Brodkin
    14  Baruch Siach
    13  Jerzy Grzegorek
    12  Eric Le Bihan
    12  Maarten ter Huurne
    12  Peter Seiderer
    11  Danomi Manchego
    10  Luca Ceresoli
    10  Yegor Yefremov
     8  Romain Naour
     7  Andr? Erdmann
     7  Arnout Vandecappelle
     7  Christophe Vu-Brugier
     7  Fabio Porcedda
     7  Floris Bos
     6  David du Colombier
     6  Frank Hunleth
     5  Angelo Compagnucci
     5  Yuvaraj Patil
     4  Gregory CLEMENT
     4  Max Filippov
     3  Eric Limpens
     3  Jeremy Rosen
     3  Paul Cercueil
     3  Sebastien Bourdelin
     2  Alexey Mednyy
     2  Andreas Larsson
     2  Bryan Brinsko
     2  Eric Benard
     2  Ezequiel Garc?a
     2  Fatih A??c?
     2  Jonathan Ben Avraham
     2  Sagaert Johan
     2  Simon Dawson
     2  Spenser Gilliland
     2  Vincent Stehl?
     2  Vivien Didelot
     1  ANDY KENNEDY
     1  Alvaro G. M
     1  Andrew Ruder
     1  Axel Lin
     1  Beno?t Th?baudeau
     1  Bj?rn Forsman
     1  David Bachelart
     1  Davide Viti
     1  Gary Bisson
     1  Hadrien Boutteville
     1  Jean-Christophe DUBOIS
     1  Jeremy Kerr
     1  Joerg Krause
     1  Kelvin Cheung
     1  Marcin Jabrzyk
     1  Matt Weber
     1  Michal Sojka
     1  Mike Williams
     1  Nathaniel Roach
     1  Pedro Aguilar
     1  Pieter De Gendt
     1  Risto Avila
     1  Ryan Wilkins
     1  Sascha Arthur
     1  Sergey Alyoshin
     1  Vineet Gupta
     1  Zoltan Gyarmati

And a special thanks to our patch reviewers:

git log 2014.08.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

    141 "Yann E. MORIN" <yann.morin.1998@free.fr>
     27 Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
     27 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
     27 Samuel Martin <s.martin49@gmail.com>
     17 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      8 Vicente Olivert Riera <Vincent.Riera@imgtec.com>
      7 Bernd Kuhls <bernd.kuhls@t-online.de>
      4 Luca Ceresoli <luca@lucaceresoli.net>
      4 Gustavo Zacarias <gustavo@zacarias.com.ar>
      4 Markos Chandras <Markos.Chandras@imgtec.com>
      2 Fatih A??c? <fatih.asici@gmail.com>
      1 Yegor Yefremov <yegorslists@googlemail.com>
      1 Romain Naour <romain.naour@openwide.fr>
      1 Nathaniel Roach <nroach44@gmail.com>
      1 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
      1 Markos.Chandras <Markos.Chandras@imgtec.com>
      1 Christophe Vu-Brugier <cvubrugier@fastmail.fm>

This time again we had almost 80 unique contributors! I'm very happy
to see so many "new" people next to the "oldtimers". It was also a very
busy cycle with more than 1200 commits and changes all over the tree.

Of noteworthy new features we have:

 - Architecture:  Use -mcpu / -march instead of -mtune. Support
   additional ARC and sparc variants. Updated Code sourcery
   and Linaro external toolchains.

 - Defconfigs: Freescale iMX6DL SabreSD, Minnowboard MAX, QEMU powerpc64
   pseries added and a number of updates to the existing configurations.

 - Infrastructure: Buildroot is now less noisy when built with the
   silent option (make -s).
   A number of package infrastructure variables have been renamed from
   *_OPT to *_OPTS for constency. Buildroot will complain if the old
   names are used to assist in updating out of tree packages.
   Fixes for host systems where bash isn't located in /bin, and older
   systems not supporting mktemp --tmpdir.
   Various cleanups of users/groups in the default skeleton.
   There is now an option to choose what shell /bin/sh points to.

 - Documentation: Various updates to the user manual. The asciidoc
   documentation handling has now been extended so it can be used by
   (BR2_EXTERNAL) packages.

 - Large number of new packages (48):
   Multimedia/graphics: glm, gst1-validate, libgtk3, libshout,
   mesa3d-demos, modplugtools, mp4v2, shairport-sync, tinyalsa, x264,
   ympd
   Networking: canfestival, dovecot, dovecot-pigeonhole, leafnode2,
   libupnpp, netcat-openbsd, nginx, odhcploc, phidgetwebservice,
   pps-tools, pure-ftpd
   Languages: mono, monolite, python-configshell-fb, python-rtslib-fb,
   python-urwid, ..

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.11-rc1

Like usual, I will now create a next branch and start merging in new
features, rather than wait until 2014.11 is released.

-- 
Bye, Peter Korsgaard
