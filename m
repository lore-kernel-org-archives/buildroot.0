From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Jun 2019 10:15:27 +0200
Subject: [Buildroot] Buildroot 2019.05 released
Message-ID: <871s0cv1wg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2019.05 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2019.05.tar.gz

or

http://buildroot.net/downloads/buildroot-2019.05.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

This was another big development cycle with more than 1200 changes all
over the tree and almost 100 unique contributors! I'm once again very
happy to see so many "new" people next to the "oldtimers".

Of noteworthy new features/changes we have:

- Architecture: Andes 32-bit (nds32) support added.

- Only build host-lzip / host-xz when really needed by packages, not
  just when not available on the build host.

- Toolchain: Glibc bumped to 2.29, musl bumped to 1.1.22, binutils 2.32
  added, 2.28/2.29 removed, default changed to 2.31.1.

- Linux: Also build default make target to ensure extra files like the
  gdb scripts enabled by CONFIG_GDB_SCRIPTS are also built. Notice: This
  may mean that extra host utilities like uboot-mkimage are needed.

- Infrastructure: show-info and <pkg>-show-info make targets added to
  output package metadata in JSON format for external use.
  pkg-config no longer uses the .config file to track timestamps as
  Linux 4.19+ touches it, causing rebuilds.

- Gettext-tiny package added as a lightweight replacement for GNU
  gettext for situations where NLS support is not needed.

- New defconfigs: Andes AE3XX, Freescale imx8mpico / imx8qxpmek / T2080
  QDS RDB, Licheepi zero, Orangepi R1

- New packages: bats-core, bayer2rgb-neon, brickd, cog, dacapo, enet,
  gettext-tiny, gli, gst1-plugins-bayer2rgb-neon, imx-sc-firmware,
  intel-mediadriver, intel-mediasdk, libcamera, libhtp, libp11, libwpe,
  lua-binaryheap, lua-gd, lua-lunitx, mender-artifact, most, oniguruma,
  openjdk, openjdk-bin, opensbi, optee-benchmark, optee-client,
  optee-examples, optee-os, optee-test, paho-mqtt-cpp,
  python-aioblescan, python-aioconsole, python-aiohttp-cors,
  python-aiomonitor, python-backcall, python-jedi, python-parso,
  python-pyjwt, python-terminaltables, suricata, tpm2-totp, uftp,
  wpebackend-fdo, wpewebkit

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.05

Many thanks to the people contributing to this release:

git shortlog -s -n 2019.02..

   341	Fabrice Fontaine
   111	Peter Korsgaard
    74	Bernd Kuhls
    65	Adam Duskett
    63	Francois Perrad
    60	Peter Seiderer
    58	Thomas Petazzoni
    41	Yann E. MORIN
    35	Giulio Benetti
    32	Shyam Saini
    28	Romain Naour
    20	Baruch Siach
    19	Asaf Kahlon
    19	J?rg Krause
    18	Vadim Kochan
    17	Etienne Carriere
    17	James Hilliard
    12	Angelo Compagnucci
    12	Arnout Vandecappelle (Essensium/Mind)
     9	Alistair Francis
     9	Andr? Hentschel
     8	Carlos Santos
     8	Christian Stewart
     8	Nylon Chen
     6	Ed Blake
     6	Norbert Lange
     5	Esben Haabendal
     5	Joseph Kogut
     5	Martin Bark
     5	Mirza Krak
     5	Petr Vorel
     4	Adrien Gallou?t
     4	Artem Panfilov
     4	Bartosz Bilas
     4	Joel Stanley
     4	Louis-Paul Cordier
     4	Matt Weber
     4	Max Filippov
     4	Valentin Korenblit
     3	Adrian Perez de Castro
     3	David Lechner
     3	Eric Le Bihan
     3	Ga?l PORTAY
     3	Grzegorz Blach
     3	Jared Bents
     3	Julien Olivain
     3	Martin Kepplinger
     3	Ricardo Martincoski
     3	Sergio Prado
     3	Trent Piepho
     2	Andreas Naumann
     2	Anisse Astier
     2	Artem Senichev
     2	Cl?ment Leger
     2	Eloi Bail
     2	Lubomir Rintel
     2	Markus Mayer
     2	Michel Stempin
     2	Nicolas Serafini
     2	Nityananda Padhan
     2	Pierre-Jean Texier
     2	Samuel Mendoza-Jonas
     2	Thomas De Schampheleire
     1	Abdelmalek Benelouezzane
     1	Alex Xu
     1	Alexandru Ardelean
     1	Alexey Brodkin
     1	Alexey Lukyanchuk
     1	Bartosz Golaszewski
     1	Charlie Turner
     1	DUPONCHEEL S?bastien
     1	David Rosca
     1	Evgeniy Didin
     1	Fabio Estevam
     1	Guo Ren
     1	I?igo Huguet
     1	John Keeping
     1	Jugurtha BELKALEM
     1	Julien BOIBESSOT
     1	Julien Grossholtz
     1	Karsten Merker
     1	Kieran Bingham
     1	Leach, Daniel J
     1	Marcin Niestroj
     1	Mark Corbin
     1	Mark Thompson
     1	Markus Steinhilber
     1	Matt Flax
     1	Micha?l Blanc
     1	Reed Nightingale
     1	Refik TUZAKLI
     1	Ryan Coe
     1	Sam Voss
     1	Stefan Maksimovic
     1	Stuart Summers
     1	Sven Oliver Moll
     1	S?rensen, Stefan
     1	Yegor Yefremov

