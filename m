From: Technomage-hawke <technomage.hawke@gmail.com>
Date: Fri, 18 Jan 2008 19:43:23 -0700
Subject: [Buildroot] need help
Message-ID: <200801181943.23878.technomage.hawke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ok,
I am at my wits end here.

I am trying to compile your package (uclibc) under an amd64 based system, only there doesn't appear to be any support for compiling there at all.

any attempt to compile using the "next best thing (as default selected by make config) yields the following set of errors:

****************************
make[1]: Entering directory `/root/build/uclibc/uClibc-0.9.27/ldso'
echo "const char *_dl_progname=\""ld-uClibc.so.0"\";" \
                > include/dl-progname.h
echo "#include \"i386/elfinterp.c\"" \
                >> include/dl-progname.h
ln -fs ../../include/elf.h include/
ln -fs ../ldso/i386/dl-startup.h include/
ln -fs ../ldso/i386/dl-syscalls.h include/
ln -fs ../ldso/i386/dl-sysdep.h include/
make -C ldso;
make[2]: Entering directory `/root/build/uclibc/uClibc-0.9.27/ldso/ldso'
	gcc -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing 
              -fno-stack-protector -falign-jumps=0 -falign-loops=0 -Os 
              -funit-at-a-time -fPIC -DUCLIBC_RUNTIME_PREFIX=\"/usr/i386-linux-uclibc/\" 
              -fno-builtin -nostdinc -D_LIBC -I../../ldso/include -I. 
              -I../../include -isystem /usr/lib/gcc/x86_64-linux-gnu/4.1.2/include  
              -I../libdl -c i386/resolve.S -o i386/resolve.o
i386/resolve.S: Assembler messages:
i386/resolve.S:30: Error: `pusha' is not supported in 64-bit mode
i386/resolve.S:32: Error: suffix or operands invalid for `push'
i386/resolve.S:33: Error: suffix or operands invalid for `push'
i386/resolve.S:38: Error: suffix or operands invalid for `pop'
i386/resolve.S:40: Error: relocated field and relocation type differ in signedness
i386/resolve.S:41: Error: suffix or operands invalid for `call'
i386/resolve.S:48: Error: `popa' is not supported in 64-bit mode
make[2]: *** [i386/resolve.o] Error 1
make[2]: Leaving directory `/root/build/uclibc/uClibc-0.9.27/ldso/ldso'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/root/build/uclibc/uClibc-0.9.27/ldso'
make: *** [_dir_ldso] Error 2
*************************************

additionally, attempting to compile from sources patched for debian resulted in this:
**************************
make[3]: Entering directory `/root/build/uclibc/uclibc-0.9.27/ldso/ldso'
	gcc -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing 
              -fno-stack-protector -falign-jumps=0 -falign-loops=0 -Os 
              -funit-at-a-time -march=i386 -fPIC -DUCLIBC_RUNTIME_PREFIX=\"/usr/x86_64-uclibc-linux/\" 
              -fno-builtin -nostdinc -D_LIBC -I../../ldso/include -I. -I../../include -isystem /usr/lib/gcc/x86_64-linux-gnu/4.1.2/include  
              -I../libdl -c i386/resolve.S -o i386/resolve.o
i386/resolve.S:0: error: CPU you selected does not support x86-64 instruction set
i386/resolve.S:0: error: CPU you selected does not support x86-64 instruction set
make[3]: *** [i386/resolve.o] Error 1
make[3]: Leaving directory `/root/build/uclibc/uclibc-0.9.27/ldso/ldso'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/root/build/uclibc/uclibc-0.9.27/ldso'
make[1]: *** [_dir_ldso] Error 2
make[1]: Leaving directory `/root/build/uclibc/uclibc-0.9.27'
make: *** [build-stamp] Error 2
**************************

this makes is very difficult to compile another project (Debian router) 
<see: http://gate-bunker.p6.msu.ru/~berk/router.html >.

any help here would be greatly appreciated.

thank you.
