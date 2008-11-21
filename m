From: Daniel James Laird <daniel.j.laird@nxp.com>
Date: Fri, 21 Nov 2008 15:47:41 +0100
Subject: [Buildroot] Fonconfig
In-Reply-To: <6c8937b20811210223l527b6f07ya15f0248a96352f8@mail.gmail.com>
References: <6c8937b20811210223l527b6f07ya15f0248a96352f8@mail.gmail.com>
Message-ID: <C13DBBE85AD6974B85C118C35890CA5F13B90D3480@EU1RDCRDC1WX029.exi.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

can you do gcc--version as sysroot only works on gcc>4.2

Cheers
Daniel Laird

From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On Behalf Of l m
Sent: 2008 Nov 21 10:24
To: buildroot at uclibc.org
Subject: [Buildroot] Fonconfig

Hi, guys
I just found this compiling problem.

>>> fontconfig 2.6.0 Building
/usr/bin/make -j1  -C build_i686/fontconfig-2.6.0/
make[1]: Entering directory `build_i686/fontconfig-2.6.0'
/usr/bin/make  all-recursive
make[2]: Entering directory `build_i686/fontconfig-2.6.0'
Making all in fontconfig
make[3]: Entering directory `build_i686/fontconfig-2.6.0/fontconfig'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `build_i686/fontconfig-2.6.0/fontconfig'
Making all in fc-case
make[3]: Entering directory `build_i686/fontconfig-2.6.0/fc-case'
touch fcalias.h fcaliastail.h
/usr/bin/make  all-am
make[4]: Entering directory `build_i686/fontconfig-2.6.0/fc-case'
/usr/lib/ccache/gcc -DHAVE_CONFIG_H -I. -I.. -I../src -I.. -Wall -Wpointer-arith -Wstrict-prototypes    -Wmissing-prototypes -Wmissing-declarations     -Wnested-externs -fno-strict-aliasing    -Os  -Ibuild_i686/staging_dir/usr/include -Ibuild_i686/staging_dir/include --sysroot=build_i686/staging_dir/ -isysroot build_i686/staging_dir -mtune=i686 -march=i686 -MT fc-case.o -MD -MP -MF .deps/fc-case.Tpo -c -o fc-case.o fc-case.c
mv -f .deps/fc-case.Tpo .deps/fc-case.Po
/usr/lib/ccache/gcc  -Os  -Ibuild_i686/staging_dir/usr/include -Ibuild_i686/staging_dir/include --sysroot=build_i686/staging_dir/ -isysroot build_i686/staging_dir -mtune=i686 -march=i686  -Lbuild_i686/staging_dir/lib -Lbuild_i686/staging_dir/usr/lib --sysroot=build_i686/staging_dir/ -o fc-case fc-case.o
/usr/bin/ld: this linker was not configured to use sysroots
collect2: ld returned 1 exit status
make[4]: *** [fc-case] Error 1
make[4]: Leaving directory `build_i686/fontconfig-2.6.0/fc-case'
make[3]: *** [all] Error 2
make[3]: Leaving directory `build_i686/fontconfig-2.6.0/fc-case'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `build_i686/fontconfig-2.6.0'
make[1]: *** [all] Error 2
make[1]: Leaving directory `build_i686/fontconfig-2.6.0'
make: *** [build_i686/fontconfig-2.6.0/.stamp_built] Error 2

LM
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081121/3fc54adc/attachment-0001.htm 
