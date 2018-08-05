From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 16:08:06 +0200
Subject: [Buildroot] Buildroot 2018.08-rc1 released
Message-ID: <20180805160806.086f0a64@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Buildroot 2018.08-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2018.08-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2018.08-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

With 897 commits since 2018.05, this is probably one of the smallest
release we had in recent years, after a fairly busy 2018.05 cycle that
had 1266 commits. We received contributions from 101 different
developers.

Of noteworthy new features/changes we have:

	Toolchain:

	- add support for gcc 8.x, switch to gcc 7.x as the default
	  version
	- add support for gdb 8.1, switch to gdb 8.0 as the default
	  and remove gdb 7.10/7.11
	- add support for binutils 2.31
	- NIOSII CodeSourcery toolchain updated
	- Linaro AArch64 BE toolchain added, and other Linaro
	  toolchains updated
	- Synopsys ARC pre-built toolchain updated

	Architecture: add support for ARM Cortex-M7

	Major updates:

	- systemd bumped to 239
	- Qt5 bumped to 5.11.1
	- Rust bumped to 1.27
	- GStreamer stack bumped to 1.14.2
	- X.org server bumped to 1.20, and all X.org proto packages
	  replaced by the single xorgproto package
	- i.MX6 support packages bumped to 6.2.4

	Linux: bumped to 4.17 by default.

	Infrastructure: new package infrastructure added for packages
	using the Meson build system

	New packages: at-spi2-atk, at-spi2-core, capnproto, cmocka,
	corkscrew, cutelyst, davfs2, flatcc, libidn2, libgit2,
	libopusenc, mender, nghttp2, perl-convert-asn1, perl-crypt-blowfish,
	perl-crypt-cbc, perl-digest-md5, perl-mime-base64-urlsafe,
	perl-mojolicious-plugin-authentication, perl-net-ping,
	perl-net-snmp, perl-net-ssh2, perl-net-telnet, pigz,
	python-reentry, python-request-id, python-validators,
	python-webob, shadowsocks-libev, speexdsp, xorgproto, wampcc

	New defconfigs: NXP i.MX7D SDB, Boundary Devices Nitrogen 8M,
	Olimex A10 OLinuxino, ZynqMP ZCU106

	Removed packages: all xproto_* have been removed and replaced
	by xorgproto

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2018.08-rc1

Many thanks to the people contributing to this release:

git shortlog -s -n 2018.05..

   135  Fabrice Fontaine
   122  Bernd Kuhls
    84  Baruch Siach
    71  Yann E. MORIN
    44  Francois Perrad
    38  Fabio Estevam
    38  Romain Naour
    29  Peter Korsgaard
    27  Thomas Petazzoni
    23  Ga?l PORTAY
    19  Thomas De Schampheleire
    17  Gary Bisson
    15  Carlos Santos
    12  Eric Le Bihan
    12  Joseph Kogut
    10  Evgeniy Didin
    10  Martin Bark
     9  Adam Duskett
     9  Angelo Compagnucci
     9  J?rg Krause
     6  Asaf Kahlon
     6  Marcus Folkesson
     5  Luca Ceresoli
     5  Ricardo Martincoski
     4  Florian La Roche
     4  Geoff Levand
     4  Hollis Blanchard
     4  Joel Carlson
     4  Leon Anavi
     4  Min Xu
     4  Nicolas Cavallari
     4  Petr Vorel
     4  Pierre Ducroquet
     3  Alexey Brodkin
     3  Arnout Vandecappelle (Essensium/Mind)
     3  Daniel Nicoletti
     3  Gwenhael Goavec-Merou
     3  Jagan Teki
     3  Julien BOIBESSOT
     3  J?r?my Rosen
     3  Marcin Niestroj
     3  Peter Seiderer
     3  Sven Neumann
     3  Zoltan Gyarmati
     2  Alfredo Alvarez Fernandez
     2  Antoine Tenart
     2  Artem Panfilov
     2  Bartosz Golaszewski
     2  Jan Kraval
     2  Martijn de Gouw
     2  Matt Weber
     2  Max Filippov
     2  Micha?l Burtin
     2  Ofer Heifetz
     2  Ryan Coe
     2  Thomas Ehrhardt
     2  Trent Piepho
     2  Vasant Hegde
     2  Waldemar Brodkorb
     2  Yegor Yefremov
     1  Alex Suykov
     1  Andr? Hentschel
     1  Anssi Hannula
     1  Asgeir Bjarni Ingvarsson
     1  Atanas Palavrov Updating wiringPi to add support for RPi3B+
     1  Bryce Ferguson
     1  Charles Hardin
     1  Christoph Engelbert
     1  Damien Th?bault
     1  Dan Walkes
     1  David Barbion
     1  David De Grave (Essensium/Mind)
     1  David Owens
     1  Ignacy Gaw?dzki
     1  J. Tang
     1  Jan Dohl
     1  Jan Heylen
     1  Jared Bents
     1  Jason A. Donenfeld
     1  Jean-Fran?ois T?tu
     1  Joel Stanley
     1  Johan Oudinet
     1  John Faith
     1  Laurent Cans
     1  Laurent Hartanerot
     1  Mathieu Maret
     1  Mikhail Karpenko
     1  Oleksandr Zhadan
     1  Paresh Chaudhary
     1  Pierre-Louis Bossart
     1  Robert Beckett
     1  Roman Gorbenkov
     1  Sam Bobroff
     1  Sam Lancia
     1  Samuel Mendoza-Jonas
     1  Sefan Rommel
     1  Stefan S?rensen
     1  S?bastien Szymanski
     1  Valentin Korenblit
     1  Vincent Prince
     1  Yannis Damigos

And a special thanks to our patch reviewers:

git log 2018.05.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     24 "Yann E. MORIN" <yann.morin.1998@free.fr>
      6 Peter Seiderer <ps.report@gmx.net>
      4 Carlos Santos <casantos@datacom.com.br>
      4 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      3 Romain Naour <romain.naour@gmail.com>
      3 Ricardo Martincoski <ricardo.martincoski@gmail.com>
      3 Joel Carlson <JoelsonCarl@gmail.com>
      3 Baruch Siach <baruch@tkos.co.il>
      2 Yegor Yefremov <yegorslists@googlemail.com>
      2 Petr Vorel <petr.vorel@gmail.com>
      1 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
      1 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
      1 Ryan Coe <bluemrp9@gmail.com>
      1 Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
      1 Matt Weber <matthew.weber@rockwellcollins.com>
      1 Luca Ceresoli <luca@lucaceresoli.net>
      1 Jagan Teki <jagan@amarulasolutions.com>
      1 Eric Le Bihan <eric.le.bihan.dev@free.fr>

Like usual, we will now create a next branch and start merging in new
features, rather than wait until 2018.08 is released.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
