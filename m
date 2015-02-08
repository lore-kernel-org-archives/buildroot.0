From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Feb 2015 22:26:54 +0100
Subject: [Buildroot] Buildroot 2015.02-rc1 released
Message-ID: <87zj8o3xi9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2015.02-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2015.02-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2015.02-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -s -n 2014.11..

   232  Gustavo Zacarias
   166  Thomas Petazzoni
    94  Peter Korsgaard
    83  Yann E. MORIN
    75  Bernd Kuhls
    56  Vicente Olivert Riera
    41  Romain Naour
    33  Baruch Siach
    26  Yegor Yefremov
    25  Arnout Vandecappelle
    25  Francois Perrad
    24  J?rg Krause
    21  Peter Seiderer
    20  Samuel Martin
    17  Johan Oudinet
    13  Fabio Porcedda
    13  Jerzy Grzegorek
    12  J?r?me Pouiller
    11  Maxime Hadjinlian
     7  Gregory Dymarek
     6  Guido Mart?nez
     6  Richard Genoud
     6  Steve Kenton
     5  Alex Suykov
     5  Bartosz Golaszewski
     5  Fatih A??c?
     5  Nathaniel Roach
     5  Paul Cercueil
     5  Thierry Bultel
     4  Angelo Compagnucci
     4  Clayton Shotwell
     4  David Bender
     4  Floris Bos
     4  Frank Hunleth
     4  Pedro Aguilar
     4  Ryan Coe
     4  Simon Marchi
     4  Zoltan Gyarmati
     3  Alexander Clouter
     3  Alexey Brodkin
     3  Bj?rn Forsman
     3  Doug Kehn
     3  Ivo Slanina
     3  Luca Ceresoli
     3  Maxim Mikityanskiy
     3  Vivien Didelot
     2  Alan Ott
     2  Andr? Hentschel
     2  Beno?t Th?baudeau
     2  Guillaume GARDET
     2  Gwenhael Goavec-Merou
     2  Jens Stimpfle
     2  Nicolas Serafini
     2  Philippe Proulx
     2  Steve James
     2  erico.nunes
     1  Alvaro G. M
     1  Danomi Manchego
     1  Erico Nunes
     1  Ernesto L. Williams Jr
     1  Fabian Mewes
     1  Hadrien Boutteville
     1  Ilya Lipnitskiy
     1  Ivan Sergeev
     1  Jaap Crezee
     1  Jean-Paul Etienne
     1  Jeremy Kerr
     1  Jeremy Rosen
     1  Johan Derycke
     1  Karoly Kasza
     1  Nicolas Cavallari
     1  Oli Vogt
     1  Peter K?mmel
     1  Pierre Le Magourou
     1  Pieter De Gendt
     1  Pieter Ronsijn
     1  Ryan Barnett
     1  Sagaert Johan
     1  Spenser Gilliland
     1  Thomas De Schampheleire
     1  Vanya Sergeev
     1  Vincent
     1  Volker Krause
     1  claurita
     1  gilles.talis at gmail.com

And a special thanks to our patch reviewers:

git log 2014.11.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

    152 "Yann E. MORIN" <yann.morin.1998@free.fr>
     13 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
     11 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
      9 Vicente Olivert Riera <Vincent.Riera@imgtec.com>
      8 Romain Naour <romain.naour@openwide.fr>
      7 Samuel Martin <s.martin49@gmail.com>
      7 Karoly Kasza <kaszak@gmail.com>
      4 Markos Chandras <Markos.Chandras@imgtec.com>
      2 Matt Weber <matthew.weber@rockwellcollins.com>
      1 Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
      1 Ryan Barnett <ryan.barnett@rockwellcollins.com>
      1 Peter Seiderer <ps.report@gmx.net>
      1 Luca Ceresoli <luca@lucaceresoli.net>
      1 Gustavo Zacarias <gustavo@zacarias.com.ar>
      1 Fabio Porcedda <fabio.porcedda@gmail.com>
      1 Bernd Kuhls <bernd.kuhls@t-online.de>

This time again we had more than 80 unique contributors! I'm very happy
to see so many "new" people next to the "oldtimers". We once again had a
lot (1150) of changess all over the tree.

Of noteworthy new features/changes we have:

- Static/shared library handling reworked. This is now a tristate
  (shared only / shared and static / static only). Default is now shared
  only to speed up the build. BR2_PREFER_STATIC_LIB is now called
  BR2_STATIC_LIBS.

- The toolchain (internal and external) will now warn when an unsafe
  library or header path is used (such as /usr/include or /usr/lib). If
  BR2_COMPILER_PARANOID_UNSAFE_PATH is enabled under build options this
  instead becomes an error.

- Architectures: Freescale E5500 and E6500 PowerPC support added,
  deprecated MIPS 1/2/3/4 support removed.

- New defconfigs: Freescale p2020ds, MIPS creator CI20, Raspberrypi with
  DT, UDOO Quad.

- 'make <foo>_defconfig' now saves the path to the defconfig in the
  .config, so a 'make savedefconfig' automatically updates it.

- Infrastructure for packages using the Erland rebar tool has been added.

- Hashes for a large number of packages have been added. Hashes are now
  checked for both target and host packages.

- The system menu now has an option to automatically configure a network
  interface through DHCP at bootup.

- The default filesystem skeleton now uses a separate tmpfs for /run
  instead of a symlink to /tmp/ for security reasons / to protect
  against conflicts with user generated temporary files.

 - Large number of new packages (99): Erlang and Python modules, Kodi,
   SELinux support packages, ..

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.02-rc1

Like usual, I will now create a next branch and start merging in new
features, rather than wait until 2015.02 is released.

-- 
Bye, Peter Korsgaard
