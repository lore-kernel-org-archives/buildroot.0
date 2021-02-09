From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 09 Feb 2021 23:08:12 +0100
Subject: [Buildroot] Buildroot 2021.02-rc1 released
Message-ID: <87k0rgq4hf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2021.02-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2021.02-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2021.02-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

Once more a busy development cycle with almost 1400 changes and
contributions from 119 unique contributors!

Of noteworthy new features/changes we have:

- Toolchain: Default to binutils 2.35.2, add 2.36.1, drop 2.33.x. Fix
  GCC 10.x ARC adc/sbc pattern handling, Update ARM toolchains to
  10.2-2020.11 release.

- Vulnerability scanning: The CVE checking logic has been extended to
  match packages based on CPE (Common Platform Enumeration) IDs for more
  accurate matching, and CPE identifiers have been added for a large
  amount of packages.

- Download: Rework the tarball creation logic (E.G. when a package is
  fetched from a git/svn repo) to no longer require a host-tar <=
  1.29. To differ between the old and the new format, the new tarballs
  have gained a -br1 suffix (<pkg>-<version>-br1.tar.gz).

- SELinux support: A significant number of packages now pull in the
  relevant refpolicy modules when enabled.

- New defconfigs: arrow avenger96, bananapi M1+, microchip sam9x60ek,
  pine64 rock64

- New packages: balena-engine, casync, coremark, coremark-pro,
  datatables, datatables-buttons, datatables-fixedcolumns,
  datatables-responsive, delve, frotz, gkrellm, inih, jszip, libgeos,
  libiec61850, libmdbx, lualdap, neofetch, nvidia-modprobe, open62541,
  perl-devel-cycle, perl-devel-size, perl-math-int64, ply, popperjs,
  python-bleak, python-defusedxml, python-pycups, python-pytest-asyncio,
  python-typing-extensions, qcom-db410c-firmware, qt5coap, qt5knx,
  qt5mqtt, quickjs, rcw-smarc-sal28, screenfetch, ssdp-responder,
  tpm2-pkcs11, wqy-zenhei, xorcurses


And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.02-rc1


Many thanks to the people contributing to this release:

