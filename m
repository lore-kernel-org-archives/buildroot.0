From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Aug 2019 09:19:18 +0200
Subject: [Buildroot] Buildroot 2019.08-rc1 released
Message-ID: <87k1bmn6vd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2019.08-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2019.08-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2019.08-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

Again a fairly active development cycle with ~1100 changes and
contributions from more than 100 unique contributors!

Of noteworthy new features/changes we have:

- Architectures: Internal toolchain support for C-SKY, support for ARC
  HS48 v3.1 and HS38 with Quad MAC & FPU, support for ARM A76, A76/A55
  big.LITTLE, emag, neoverse-N1, phecda and tsv110.

- Toolchain: ARC toolchain updated to 2019.03 (binutils 2.32.51 / GCC
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

- New defconfigs: HiFive Unleashed, I.MX8MM EVK and Pico, Nanopi m4 and
  neo4, Nanopc t4, Olimex A33 olinuxino, Pine64 Rockpro64, PowerPC
  mac99, QEMU C-SKY 610/807/810/860 virt, Raspberry Pi 4, Raxda rock
  pi4, Solidrun Clearfog GT-8K

- New packages: bitcoin, c-capnproto, fatcat, ifmetric, jack1,
  jailhouse, libubootenv, luasyslog, mender-grubenv, murata-cyw-fw,
  openrc, piglit, python-colorama, python-cycler, python-hiredis,
  python-ifaddr, python-inflection, python-iptables, python-matplotlib,
  python-periphery, python-pycairo, python-redis, python-termcolor,
  python-tinyrpc, python-txdbus, skeleton-init-openrc, spdlog, sshguard,
  stellarium, zziplib

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.08-rc1


Many thanks to the people contributing to this release:

git shortlog -s -n 2019.05..

   175	Fabrice Fontaine
   165	Bernd Kuhls
    77	Adam Duskett
    59	Pierre-Jean Texier
    51	Peter Korsgaard
    41	Yann E. MORIN
    38	Giulio Benetti
    35	Thomas Petazzoni
    29	Romain Naour
    25	Baruch Siach
    24	Francois Perrad
    16	Guo Ren
    16	J?rg Krause
    15	Asaf Kahlon
    15	Victor Huesca
    14	Petr Vorel
    12	Arnout Vandecappelle (Essensium/Mind)
    11	Peter Seiderer
    11	Ricardo Martincoski
    10	Gilles Talis
    10	Titouan Christophe
     9	Adrian Perez de Castro
     9	Joris Offouga
     8	James Hilliard
     8	Marcin Niestroj
     8	Matt Weber
     6	Etienne Carriere
     6	Jugurtha BELKALEM
     6	Julien Olivain
     6	Micha? ?yszczek
     6	Shyam Saini
     5	Alistair Francis
     5	Angelo Compagnucci
     5	Atharva Lele
     5	Bartosz Bilas
     5	Carlos Santos
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
     2	Bartosz Golaszewski
     2	Brent Generous
     2	Jan Kundr?t
     2	Jared Bents
     2	Julien BOIBESSOT
     2	Mark Corbin
     2	Mirza Krak
     2	Nicolas Serafini
     2	Nylon Chen
     2	Paulo Serra Filho
     2	Ryan Coe
     2	Serhii Sakhno
     2	Zoltan Gyarmati
     1	Adam Heinrich
     1	Alex Xu
     1	Alexandre PAYEN
     1	Alexandru Ardelean
     1	Arno Messiaen
     1	Arnold Bloemert
     1	Brandon Maier
     1	Brett Gyarfas
     1	Carlo Caione
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
     1	Kieran Bingham
     1	Nicolas Cavallari
     1	Oleksandr Zhadan
     1	Olivier Schonken
     1	Philip Molloy
     1	Philipp Wagner
     1	Raul Hidalgo Caballero
     1	Sam Bobroff
     1	Samuel Mendoza-Jonas
     1	Signed-off-by: Alex Xu
     1	Simon Rowe
     1	Thomas Huth
     1	Trent Piepho
     1	Vincent Stehl?
     1	Yi Zheng
     1	?? ?

And a special thanks to our patch reviewers:

git log 2019.05.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     14 Yann E. MORIN <yann.morin.1998@free.fr>
     12 Thomas Huth <huth@tuxfamily.org>
      6 Francois Perrad <francois.perrad@gadz.org>
      5 Petr Vorel <petr.vorel@gmail.com>
      4 Matthew Weber <matthew.weber@rockwellcollins.com>
      3 Adrian Perez de Castro <aperez@igalia.com>
      2 Yegor Yefremov <yegorslists@googlemail.com>
      2 "Yann E. MORIN" <yann.morin.1998@free.fr>
      2 Romain Naour <romain.naour@smile.fr>
      2 Matt Weber <matthew.weber@rockwellcollins.com>
      2 Ludovic Desroches <ludovic.desroches@microchip.com>
      2 Guo Ren <guoren@kernel.org>
      2 Gilles Talis <gilles.talis@gmail.com>
      2 Fabio Estevam <festevam@gmail.com>
      2 Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>
      2 Atharva Lele <itsatharva@gmail.com>
      2 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      2 Alexey Brodkin <abrodkin@synopsys.com>
      1 Zoltan Gyarmati <zgyarmati@zgyarmati.de>
      1 Nylon Chen <nylon7@andestech.com>
      1 Pierre-Jean Texier <pjtexier@koncepto.io>
      1 Peter Seiderer <ps.report@gmx.net>
      1 Mirza Krak <mirza.krak@northern.tech>
      1 J?rg Krause <joerg.krause@embedded.rocks>
      1 Giulio Benetti <giulio.benetti@micronovasrl.com>
      1 Bernd Kuhls <bernd.kuhls@t-online.de>
      1 Adam Duskett <aduskett@gmail.com>

A next branch has already been created, and we will start merging new
features for 2019.11 already.

-- 
Bye, Peter Korsgaard
