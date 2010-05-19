From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 19 May 2010 20:34:37 +0000 (UTC)
Subject: [Buildroot] [Bug 1789] New: binutils fails to build for i386
Message-ID: <bug-1789-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1789

           Summary: binutils fails to build for i386
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: buildroot at invalid-domain.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I'm trying to build buildroot for i386 using the default configuration (i.e.
make ARCH=i386 defconfig ; make), but it stops when building binutils:

/usr/bin/gcc -Wl,-rpath -Wl,/media/disk/git/test/host/usr/lib
-I/media/disk/git/test/host/include -I/media/disk/git/test/host/usr/include -c
-DHAVE_CONFIG_H -g -O2  -I.
-I/media/disk/git/test/toolchain/binutils-2.20.1/libiberty/../include  -W -Wall
-Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic 
/media/disk/git/test/toolchain/binutils-2.20.1/libiberty/fibheap.c -o fibheap.o
/media/disk/git/test/toolchain/binutils-2.20.1/libiberty/fibheap.c: In function
'fibheap_union':
/media/disk/git/test/toolchain/binutils-2.20.1/libiberty/fibheap.c:151:
warning: implicit declaration of function 'free'
/media/disk/git/test/toolchain/binutils-2.20.1/libiberty/fibheap.c: In function
'fibheap_replace_key_data':
/media/disk/git/test/toolchain/binutils-2.20.1/libiberty/fibheap.c:220: error:
'LONG_MIN' undeclared (first use in this function)
/media/disk/git/test/toolchain/binutils-2.20.1/libiberty/fibheap.c:220: error:
(Each undeclared identifier is reported only once
/media/disk/git/test/toolchain/binutils-2.20.1/libiberty/fibheap.c:220: error:
for each function it appears in.)
/media/disk/git/test/toolchain/binutils-2.20.1/libiberty/fibheap.c: In function
'fibheap_delete_node':
/media/disk/git/test/toolchain/binutils-2.20.1/libiberty/fibheap.c:261: error:
'LONG_MIN' undeclared (first use in this function)
/media/disk/git/test/toolchain/binutils-2.20.1/libiberty/fibheap.c:265:
warning: implicit declaration of function 'abort'
/media/disk/git/test/toolchain/binutils-2.20.1/libiberty/fibheap.c:265:
warning: incompatible implicit declaration of built-in function 'abort'
/media/disk/git/test/toolchain/binutils-2.20.1/libiberty/fibheap.c: In function
'fibheap_consolidate':
/media/disk/git/test/toolchain/binutils-2.20.1/libiberty/fibheap.c:368:
warning: implicit declaration of function 'memset'
/media/disk/git/test/toolchain/binutils-2.20.1/libiberty/fibheap.c:368:
warning: incompatible implicit declaration of built-in function 'memset'
make[3]: *** [fibheap.o] Error 1
make[3]: Leaving directory
`/media/disk/git/test/toolchain/binutils-2.20.1-build/libiberty'
make[2]: *** [all-libiberty] Error 2
make[2]: *** Waiting for unfinished jobs....
checking if /usr/bin/gcc -Wl,-rpath -Wl,/media/disk/git/test/host/usr/lib
-I/media/disk/git/test/host/include -I/media/disk/git/test/host/usr/include
supports -fno-rtti -fno-exceptions... no
checking for /usr/bin/gcc -Wl,-rpath -Wl,/media/disk/git/test/host/usr/lib
-I/media/disk/git/test/host/include -I/media/disk/git/test/host/usr/include
option to produce PIC... -fPIC -DPIC
checking if /usr/bin/gcc -Wl,-rpath -Wl,/media/disk/git/test/host/usr/lib
-I/media/disk/git/test/host/include -I/media/disk/git/test/host/usr/include PIC
flag -fPIC -DPIC works... yes
checking if /usr/bin/gcc -Wl,-rpath -Wl,/media/disk/git/test/host/usr/lib
-I/media/disk/git/test/host/include -I/media/disk/git/test/host/usr/include
static flag -static works... yes
checking if /usr/bin/gcc -Wl,-rpath -Wl,/media/disk/git/test/host/usr/lib
-I/media/disk/git/test/host/include -I/media/disk/git/test/host/usr/include
supports -c -o file.o... yes
checking if /usr/bin/gcc -Wl,-rpath -Wl,/media/disk/git/test/host/usr/lib
-I/media/disk/git/test/host/include -I/media/disk/git/test/host/usr/include
supports -c -o file.o... (cached) yes
checking whether the /usr/bin/gcc -Wl,-rpath
-Wl,/media/disk/git/test/host/usr/lib -I/media/disk/git/test/host/include
-I/media/disk/git/test/host/usr/include linker (/usr/bin/ld
-L/media/disk/git/test/host/lib -L/media/disk/git/test/host/usr/lib -m
elf_x86_64) supports shared libraries... yes
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... no
checking whether to build static libraries... yes
Setting warning flags = -W -Wall -Wstrict-prototypes -Wmissing-prototypes
checking whether to enable maintainer-specific portions of Makefiles... no
checking whether to install libbfd... no
checking whether NLS is requested... no
checking whether NLS is requested... no
checking for msgfmt... /usr/bin/msgfmt
checking for gmsgfmt... /usr/bin/msgfmt
checking for xgettext... /usr/bin/xgettext
checking for msgmerge... /usr/bin/msgmerge
checking for string.h... (cached) yes
checking for strings.h... (cached) yes
checking for stdlib.h... (cached) yes
checking limits.h usability... yes
checking limits.h presence... yes
checking for limits.h... yes
checking whether basename is declared... yes
checking whether stpcpy is declared... yes
checking linker --as-needed support... yes
checking for cos in -lm... yes
configure: updating cache ./config.cache
configure: creating ./config.status
config.status: creating Makefile
config.status: creating po/Makefile.in
config.status: creating config.h
config.status: executing depfiles commands
config.status: executing libtool commands
config.status: executing default-1 commands
config.status: creating po/POTFILES
config.status: creating po/Makefile
make[2]: Leaving directory
`/media/disk/git/test/toolchain/binutils-2.20.1-build'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/media/disk/git/test/toolchain/binutils-2.20.1-build'
make: ***
[/media/disk/git/test/toolchain/binutils-2.20.1-build/binutils/objdump] Error 2


$  uname -a
Linux terdaan 2.6.24-27-generic #1 SMP Wed Mar 24 11:03:26 UTC 2010 x86_64
GNU/Linux


This bug first appeared after commit 6b939d40f6a29a43277566adc9d4312d49cb3abf;
starting from the previous comit d701a82321ad2f3e5bfa16639e93532294cad4ce
buildroot compiles without errors.

Bye, Ludger

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
