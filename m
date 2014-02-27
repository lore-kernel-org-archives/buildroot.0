From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2014 22:03:49 +0100
Subject: [Buildroot] Buildroot 2014.02 released
Message-ID: <87ob1s8dze.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2014.02 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2014.02.tar.gz

or

http://buildroot.net/downloads/buildroot-2014.02.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

After 3 months of development a new stable Buildroot release is
out. Significant changes are:

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

 - Python and Luarocks package infrastructure support. See user manual
   for details.

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

http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.02

This time we had more than 80 unique contributors! I'm very happy to see
so many "new" people next to the "oldtimers". It was once again a very
busy cycle with more than 1100 commits (biggest so far!) and changes all
over the tree.

This release also marks the 5 year anniversary of us doing regular
releases every 3 months!

Many thanks to all the people contributing to this release:

git shortlog -s -n 2013.11..

   188	Gustavo Zacarias
   133	Thomas Petazzoni
    94	Peter Korsgaard
    80	Yann E. MORIN
    73	Thomas De Schampheleire
    58	Bernd Kuhls
    40	Simon Dawson
    33	Axel Lin
    30	Francois Perrad
    30	Samuel Martin
    29	Baruch Siach
    25	Jerzy Grzegorek
    22	Maxime Hadjinlian
    22	Ryan Barnett
    20	Vicente Olivert Riera
    19	Yegor Yefremov
    17	Arnout Vandecappelle
    15	Romain Naour
    12	Fatih A??c?
    11	Spenser Gilliland
    10	Fabio Porcedda
    10	Julien Boibessot
     8	Mischa Jonker
     8	Sven Neumann
     7	Anders Darander
     6	Danomi Manchego
     6	Paul Cercueil
     5	eric.le.bihan.dev at free.fr
     4	Ezequiel Garc?a
     4	Frank Hunleth
     4	Jeremy Kerr
     4	Jeremy Rosen
     4	J?r?me Pouiller
     4	Ludovic Desroches
     4	Marcelo Guti?rrez(UTN/FRH)
     4	Martin Bark
     3	Bj?rn Forsman
     3	Chris Packham
     3	Matt Weber
     3	Peter Seiderer
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
     2	Frank Bergmann
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
     1	Gary Bisson
     1	Markos Chandras
     1	Mathias De Mar?
     1	Matthew Weber
     1	Max Filippov
     1	Nicolas Dechesne
     1	Nix
     1	Noam Camus
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

     42 "Yann E. MORIN" <yann.morin.1998@free.fr>
     24 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
     20 Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
     18 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
     10 Samuel Martin <s.martin49@gmail.com>
      5 Ryan Barnett <rjbarnet@rockwellcollins.com>
      4 "Samuel Martin" <s.martin49@gmail.com>
      4 Luca Ceresoli <luca@lucaceresoli.net>
      4 Gustavo Zacarias <gustavo@zacarias.com.ar>
      1 Thomas De Schampheleire <patrickdepinguin@gmail.com>
      1 Spenser Gilliland <spenser@gillilanding.com>
      1 Simon Dawson <spdawson@gmail.com>
      1 Samuel Martin <smartin@aldebaran-robotics.com>
      1 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
      1 Markos Chandras <markos.chandras@imgtec.com>
      1 Julien Boibessot <julien.boibessot@armadeus.com>
      1 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
      1 Eric Jarrige <eric.jarrige@armadeus.org>
      1 Arvid Picciani <aep@exys.org>

Once again our autobuilders have helped us fix a huge amount of build
issues. Thanks to all the people reviewing failures and fixing issues:

for i in $(git log --format=%H 2013.11..); do \
    git show --quiet $i | grep -q http://autobuild && \
    git show --quiet --format="%an" $i ; done | sort | uniq -c | \
        sort -rn -k1

     40 Thomas Petazzoni
     28 Gustavo Zacarias
     23 Baruch Siach
     19 Peter Korsgaard
     13 Samuel Martin
     10 Ryan Barnett
      9 Romain Naour
      8 Vicente Olivert Riera
      7 Thomas De Schampheleire
      6 Simon Dawson
      4 Bernd Kuhls
      3 Arnout Vandecappelle
      3 Francois Perrad
      3 Fatih A??c?
      3 Fabio Porcedda
      2 Yann E. MORIN
      2 Spenser Gilliland
      2 Maxime Hadjinlian
      2 Anton Kolesov
      1 Sonic Zhang
      1 Julien Boibessot
      1 Jeremy Rosen
      1 Frank Bergmann
      1 Ezequiel Garc?a
      1 Clayton Shotwell
      1 Christophe Vu-Brugier
      1 Axel Lin
      1 Alexander Lukichev

A special thanks to Thomas Petazzoni for handling the maintainer duties
while I was away!

Next release will be 2014.05. Expect the first release candidate early
May, and the final release at the end of the month.

We had a very nice developer days meeting after FOSDEM in Brussels,
Belgium. Thanks to all the attendees and especially Arnout Vandecappelle
for writing a detailed report about the session and to Google and Mind
for sponsoring:

http://lists.busybox.net/pipermail/buildroot/2014-February/088373.html

The next developers meeting will take place just before the Embedded
Linux Conference Europe in D?sseldorf, Germany:

http://lists.busybox.net/pipermail/buildroot/2014-February/088978.html

We are looking for companies willing to sponsor this Developers
Meeting. The budget is in the 250-500 EUR range, so it's fairly cheap
for most companies, but allows us to cover the cost of the meeting room,
and optionally the Saturday dinner for the participants.

And finally we already have a number of interesting changes lined up for
the next cycle (either already on next or under review):

 - Uptodate systemd package and support for eudev

 - Update of the Freescale iMX hardware acceleration and TI graphics
   drivers

 - Python version update and support for building external python
   packages against python 3.

 - Support for Glibc 2.19 in the internal toolchain

 - Infrastructure for parallel toplevel builds

 - Perl packaging infrastructure

 - XBMC

.. And a new website!

Enjoy!

-- 
Bye, Peter Korsgaard
