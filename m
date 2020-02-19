From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2020 14:05:52 +0100
Subject: [Buildroot] Buildroot 2020.02-rc1 released
Message-ID: <87zhded8wf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2020.02-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2020.02-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2020.02-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

Again a very active development cycle with more than 1400 changes and
contributions from more than 120 unique contributors!

Of noteworthy new features/changes we have:

- Add experimental support for building with a per-package target and
  host directory. This still has some rough edges, but brings a number
  of advantages:

  - Packages will only be able to access the explicitly listed
    dependencies and not any other packages that happen to be built
    before, ensuring correct dependency information in Buildroot.

  - Possibility for top-level parallel builds, speeding up builds on
    multicore machines.

- Architecture: Add support for ARC-HS38 with 64bit multiplier variant,
  allow building glibc for big endian ARC, handle 16KB MMU page size for
  ARC in toolchain wrapper.

- Toolchain: Add binutils 2.33.1, GCC 7.5.0, Arm 9.2-2019.12 toolchains,
  ARC 2019.09 toolchain. Allow using custom kernel headers newer than
  what is known by Buildroot.

- pkg-stats: Support for CVE vulnerability reporting by comparing to NVD
  database.

- Util-linux: Ensure that hwclock is built without GPLv3 code. Notice
  that builds with hwclock has contained GPLv3-licensed code since
  util-linux 2.30 (Buildroot 2017.08+)

- New defconfigs: Beelink GS1, Raspberrypi4 64bit

- New packages: alura, avro-c, bubblewrap, cctz, cereal, qcpuburn-arm,
  elixir, erlang-base64url, erlang-idna, erlang-jose, erlang-p1-acme,
  erlang-p1-mqtree, erlang-p1-yconf, fluid-soundfont, fluidsynth,
  gcnano-binaries, gensio, glslsandbox-player, libargon2,
  libmodsecurity, libpam-nfc, libtelnet, lua-codegen, lua-livr,
  lua-livr-extra, lua-rotas, lua-silva, mfoc, network-manager-openvpn,
  nginx-modsecurity, perl-crypt-openssl-aes, perl-math-prime-util,
  pipewire, ptm2human, python-aenum, python-aiohttp-debugtoolbar,
  python-aiohttp-mako, python-aiologstash, python-aiosignal,
  python-aiozipkin, python-async-lru, python-avro, python-bunch,
  python-crontab, python-dnspython, python-entrypoints, python-esptool,
  python-frozenlist, python-future, python-gitdb, python-janus,
  python-lockfile, python-logstash, python-nested-dict, python-pbr,
  python-pyaes, python-pydantic, python-smmap2, python-sockjs,
  python-zc-lockfile, raspi-gpio, rocksdb, sdbusplus, spidermonkey,
  thermald, ti-sgx-libgbm, tinyssh, tio, umtprd, weston-imx,
  wireguard-linux-compat, wireguard-tools, xdg-dbus-proxy

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.02-rc1


Many thanks to the people contributing to this release:

