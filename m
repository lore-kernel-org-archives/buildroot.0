From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 18:18:39 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-05-15
In-Reply-To: <20150516063015.D2BB91018B2@stock.ovh.net>
References: <20150516063015.D2BB91018B2@stock.ovh.net>
Message-ID: <20150516181839.6f342148@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 May 2015 08:30:15 +0200 (CEST), Thomas Petazzoni wrote:

>          sh4 |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/a9d4f87cbb1a792d4718ff409250c3aa24f812b9/

uClibc issue, will be fixed once I rebuild all the Buildroot
toolchains with the latest Buildroot version.

>      powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/e9b4242b75fac6068622517cbc53b49b5811584b/
>          arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/1de9b41835f8466a58708b415d213c90adf52a21/

uClibc issue, can be fixed by using uClibc-ng as the default.

For both of these uClibc issues, what do we do currently? Exceptions in
the autobuilders?

> microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/0bab8ace014ba7399678a6b263617d900ea27da4/
> microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/1aed89109f5e298f6a182ca1950bf78106403e81/

Compiler bug that occurs when BR2_ENABLE_DEBUG is used. I suggest to
strip -g specifically for this package on Microblaze.

>       xtensa |                  glibmm-2.36.1 | NOK | http://autobuild.buildroot.net/results/81a3bca5cbcf789c7ce1aa221a6a4154dd7c3917/

Under investigation by Max.

>       x86_64 |                host-mono-4.0.0 | NOK | http://autobuild.buildroot.net/results/b05b7829770deee1a554d110a2ac92324cb56cfa/

Under investigation by Yann.

>         i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/aff55e4714376197afaefa839fc1afe7a5aea748/
>         i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/9fbfc2a12120da53a2caf1217b653e5c296e4ab4/
>       x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/39966761b41aaf259cedcc241dab3d87f18871c8/
>         i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/87139c988e170a69e5caa5bc63304631b4786154/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=25e15fd17fa51a79b40159629dea1eea7b5f8d96.

>       xtensa |                 jasper-1.900.1 | NOK | http://autobuild.buildroot.net/results/5d17055027055ffd33fcd28b208130afb26343c9/

Under investigation by Max.

>         bfin |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/d4a1d890b4f8f12492de91eeae81f7b439c5e5e4/

Missing -lstdc++ for static linking.

>          arm |                 libedje-1.7.10 | NOK | http://autobuild.buildroot.net/results/62abc3eb74077f509b96bd7d249d5f61deadf633/

uClibc issue, can be fixed by using uClibc-ng.

>          arc |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/2ac6a4f946d48cacff85d44d662e1c103f7443f8/

/home/peko/autobuild/instance-0/output/build/lirc-tools-0.9.2/lib/lirc_log.c:82: multiple definition of `loglevel'
lircmd.o:/home/peko/autobuild/instance-0/output/build/lirc-tools-0.9.2/daemons/lircmd.c:202: first defined here

Seems like a stupid upstream problem. Someone to look at it?

>     mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/e32a5eebc61f840df48b050fc6399f2b6a861578/
>     mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/8b0f52768250826d3ec924283a192bbd492076ba/

Would be fixed by http://patchwork.ozlabs.org/patch/473048/ +
http://patchwork.ozlabs.org/patch/473047/.

>         bfin |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/ff865d106d7ec7ca8890f29448f4dea6aec478b5/

Weird stuff happening:

In file included from ../ncurses/./tty/hashmap.c:70:
../ncurses/curses.priv.h:598: error: expected specifier-qualifier-list before 'cchar_t'In file included from ../ncurses/./tty/hardscroll.c:148:
../ncurses/curses.priv.h:598: error: expected specifier-qualifier-list before 'cchar_t'

>          arm | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/c3ea67d9b341749b9591451da3f3b0cb4a9fbb74/

checking for library containing rl_initialize... no
configure: error: editline or readline is required
package/pkg-generic.mk:146: recipe for target '/ssd1/thomas/autobuild/instance-3/output/build/neardal-33b54a55032b047fd885a5eb3592c169c0056c49/.stamp_configured' failed
make: *** [/ssd1/thomas/autobuild/instance-3/output/build/neardal-33b54a55032b047fd885a5eb3592c169c0056c49/.stamp_configured] Error 1

Static linking issue.

>         bfin |                      php-5.6.8 | NOK | http://autobuild.buildroot.net/results/08eed81cc6650d15d7319cc2b9bbd0400721ce12/
>         bfin |                      php-5.6.8 | NOK | http://autobuild.buildroot.net/results/a22343f0fa41e821a4f08184243bb314493b3757/

checking for SQLite 3.3.9+... checking for sqlite3_prepare_v2 in -lsqlite3... no
not found
configure: error: Please install SQLite 3.3.9 first or check libsqlite3 is present
make: *** [/home/test/autobuild/instance-0/output/build/php-5.6.8/.stamp_configured] Error 1

Missing -lpthread when static linking.

>       x86_64 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/f4a22344bd5c8f59e6f8cacb6a549f8d8fe99af2/

checking for lt_dladvise_init in -lltdl... no
configure: error: Unable to find libltdl version 2. Makes sure you have libtool 2.4 or later installed.
make: *** [/home/buildroot/build/instance-1/output/build/pulseaudio-5.0/.stamp_configured] Error 1
make: Leaving directory `/home/buildroot/build/instance-1/buildroot'

Seems like pulseaudio cannot build in BR2_STATIC_LIBS scenarios.

>         sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/3f7a39e06f9266b39a87d6e382c145ea036f75f8/
>         sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/235be65404d19fa3c21df741f86fbc0a9b32157e/

Compiler bug. I will send a patch to exclude QtWebkit with this
toolchain.

>          arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/b24e4804e9f8505db51b5d2c3fc9fda6c9147c73/
>          arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/b9425ab39efae75bba72adee07e6746b1d545d25/

Compiler bug. I could disallow the Linaro toolchain completely for this
package, but how will we notice that the bug has been fixed?

That's the drawback of not having versioned Config.in symbols for
Linaro toolchains...

>         bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/05563df889346fbed9926fad6542b25f26996c2c/

Fixed by http://git.buildroot.net/buildroot/commit/?id=22f5be171c6f9bb2611e7b87197e9faeabcaab18.

>       xtensa |            uboot-tools-2015.04 | NOK | http://autobuild.buildroot.net/results/97a3070356e557a41b2a6cfe152884a3319eb823/

Regression caused by
http://git.buildroot.net/buildroot/commit/?id=95f9a5c3df8e4226b99438efccf0bf21eecb573d.

>         bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/931dede013d94f88fcb5185dac494775603063ec/

Would be fixed by
http://autobuild.buildroot.net/results/b9425ab39efae75bba72adee07e6746b1d545d25/.

>          sh4 |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/1424d0f57631c72a45fce89fae24c472af5c896f/

Already fixed by
http://git.buildroot.net/buildroot/commit/?id=ee2b703fe799b36e54f35851e6f2db28eb8fdb1f.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
