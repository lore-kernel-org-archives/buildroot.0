From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Sep 2019 23:34:33 +0200
Subject: [Buildroot] Buildroot 2019.08 released
Message-ID: <87sgpf1z12.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2019.08 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2019.08.tar.gz

or

http://buildroot.net/downloads/buildroot-2019.08.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

This was another big development cycle with more than 1200 changes all
over the tree and more than 100 unique contributors! I'm once again very
happy to see so many "new" people next to the "oldtimers".

Of noteworthy new features/changes we have:

- Architectures: Internal toolchain support for C-SKY, support for ARC
  HS48 v3.1 and HS38 with Quad MAC & FPU, support for ARM A76, A76/A55
  big.LITTLE, emag, neoverse-N1, phecda and tsv110.

- toolchain: ARC toolchain updated to 2019.03 (binutils 2.32.51 / GCC
  8.3.1 / glibc 2.29), ARM AAarch64/ARM toolchains updated to
  2019.03. Add GCC 9.1.0, remove GCC 4.9 and 6.5, add GDB 8.3, remove
  GDB 7.12 and 8.0.1, default to GDB 8.2, GCC 8.3.0. Musl updated to
  1.1.23, bringing support for RISC-V 64.

- Br2-external: Add support for injecting additional options to the list
  of preconfigured external toolchains and libjpeg and openssl providers
  using files under provides/. See the manual for details.

- pkg-stats: support outputting in JSON format with --json for easier
  post processing. The classic HTML output is still available with
  --html. Parallelize access to release-monitoring.org to speed up
  runtime.

- Drop non-conventional version prefix/suffix/separators for packages
  for better compatibility with release-monitoring.org

- Init systems: Add basic openrc support and <pkg>_INSTALL_INIT_OPENRC
  variable in the infrastructure to install openrc service scripts if
  enabled.

- New packages: bitcoin, c-capnproto, fatcat, ifmetric, jack1,
  jailhouse, libubootenv, luasyslog, mender-grubenv, murata-cyw-fw,
  openrc, piglit, python-colorama, python-cycler, python-hiredis,
  python-ifaddr, python-inflection, python-iptables, python-matplotlib,
  python-periphery, python-pycairo, python-redis, python-termcolor,
  python-tinyrpc, python-txdbus, skeleton-init-openrc, spdlog, sshguard,
  stellarium, zziplib

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.08

Many thanks to the people contributing to this release:

git shortlog -s -n 2019.05..

   213	Fabrice Fontaine
   209	Bernd Kuhls
    77	Adam Duskett
    69	Thomas Petazzoni
    63	Peter Korsgaard
    62	Pierre-Jean Texier
    42	Yann E. MORIN
    38	Giulio Benetti
    33	Romain Naour
    29	Baruch Siach
    25	Francois Perrad
    19	J?rg Krause
    16	Guo Ren
    15	Arnout Vandecappelle (Essensium/Mind)
    15	Asaf Kahlon
    15	Ricardo Martincoski
    15	Victor Huesca
    14	Petr Vorel
    13	Adrian Perez de Castro
    12	Carlos Santos
    11	Peter Seiderer
    10	Gilles Talis
    10	Titouan Christophe
     9	Joris Offouga
     8	James Hilliard
     8	Marcin Niestroj
     8	Matt Weber
     6	Angelo Compagnucci
     6	Etienne Carriere
     6	Jugurtha BELKALEM
     6	Julien Olivain
     6	Micha? ?yszczek
     6	Shyam Saini
     5	Alistair Francis
     5	Atharva Lele
     5	Bartosz Bilas
     5	Grzegorz Blach
     5	S?bastien Szymanski
     4	Alexey Brodkin
     4	Evgeniy Didin
     4	Lubomir Rintel
     4	Markus Mayer
     4	Michael Cullen
     4	Vadim Kochan
     3	Esben Haabendal
     3	Fabio Estevam
     3	Jerzy Grzegorek
     3	Joel Stanley
     3	Ludovic Desroches
     3	Marcel Patzlaff
     3	Thomas De Schampheleire
     2	Alexandre PAYEN
     2	Bartosz Golaszewski
     2	Biagio Montaruli
     2	Brent Generous
     2	Jan Kundr?t
     2	Jared Bents
     2	Julien BOIBESSOT
     2	Mark Corbin
     2	Mirza Krak
     2	Nicolas Cavallari
     2	Nicolas Serafini
     2	Nylon Chen
     2	Paulo Serra Filho
     2	Ryan Coe
     2	Serhii Sakhno
     2	Zoltan Gyarmati
     1	Adam Heinrich
     1	Alex Xu
     1	Alexandru Ardelean
     1	Arno Messiaen
     1	Arnold Bloemert
     1	Brandon Maier
     1	Brett Gyarfas
     1	Carlo Caione
     1	Christian Stewart
     1	Damien DUVAL
     1	Daniel J. Leach
     1	David Rosca
     1	Denis Osterland
     1	Einar Jon Gunnarsson
     1	Fabio Urquiza
     1	Frank Vanbever
     1	Ismael Luceno
     1	Jan Willem Janssen
     1	Joel Carlson
     1	John Faith
     1	John Keeping
     1	Julien Grossholtz
     1	Kieran Bingham
     1	Oleksandr Zhadan
     1	Olivier Schonken
     1	Philip Molloy
     1	Philipp Wagner
     1	Raul Hidalgo Caballero
     1	Sam Bobroff
     1	Samuel Mendoza-Jonas
     1	Sergio Prado
     1	Signed-off-by: Alex Xu
     1	Simon Rowe
     1	S?rensen, Stefan
     1	Thomas Huth
     1	Trent Piepho
     1	Vincent Stehl?
     1	Yi Zheng
     1	?? ?

