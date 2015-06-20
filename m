From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Jun 2015 17:12:40 +0200
Subject: [Buildroot] [PATCH 3/6] gcc: add support for gcc 5.1
References: <1434292411-5003-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1434292411-5003-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <XnsA4BFAF16D8B15berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:1434292411-5003-4-git-send-email-
thomas.petazzoni at free-electrons.com:

>  * x86, uClibc-ng and uClibc 0.9.33.2

Hi,

using buildroot master

* 333002c - (origin/master, origin/HEAD) dnsmasq: bump to version 2.73 (70 
minutes ago) <Gustavo Zacarias>

including

http://patchwork.ozlabs.org/patch/483999/
http://patchwork.ozlabs.org/patch/484002/
http://patchwork.ozlabs.org/patch/483998/
http://patchwork.ozlabs.org/patch/483997/

this defconfig

BR2_x86_i386=y
BR2_GCC_VERSION_5_1_X=y

fails to compile:

make[2]: Entering directory `/home/fli4l/br9_gcc5/output/build/host-gcc-
final-5.1.0/build/i386-buildroot-linux-uclibc/libgcc'
# If this is the top-level multilib, build all the other
# multilibs.
/home/fli4l/br9_gcc5/output/build/host-gcc-final-5.1.0/build/./gcc/xgcc -
B/home/fli4l/br9_gcc5/output/build/host-gcc-final-5.1.0/build/./gcc/ -
B/home/fli4l/br9_gcc5/output/host/usr/i386-buildroot-linux-uclibc/bin/ -
B/home/fli4l/br9_gcc5/output/host/usr/i386-buildroot-linux-uclibc/lib/ -
isystem /home/fli4l/br9_gcc5/output/host/usr/i386-buildroot-linux-
uclibc/include -isystem /home/fli4l/br9_gcc5/output/host/usr/i386-
buildroot-linux-uclibc/sys-include    -g -O2 -g -Os -O2  -g -O2 -g -Os -
DIN_GCC  -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-
strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-
definition  -isystem ./include   -fpic -mlong-double-80 -g -DIN_LIBGCC2 -
fbuilding-libgcc -fno-stack-protector   -fpic -mlong-double-80 -I. -I. -
I../.././gcc -I../../../libgcc -I../../../libgcc/. -I../../../libgcc/../gcc 
-I../../../libgcc/../include    -DUSE_TLS -o generic-morestack-thread.o -MT 
generic-morestack-thread.o -MD -MP -MF generic-morestack-thread.dep  -c 
../../../libgcc/generic-morestack-thread.c -fvisibility=hidden -
DHIDE_EXPORTS
../../../libgcc/generic-morestack-thread.c:41:21: fatal error: pthread.h: 
No such file or directory
compilation terminated.
make[2]: *** [generic-morestack-thread.o] Error 1
make[2]: Leaving directory `/home/fli4l/br9_gcc5/output/build/host-gcc-
final-5.1.0/build/i386-buildroot-linux-uclibc/libgcc'
make[1]: *** [all-target-libgcc] Error 2
make[1]: Leaving directory `/home/fli4l/br9_gcc5/output/build/host-gcc-
final-5.1.0/build'
make: *** [all] Error 2
make: Leaving directory `/home/fli4l/br9_gcc5/output/build/host-gcc-final-
5.1.0/build'

Regards, Bernd
