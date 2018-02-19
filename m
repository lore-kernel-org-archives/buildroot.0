From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 19 Feb 2018 22:03:04 +0000
Subject: [Buildroot] [Bug 10776] New: ktap fails to build
Message-ID: <bug-10776-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10776

            Bug ID: 10776
           Summary: ktap fails to build
           Product: buildroot
           Version: 2018.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: zinosat at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I've tried to build ktap on a minimal 2018.02 buildroot setup for beaglebone
black (beaglebone_defconfig)
Here follows the build log

ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b.tar.gz: OK (sha256:
bc8b03a53c430ae4fcf594ffdf31e2b2ed47a8fee25dd8fea60aa34f75441707)
[7m>>> ktap eb66d40310c93dc82bc8eac889744c1ed1f01f7b Extracting[27m
gzip -d -c
/home/zino/code/sirti/PVS/buildroot/dl/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b.tar.gz
| tar --strip-components=1 -C
/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b
  -xf -
[7m>>> ktap eb66d40310c93dc82bc8eac889744c1ed1f01f7b Patching[27m
[7m>>> ktap eb66d40310c93dc82bc8eac889744c1ed1f01f7b Configuring[27m
[7m>>> ktap eb66d40310c93dc82bc8eac889744c1ed1f01f7b Building[27m
/usr/bin/make -j9 -C
/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b
PATH="/home/zino/code/sirti/PVS/buildroot/output/host/bin:/home/zino/code/sirti/PVS/buildroot/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
AR="/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-ar"
AS="/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-as"
LD="/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-ld"
NM="/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-nm"
CC="/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-gcc"
GCC="/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-gcc"
CPP="/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-cpp"
CXX="/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-g++"
FC="/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-gfortran"
F77="/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-gfortran"
RANLIB="/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-ranlib"
READELF="/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-readelf"
STRIP="/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-strip"
OBJCOPY="/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-objcopy"
OBJDUMP="/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/home/zino/code/sirti/PVS/buildroot/output/host/include"
CFLAGS_FOR_BUILD="-O2
-I/home/zino/code/sirti/PVS/buildroot/output/host/include"
CXXFLAGS_FOR_BUILD="-O2
-I/home/zino/code/sirti/PVS/buildroot/output/host/include"
LDFLAGS_FOR_BUILD="-L/home/zino/code/sirti/PVS/buildroot/output/host/lib
-Wl,-rpath,/home/zino/code/sirti/PVS/buildroot/output/host/lib"
FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-as"
DEFAULT_LINKER="/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-ld"
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os "
CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
" LDFLAGS="" FCFLAGS=" -Os " FFLAGS=" -Os "
PKG_CONFIG="/home/zino/code/sirti/PVS/buildroot/output/host/bin/pkg-config"
STAGING_DIR="/home/zino/code/sirti/PVS/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot"
INTLTOOL_PERL=/usr/bin/perl NO_LIBELF=1 ktap
make[1]: ingresso nella directory
"/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b"
/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-gcc 
-Wall -O2 -DNO_LIBELF -o userspace/kp_main.o -c userspace/kp_main.c
/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-gcc 
-Wall -O2 -DNO_LIBELF -o userspace/kp_lex.o -c userspace/kp_lex.c
/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-gcc 
-Wall -O2 -DNO_LIBELF -o userspace/kp_parse.o -c userspace/kp_parse.c
/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-gcc 
-Wall -O2 -DNO_LIBELF -o userspace/kp_bcwrite.o -c userspace/kp_bcwrite.c
/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-gcc 
-Wall -O2 -DNO_LIBELF -o userspace/kp_reader.o -c userspace/kp_reader.c
/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-gcc 
-Wall -O2 -DNO_LIBELF -o userspace/kp_util.o -c userspace/kp_util.c
/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-gcc 
-Wall -O2 -DNO_LIBELF -o userspace/kp_parse_events.o -c
userspace/kp_parse_events.c
userspace/kp_bcwrite.c: In function ?bcwrite_ktab?:
userspace/kp_bcwrite.c:81:3: warning: this ?for? clause does not guard...
[-Wmisleading-indentation]
   for (i = (ptrdiff_t)t->asize-1; i >= 0; i--)
   ^~~
userspace/kp_bcwrite.c:84:4: note: ...this statement, but the latter is
misleadingly indented as if it were guarded by the ?for?
    narray = (int)(i+1);
    ^~~~~~
userspace/kp_lex.c: In function ?lex_string?:
userspace/kp_lex.c:210:5: warning: this ?while? clause does not guard...
[-Wmisleading-indentation]
     while (kp_char_isspace(ls->c))
     ^~~~~
userspace/kp_lex.c:215:6: note: ...this statement, but the latter is
misleadingly indented as if it were guarded by the ?while?
      continue;
      ^~~~~~~~
/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-gcc
-Wall -O2 -DNO_LIBELF -o ktap  userspace/kp_main.o userspace/kp_lex.o
userspace/kp_parse.o userspace/kp_bcwrite.o userspace/kp_reader.o
userspace/kp_util.o userspace/kp_parse_events.o -lpthread
make[1]: uscita dalla directory
"/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b"
[7m>>> ktap eb66d40310c93dc82bc8eac889744c1ed1f01f7b Building kernel
module(s)[27m
PATH="/home/zino/code/sirti/PVS/buildroot/output/host/bin:/home/zino/code/sirti/PVS/buildroot/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
BR_BINARIES_DIR=/home/zino/code/sirti/PVS/buildroot/output/images /usr/bin/make
-j9 -C
/home/zino/code/sirti/PVS/buildroot/output/build/linux-f9f6f0db2d5e4f9d2ff46eb31a5a05276a92ed7d
HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm
INSTALL_MOD_PATH=/home/zino/code/sirti/PVS/buildroot/output/target
CROSS_COMPILE="/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-"
DEPMOD=/home/zino/code/sirti/PVS/buildroot/output/host/sbin/depmod
INSTALL_MOD_STRIP=1 KVERSION=`/usr/bin/make -j9 HOSTCC="/usr/bin/gcc"
HOSTCFLAGS="" ARCH=arm
INSTALL_MOD_PATH=/home/zino/code/sirti/PVS/buildroot/output/target
CROSS_COMPILE="/home/zino/code/sirti/PVS/buildroot/output/host/bin/arm-linux-gnueabihf-"
DEPMOD=/home/zino/code/sirti/PVS/buildroot/output/host/sbin/depmod
INSTALL_MOD_STRIP=1 -C
/home/zino/code/sirti/PVS/buildroot/output/build/linux-f9f6f0db2d5e4f9d2ff46eb31a5a05276a92ed7d
--no-print-directory -s kernelrelease 2>/dev/null`
PWD=/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/.
M=/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/.
modules
make[1]: ingresso nella directory
"/home/zino/code/sirti/PVS/buildroot/output/build/linux-f9f6f0db2d5e4f9d2ff46eb31a5a05276a92ed7d"
    CHK libelf
/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/./Makefile:108:
No libelf found, disables symbol resolving, please install
elfutils-libelf-devel/libelf-dev
  CC [M] 
/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/./runtime/amalg.o
In file included from
/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/./runtime/amalg.c:22:0:
/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/./runtime/ktap.c:
In function ?ktapvm_ioctl?:
/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/./runtime/ktap.c:177:11:
error: implicit declaration of function ?get_unused_fd?; did you mean
?put_unused_fd?? [-Werror=implicit-function-declaration]
  new_fd = get_unused_fd();
           ^~~~~~~~~~~~~
           put_unused_fd
In file included from
/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/./runtime/amalg.c:23:0:
/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/./runtime/kp_obj.c:
In function ?kp_malloc?:
/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/./runtime/kp_obj.c:47:8:
error: ?__GFP_WAIT? undeclared (first use in this function); did you mean
?__GFP_WRITE??
     & ~__GFP_WAIT)
        ^
/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/./runtime/kp_obj.c:59:23:
note: in expansion of macro ?KTAP_ALLOC_FLAGS?
  addr = kmalloc(size, KTAP_ALLOC_FLAGS);
                       ^~~~~~~~~~~~~~~~
/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/./runtime/kp_obj.c:47:8:
note: each undeclared identifier is reported only once for each function it
appears in
     & ~__GFP_WAIT)
        ^
/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/./runtime/kp_obj.c:59:23:
note: in expansion of macro ?KTAP_ALLOC_FLAGS?
  addr = kmalloc(size, KTAP_ALLOC_FLAGS);
                       ^~~~~~~~~~~~~~~~
/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/./runtime/kp_obj.c:
In function ?kp_zalloc?:
/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/./runtime/kp_obj.c:47:8:
error: ?__GFP_WAIT? undeclared (first use in this function); did you mean
?__GFP_WRITE??
     & ~__GFP_WAIT)
        ^
/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/./runtime/kp_obj.c:70:23:
note: in expansion of macro ?KTAP_ALLOC_FLAGS?
  addr = kzalloc(size, KTAP_ALLOC_FLAGS);
                       ^~~~~~~~~~~~~~~~
In file included from
/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/./runtime/kp_str.c:37:0,
                 from
/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/./runtime/amalg.c:25:
/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/./runtime/kp_events.h:
At top level:
/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/./runtime/kp_events.h:4:10:
fatal error: linux/ftrace_event.h: File o directory non esistente
 #include <linux/ftrace_event.h>
          ^~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
compilation terminated.
scripts/Makefile.build:258: set di istruzioni per l'obiettivo
"/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/./runtime/amalg.o"
non riuscito
make[2]: ***
[/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/./runtime/amalg.o]
Errore 1
Makefile:1402: set di istruzioni per l'obiettivo
"_module_/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/."
non riuscito
make[1]: ***
[_module_/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/.]
Errore 2
make[1]: uscita dalla directory
"/home/zino/code/sirti/PVS/buildroot/output/build/linux-f9f6f0db2d5e4f9d2ff46eb31a5a05276a92ed7d"
package/pkg-generic.mk:247: set di istruzioni per l'obiettivo
"/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/.stamp_built"
non riuscito
make: ***
[/home/zino/code/sirti/PVS/buildroot/output/build/ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b/.stamp_built]
Errore 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