git shortlog -s -n 2020.11..

   463	Fabrice Fontaine
   125	Bernd Kuhls
   106	Peter Seiderer
    68	Thomas Petazzoni
    59	Peter Korsgaard
    55	Francois Perrad
    33	Yann E. MORIN
    28	Heiko Thiery
    27	Romain Naour
    23	Stephane Viau
    19	Johan Oudinet
    18	Marcin Niestroj
    15	Thomas De Schampheleire
    14	Joachim Wiberg
    14	Maxime Chevallier
    13	Angelo Compagnucci
    13	James Hilliard
    12	Baruch Siach
    12	Petr Vorel
    11	Christian Stewart
    10	Gilles Talis
    10	Joeri Barbarien
     9	Giulio Benetti
     8	Asaf Kahlon
     8	Michael Walle
     8	Sergey Matyukevich
     8	Titouan Christophe
     7	Bartosz Bilas
     7	Fabio Estevam
     7	Gary Bisson
     7	J?rg Krause
     7	Michael Nosthoff
     6	Jianhui Zhao
     6	Maxim Kochetkov
     5	Geoffrey Le Gourri?rec
     5	Gwenhael Goavec-Merou
     5	Tian Yuanhao
     5	Vincent Stehl?
     5	Vineet Gupta
     4	Adrian Perez de Castro
     4	Chris Packham
     4	Grzegorz Blach
     4	Julien Olivain
     4	Matt Weber
     4	Rapha?l M?lotte
     3	Adam Duskett
     3	Alexander Egorenkov
     3	Arnout Vandecappelle (Essensium/Mind)
     3	Gleb Mazovetskiy
     3	Norbert Lange
     3	Pascal Vizeli
     3	Pierre-Jean Texier
     3	Sergio Prado
     3	Yair Ben-Avraham
     2	Andreas Klinger
     2	Bin Meng
     2	D. Olsson
     2	David Barbion
     2	Gao Xiang
     2	Jeff Zignego
     2	Joseph Kogut
     2	Kalpesh Panchal
     2	Leonid Yuriev
     2	Michael Baudino
     2	Michael Fischer
     2	Michael Vetter
     2	Mike Frampton
     2	Min Xu
     2	Stefan Agner
     2	Stefan S?rensen
     2	Thomas Huth
     2	Vadym Kochan
     2	V?clav Kubern?t
     2	Waldemar Brodkorb
     2	Zoltan Gyarmati
     1	Adam Wujek
     1	Alexander Dahl
     1	Andreas Hilse
     1	Antoine Tenart
     1	Bernd Amend
     1	Changming Huang
     1	Christoph M?llner
     1	David GOUARIN
     1	Edmundo Ferreira
     1	Eldar Gasanov
     1	Eugen Hristev
     1	Filip Skoneczny
     1	Florian La Roche
     1	Francois Gervais
     1	Gregory CLEMENT
     1	Guillaume W. Bres
     1	Hector Kesari
     1	Heiko Stuebner
     1	Ignacy Gaw?dzki
     1	Ismael Luceno
     1	Joel Stanley
     1	Jos? Luis Salvador Rufo
     1	Jules Maselbas
     1	Julien Grossholtz
     1	Klaus Heinrich Kiwi
     1	Konrad Schwarz
     1	Laurent Hartanerot
     1	Marcus Folkesson
     1	Mark Corbin
     1	Maxime Brunelle
     1	Mircea GLIGA
     1	Nicolas Cavallari
     1	Pascal de Bruijn
     1	Pieter Ronsijn
     1	Rob Mellor
     1	Ryan Barnett
     1	Samuel Mendoza-Jonas
     1	Simon Rowe
     1	Thomas Claveirole
     1	Timo Ketola
     1	Veronika Kremneva
     1	Yann CARDAILLAC
     1	Yann Sionneau
     1	Yegor Yefremov

And a special thanks to our patch reviewers:

git log 2020.11.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

      9 Matt Weber <matthew.weber@rockwellcollins.com>
      8 Vincent Fazio <vfazio@xes-inc.com>
      8 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      6 Peter Seiderer <ps.report@gmx.net>
      6 Matthew Weber <matthew.weber@rockwellcollins.com>
      5 Gary Bisson <gary.bisson@boundarydevices.com>
      3 Petr Vorel <petr.vorel@gmail.com>
      3 Joel Stanley <joel@jms.id.au>
      2 Yegor Yefremov <yegorslists@googlemail.com>
      2 Romain Naour <romain.naour@gmail.com>
      2 Marcin Niestroj <m.niestroj@grinn-global.com>
      2 Jan Kundr?t <jan.kundrat@cesnet.cz>
      2 Heiko Thiery <heiko.thiery@gmail.com>
      2 Gilles Talis <gilles.talis@gmail.com>
      2 Alistair Francis <alistair.francis@wdc.com>
      2 Adrian Perez de Castro <aperez@igalia.com>
      1 Zoltan Gyarmati <zgyarmati@zgyarmati.de>
      1 Norbert Lange <nolange79@gmail.com>
      1 Michael Nosthoff <buildroot@heine.tech>
      1 Matthew Weber >matthew.weber at rockwellcollins.com
      1 Marcus Folkesson <marcus.folkesson@gmail.com>
      1 Leonid Yuriev <leo@yuriev.ru>
      1 Joachim Wiberg <troglobit@gmail.com>
      1 Giulio Benetti <giulio.benetti@benettiengineering.com>
      1 Christian Stewart <christian@paral.in>
      1 Bin Meng <bin.meng@windriver.com>
      1 Baruch Siach <baruch@tkos.co.il>
      1 Andr? Hentschel <nerv@dawncrow.de>
      1 Alexey Brodkin <abrodkin@synopsys.com>

I will now create a next branch and start merging new features for
2021.05 already in parallel with the 2021.02 stabilization.

-- 
Bye, Peter Korsgaard
