From: Paradoxxa2001 at web.de <Paradoxxa2001@web.de>
Date: Thu, 15 May 2008 10:15:09 +0200
Subject: [Buildroot] at91sam9263 and user-space support compile fails
Message-ID: <1164068660@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

im trying to compile the user-space with following instructions:

cd xenobuild
../xenomai-2.4.3/configure --build=i686-pc-linux-gnu --host=arm-elf --enable-arm-mach=at91sam926x
make

Here is the output that make generate:
_____________________________________________________________________________
Making all in src
make[1]: Entering directory `/home/paradoxxa/xenobuild/src'
Making all in include
make[2]: Entering directory `/home/paradoxxa/xenobuild/src/include'
make  all-am
make[3]: Entering directory `/home/paradoxxa/xenobuild/src/include'
make[3]: F?r das Ziel ?all-am? ist nichts zu tun.
make[3]: Leaving directory `/home/paradoxxa/xenobuild/src/include'
make[2]: Leaving directory `/home/paradoxxa/xenobuild/src/include'
Making all in rtdk
make[2]: Entering directory `/home/paradoxxa/xenobuild/src/rtdk'
/bin/sh ../../libtool --tag=CC   --mode=compile arm-elf-gcc -DHAVE_CONFIG_H -I. -I../../src/include -I../../../xenomai-2.4.3/src/rtdk  -O2 -D_GNU_SOURCE -D_REENTRANT -Wall -pipe -march=armv5 -D__XENO__ -D__IN_XENO__ -Wstrict-prototypes -I../../../xenomai-2.4.3/include    -MT librtdk_la-rt_print.lo -MD -MP -MF .deps/librtdk_la-rt_print.Tpo -c -o librtdk_la-rt_print.lo `test -f 'rt_print.c' || echo '../../../xenomai-2.4.3/src/rtdk/'`rt_print.c
 arm-elf-gcc -DHAVE_CONFIG_H -I. -I../../src/include -I../../../xenomai-2.4.3/src/rtdk -O2 -D_GNU_SOURCE -D_REENTRANT -Wall -pipe -march=armv5 -D__XENO__ -D__IN_XENO__ -Wstrict-prototypes -I../../../xenomai-2.4.3/include -MT librtdk_la-rt_print.lo -MD -MP -MF .deps/librtdk_la-rt_print.Tpo -c ../../../xenomai-2.4.3/src/rtdk/rt_print.c -o librtdk_la-rt_print.o
In file included from ../../src/include/asm/xenomai/system.h:134,
                 from ../../../xenomai-2.4.3/src/rtdk/rt_print.c:30:
../../../xenomai-2.4.3/include/nucleus/system.h:23:20: error: memory.h: No such file or directory
../../../xenomai-2.4.3/include/nucleus/system.h:25:23: error: asm/param.h: No such file or directory
In file included from ../../src/include/asm/xenomai/atomic.h:77,
                 from ../../../xenomai-2.4.3/include/nucleus/system.h:26,
                 from ../../src/include/asm/xenomai/system.h:134,
                 from ../../../xenomai-2.4.3/src/rtdk/rt_print.c:30:
