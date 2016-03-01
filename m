From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Mar 2016 22:13:24 +0100
Subject: [Buildroot] Buildroot 2016.02 released
Message-ID: <87lh61kikr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2016.02 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2016.02.tar.gz

or

http://buildroot.net/downloads/buildroot-2016.02.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

This cycle was again a very busy release with almost 1500 changes all
over the tree and more than 100 unique contributors! I'm very happy to
see so many "new" people next to the "oldtimers".

Of noteworthy new features/changes we have:

- Toolchain: Support for GCC 5.3.x. ARC toolchain updated to
  arc-2015.12. Possibility to use the same Linux kernel
  sources for the toolchain kernel headers.
  Support for legacy uClibc dropped, default to uClibc-ng instead.
  Added sys/queue.h implementation for MUSL for compatibility.
  Updated versions of Code sourcery and Linaro toolchains.
  MIPS Codescape toolchains added. Version selection for preconfigured
  external toolchains removed.

- New Defconfigs: Acmesystems Arietta g25, ARM Juno r0/r1 development
  boards, Freescale i.MX6UL Evaluation Kit, Intel Galileo Gen 2, Orange
  Pi PC.  A number of defconfigs have been extended to generate complete
  system images using genimage.

- Makedevs utility now accepts textual (non-numerical) user and group
  names.

- Vagrant file to easily setup a working development environment
  in a VM has been added.

- Linux: timeconst.pl for older (<3.9 kernels) which isn't compatible
  with modern Perl versions now automatically gets patched to fix build
  issues when building on recent distributions (Fedora 23, Debian
  Testing/Unstable, ..).

- Size-stats-compare script to compare rootfs sizes between builds has
  been added.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2016.02


Many thanks to the people contributing to this release:

git shortlog -s -n 2015.11..

   329	Gustavo Zacarias
   303	Bernd Kuhls
   122	Thomas Petazzoni
    82	Romain Naour
    72	Yann E. MORIN
    59	Peter Korsgaard
    56	Vicente Olivert Riera
    50	Yegor Yefremov
    34	J?rg Krause
    18	Arnout Vandecappelle
    15	Gary Bisson
    15	Peter Seiderer
    14	Sergio Prado
    13	Jerzy Grzegorek
    13	Samuel Martin
    13	Thomas De Schampheleire
    12	Francois Perrad
    12	Joris Lijssens
    12	Martin Bark
    12	Waldemar Brodkorb
    11	Angelo Compagnucci
    10	James Knight
     9	Luca Ceresoli
     8	Andr? Hentschel
     8	Rodrigo Rebello
     7	Beno?t Th?baudeau
     7	Lada Trimasova
     6	Baruch Siach
     6	Erico Nunes
     6	Mauro Condarelli
     5	Alex Suykov
     5	John Keeping
     5	Ricardo Martincoski
     4	Chris Packham
     4	Doug Kehn
     4	J?r?me Pouiller
     4	Pieterjan Camerlynck
     4	Sam bobroff
     4	Volkov Viacheslav
     3	Alexey Brodkin
     3	Davide Viti
     3	Eelco Chaudron
     3	Fabio Porcedda
     3	Ignacy Gaw?dzki
     3	Jonathan Ben Avraham
     3	Maxime Hadjinlian
     3	No? Rubinstein
     3	Philippe Proulx
     3	Rahul Bedarkar
     3	Ryan Barnett
     2	Alexandre Belloni
     2	Carlos Santos
     2	Ezequiel Garc?a
     2	Gabe Evans
     2	Joao Pinto
     2	Max Filippov
     2	Olivier Schonken
     2	Peter Rosin
     2	Petr Vorel
     2	Phil Eichinger
     2	Ray Kinsella
     2	Renaud AUBIN
     2	Trent Piepho
     2	Vincent Dehors
     1	Abhishek Singh
     1	Andreas Ehmanns
     1	Andrew Donnellan
     1	Antoine T?nart
     1	Ariel D'Alessandro
     1	Arnout Vandecappelle (Essensium/Mind)
     1	Cam Hutchison
     1	Christophe Vu-Brugier
     1	Danomi Manchego
     1	David du Colombier
     1	Eric Limpens
     1	Henrique Marks
     1	Hollis Blanchard
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
     1	Michael Schenk
     1	Nathan Ford
     1	Neha Bairathi
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
     1	Zoltan Gyarmati
     1	lothar felten
     1	niranjan.reddy

