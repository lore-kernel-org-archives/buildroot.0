From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 21 Jun 2008 14:21:25 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc: 4.3.1
In-Reply-To: <200806202050.32567.fboudra@gmail.com>
References: <20080619190606.260DD3C67C@busybox.net>
	<6a2e33620806200906h5b27d157s551782a16eb00a36@mail.gmail.com>
	<87r6as2c0o.fsf@macbook.be.48ers.dk>
	<200806202050.32567.fboudra@gmail.com>
Message-ID: <20080621122124.GZ10734@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 20, 2008 at 08:50:31PM +0200, Fathi Boudra wrote:
>On Friday 20 June 2008 20:32:07 Peter Korsgaard wrote:
>
>> I also seem to have problems on powerpc, but haven't looked at it yet
>> in detail:
>>
>> /home/peko/source/buildroot/toolchain_build_powerpc/gcc-4.3.1/libgcc/../lib
>>decnumber/decExcept.c:30:18: error: fenv.h: No such file or directory
>> make[2]: *** [decExcept.o] Error 1
>> make[2]: Leaving directory
>> `/home/peko/source/buildroot/toolchain_build_powerpc/gcc-4.3.1-initial/powe
>>rpc-linux-uclibc/libgcc' make[1]: *** [all-target-libgcc] Error 2
>> make[1]: Leaving directory
>> `/home/peko/source/buildroot/toolchain_build_powerpc/gcc-4.3.1-initial'
>
>That's it. I retried right now and got same issue with a defconfig (except 
>arch + gcc switch):
>
>ld_powerpc/gcc-4.3.1/libgcc -I/buildd/build-area/toolchain/buildroot-chrp32/toolchain_build_powerpc/gcc-4.3.1/libgcc/. -I/buildd/build-area/toolchain/buildroot-chrp32/toolchain_build_powerpc/gcc-4.3.1/libgcc/../gcc -I/buildd/build-area/toolchain/buildroot-chrp32/toolchain_build_powerpc/gcc-4.3.1/libgcc/../include -I/buildd/build-area/toolchain/buildroot-chrp32/toolchain_build_powerpc/gcc-4.3.1/libgcc/../libdecnumber/dpd -I/buildd/build-area/toolchain/buildroot-chrp32/toolchain_build_powerpc/gcc-4.3.1/libgcc/../libdecnumber -I../../libdecnumber -DHAVE_CC_TLS -o 
>decExcept.o-MT decExcept.o -MD -MP -MF 
>decExcept.dep -c /buildd/build-area/toolchain/buildroot-chrp32/toolchain_build_powerpc/gcc-4.3.1/libgcc/../libdecnumber/decExcept.c
>/buildd/build-area/toolchain/buildroot-chrp32/toolchain_build_powerpc/gcc-4.3.1/libgcc/../libdecnumber/decExcept.c:30:18: 
>error: fenv.h: No such file or directory

so why don't you just disable it?
I've only added fexcept*() for my personal use on i386, no other arch
has it, currently. This is expected behaviour.
