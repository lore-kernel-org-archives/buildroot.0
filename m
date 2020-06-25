From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 25 Jun 2020 14:25:23 +0000
Subject: [Buildroot] [Bug 13041] New: unable to build opus when using thumb
 instructions on arm926t
Message-ID: <bug-13041-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13041

            Bug ID: 13041
           Summary: unable to build opus when using thumb instructions on
                    arm926t
           Product: buildroot
           Version: 2020.05
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: s404.gordon at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8521
  --> https://bugs.busybox.net/attachment.cgi?id=8521&action=edit
config file

Hello.

I can't build my system, build fails on opus package.

Target board specs:
Licheepi nano
f1c100s SOC
arm926t (armv5tej) architecture
Thumb instructions enabled, build is ok when building using regular ARM
instruction set.

I don't even know why buildroot is building opus, i've disabled ffmpeg and
other opus tools.

Host system:
evgeny ~/buildroot-2020.05 $ uname -a
Linux ZEMLYANIKA 5.6.0-2-amd64 #1 SMP Debian 5.6.14-1 (2020-05-23) x86_64
GNU/Linux
evgeny ~/buildroot-2020.05 $ gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/lib/gcc/x86_64-linux-gnu/9/lto-wrapper
OFFLOAD_TARGET_NAMES=nvptx-none:hsa
OFFLOAD_TARGET_DEFAULT=1
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Debian 9.3.0-14'
--with-bugurl=file:///usr/share/doc/gcc-9/README.Bugs
--enable-languages=c,ada,c++,go,brig,d,fortran,objc,obj-c++,gm2 --prefix=/usr
--with-gcc-major-version-only --program-suffix=-9
--program-prefix=x86_64-linux-gnu- --enable-shared --enable-linker-build-id
--libexecdir=/usr/lib --without-included-gettext --enable-threads=posix
--libdir=/usr/lib --enable-nls --enable-bootstrap --enable-clocale=gnu
--enable-libstdcxx-debug --enable-libstdcxx-time=yes
--with-default-libstdcxx-abi=new --enable-gnu-unique-object
--disable-vtable-verify --enable-plugin --enable-default-pie --with-system-zlib
--with-target-system-zlib=auto --enable-objc-gc=auto --enable-multiarch
--disable-werror --with-arch-32=i686 --with-abi=m64
--with-multilib-list=m32,m64,mx32 --enable-multilib --with-tune=generic
--enable-offload-targets=nvptx-none=/build/gcc-9-aHzuVo/gcc-9-9.3.0/debian/tmp-nvptx/usr,hsa
--without-cuda-driver --enable-checking=release --build=x86_64-linux-gnu
--host=x86_64-linux-gnu --target=x86_64-linux-gnu
--with-build-config=bootstrap-lto-lean --enable-link-mutex
Thread model: posix
gcc version 9.3.0 (Debian 9.3.0-14)

Log:
>>> opus 1.3.1 Building
PATH="/home/evgeny/buildroot-2020.05/output/host/bin:/home/evgeny/buildroot-2020.05/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
 /usr/bin/make   -C /home/evgeny/buildroot-2020.05/output/build/opus-1.3.1/
make[1]: Entering directory
'/home/evgeny/buildroot-2020.05/output/build/opus-1.3.1'
./celt/arm/arm2gnu.pl  < celt/arm/armopts.s > celt/arm/armopts-gnu.S
./celt/arm/arm2gnu.pl  < celt/arm/celt_pitch_xcorr_arm.s >
celt/arm/celt_pitch_xcorr_arm-gnu.S
/usr/bin/make  all-recursive
make[2]: Entering directory
'/home/evgeny/buildroot-2020.05/output/build/opus-1.3.1'
make[3]: Entering directory
'/home/evgeny/buildroot-2020.05/output/build/opus-1.3.1'
  CPPAS    celt/arm/celt_pitch_xcorr_arm-gnu.lo
  CC       celt/bands.lo
  CC       celt/celt.lo
  CC       celt/celt_encoder.lo
  CC       celt/celt_decoder.lo
  CC       celt/cwrs.lo
  CC       celt/entcode.lo
  CC       celt/entdec.lo
