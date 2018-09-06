From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Sep 2018 22:49:13 +0200
Subject: [Buildroot] Buildroot 2018.08 released
Message-ID: <878t4e73na.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2018.08 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2018.08.tar.gz

or

http://buildroot.net/downloads/buildroot-2018.08.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

This cycle was somewhat smaller than other recent cycles, with "only"
1088 changes all over the tree, but still with more than 100 unique
contributors! Thanks everyone!

Of noteworthy new features/changes we have:

Toolchain:

- add support for gcc 8.x, switch to gcc 7.x as the default version
- add support for gdb 8.1, switch to gdb 8.0 as the defaultand remove
  gdb 7.10/7.11
- add support for binutils 2.31
- NIOSII CodeSourcery toolchain updated
- Linaro AArch64 BE toolchain added, and other Linaro toolchains updated
- Synopsys ARC pre-built toolchain updated

Architecture: add support for ARM Cortex-M7

Major updates:

- systemd bumped to 239
- Qt5 bumped to 5.11.1
- Rust bumped to 1.27
- GStreamer stack bumped to 1.14.2
- X.org server bumped to 1.20, and all X.org proto packages replaced by
  the single xorgproto package
- i.MX6 support packages bumped to 6.2.4
- i.MX Vivante graphics version bumped to 6.2.4.p1.2, adding support for
  Wayland and i.MX8MQ platforms

Linux: bumped to 4.17 by default.

pkg-kconfig: Support dependencies needed to run the configurator,
E.G. recent Linux kernel versions needing flex and bison.

Infrastructure: new package infrastructure added for packages using the
Meson build system

New packages: at-spi2-atk, at-spi2-core, capnproto, cmocka, corkscrew,
cutelyst, davfs2, flatcc, libidn2, libgit2, libopusenc, mender, nghttp2,
perl-convert-asn1, perl-crypt-blowfish, perl-crypt-cbc, perl-digest-md5,
perl-mime-base64-urlsafe, perl-mojolicious-plugin-authentication,
perl-net-ping, perl-net-snmp, perl-net-ssh2, perl-net-telnet, pigz,
python-reentry, python-request-id, python-validators, python-webob,
shadowsocks-libev, speexdsp, xorgproto, wampcc

New defconfigs: NXP i.MX7D SDB, Boundary Devices Nitrogen 8M, Olimex A10
OLinuxino, ZynqMP ZCU106

Removed packages: all xproto_* have been removed and replaced by
xorgproto

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2018.08


Beware of the following known issues:

- Glibc 2.28 on the build host breaks compilation of a number of host
  packages. 2018.08 contains fixes for some of these packages, but not
  all. Consider building on hosts (or in containers) using older Glibc
  versions.

- host-dtc 1.4.7 breaks compilation of older U-Boot and Linux kernel
  configurations using FDT/DTC. Consider updating the Linux kernel to >=
  4.17 and U-Boot to >= 2018.07 or backporting commit 9130ba8846
  (scripts/dtc: Update to upstream version v1.4.6-9-gaadd0b65c987) for
  the Linux kernel / commit db405d1980 for U-Boot.
  Alternatively revert commit 7b929ddcf0 (dtc: bump version to 1.4.7)
  and ensure your build host does not have the libfdt development
  headers installed.


Many thanks to the people contributing to this release:

