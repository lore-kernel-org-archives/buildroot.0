From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2016 08:25:24 +0100
Subject: [Buildroot] Buildroot 2016.02-rc1 released
Message-ID: <87mvr9rpqz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2016.02-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2016.02-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2016.02-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

This was another fairly big development cycle with almost 1300 changes
all over the tree and close to 100 unique contributors! I'm very happy
to see so many "new" people next to the "oldtimers".

Of noteworthy new features/changes we have:

- Toolchain: Support for GCC 5.3.x. ARC toolchain updated to
  arc-2015.12.
  Support for legacy uClibc dropped, default to uClibc-ng instead.
  Added sys/queue.h implementation for MUSL for compatibility.
  Updated versions of Code sourcery and Linaro toolchains.
  MIPS Codescape toolchains added. Version selection for preconfigured
  external toolchains removed.

- New Defconfigs: ARM Juno r0/r1 development boards, Freescale i.MX6UL
  Evaluation Kit, Intel Galileo Gen 2, Orange Pi PC.
  A number of defconfigs have been extended to generate complete system
  images using genimage.

- Makedevs utility now accepts textual (non-numerical) user and group
  names.

- Vagrant file to easily setup a working development environment
  in a VM has been added.

- Size-stats-compare script to compare rootfs sizes between builds has
  been added.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2016.02-rc1


Many thanks to the people contributing to this release:

git shortlog -s -n 2015.11..

   298	Gustavo Zacarias
   220	Bernd Kuhls
   115	Thomas Petazzoni
    71	Romain Naour
    71	Yann E. MORIN
    54	Vicente Olivert Riera
    49	Yegor Yefremov
    45	Peter Korsgaard
    32	J?rg Krause
    15	Arnout Vandecappelle
    15	Gary Bisson
    14	Sergio Prado
    13	Jerzy Grzegorek
    13	Samuel Martin
    13	Thomas De Schampheleire
    12	Francois Perrad
    12	Joris Lijssens
    12	Peter Seiderer
    12	Waldemar Brodkorb
    10	Martin Bark
     8	Andr? Hentschel
     8	Angelo Compagnucci
     8	Rodrigo Rebello
     7	Beno?t Th?baudeau
     6	Erico Nunes
     6	James Knight
     6	Lada Trimasova
     6	Mauro Condarelli
     5	Alex Suykov
     5	Luca Ceresoli
     4	Baruch Siach
     4	Chris Packham
     4	Doug Kehn
     4	John Keeping
     4	J?r?me Pouiller
     4	Pieterjan Camerlynck
     4	Ricardo Martincoski
     4	Sam bobroff
     4	Volkov Viacheslav
     3	Alexey Brodkin
     3	Davide Viti
     3	Eelco Chaudron
     3	Fabio Porcedda
     3	Jonathan Ben Avraham
     3	No? Rubinstein
     3	Philippe Proulx
     3	Ryan Barnett
     2	Carlos Santos
     2	Ezequiel Garc?a
     2	Joao Pinto
     2	Olivier Schonken
     2	Peter Rosin
     2	Petr Vorel
     2	Phil Eichinger
     2	Ray Kinsella
     2	Renaud AUBIN
     2	Trent Piepho
     2	Vincent Dehors
     1	Abhishek Singh
     1	Alexandre Belloni
     1	Andreas Ehmanns
     1	Andrew Donnellan
     1	Ariel D'Alessandro
     1	Arnout Vandecappelle (Essensium/Mind)
     1	Cam Hutchison
     1	Christophe Vu-Brugier
     1	Danomi Manchego
     1	David du Colombier
     1	Henrique Marks
     1	Hollis Blanchard
     1	Ignacy Gaw?dzki
     1	Jan Heylen
     1	Jan Sarenik
     1	Joao Mano
     1	Johan Oudinet
     1	Johan Sagaert
     1	Juha Rantanen
     1	Julien BOIBESSOT
     1	Julien CORJON
     1	Julien Floret
     1	Marc Gonzalez
     1	Matt Weber
     1	Max Filippov
     1	Maxime Hadjinlian
     1	Michael Schenk
     1	Nathan Ford
     1	Nicolas Cavallari
     1	Nikolay Dimitrov
     1	Sergi Granell
     1	Steven Noonan
     1	Stewart Smith
     1	S?bastien Szymanski
     1	Thomas Claveirole
     1	Tom Rini
     1	Vicente Bergas
     1	Vivien Didelot
     1	lothar felten

And a special thanks to our patch reviewers:

git log 2015.11.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     86 "Yann E. MORIN" <yann.morin.1998@free.fr>
     41 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
     24 Vicente Olivert Riera <Vincent.Riera@imgtec.com>
     10 Gustavo Zacarias <gustavo@zacarias.com.ar>
      7 Romain Naour <romain.naour@gmail.com>
      6 Yegor Yefremov <yegorslists@googlemail.com>
      6 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
      2 "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
      2 Luca Ceresoli <luca@lucaceresoli.net>
      2 Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
      2 Bernd Kuhls <bernd.kuhls@t-online.de>
      1 "Yann E. MORIN" <yann.morin.1998@free.fr>
      1 Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
      1 Samuel Martin <s.martin49@gmail.com>
      1 Romain Naour <romain.naour@openwide.fr>
      1 Rahul Bedarkar <rahul.bedarkar@imgtec.com>
      1 Piotr Nakraszewicz <piotr.nakraszewicz@imgtec.com>
      1 Nikolay Dimitrov <picmaster@mail.bg>
      1  "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
      1 Marcin Nowakowski <marcin.nowakowski@imgtec.com>
      1 J?r?me Pouiller <jezz@sysmic.org>
      1 James Knight <james.knight@rockwellcollins.com>
      1 Gary Bisson <gary.bisson@boundarydevices.com>
      1 Alexandre Belloni <alexandre.belloni@free-electrons.com>
      1 Alexander Dahl <post@lespocky.de>

Like usual, I will now create a next branch and start merging in new
features, rather than wait until 2016.02 is released.

-- 
Bye, Peter Korsgaard