make[4]: Entering directory
'/home/evgeny/buildroot-2020.05/output/build/opus-1.3.1/doc'
make[4]: Nothing to be done for 'all'.
make[4]: Leaving directory
'/home/evgeny/buildroot-2020.05/output/build/opus-1.3.1/doc'
  CC       celt/entenc.lo
  CC       celt/kiss_fft.lo
  CC       celt/laplace.lo
  CC       celt/mathops.lo
  CC       celt/mdct.lo
  CC       celt/modes.lo
  CC       celt/pitch.lo
  CC       celt/celt_lpc.lo
  CC       celt/quant_bands.lo
  CC       celt/rate.lo
  CC       celt/vq.lo
/tmp/ccNlGv5j.s: Assembler messages:
/tmp/ccNlGv5j.s:459: Error: selected processor does not support `smull
r3,r5,r4,r6' in Thumb mode
/tmp/ccNlGv5j.s:478: Error: selected processor does not support `smull
r3,r0,r4,r6' in Thumb mode
make[3]: *** [Makefile:2551: celt/mathops.lo] Error 1
make[3]: *** Waiting for unfinished jobs....
/tmp/ccIgr58F.s: Assembler messages:
/tmp/ccIgr58F.s:338: Error: selected processor does not support `smull
r4,r5,r0,r3' in Thumb mode
/tmp/ccIgr58F.s:354: Error: selected processor does not support `smull
r4,r5,r0,r3' in Thumb mode
/tmp/ccIgr58F.s:370: Error: selected processor does not support `smull
r6,r4,r0,r3' in Thumb mode
/tmp/ccIgr58F.s:387: Error: selected processor does not support `smull
r1,r0,r6,r3' in Thumb mode
/tmp/ccIgr58F.s:405: Error: selected processor does not support `smull
r7,r3,r6,r1' in Thumb mode
/tmp/ccIgr58F.s:424: Error: selected processor does not support `smull
ip,r6,r7,r1' in Thumb mode
/tmp/ccIgr58F.s:533: Error: selected processor does not support `smull
r6,r2,r7,r5' in Thumb mode
/tmp/ccIgr58F.s:548: Error: selected processor does not support `smull
ip,r2,r7,r4' in Thumb mode
/tmp/ccIgr58F.s:562: Error: selected processor does not support `smull
ip,r7,r6,r4' in Thumb mode
/tmp/ccIgr58F.s:588: Error: selected processor does not support `smull
r6,r2,r4,r5' in Thumb mode
/tmp/ccIgr58F.s:602: Error: selected processor does not support `smull
ip,r2,r7,r4' in Thumb mode
/tmp/ccIgr58F.s:616: Error: selected processor does not support `smull
ip,r7,r6,r4' in Thumb mode
/tmp/ccIgr58F.s:642: Error: selected processor does not support `smull
r6,r2,r4,r5' in Thumb mode
/tmp/ccIgr58F.s:656: Error: selected processor does not support `smull
ip,r2,r7,r4' in Thumb mode
/tmp/ccIgr58F.s:670: Error: selected processor does not support `smull
ip,r7,r6,r4' in Thumb mode
/tmp/ccIgr58F.s:696: Error: selected processor does not support `smull
r6,r2,r4,r5' in Thumb mode
/tmp/ccIgr58F.s:710: Error: selected processor does not support `smull
ip,r2,r7,r4' in Thumb mode
/tmp/ccIgr58F.s:724: Error: selected processor does not support `smull
ip,r7,r6,r4' in Thumb mode
/tmp/ccIgr58F.s:750: Error: selected processor does not support `smull
r6,r2,r4,r5' in Thumb mode
/tmp/ccIgr58F.s:764: Error: selected processor does not support `smull
ip,r2,r7,r4' in Thumb mode
/tmp/ccIgr58F.s:778: Error: selected processor does not support `smull
ip,r7,r6,r4' in Thumb mode
make[3]: *** [Makefile:2551: celt/celt.lo] Error 1
/tmp/ccEvQku1.s: Assembler messages:
/tmp/ccEvQku1.s:135: Error: selected processor does not support `smull
r7,r1,r6,ip' in Thumb mode
/tmp/ccEvQku1.s:146: Error: selected processor does not support `smull
r6,r5,r2,ip' in Thumb mode
/tmp/ccEvQku1.s:179: Error: selected processor does not support `smull
r7,r1,r6,ip' in Thumb mode
/tmp/ccEvQku1.s:191: Error: selected processor does not support `smull
r6,r5,r2,ip' in Thumb mode

...and so on...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
