From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Apr 2013 08:19:48 +0200
Subject: [Buildroot] elfutils 1.55 build fail - arm
In-Reply-To: <51722958.9030700@ras.kells.com>
References: <51722958.9030700@ras.kells.com>
Message-ID: <5174D684.1060109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/04/13 07:36, Rob Schottland (buildroot) wrote:
> We encountered a build failure in elftools 0.155 compiling bzip2.c
>
> Any insights would be appreciated.
>
> build.log,  .config  and  elfutils.mk
> details follow:
> = = = = = = = =
> build.log
> = = = = = = = =
> --->>> elfutils 0.155 Building
> PATH="/data1/Packages/buildroot-2013.02/output/host/bin:/data1/Packages/buildroot-2013.02/output/host/usr/bin:/data1/Packages/buildroot-2013.02/output/host/usr/sbin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
> PERLLIB="/data1/Packages/buildroot-2013.02/output/host/usr/lib/perl"
> /usr/bin/make -j2  -C
> /data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/
> make[1]: Entering directory
> `/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155'
> /usr/bin/make  all-recursive
> make[2]: Entering directory
> `/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155'
> Making all in config
> make[3]: Entering directory
> `/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/config'
> make[3]: Nothing to be done for `all'.
> make[3]: Leaving directory
> `/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/config'
> Making all in m4
> make[3]: Entering directory
> `/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/m4'
> make[3]: Nothing to be done for `all'.
> make[3]: Leaving directory
> `/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/m4'
> Making all in lib
> make[3]: Entering directory
> `/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/lib'
> make[3]: Nothing to be done for `all'.
> make[3]: Leaving directory
> `/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/lib'
> Making all in libelf
> make[3]: Entering directory
> `/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/libelf'
> make[3]: Nothing to be done for `all'.
> make[3]: Leaving directory
> `/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/libelf'
> Making all in libebl
> make[3]: Entering directory
> `/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/libebl'
> make[3]: Nothing to be done for `all'.
> make[3]: Leaving directory
> `/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/libebl'
> Making all in libdwfl
> make[3]: Entering directory
> `/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/libdwfl'
> /data1/Packages/buildroot-2013.02/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
> -D_GNU_SOURCE -DHAVE_CONFIG_H -DLOCALEDIR='"/usr/share/locale"' -I. -I..
> -I. -I. -I../lib -I.. -I. -I./../libelf -I./../libebl -I./../libdw
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -std=gnu99 -Wall -Wshadow
> -Wunused -Wextra -fgnu89-inline -Wformat=2 -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -pipe -Os -MT bzip2.o -MD -MP -MF .deps/bzip2.Tpo
> -c -o bzip2.o bzip2.c
> if
> /data1/Packages/buildroot-2013.02/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
> -D_GNU_SOURCE -DHAVE_CONFIG_H -DLOCALEDIR='"/usr/share/locale"' -I. -I..
> -I. -I. -I../lib -I.. -I. -I./../libelf -I./../libebl -I./../libdw
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -std=gnu99 -Wall -Wshadow
> -Wunused -Wextra -fgnu89-inline -Wformat=2 -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -pipe -Os -c -o dwfl_begin.os -fpic -DPIC -DSHARED
> -MT dwfl_begin.os -MD -MP \
>        -MF ".deps/dwfl_begin.Tpo" `test -f 'dwfl_begin.c' || echo
> './'`dwfl_begin.c; \
>      then cat ".deps/dwfl_begin.Tpo" >> ".deps/dwfl_begin.Po"; \
>           rm -f ".deps/dwfl_begin.Tpo"; \
>      else rm -f ".deps/dwfl_begin.Tpo"; exit 1; \
>      fi
> In file included from bzip2.c:4:0:
> gzip.c:49:20: fatal error: bzlib.h: No such file or directory
> compilation terminated.

  Strange. Can you check if output/staging/usr/include/bzlib.h indeed 
doesn't exist?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