git shortlog -s -n 2018.05..

   157	Fabrice Fontaine
   150	Bernd Kuhls
    97	Baruch Siach
    84	Yann E. MORIN
    61	Peter Korsgaard
    45	Thomas Petazzoni
    44	Francois Perrad
    41	Fabio Estevam
    38	Romain Naour
    27	Ga?l PORTAY
    20	Thomas De Schampheleire
    18	Gary Bisson
    16	Carlos Santos
    12	Eric Le Bihan
    12	Joseph Kogut
    11	Angelo Compagnucci
    10	Adam Duskett
    10	Evgeniy Didin
    10	J?rg Krause
    10	Martin Bark
    10	Mirza Krak
     7	Laurent Hartanerot
     7	Peter Seiderer
     7	Ricardo Martincoski
     6	Asaf Kahlon
     6	Marcus Folkesson
     6	Matt Weber
     5	Giulio Benetti
     5	Hollis Blanchard
     5	Luca Ceresoli
     4	Alexey Brodkin
     4	Daniel Nicoletti
     4	Florian La Roche
     4	Geoff Levand
     4	Gwenhael Goavec-Merou
     4	Jagan Teki
     4	Joel Carlson
     4	Leon Anavi
     4	Marcin Niestroj
     4	Min Xu
     4	Nicolas Cavallari
     4	Petr Vorel
     4	Pierre Ducroquet
     3	Arnout Vandecappelle (Essensium/Mind)
     3	Julien BOIBESSOT
     3	J?r?my Rosen
     3	Max Filippov
     3	Sven Neumann
     3	Zoltan Gyarmati
     2	Alfredo Alvarez Fernandez
     2	Andr? Hentschel
     2	Antoine Tenart
     2	Artem Panfilov
     2	Bartosz Golaszewski
     2	Christopher McCrory
     2	David Owens
     2	Jan Kraval
     2	Martijn de Gouw
     2	Micha?l Burtin
     2	Ofer Heifetz
     2	Ryan Coe
     2	Thomas Ehrhardt
     2	Trent Piepho
     2	Vasant Hegde
     2	Waldemar Brodkorb
     2	Yegor Yefremov
     1	Alex Suykov
     1	Anssi Hannula
     1	Asgeir Bjarni Ingvarsson
     1	Atanas Palavrov
     1	Brad Love
     1	Bryce Ferguson
     1	Charles Hardin
     1	Christoph Engelbert
     1	Damien Th?bault
     1	Dan Walkes
     1	David Barbion
     1	David De Grave (Essensium/Mind)
     1	Frank Hunleth
     1	Ignacy Gaw?dzki
     1	J. Tang
     1	Jan Dohl
     1	Jan Heylen
     1	Jared Bents
     1	Jason A. Donenfeld
     1	Jean-Fran?ois T?tu
     1	Joel Stanley
     1	Johan Oudinet
     1	John Faith
     1	Keith Mok
     1	Laurent Cans
     1	Mark Corbin
     1	Mathieu Maret
     1	Matt Flax
     1	Mikhail Karpenko
     1	Oleksandr Zhadan
     1	Paresh Chaudhary
     1	Peter Thompson
     1	Pierre-Louis Bossart
     1	Richard Kunze
     1	Robert Beckett
     1	Roman Gorbenkov
     1	Sam Bobroff
     1	Sam Lancia
     1	Samuel Mendoza-Jonas
     1	Sefan Rommel
     1	Stefan S?rensen
     1	S?bastien Szymanski
     1	Thomas Preston
     1	Vadim Kochan
     1	Valentin Korenblit
     1	Vincent Prince
     1	Yannis Damigos

And a special thanks to our patch reviewers:

git log 2018.05.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     32 "Yann E. MORIN" <yann.morin.1998@free.fr>
      6 Peter Seiderer <ps.report@gmx.net>
      5 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      4 Carlos Santos <casantos@datacom.com.br>
      3 Romain Naour <romain.naour@gmail.com>
      3 Ricardo Martincoski <ricardo.martincoski@gmail.com>
      3 Joel Carlson <JoelsonCarl@gmail.com>
      3 Baruch Siach <baruch@tkos.co.il>
      2 Yegor Yefremov <yegorslists@googlemail.com>
      2 Petr Vorel <petr.vorel@gmail.com>
      2 Matt Weber <matthew.weber@rockwellcollins.com>
      1 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
      1 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
      1 Ryan Coe <bluemrp9@gmail.com>
      1 Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
      1 Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
      1 Luca Ceresoli <luca@lucaceresoli.net>
      1 Jan Kundr?t <jan.kundrat@cesnet.cz>
      1 Jagan Teki <jagan@amarulasolutions.com>
      1 Hollis Blanchard <hollis_blanchard@mentor.com>
      1 Eric Le Bihan <eric.le.bihan.dev@free.fr>

Once again our autobuilders have helped us fix a huge amount of build
issues. Thanks to all the people reviewing failures and fixing issues:

for i in $(git log --format=%H 2018.05..); do \
    git show --quiet $i | grep -q http://autobuild && \
    git show --quiet --format="%an" $i ; done | sort | uniq -c | \
        sort -rn -k1

     46 Fabrice Fontaine
     25 Baruch Siach
     21 Bernd Kuhls
     14 Thomas Petazzoni
      5 Peter Seiderer
      4 Matt Weber
      4 Giulio Benetti
      3 Yann E. MORIN
      3 Peter Korsgaard
      3 Marcus Folkesson
      3 Daniel Nicoletti
      2 Joseph Kogut
      2 Francois Perrad
      1 Yegor Yefremov
      1 Thomas De Schampheleire
      1 S?bastien Szymanski
      1 Romain Naour
      1 Min Xu
      1 J?rg Krause
      1 Hollis Blanchard
      1 Gwenhael Goavec-Merou
      1 Gary Bisson
      1 Christopher McCrory
      1 Carlos Santos
      1 Angelo Compagnucci

The next release will be 2018.11. Expect the first release candidate at
the beginning of November and the final release at the end of the month.

This release will be supported with security and other important fixes
until 2018.11 is out. If you need longer support then consider using our
long term support release (2018.02.x) instead which will be supported
until 2019.02.

-- 
Bye, Peter Korsgaard