And a special thanks to our patch reviewers:

git log 2019.05.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     16 Yann E. MORIN <yann.morin.1998@free.fr>
     12 Thomas Huth <huth@tuxfamily.org>
      6 Francois Perrad <francois.perrad@gadz.org>
      5 Petr Vorel <petr.vorel@gmail.com>
      4 Matthew Weber <matthew.weber@rockwellcollins.com>
      3 Yegor Yefremov <yegorslists@googlemail.com>
      3 Romain Naour <romain.naour@smile.fr>
      3 Peter Seiderer <ps.report@gmx.net>
      3 Fabio Estevam <festevam@gmail.com>
      3 Alexey Brodkin <abrodkin@synopsys.com>
      3 Adrian Perez de Castro <aperez@igalia.com>
      2 "Yann E. MORIN" <yann.morin.1998@free.fr>
      2 Matt Weber <matthew.weber@rockwellcollins.com>
      2 Ludovic Desroches <ludovic.desroches@microchip.com>
      2 Guo Ren <guoren@kernel.org>
      2 Gilles Talis <gilles.talis@gmail.com>
      2 Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>
      2 Atharva Lele <itsatharva@gmail.com>
      2 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      1 Zoltan Gyarmati <zgyarmati@zgyarmati.de>
      1 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
      1 "Sergio Prado" <sergio.prado@e-labworks.com>
      1 Nylon Chen <nylon7@andestech.com>
      1 Rafal Susz <rafal.susz@gmail.com>
      1 Pierre-Jean Texier <pjtexier@koncepto.io>
      1 Mirza Krak <mirza.krak@northern.tech>
      1 Luca Ceresoli <luca@lucaceresoli.net>
      1 J?rg Krause <joerg.krause@embedded.rocks>
      1 Giulio Benetti <giulio.benetti@micronovasrl.com>
      1 Christophe Priouzeau <christophe.priouzeau@st.com>
      1 Chris Packham <judge.packham@gmail.com>
      1 Carlos Santos <unixmania@gmail.com>
      1 Bernd Kuhls <bernd.kuhls@t-online.de>
      1 Adam Duskett <aduskett@gmail.com>

Once again our autobuilders have helped us fix a huge amount of build
issues. Thanks to all the people reviewing failures and fixing issues:

for i in $(git log --format=%H 2019.05..); do \
    git show --quiet $i | grep -q http://autobuild && \
    git show --quiet --format="%an" $i ; done | sort | uniq -c | \
        sort -rn -k1

     98 Fabrice Fontaine
     29 Bernd Kuhls
     11 Giulio Benetti
      8 Thomas Petazzoni
      7 Baruch Siach
      5 Pierre-Jean Texier
      3 Peter Seiderer
      2 Yann E. MORIN
      2 Romain Naour
      2 Petr Vorel
      2 Peter Korsgaard
      2 Nylon Chen
      1 Sam Bobroff
      1 Kieran Bingham
      1 Julien BOIBESSOT
      1 Joris Offouga
      1 J?rg Krause
      1 James Hilliard
      1 Gilles Talis
      1 Evgeniy Didin
      1 Carlos Santos
      1 Arnout Vandecappelle (Essensium/Mind)
      1 Alexandre PAYEN
      1 Adam Duskett

The next release will be 2019.11. Expect the first release candidate at
the beginning of November and the final release at the end of the month.

This release will be supported with security and other important fixes
until 2019.11 is out. If you need longer support then consider using our
long term support release (2019.02.x) instead which will be supported
until March 2020.

The next developers meeting will take place in Lyon, France on October
25-27th, right before the Embedded Linux Conference Europe. Thanks to
Smile for sponsoring the meeting location!

For more details, see the announcement:
http://lists.busybox.net/pipermail/buildroot/2019-August/257679.html

-- 
Bye, Peter Korsgaard
