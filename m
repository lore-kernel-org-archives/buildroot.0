From: Will Newton <will.newton@gmail.com>
Date: Thu, 21 Nov 2013 09:00:15 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-20
In-Reply-To: <20131121073002.85918101270@stock.ovh.net>
References: <20131121073002.85918101270@stock.ovh.net>
Message-ID: <CAFbHwiTA228YrD+zfo8omQbn_74+kFg+8oS2PO-syx8N7dXFrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 21, 2013 at 7:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2013-11-20
> ===============================
>
>         success : 79
>        failures : 30
>        timeouts : 0
>           TOTAL : 109
>
> Classification of failures by reason
> ====================================
>
>                       qt-4.8.5 | 3
>                libsigsegv-2.10 | 2
>                   aespipe-2.4c | 2
>   toolchain-external-undefined | 2
>                 openssl-1.0.1e | 2
>                libglib2-2.36.3 | 2
>                 libiscsi-1.6.0 | 1
> ne10-88c18f02199947b2c8b577... | 1
>                     zlib-1.2.8 | 1
>                   python-2.7.3 | 1
>                 directfb-1.6.3 | 1
>              tinymembench-v0.2 | 1
>               fontconfig-2.6.0 | 1
>              alsa-utils-1.0.26 | 1
>                libcap-ng-0.7.3 | 1
>                  mplayer-1.1.1 | 1
>                ruby-1.9.3-p448 | 1
>                 sdl_ttf-2.0.11 | 1
>               gstreamer1-1.2.1 | 1
>                alsa-lib-1.0.26 | 1
>                    squid-3.3.9 | 1
>                      lxc-0.9.0 | 1
>                  qt5base-5.1.1 | 1
>
> Detail of failures
> ===================
>
>     mipsel |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/67777100952502ce1234d56d487232b89fc63555/
>       mips |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/8c82eb723f332672eec3ea1dadccdcdaa42051f1/
>    powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/d61ef4411019699d7b6bcd42faeb090c54d47497/
>       bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/3ef1964a674dbac3dc29f51e39c6f2db0ff0034d/
>       bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/8606ad5f2fd29472b21ed86e59afb3c7e537bb04/
>       bfin |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/aaf5637c06730177e0f98a3bb1bb4f72922f0f4a/
>     xtensa |               gstreamer1-1.2.1 | NOK | http://autobuild.buildroot.net/results/a75445ff97aa64206a396a9dfa3592d6e939fabb/
>      avr32 |                libcap-ng-0.7.3 | NOK | http://autobuild.buildroot.net/results/9e2b20bd82e7629ae4e732d816fce5328683900e/
>       bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/82ec28701d0586cdcabd1765fce4eb6e8f9e872b/
>       bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/d304c5efa2012aad0d38293833f23ba4196b99b0/
>   mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/1dc62210c19261a8f5798c992a20dd70244702c9/
>    aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/16cf518c29fb42279b4d3f5bf1a0b08b7991de25/
>    aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/9821f4d44e65db1ec503acc89685ccfa7664fc32/

May be fixed by this patch:

http://lists.gnu.org/archive/html/bug-libsigsegv/2013-05/msg00001.html

>      avr32 |                      lxc-0.9.0 | NOK | http://autobuild.buildroot.net/results/79ad9d7f5a9fb48e7d3210f0aee14638fde8f3e7/
>        arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/4f6f7b158cb759e631e6a6d1855add7cec27f0ef/

Trying to build neon with a toolchain that does not support it:

/tmp/ccdf5DMj.s: Assembler messages:
/tmp/ccdf5DMj.s:2843: Error: selected FPU does not support instruction
-- `vmul.f32 q0,q0,q1'
/tmp/ccdf5DMj.s:2937: Error: selected processor does not support ARM
mode `veor q0,q0,q2'
/tmp/ccdf5DMj.s:2938: Error: selected FPU does not support instruction
-- `vmul.f32 q0,q0,q1'
/tmp/ccdf5DMj.s:3009: Error: selected FPU does not support instruction
-- `vmul.f32 d0,d0,d1'
/tmp/ccdf5DMj.s:3092: Error: selected processor does not support ARM
mode `veor d0,d0,d2'
/tmp/ccdf5DMj.s:3093: Error: selected FPU does not support instruction
-- `vmul.f32 d0,d0,d1'
make[2]: *** [libavcodec/aacdec.o] Error 1

>        arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/f554a022deb1798f91b67b06fb1d45f3aab7b40a/

Similar:

In file included from
/home/test/test/2/output/build/ne10-88c18f02199947b2c8b57796f5a3ca53160aff96/modules/math/NE10_mlac.neon.c:36:0:
/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.3/include/arm_neon.h:32:2:
error: #error You must enable NEON instructions (e.g.
-mfloat-abi=softfp -mfpu=neon) to use arm_neon.h
make[3]: *** [modules/CMakeFiles/NE10_test.dir/math/NE10_divc.neon.c.o] Error 1


> microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/adf657ad294e8e70a0f777cf104c3bcfb31d5512/
> microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/cffd89c243169c2f5fb4066616667cce0072c7ab/
>        arm |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/627ed1de53a1f059f52b1df15fda8cfd2e02a51a/

Multiple definition of symbols with uClibc toolchain (not one I have
seen before):