../../src/include/asm/xenomai/syscall.h:229:22: error: sys/mman.h: No such file or directory
In file included from ../../../xenomai-2.4.3/src/rtdk/rt_print.c:30:
../../src/include/asm/xenomai/system.h:135:28: error: bits/local_lim.h: No such file or directory
../../../xenomai-2.4.3/src/rtdk/rt_print.c:68: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__buffer_lock'
../../../xenomai-2.4.3/src/rtdk/rt_print.c:69: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__buffer_key'
../../../xenomai-2.4.3/src/rtdk/rt_print.c: In function 'rt_vfprintf':
../../../xenomai-2.4.3/src/rtdk/rt_print.c:78: warning: implicit declaration of function 'pthread_getspecific'
../../../xenomai-2.4.3/src/rtdk/rt_print.c:78: error: '__buffer_key' undeclared (first use in this function)
../../../xenomai-2.4.3/src/rtdk/rt_print.c:78: error: (Each undeclared identifier is reported only once
../../../xenomai-2.4.3/src/rtdk/rt_print.c:78: error: for each function it appears in.)
../../../xenomai-2.4.3/src/rtdk/rt_print.c:78: warning: initialization makes pointer from integer without a cast
../../../xenomai-2.4.3/src/rtdk/rt_print.c:95: warning: assignment makes pointer from integer without a cast
../../../xenomai-2.4.3/src/rtdk/rt_print.c: In function 'set_buffer_name':
../../../xenomai-2.4.3/src/rtdk/rt_print.c:206: warning: implicit declaration of function 'pthread_self'
../../../xenomai-2.4.3/src/rtdk/rt_print.c: In function 'rt_print_init':
../../../xenomai-2.4.3/src/rtdk/rt_print.c:216: error: '__buffer_key' undeclared (first use in this function)
../../../xenomai-2.4.3/src/rtdk/rt_print.c:216: warning: initialization makes pointer from integer without a cast
../../../xenomai-2.4.3/src/rtdk/rt_print.c:253: warning: implicit declaration of function 'pthread_mutex_lock'
../../../xenomai-2.4.3/src/rtdk/rt_print.c:253: error: '__buffer_lock' undeclared (first use in this function)
../../../xenomai-2.4.3/src/rtdk/rt_print.c:260: warning: implicit declaration of function 'pthread_mutex_unlock'
../../../xenomai-2.4.3/src/rtdk/rt_print.c:262: warning: implicit declaration of function 'pthread_setspecific'
../../../xenomai-2.4.3/src/rtdk/rt_print.c: In function 'rt_print_cleanup':
../../../xenomai-2.4.3/src/rtdk/rt_print.c:274: error: '__buffer_key' undeclared (first use in this function)
../../../xenomai-2.4.3/src/rtdk/rt_print.c:274: warning: passing argument 1 of 'cleanup_buffer' makes pointer from integer without a cast
../../../xenomai-2.4.3/src/rtdk/rt_print.c: In function 'rt_print_buffer_name':
../../../xenomai-2.4.3/src/rtdk/rt_print.c:279: error: '__buffer_key' undeclared (first use in this function)
../../../xenomai-2.4.3/src/rtdk/rt_print.c:279: warning: initialization makes pointer from integer without a cast
../../../xenomai-2.4.3/src/rtdk/rt_print.c:290: warning: assignment makes pointer from integer without a cast
../../../xenomai-2.4.3/src/rtdk/rt_print.c: In function 'cleanup_buffer':
../../../xenomai-2.4.3/src/rtdk/rt_print.c:303: error: '__buffer_key' undeclared (first use in this function)
../../../xenomai-2.4.3/src/rtdk/rt_print.c:305: error: '__buffer_lock' undeclared (first use in this function)
../../../xenomai-2.4.3/src/rtdk/rt_print.c: In function 'printer_thread':
../../../xenomai-2.4.3/src/rtdk/rt_print.c:387: warning: implicit declaration of function 'nanosleep'
../../../xenomai-2.4.3/src/rtdk/rt_print.c:389: error: '__buffer_lock' undeclared (first use in this function)
../../../xenomai-2.4.3/src/rtdk/rt_print.c: In function '__rt_print_init':
../../../xenomai-2.4.3/src/rtdk/rt_print.c:399: error: 'pthread_t' undeclared (first use in this function)
../../../xenomai-2.4.3/src/rtdk/rt_print.c:399: error: expected ';' before 'thread'
../../../xenomai-2.4.3/src/rtdk/rt_print.c:400: error: 'pthread_attr_t' undeclared (first use in this function)
../../../xenomai-2.4.3/src/rtdk/rt_print.c:400: error: expected ';' before 'thattr'
../../../xenomai-2.4.3/src/rtdk/rt_print.c:432: warning: implicit declaration of function 'pthread_mutex_init'
../../../xenomai-2.4.3/src/rtdk/rt_print.c:432: error: '__buffer_lock' undeclared (first use in this function)
../../../xenomai-2.4.3/src/rtdk/rt_print.c:433: warning: implicit declaration of function 'pthread_key_create'
../../../xenomai-2.4.3/src/rtdk/rt_print.c:433: error: '__buffer_key' undeclared (first use in this function)
../../../xenomai-2.4.3/src/rtdk/rt_print.c:435: warning: implicit declaration of function 'pthread_attr_init'
../../../xenomai-2.4.3/src/rtdk/rt_print.c:435: error: 'thattr' undeclared (first use in this function)
../../../xenomai-2.4.3/src/rtdk/rt_print.c:436: warning: implicit declaration of function 'pthread_attr_setstacksize'
../../../xenomai-2.4.3/src/rtdk/rt_print.c:436: error: 'PTHREAD_STACK_MIN' undeclared (first use in this function)
../../../xenomai-2.4.3/src/rtdk/rt_print.c:437: warning: implicit declaration of function 'pthread_create'
../../../xenomai-2.4.3/src/rtdk/rt_print.c:437: error: 'thread' undeclared (first use in this function)
make[2]: *** [librtdk_la-rt_print.lo] Fehler 1
make[2]: Leaving directory `/home/paradoxxa/xenobuild/src/rtdk'
make[1]: *** [all-recursive] Fehler 1
make[1]: Leaving directory `/home/paradoxxa/xenobuild/src'
make: *** [all-recursive] Fehler 1
_____________________________________________________________________________

It says me that the files memory.h and asm/param.h couldn't be found. 
Im wondering why? I also tried it like the example in the README.INSTALL 2.6 Building for ARM
but with the same result. Do anyone know how to fix this?

Regards,
Thomas





_______________________________________________________________
Schon geh?rt? Der neue WEB.DE MultiMessenger kann`s mit allen: 
http://www.produkte.web.de/messenger/?did=3016
