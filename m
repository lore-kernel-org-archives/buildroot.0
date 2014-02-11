From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2014 13:38:28 +0100
Subject: [Buildroot] Buildroot 2014.02-rc1 released
Message-ID: <87sirpvn7f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2014.02-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2014.02-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2014.02-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -s -n 2013.11..

   183	Gustavo Zacarias
    84	Thomas Petazzoni
    73	Peter Korsgaard
    72	Yann E. MORIN
    58	Bernd Kuhls
    56	Thomas De Schampheleire
    38	Simon Dawson
    33	Axel Lin
    28	Samuel Martin
    26	Francois Perrad
    25	Jerzy Grzegorek
    24	Baruch Siach
    22	Maxime Hadjinlian
    19	Yegor Yefremov
    17	Ryan Barnett
    15	Vicente Olivert Riera
    12	Fatih A??c?
    11	Spenser Gilliland
    10	Julien Boibessot
     9	Romain Naour
     8	Mischa Jonker
     7	Anders Darander
     7	Arnout Vandecappelle
     7	Sven Neumann
     6	Danomi Manchego
     6	Paul Cercueil
     5	Fabio Porcedda
     5	eric.le.bihan.dev at free.fr
     4	Frank Hunleth
     4	Jeremy Kerr
     4	Jeremy Rosen
     4	J?r?me Pouiller
     4	Ludovic Desroches
     3	Bj?rn Forsman
     3	Chris Packham
     3	Marcelo Guti?rrez(UTN/FRH)
     3	Martin Bark
     3	Matt Weber
     3	Shawn Landden
     3	Sonic Zhang
     3	Wojciech M. Zabolotny
     3	trem
     2	Adrien B?raud
     2	Alexander Lukichev
     2	Alexandre Belloni
     2	Anton Blanchard
     2	Anton Kolesov
     2	Arnaud R?billout
     2	Christophe Vu-Brugier
     2	Ezequiel Garc?a
     2	Lucas De Marchi
     2	Nathan Lynch
     2	Naumann Andreas
     2	Sagaert Johan
     2	Stefan S?rensen
     1	Alan Ott
     1	Andi Shyti
     1	Andrew Ruder
     1	Antoine Pierlot-Garcin
     1	Arnaud Aujon
     1	Clayton Shotwell
     1	Daniel Nystr?m
     1	Ezequiel Garcia
     1	Gary Bisson
     1	Markos Chandras
     1	Mathias De Mar?
     1	Matthew Weber
     1	Nicolas Dechesne
     1	Nix
     1	Noam Camus
     1	Peter Seiderer
     1	Philippe Reynes
     1	Rafal Fabich
     1	S?bastien Szymanski
     1	Thierry Bultel
     1	Thomas Pedersen
     1	Tristan Lelong
     1	Valentine Barshak
     1	Zoltan Gyarmati
     1	universe II

And a special thanks to our patch reviewers:

git log 2013.11.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     33 "Yann E. MORIN" <yann.morin.1998@free.fr>
     21 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
     19 Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
     17 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      6 Samuel Martin <s.martin49@gmail.com>
      5 Ryan Barnett <rjbarnet@rockwellcollins.com>
      4 "Samuel Martin" <s.martin49@gmail.com>
      4 Luca Ceresoli <luca@lucaceresoli.net>
      4 Gustavo Zacarias <gustavo@zacarias.com.ar>
      1 Thomas De Schampheleire <patrickdepinguin@gmail.com>
      1 Spenser Gilliland <spenser@gillilanding.com>
      1 Markos Chandras <markos.chandras@imgtec.com>
      1 Julien Boibessot <julien.boibessot@armadeus.com>
      1 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
      1 Eric Jarrige <eric.jarrige@armadeus.org>
      1 Arvid Picciani <aep@exys.org>

This time we had more than 80 unique contributors! I'm very happy to see
so many "new" people next to the "oldtimers". It was again a very busy
cycle with close to 1000 commits and changes all over the tree.

Of noteworthy new features we have:

 - Support for external packages/defconfigs (BR2_EXTERNAL). See user
   manual for details.

 - Cleanup of environment variable names for consistency. The download
   directory location override (BUILDROOT_DL_DIR) is now called
   BR2_DL_DIR. Likewise the name of the current .config is renamed from
   BUILDROOT_CONFIG to BR2_CONFIG. Please update your post build scripts
   if you use this!

 - Toolchains: uClibc pread/pwrite fixes, GCC stack corruption on ARM
   fix, updated Linaro and Sourcery Codebench external toolchains.
   Internal toolchain support for Microblaze.

 - Python package infrastructure support. See user manual for details.

 - Large number of new packages (67): Mostly networking related: c-ares,
   ca-certificates, fping, libmbim, libnfs, libshairplay, libsocketcan,
   modemmanager, mtr, net-tools, rtmpdump, rtptools, smcroute and
   tcpreplay. Multimedia: gst1-libav, fswebcam, jasper, lbreakout2,
   libass, libbluray, libcdio, libmodplug, ltris, minidlna and vlc.
   Hardware: avrdude, cwiid, gpm, intel-microcode, iucode-tools,
   libevdev, mmc-utils, smstools3 and ti-uim.
   Python: configobj, dialog, json-schema-validator, keyring, msgpack,
   posix-ipc, pyasn, pycrypto, pysnmp, pysnmp-apps, pysnmp-mibs, pyusb,
   simplejson, tornado and versiontools. Lua: lsyscall and luarocks.
   Development: apitrace, evemu and ktap.

 - New defconfigs: Armadeus APF51 and Zedboard added, updates to a bunch
   of our existing configs.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.02-rc1

Like usual, I will now create a next branch and start merging in new
features, rather than wait until 2014.02 is released.

-- 
Bye, Peter Korsgaard