/home/test/test/2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(setregid.os):
In function `setregid':
setregid.c:(.text+0x0): multiple definition of `setregid'
/home/test/test/2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpthread.a(pthread_setregid.os):pthread_setregid.c:(.text+0x0):
first defined here
/home/test/test/2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(setresgid.os):
In function `setresgid':
setresgid.c:(.text+0x0): multiple definition of `setresgid'
/home/test/test/2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpthread.a(pthread_setresgid.os):pthread_setresgid.c:(.text+0x0):
first defined here
/home/test/test/2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(setresuid.os):
In function `setresuid':
setresuid.c:(.text+0x0): multiple definition of `setresuid'
/home/test/test/2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpthread.a(pthread_setresuid.os):pthread_setresuid.c:(.text+0x0):
first defined here
/home/test/test/2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(setreuid.os):
In function `setreuid':
setreuid.c:(.text+0x0): multiple definition of `setreuid'
/home/test/test/2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpthread.a(pthread_setreuid.os):pthread_setreuid.c:(.text+0x0):
first defined here

>        arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/ce5eea3c0d4c66f5374430102b21df9a10873054/

The EGL support seems not to be detected correctly:

The EGL functionality test failed!
 EGL is required for OpenGL ES to manage contexts & surfaces.
 You might need to modify the include and library search paths by editing
 QMAKE_INCDIR_EGL, QMAKE_LIBDIR_EGL and QMAKE_LIBS_EGL in
 /home/test/test/3/output/build/qt-4.8.5/mkspecs/qws/linux-arm-g++.
make: *** [/home/test/test/3/output/build/qt-4.8.5/.stamp_configured] Error 1

>   mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/838983b81f54e535a6029bb6901b9e525e7bc309/
>   mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/ae499fa0fa999bf7da5ffbb78c5ad4377a252b7c/
>      avr32 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/b4d1bdd168bf18f0454f3f00fe78f83a0e77f190/
>        arm |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/7c6cc07e360aa998957a48e834b8cc086282d716/

Missing thread support?

checking for pthread_kill in -lthr... no
checking for pthread_kill in -lpthread... no
checking for pthread_kill in -lpthreads... no
checking for pthread_kill in -lc... no
checking for pthread_kill in -lc_r... no
checking for pthread_kill in -lroot... no
configure: WARNING: "Don't know how to find pthread library on your
system -- thread support disabled"
checking for sched_yield... yes
checking for pthread_attr_setinheritsched... no
checking for pthread_getattr_np... no
checking for pthread_attr_get_np... no
checking for pthread_attr_getstack... no
checking for pthread_get_stackaddr_np... no
checking for pthread_get_stacksize_np... no
checking for thr_stksegment... no
checking for pthread_stackseg_np... no
checking for pthread_getthrds_np... no
checking for pthread_condattr_setclock... no
checking for pthread_sigmask... no
checking for backtrace... no
checking valgrind/memcheck.h usability... no
checking valgrind/memcheck.h presence... no
checking for valgrind/memcheck.h... no
checking whether ELF binaries are produced... yes
checking whether OS depend dynamic link works... yes
checking for arm-buildroot-linux-uclibcgnueabi-strip...
/home/test/test/2/output/host/usr/bin/arm-linux-strip
checking for prefix of external symbols... NONE
configure: error: thread model is missing

>        arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/d1f3cde93310780e453188f71394b21bc4e5a057/

More OpenGL problems?

/home/test/test/3/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.7.3/../../../../arm-none-linux-gnueabi/bin/ld:
warning: libXdamage.so.1, needed by
/home/test/test/3/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGL.so,
not found (try using -rpath or -rpath-link)
/home/test/test/3/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.7.3/../../../../arm-none-linux-gnueabi/bin/ld:
warning: libXfixes.so.3, needed by
/home/test/test/3/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGL.so,
not found (try using -rpath or -rpath-link)
/home/test/test/3/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.7.3/../../../../arm-none-linux-gnueabi/bin/ld:
warning: libXext.so.6, needed by
/home/test/test/3/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGL.so,
not found (try using -rpath or -rpath-link)
/home/test/test/3/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.7.3/../../../../arm-none-linux-gnueabi/bin/ld:
warning: libX11.so.6, needed by
/home/test/test/3/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGL.so,
not found (try using -rpath or -rpath-link)

>        arm |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/b33e1f41e50b6e7ac3e30806b9a617d451bc27b4/

Missing include?

Kid.cc: In member function 'void Kid::start(pid_t)':
Kid.cc:43:20: error: 'time' was not declared in this scope
Kid.cc: In member function 'void Kid::stop(Kid::status_type)':
Kid.cc:55:20: error: 'time' was not declared in this scope
make[4]: *** [Kid.lo] Error 1

>   mips64el |              tinymembench-v0.2 | NOK | http://autobuild.buildroot.net/results/ae478962c1b13af9fc46bb0a5379f89b3fbbecd8/
>   mips64el |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/fded49c26bd51f9e457cd4e785bd27bb9d47c797/
>       sh4a |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/920a4bf85916e3e7d71c479e2730787ec0b54131/
>       mips |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/9671f48783d2b69f941da97a6486fa73bb221b84/

Unfortunately I don't have the time at the moment to look into these
problems any further but maybe next week I can find some time to make
a patch or two.
