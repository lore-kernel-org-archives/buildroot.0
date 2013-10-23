From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Oct 2013 10:46:17 +0000 (UTC)
Subject: [Buildroot] [Bug 6590] New: directfb-examples build failed whit
	linaro toolchain
Message-ID: <bug-6590-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6590

           Summary: directfb-examples build failed whit linaro toolchain
           Product: buildroot
           Version: 2013.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: i90091e at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I'm using buildroot 2013.08.1 with linaro toolchain 13.06
(gcc-linaro-arm-linux-gnueabihf-4.8-2013.06_linux.tar.xz) to build image with
directfb-examples package. When build directfb-examples package, building
failed, gcc can't find librt and libdl. Full error message is:

>>> directfb-examples 1.6.0 Building
PATH="/home/jacky/buildroot-linaro-toolchain/host/bin:/home/jacky/buildroot-linaro-toolchain/host/usr/bin:/home/jacky/buildroot-linaro-toolchain/host/usr/sbin/:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/jacky/.rvm/bin"
PERLLIB="/home/jacky/buildroot-linaro-toolchain/host/usr/lib/perl" 
/usr/bin/make -j2  -C
/home/jacky/buildroot-linaro-toolchain/build/directfb-examples-1.6.0/
make[1]: Entering directory
`/home/jacky/buildroot-linaro-toolchain/build/directfb-examples-1.6.0'
Making all in src
make[2]: Entering directory
`/home/jacky/buildroot-linaro-toolchain/build/directfb-examples-1.6.0/src'
Making all in df_knuckles
make[3]: Entering directory
`/home/jacky/buildroot-linaro-toolchain/build/directfb-examples-1.6.0/src/df_knuckles'
/home/jacky/buildroot-linaro-toolchain/host/usr/bin/arm-linux-gnueabihf-gcc
-D_REENTRANT
-I/home/jacky/buildroot-linaro-toolchain/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/directfb
  -Wall -O3 -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -pipe -Os  -Werror-implicit-function-declaration   -o
df_knuckles df_knuckles.o matrix.o -ldirectfb -lfusion
-L/home/jacky/buildroot-linaro-toolchain/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
-ldirect -lpthread   -lm 
/home/jacky/buildroot-linaro-toolchain/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.8.2/../../../../arm-linux-gnueabihf/bin/ld:
warning: libdl.so.2, needed by
/home/jacky/buildroot-linaro-toolchain/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libdirectfb.so,
not found (try using -rpath or -rpath-link)
/home/jacky/buildroot-linaro-toolchain/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.8.2/../../../../arm-linux-gnueabihf/bin/ld:
warning: librt.so.1, needed by
/home/jacky/buildroot-linaro-toolchain/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libdirectfb.so,
not found (try using -rpath or -rpath-link)
/home/jacky/buildroot-linaro-toolchain/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libdirect.so:
undefined reference to `clock_getres at GLIBC_2.4'
/home/jacky/buildroot-linaro-toolchain/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libdirect.so:
undefined reference to `clock_gettime at GLIBC_2.4'
/home/jacky/buildroot-linaro-toolchain/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libdirect.so:
undefined reference to `dlclose at GLIBC_2.4'
/home/jacky/buildroot-linaro-toolchain/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libdirect.so:
undefined reference to `clock_settime at GLIBC_2.4'
/home/jacky/buildroot-linaro-toolchain/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libdirect.so:
undefined reference to `dlerror at GLIBC_2.4'
/home/jacky/buildroot-linaro-toolchain/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libdirectfb.so:
undefined reference to `dlopen at GLIBC_2.4'
collect2: error: ld returned 1 exit status
make[3]: *** [df_knuckles] Error 1
make[3]: Leaving directory
`/home/jacky/buildroot-linaro-toolchain/build/directfb-examples-1.6.0/src/df_knuckles'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/jacky/buildroot-linaro-toolchain/build/directfb-examples-1.6.0/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
`/home/jacky/buildroot-linaro-toolchain/build/directfb-examples-1.6.0'
make: ***
[/home/jacky/buildroot-linaro-toolchain/build/directfb-examples-1.6.0/.stamp_built]
Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
