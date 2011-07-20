From: Diego Iastrubni <diegoiast@gmail.com>
Date: Wed, 20 Jul 2011 17:04:02 +0300
Subject: [Buildroot] Building valgrind with ccache fails
Message-ID: <CALR4fEJsNk60r1Q+kFMwne4_ZcDqu2CWfTMaxDgt1rsMUt1_Xg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I am using buildroot master, and when I enable ccache support, valgrind
fails to build. I am able to reproduce this on i586 and arm (i586 using
buildtool-ng, and arm using a code sourcery toolchain). Error is available
at the end of this email.

Can anyone reproduce?

BTW: it seems like on my setup (omap3) valgrind returns a lot of errors deep
inside glibc, and in fails to detect memory leaks. Can anyone reproduce
this?


../coregrind/link_tool_exe_linux 0x38000000
/home/diego/src/buildroot/output/host/usr/bin/ccache
/home/diego/src/buildroot/output/host/usr/bin/i586-unknown-linux-gnu-gcc
 -Wno-long-long -pipe -O2  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Wno-pointer-sign -fno-stack-protector   -o
memcheck-x86-linux -m32 -mpreferred-stack-boundary=2 -O2 -g -Wall
-Wmissing-prototypes -Wshadow -Wpointer-arith -Wstrict-prototypes
-Wmissing-declarations -Wno-format-zero-length -fno-strict-aliasing
-O2 -static -nodefaultlibs -nostartfiles -u _start -Wl,--build-id=none
-m32 memcheck_x86_linux-mc_leakcheck.o
memcheck_x86_linux-mc_malloc_wrappers.o memcheck_x86_linux-mc_main.o
memcheck_x86_linux-mc_translate.o memcheck_x86_linux-mc_machine.o
memcheck_x86_linux-mc_errors.o ../coregrind/libcoregrind-x86-linux.a
../VEX/libvex-x86-linux.a -lgcc
cache directory                     /home/diego/.buildroot-ccache
cache hit (direct)                 28821
cache hit (preprocessed)            6503
cache miss                         59026
called for link                     5908
compile failed                      5249
preprocessor error                  2361
bad compiler arguments              1168
unsupported source language          162
autoconf compile/link              20089
unsupported compiler option         5290
no input file                       6290
files in cache                     79931
cache size                         889.6 Mbytes
max cache size                       1.0
Gbytes*/home/diego/src/buildroot/output/host/usr/bin/ccache: invalid
option -- 't'*
Usage:
    ccache [options]
    ccache compiler [compiler options]
    compiler [compiler options]          (via symbolic link)

Options:
    -c, --cleanup         delete old files and recalculate size counters
                          (normally not needed as this is done automatically)
    -C, --clear           clear the cache completely
    -F, --max-files=N     set maximum number of files in cache to N (use 0 for
                          no limit)
    -M, --max-size=SIZE   set maximum size of cache to SIZE (use 0 for no
                          limit; available suffixes: G, M and K; default
                          suffix: G)
    -s, --show-stats      show statistics summary
    -z, --zero-stats      zero statistics counters

    -h, --help            print this help text
    -V, --version         print version and copyright information

See also <http://ccache.samba.org>.
make[4]: *** [memcheck-x86-linux] Error 1
make[4]: Leaving directory
`/home/diego/src/buildroot/output/build/valgrind-3.6.1/memcheck'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/diego/src/buildroot/output/build/valgrind-3.6.1/memcheck'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/diego/src/buildroot/output/build/valgrind-3.6.1'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/diego/src/buildroot/output/build/valgrind-3.6.1'
make: *** [/home/diego/src/buildroot/output/build/valgrind-3.6.1/.stamp_built]
Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110720/b58e59b0/attachment.html>