And a special thanks to our patch reviewers:

git log 2019.02.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     13 "Yann E. MORIN" <yann.morin.1998@free.fr>
      8 Peter Seiderer <ps.report@gmx.net>
      8 Adrian Perez de Castro <aperez@igalia.com>
      2 Romain Naour <romain.naour@smile.fr>
      2 Matthew Weber <matthew.weber@rockwellcollins.com>
      2 Giulio Benetti <giulio.benetti@micronovasrl.com>
      2 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      2 Angelo Compagnucci <angelo@amarulasolutions.com>
      2 Adam Duskett <aduskett@gmail.com>
      1 Thomas Huth <huth@tuxfamily.org>
      1 Ryan Barnett <ryan.barnett@rockwellcollins.com>
      1 Petr Vorel <petr.vorel@gmail.com>
      1 Peter Korsgaard <peter@korsgaard.com>
      1 Max Filippov <jcmvbkbc@gmail.com>
      1 Matt Weber <matthew.weber@rockwellcollins.com>
      1 Kieran Bingham <kieran.bingham@ideasonboard.com>
      1 Julien Floret <julien.floret at 6wind.com
      1 Francois Perrad <francois.perrad@gadz.org>
      1 Fabio Estevam <festevam@gmail.com>
      1 Carlos Santos <unixmania@gmail.com>
      1 Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>
      1 Baruch Siach <baruch@tkos.co.il>
      1 Anisse Astier <anisse@astier.eu>
      1 Alistair Francis <alistair.francis@wdc.com>
      1 Alexey Brodkin <abrokdin@synopsys.com>

Once again our autobuilders have helped us fix a huge amount of build
issues. Thanks to all the people reviewing failures and fixing issues:

for i in $(git log --format=%H 2019.02..); do \
    git show --quiet $i | grep -q http://autobuild && \
    git show --quiet --format="%an" $i ; done | sort | uniq -c | \
        sort -rn -k1

    133 Fabrice Fontaine
     25 Giulio Benetti
     10 Thomas Petazzoni
      8 Vadim Kochan
      7 Baruch Siach
      4 Yann E. MORIN
      4 Nylon Chen
      4 Adam Duskett
      2 Valentin Korenblit
      2 Peter Seiderer
      2 Peter Korsgaard
      2 Max Filippov
      2 Martin Bark
      2 Etienne Carriere
      1 Romain Naour
      1 Nicolas Serafini
      1 J?rg Krause
      1 Ga?l PORTAY
      1 Francois Perrad
      1 Carlos Santos
      1 Bernd Kuhls
      1 Artem Panfilov
      1 Arnout Vandecappelle (Essensium/Mind)
      1 Anisse Astier
      1 Andr? Hentschel

The next release will be 2019.08. Expect the first release candidate at
the beginning of August and the final release at the end of the month.

This release will be supported with security and other important fixes
until 2019.08 is out. If you need longer support then consider using our
long term support release (2019.02.x) instead which will be supported
until March 2020.

-- 
Bye, Peter Korsgaard
