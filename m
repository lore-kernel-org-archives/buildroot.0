From: Carlos Santos <unixmania@gmail.com>
Date: Sat, 26 Oct 2019 20:05:36 -0300
Subject: [Buildroot] [PATCH 1/1] package/dtc: Bump to v1.5.1
In-Reply-To: <20191026153938.0c11841c@windsurf.home>
References: <20191025200034.199561-1-titouan.christophe@railnova.eu>
 <20191026153938.0c11841c@windsurf.home>
Message-ID: <CAJ4jsadV-fHDYB1Lup1d7NSk1zprpUJVp4XbwuJS7yrfX_ad0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 26, 2019 at 10:39 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Fri, 25 Oct 2019 22:00:34 +0200
> Titouan Christophe <titouan.christophe@railnova.eu> wrote:
>
> > Remove 0002-Makefile-Add-EXTRA_CFLAGS-variable.patch which is now
> > applied upstream
> >
> > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> > ---
> >  ...ards-for-older-kernel-u-boot-sources.patch | 13 +++++--
> >  ...2-Makefile-Add-EXTRA_CFLAGS-variable.patch | 37 -------------------
> >  package/dtc/dtc.hash                          |  2 +-
> >  package/dtc/dtc.mk                            |  2 +-
> >  4 files changed, 11 insertions(+), 43 deletions(-)
> >  delete mode 100644 package/dtc/0002-Makefile-Add-EXTRA_CFLAGS-variable.patch
>
> Applied to master, thanks.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

This commit broke beaglebone:

2019-10-26T19:57:58 >>> linux 4dae378bbe721277b08699d1d88ffae12acc9b09 Building
2019-10-26T19:57:58
PATH="/work/beaglebone/host/bin:/work/beaglebone/host/sbin:/usr/share/Modules/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin://home/casantos/bin"
BR_BINARIES_DIR=/work/beaglebone/images KCFLAGS=-Wno-attribute-alias
/usr/bin/make -j1 HOSTCC="/usr/bin/gcc -O2
-I/work/beaglebone/host/include -L/work/beaglebone/host/lib
-Wl,-rpath,/work/beaglebone/host/lib" ARCH=arm
INSTALL_MOD_PATH=/work/beaglebone/target
CROSS_COMPILE="/work/beaglebone/host/bin/arm-buildroot-linux-uclibcgnueabihf-"
DEPMOD=/work/beaglebone/host/sbin/depmod INSTALL_MOD_STRIP=1 -C
/work/beaglebone/build/linux-4dae378bbe721277b08699d1d88ffae12acc9b09
all
2019-10-26T19:57:59 CALL    scripts/checksyscalls.sh
2019-10-26T19:57:59 HOSTCC  scripts/dtc/dtc-lexer.lex.o
2019-10-26T19:57:59 HOSTCC  scripts/dtc/dtc-parser.tab.o
2019-10-26T19:57:59 HOSTLD  scripts/dtc/dtc
2019-10-26T19:57:59 HOSTCC  scripts/dtc/libfdt/fdt_ro.o
2019-10-26T19:57:59 scripts/dtc/libfdt/fdt_ro.c:92:10: error:
redefinition of ?fdt_get_max_phandle?
2019-10-26T19:57:59 uint32_t fdt_get_max_phandle(const void *fdt)
2019-10-26T19:57:59 ^~~~~~~~~~~~~~~~~~~
2019-10-26T19:57:59 In file included from scripts/dtc/libfdt/fdt_ro.c:54:
2019-10-26T19:57:59 /work/beaglebone/host/include/libfdt.h:384:24:
note: previous definition of ?fdt_get_max_phandle? was here
2019-10-26T19:57:59 static inline uint32_t fdt_get_max_phandle(const void *fdt)
2019-10-26T19:57:59 ^~~~~~~~~~~~~~~~~~~
2019-10-26T19:57:59 make[4]: *** [scripts/Makefile.host:107:
scripts/dtc/libfdt/fdt_ro.o] Error 1
2019-10-26T19:57:59 make[3]: *** [scripts/Makefile.build:544:
scripts/dtc] Error 2
2019-10-26T19:57:59 make[2]: *** [Makefile:1066: scripts] Error 2
2019-10-26T19:57:59 make[1]: *** [package/pkg-generic.mk:241:
/work/beaglebone/build/linux-4dae378bbe721277b08699d1d88ffae12acc9b09/.stamp_built]
Error 2
2019-10-26T19:57:59 make: *** [Makefile:23: _all] Error 2

-- 
Carlos Santos <unixmania@gmail.com>
