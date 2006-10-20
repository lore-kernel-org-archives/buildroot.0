From: William Feng <wfeng@mysourcecommunications.com>
Date: Thu, 19 Oct 2006 20:02:26 -0700
Subject: [Buildroot] error when building arm tool chain on fedora 4
Message-ID: <1161313346.9113.121.camel@dopey>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am new to buildroot. When I tried to build an arm tool chain for 
the arm926t target. After "make menuconfig", I started "make" and I got
the following error:

/home/wfeng/code/buildroot/buildroot/toolchain_build_arm/gcc-4.0.0-initial/gcc/xgcc -B/home/wfeng/code/buildroot/buildroot/toolchain_build_arm/gcc-4.0.0-initial/gcc/ -B/home/wfeng/code/buildroot/buildroot/build_arm/staging_dir/arm-linux-uclibcgnueabi/bin/ -B/home/wfeng/code/buildroot/buildroot/build_arm/staging_dir/arm-linux-uclibcgnueabi/lib/ -isystem /home/wfeng/code/buildroot/buildroot/build_arm/staging_dir/arm-linux-uclibcgnueabi/include -isystem /home/wfeng/code/buildroot/buildroot/build_arm/staging_dir/arm-linux-uclibcgnueabi/sys-include -O2  -DIN_GCC -DCROSS_COMPILE  -DUSE_UCLIBC -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition  -isystem ./include  -fomit-frame-pointer -fPIC -g0 -DHAVE_GTHR_DEFAULT -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED  -I. -I. -I/home/wfeng/code/buildroot/buildroot/toolchain_build_arm/gcc-4.0.0/gcc -I/home/wfeng/code/buildroot/buildroot/toolchain_build_arm/gcc-4.0.0/gcc/. -I/home/wfeng/code/buildroot/buildroot/toolchain_build_arm/gcc-4.0.0/gcc/../include -I/home/wfeng/code/buildroot/buildroot/toolchain_build_arm/gcc-4.0.0/gcc/../libcpp/include  -DL_fixunsdfsi -c /home/wfeng/code/buildroot/buildroot/toolchain_build_arm/gcc-4.0.0/gcc/libgcc2.c -o libgcc/./_fixunsdfsi.o
/tmp/ccwPYAHO.s: Assembler messages:
/tmp/ccwPYAHO.s:26: Error: selected processor does not support `ldfd
f2,.L10+8'
/tmp/ccwPYAHO.s:32: Error: selected processor does not support `fltd
f0,r6'
/tmp/ccwPYAHO.s:33: Error: selected processor does not support `mufd
f1,f0,f2'
/tmp/ccwPYAHO.s:34: Error: selected processor does not support `fltd
f0,r5'
/tmp/ccwPYAHO.s:36: Error: selected processor does not support `adfltd
f0,f0,f2'
/tmp/ccwPYAHO.s:37: Error: selected processor does not support `adfd
f0,f1,f0'
/tmp/ccwPYAHO.s:39: Error: selected processor does not support `mvfs
f0,f0'
make[3]: *** [libgcc/./_floatdisf.o] Error 1

I was using 

gcc version 4.0.0 20050519 (Red Hat 4.0.0-8) 

as native compiler on a fedora 4 station. 

Does anybody know what is going on? Did I miss any compiler options?

Thanks,

-will
