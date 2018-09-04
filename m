From: Faisal Mehmood <f.m3hm00d@gmail.com>
Date: Tue, 4 Sep 2018 11:24:53 +0000
Subject: [Buildroot] Beginner help: Compilation errors for bison,
 ncurses and arm-buildroot-linux-uclibcgnueabihf
Message-ID: <CAL8qis=5F5kDuMjpsZJZLbnAkFKBVaH_V1CcV6uuK5Lu1ooPAw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I want to use buildroot to build a minimal rootfs with a handful of
GUI software and libraries for my raspberry pi 3 system.

I downloaded buildroot-2018.02.5 and enabled some libraries and
software. 'make' produced an error [1]. Given that the error was
related to ncurses, I straight away disabled it to get to a clean
build. However, disabling ncurses threw another error about bison [2].

A little google-fu told me that perhaps i'd have to apply some patch
to get it working. Since I'm pretty new to all this, I proceeded to
downloading the latest rc version, hoping that the issue would have
been resolved.

So then I downloaded buildroot-2018.08-rc3. Luckily, this time bison
compiled just fine. However, I got an error at a later stage [3].

What I want to ask is that is there a way to get going without facing
compilation errors? I got into kernel compilation a few weeks ago. The
only difficult thing was to find out what options to enable and what
options to disable. Compilation itself was breezy.

Please help me find a way to buildroot compilation where I don't have
to apply patches or solve compilation errors.

Kind regards,
m3hm00d

################################1#1#1#1#1#1#1#1#1#1########################

/home/kenobi/projects/zero/rootfs/buildroot-2018.02.5/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/Scrt1.o:
In function `_start':
(.text+0x54): undefined reference to `main'
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:850: ../lib/libncurses.so.6.0] Error 1
make[2]: Leaving directory
'/home/kenobi/projects/zero/rootfs/buildroot-2018.02.5/output/build/ncurses-6.0/ncurses'
make[1]: *** [Makefile:114: all] Error 2
make[1]: Leaving directory
'/home/kenobi/projects/zero/rootfs/buildroot-2018.02.5/output/build/ncurses-6.0'
make: *** [package/pkg-generic.mk:226:
/home/kenobi/projects/zero/rootfs/buildroot-2018.02.5/output/build/ncurses-6.0/.stamp_built]
Error 2

################################1#1#1#1#1#1#1#1#1#1########################


################################2#2#2#2#2#2#2#2#2#2########################
make[3]: Entering directory
'/home/kenobi/projects/zero/rootfs/buildroot-2018.02.5/output/build/host-bison-3.0.4'
  CC       lib/wait-process.o
  CC       lib/wctype-h.o
  CC       lib/xmalloc.o
  CC       lib/xalloc-die.o
  CC       lib/xconcat-filename.o
  CC       lib/xsize.o
  CC       lib/xstrndup.o
  CC       lib/abitset.o
  CC       lib/bitset.o
  CC       lib/bitset_stats.o
  CC       lib/bitsetv.o
  CC       lib/ebitset.o
  CC       lib/lbitset.o
  CC       lib/vbitset.o
  CC       lib/bitsetv-print.o
  CC       lib/timevar.o
  CC       lib/get-errno.o
  CC       lib/asnprintf.o
  CC       lib/fcntl.o
  CC       lib/fprintf.o
  CC       lib/fseterr.o
  CC       lib/isnand.o
  CC       lib/isnanf.o
  CC       lib/isnanl.o
  CC       lib/obstack.o
  CC       lib/printf.o
lib/fseterr.c: In function 'fseterr':
lib/fseterr.c:77:3: error: #error "Please port gnulib fseterr.c to
your platform! Look at the definitions of ferror and clearerr on your
system, then report this to bug-gnulib."
  #error "Please port gnulib fseterr.c to your platform! Look at the
definitions of ferror and clearerr on your system, then report this to
bug-gnulib."
   ^~~~~
make[3]: *** [Makefile:3466: lib/fseterr.o] Error 1
make[3]: *** Waiting for unfinished jobs....
  CC       lib/printf-args.o
make[3]: Leaving directory
'/home/kenobi/projects/zero/rootfs/buildroot-2018.02.5/output/build/host-bison-3.0.4'
make[2]: *** [Makefile:4522: all-recursive] Error 1
make[2]: Leaving directory
'/home/kenobi/projects/zero/rootfs/buildroot-2018.02.5/output/build/host-bison-3.0.4'
make[1]: *** [Makefile:2625: all] Error 2
make[1]: Leaving directory
'/home/kenobi/projects/zero/rootfs/buildroot-2018.02.5/output/build/host-bison-3.0.4'
make: *** [package/pkg-generic.mk:226:
/home/kenobi/projects/zero/rootfs/buildroot-2018.02.5/output/build/host-bison-3.0.4/.stamp_built]
Error 2

################################2#2#2#2#2#2#2#2#2#2########################


##############################3#3#3#3#3#3#3#3#3#3#3#3#######################
/home/kenobi/Downloads/buildroot-2018.08-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
-shared -Wl,-soname,libz.so.1,--version-script,zlib.map -fPIE
-Wl,-z,now -Wl,-z,relro -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os  -fPIC -fPIC -D_LARGEFILE64_SOURCE=1
-DHAVE_HIDDEN -o libz.so.1.2.11 adler32.lo crc32.lo deflate.lo
infback.lo inffast.lo inflate.lo inftrees.lo trees.lo zutil.lo
compress.lo uncompr.lo gzclose.lo gzlib.lo gzread.lo gzwrite.lo  -lc
-pie
/home/kenobi/Downloads/buildroot-2018.08-rc3/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/Scrt1.o:
In function `_start':
(.text+0x54): undefined reference to `main'
collect2: error: ld returned 1 exit status
make[1]: *** [Makefile:282: libz.so.1.2.11] Error 1
make[1]: Leaving directory
'/home/kenobi/Downloads/buildroot-2018.08-rc3/output/build/libzlib-1.2.11'
make: *** [package/pkg-generic.mk:232:
/home/kenobi/Downloads/buildroot-2018.08-rc3/output/build/libzlib-1.2.11/.stamp_built]
Error 2

##############################3#3#3#3#3#3#3#3#3#3#3#3#######################