git shortlog -s -n 2019.11..

   293	Fabrice Fontaine
    99	Bernd Kuhls
    97	Peter Korsgaard
    72	Heiko Thiery
    58	Thomas Petazzoni
    53	James Hilliard
    52	Adam Duskett
    40	Francois Perrad
    39	Peter Seiderer
    36	Yann E. MORIN
    31	Giulio Benetti
    31	Mark Corbin
    31	Romain Naour
    29	Pierre-Jean Texier
    25	Johan Oudinet
    24	Pascal de Bruijn
    21	Titouan Christophe
    17	Angelo Compagnucci
    16	Julien Olivain
    15	J?rg Krause
    14	Matt Weber
    13	Carlos Santos
    13	J?r?my Rosen
    12	Bartosz Bilas
    12	Fabio Estevam
    12	Thomas De Schampheleire
    11	Adrian Perez de Castro
    11	Asaf Kahlon
    10	Gilles Talis
    10	Sergey Matyukevich
     9	Christian Stewart
     9	Grzegorz Blach
     9	Louis Aussedat
     9	Yegor Yefremov
     8	Gwenhael Goavec-Merou
     7	Aleksander Morgado
     7	Arnout Vandecappelle (Essensium/Mind)
     7	Paul Cercueil
     7	Ryan Coe
     5	Baruch Siach
     5	Frank Vanbever
     5	Luca Ceresoli
     5	Refik Tuzakli
     4	Arthur Courtel
     4	Eugen Hristev
     4	Jens Kleintje
     4	Lothar Felten
     4	Michael Vetter
     4	Petr Vorel
     4	Sergio Prado
     3	Alexey Brodkin
     3	Alistair Francis
     3	Ash Charles
     3	Bartosz Golaszewski
     3	Evgeniy Didin
     3	Jan Kiszka
     3	Jan Kotas
     3	Jan Kundr?t
     3	Joris Offouga
     3	Maeva Manuel
     3	Mircea Gliga
     3	Nicolas Cavallari
     3	Viktar Palstsiuk
     3	Vineet Gupta
     2	Alexander Lukichev
     2	Alexandre PAYEN
     2	Andr? Hentschel
     2	Christian Kellermann
     2	Cl?ment P?ron
     2	Dario Binacchi
     2	Gary Bisson
     2	Gervais, Francois
     2	Joel Stanley
     2	Marcus Folkesson
     2	Max Filippov
     2	Patrick Havelange
     2	Ricardo Martincoski
     2	Ryan Barnett
     2	Thomas Preston
     2	Yi Zheng
     1	Alex Michel
     1	Alexey Lukyanchuk
     1	Alifer Moraes
     1	Atharva Lele
     1	Benjamin Kamath
     1	Christopher McCrory
     1	Clayton Shotwell
     1	Dan Walkes
     1	David Owens
     1	Eric Le Bihan
     1	Gabriel Potter
     1	Ignacy Gaw?dzki
     1	Ismael Luceno
     1	James Byrne
     1	Jared Bents
     1	Jerry Huang
     1	John Faith
     1	Julien Grossholtz
     1	Koen Martens
     1	Laurent Cans
     1	Louis Rannou
     1	Luc Creti
     1	Markus Mayer
     1	Max Berger
     1	Michael Drake
     1	Michael Fischer
     1	Michael Walle
     1	Min Xu
     1	Nathaniel Roach
     1	Nicola Di Lieto
     1	Nicolas Carrier
     1	Nikita Sobolev
     1	Pedro Jardim
     1	Philippe Reynes
     1	Sam Bobroff
     1	Santosh Multhalli
     1	Schenk Michael
     1	Simon Rowe
     1	Tom Marcuzzi
     1	Tudor Holton
     1	Vadim Kochan
     1	Vincent Fazio
     1	Wesley Chow
     1	Zoltan Gyarmati


And a special thanks to our patch reviewers:

git log 2019.11.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

      5 Peter Seiderer <ps.report@gmx.net>
      4 Romain Naour <romain.naour@smile.fr>
      4 Luca Ceresoli <luca@lucaceresoli.net>
      4 Adrian Perez de Castro <aperez@igalia.com>
      3 Petr Vorel <petr.vorel@gmail.com>
      3 Giulio Benetti <giulio.benetti@benettiengineering.com>
      3 Alistair Francis <alistair.francis@wdc.com>
      2 "Yann E. MORIN" <yann.morin.1998@free.fr>
      2 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
      2 Joel Stanley <joel@jms.id.au>
      2 Gilles Talis <gilles.talis@gmail.com>
      2 Heiko Thiery <heiko.thiery@kontron.com>
      1 Yegor Yefremov <yegorslists@googlemail.com>
      1 Sergey Matyukevich <geomatsi@mail.com>
      1 Romain Naour <romain.naour@gmail.com>
      1 Michael Trimarchi <michael@amarulasolutions.com>
      1 Matt Weber <matt@thewebers.ws>
      1 Matt Weber <matthew.weber@rockwellcollins.com>
      1 Ludovic Desroches <ludovic.desroches@microchip.com>
      1 Joel Carlson <JoelsonCarl@gmail.com>
      1 Gary Bisson <bisson.gary@gmail.com>
      1 Fabio Estevam <festevam@gmail.com>
      1 Carlos Santos <unixmania@gmail.com>
      1 Baruch Siach <baruch@tkos.co.il>
      1 Alexander Dahl <post@lespocky.de>
      1 Adam Duskett <aduskett@gmail.com>


We had a very nice developers' meeting in Brussels earlier this month with lots
of work getting done:

https://elinux.org/Buildroot:DeveloperDaysFOSDEM2020

Many thanks to the participants and sponsors!


A next branch has already been created, and changes for the 2020.05 have
started to get merged.


Keep in mind that 2020.02 will become the new long term support release,
replacing 2020.02.

-- 
Bye, Peter Korsgaard