And a special thanks to our patch reviewers:

git log 2015.11.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     98 "Yann E. MORIN" <yann.morin.1998@free.fr>
     58 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
     24 Vicente Olivert Riera <Vincent.Riera@imgtec.com>
     10 Gustavo Zacarias <gustavo@zacarias.com.ar>
      9 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
      8 Yegor Yefremov <yegorslists@googlemail.com>
      7 Romain Naour <romain.naour@gmail.com>
      3 Marcin Nowakowski <marcin.nowakowski@imgtec.com>
      3 Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
      2 Luca Ceresoli <luca@lucaceresoli.net>
      2 Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
      2 Bernd Kuhls <bernd.kuhls@t-online.de>
      1 Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
      1 Samuel Martin <s.martin49@gmail.com>
      1 Romain Naour <romain.naour@openwide.fr>
      1 Rahul Bedarkar <rahul.bedarkar@imgtec.com>
      1 Piotr Nakraszewicz <piotr.nakraszewicz@imgtec.com>
      1 Nikolay Dimitrov <picmaster@mail.bg>
      1 J?r?me Pouiller <jezz@sysmic.org>
      1 James Knight <james.knight@rockwellcollins.com>
      1 "Gwenhael Goavec-Merou" <gwenhael.goavec-merou@trabucayre.com>
      1 Gary Bisson <gary.bisson@boundarydevices.com>
      1 Alexandre Belloni <alexandre.belloni@free-electrons.com>
      1 Alexander Dahl <post@lespocky.de>

Once again our autobuilders have helped us fix a huge amount of build
issues. Thanks to all the people reviewing failures and fixing issues:

for i in $(git log --format=%H 2015.11..); do \
    git show --quiet $i | grep -q http://autobuild && \
    git show --quiet --format="%an" $i ; done | sort | uniq -c | \
        sort -rn -k1

     55 Bernd Kuhls
     44 Thomas Petazzoni
     38 Gustavo Zacarias
     14 Romain Naour
     13 Yann E. MORIN
     10 Vicente Olivert Riera
      9 Peter Korsgaard
      8 Sergio Prado
      7 J?rg Krause
      5 Waldemar Brodkorb
      5 Samuel Martin
      4 Peter Seiderer
      3 Lada Trimasova
      3 Joris Lijssens
      2 Yegor Yefremov
      2 Ricardo Martincoski
      2 Martin Bark
      2 Francois Perrad
      2 Erico Nunes
      2 Baruch Siach
      2 Arnout Vandecappelle
      2 Andr? Hentschel
      2 Alex Suykov
      2 Alexey Brodkin
      1 Thomas De Schampheleire
      1 Ryan Barnett
      1 No? Rubinstein
      1 Maxime Hadjinlian
      1 Max Filippov
      1 Matt Weber
      1 John Keeping
      1 Jan Heylen
      1 Gary Bisson
      1 Eric Limpens
      1 Doug Kehn
      1 David du Colombier

The next release will be 2016.05. Expect the first release candidate in
early May, and the final release at the end of the month.

During this development cycle we had a very nice developers meeting in
Brussels, Belgium. Many thanks to Google and Mind for sponsoring
the event and for all the participants for joining!

http://elinux.org/Buildroot:DeveloperDaysFOSDEM2016

-- 
Bye, Peter Korsgaard
