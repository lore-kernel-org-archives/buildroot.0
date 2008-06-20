From: Fathi Boudra <fboudra@gmail.com>
Date: Fri, 20 Jun 2008 20:50:31 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc: 4.3.1
In-Reply-To: <87r6as2c0o.fsf@macbook.be.48ers.dk>
References: <20080619190606.260DD3C67C@busybox.net>
	<6a2e33620806200906h5b27d157s551782a16eb00a36@mail.gmail.com>
	<87r6as2c0o.fsf@macbook.be.48ers.dk>
Message-ID: <200806202050.32567.fboudra@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 20 June 2008 20:32:07 Peter Korsgaard wrote:

> I also seem to have problems on powerpc, but haven't looked at it yet
> in detail:
>
> /home/peko/source/buildroot/toolchain_build_powerpc/gcc-4.3.1/libgcc/../lib
>decnumber/decExcept.c:30:18: error: fenv.h: No such file or directory
> make[2]: *** [decExcept.o] Error 1
> make[2]: Leaving directory
> `/home/peko/source/buildroot/toolchain_build_powerpc/gcc-4.3.1-initial/powe
>rpc-linux-uclibc/libgcc' make[1]: *** [all-target-libgcc] Error 2
> make[1]: Leaving directory
> `/home/peko/source/buildroot/toolchain_build_powerpc/gcc-4.3.1-initial'

That's it. I retried right now and got same issue with a defconfig (except 
arch + gcc switch):

ld_powerpc/gcc-4.3.1/libgcc -I/buildd/build-area/toolchain/buildroot-chrp32/toolchain_build_powerpc/gcc-4.3.1/libgcc/. -I/buildd/build-area/toolchain/buildroot-chrp32/toolchain_build_powerpc/gcc-4.3.1/libgcc/../gcc -I/buildd/build-area/toolchain/buildroot-chrp32/toolchain_build_powerpc/gcc-4.3.1/libgcc/../include -I/buildd/build-area/toolchain/buildroot-chrp32/toolchain_build_powerpc/gcc-4.3.1/libgcc/../libdecnumber/dpd -I/buildd/build-area/toolchain/buildroot-chrp32/toolchain_build_powerpc/gcc-4.3.1/libgcc/../libdecnumber -I../../libdecnumber -DHAVE_CC_TLS -o 
decExcept.o-MT decExcept.o -MD -MP -MF 
decExcept.dep -c /buildd/build-area/toolchain/buildroot-chrp32/toolchain_build_powerpc/gcc-4.3.1/libgcc/../libdecnumber/decExcept.c
/buildd/build-area/toolchain/buildroot-chrp32/toolchain_build_powerpc/gcc-4.3.1/libgcc/../libdecnumber/decExcept.c:30:18: 
error: fenv.h: No such file or directory
make[2]: *** [decExcept.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: Leaving directory 
`/buildd/build-area/toolchain/buildroot-chrp32/toolchain_build_powerpc/gcc-4.3.1-initial/powerpc-linux-uclibc/libgcc'
make[1]: *** [all-target-libgcc] Error 2
make[1]: Leaving directory 
`/buildd/build-area/toolchain/buildroot-chrp32/toolchain_build_powerpc/gcc-4.3.1-initial'
make: *** 
[/buildd/build-area/toolchain/buildroot-chrp32/toolchain_build_powerpc/gcc-4.3.1-initial/.compiled] 
Error 2

$ find . -name fenv.h
./toolchain_build_powerpc/uClibc_dev/usr/include/bits/fenv.h
./toolchain_build_powerpc/gcc-4.3.1/libstdc++-v3/include/tr1/fenv.h
./toolchain_build_powerpc/gcc-4.3.1/libstdc++-v3/include/c_compatibility/fenv.h
./toolchain_build_powerpc/uClibc-0.9.29/libc/sysdeps/linux/mips/bits/fenv.h
./toolchain_build_powerpc/uClibc-0.9.29/libc/sysdeps/linux/ia64/bits/fenv.h
./toolchain_build_powerpc/uClibc-0.9.29/libc/sysdeps/linux/e1/bits/fenv.h
./toolchain_build_powerpc/uClibc-0.9.29/libc/sysdeps/linux/sparc/bits/fenv.h
./toolchain_build_powerpc/uClibc-0.9.29/libc/sysdeps/linux/powerpc/bits/fenv.h
./toolchain_build_powerpc/uClibc-0.9.29/libc/sysdeps/linux/powerpc/fenv.h
./toolchain_build_powerpc/uClibc-0.9.29/libc/sysdeps/linux/sh/bits/fenv.h
./toolchain_build_powerpc/uClibc-0.9.29/libc/sysdeps/linux/i386/bits/fenv.h
./toolchain_build_powerpc/uClibc-0.9.29/libc/sysdeps/linux/common/bits/fenv.h
./toolchain_build_powerpc/uClibc-0.9.29/libc/sysdeps/linux/arm/bits/fenv.h
./toolchain_build_powerpc/uClibc-0.9.29/libc/sysdeps/linux/m68k/bits/fenv.h
./toolchain_build_powerpc/uClibc-0.9.29/libc/sysdeps/linux/alpha/bits/fenv.h
./toolchain_build_powerpc/uClibc-0.9.29/libc/sysdeps/linux/hppa/bits/fenv.h
./toolchain_build_powerpc/uClibc-0.9.29/libc/sysdeps/linux/x86_64/bits/fenv.h
./toolchain_build_powerpc/uClibc-0.9.29/test/math/fenv.h
