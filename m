From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Feb 2014 12:29:11 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140214101241.27857b9e@skate> (Thomas Petazzoni's message of
 "Fri, 14 Feb 2014 10:12:41 +0100")
References: <20140214073009.1D7E6102637@stock.ovh.net>
 <20140214101241.27857b9e@skate>
Message-ID: <87sirmlypk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> nios2 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/780c3388e408ae6479e824711b1c02fdbd34bef4/

 > No idea what this error means. Ezequiel ?

 > /home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.7.3/../../../../nios2-linux-gnu/bin/ld: /home/test/test/2/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/crt1.o: undefined reference to symbol '_gp'
 > /home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.7.3/../../../../nios2-linux-gnu/bin/ld: note: '_gp' is defined in DSO /home/test/test/2/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/libgpg-error.so.0 so try adding it to the linker command line

If I remember correctly, _gp is a magic linker symbol on mips/nios. When
we discussed it last time I brought up this link:

https://lists.debian.org/debian-mips/2013/06/msg00041.html


 >> x86_64 |               gst1-libav-1.2.2 | NOK | http://autobuild.buildroot.net/results/2d83f38b4a6cb2a1a47c78306da7773270ce698e/

 > Weird:

 > /home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-unknown-linux-uclibc/4.6.3/../../../../x86_64-unknown-linux-uclibc/bin/ld: ../../gst-libs/ext/libav/libavcodec/libavcodec.a(lpc.o): relocation R_X86_64_PC32 against symbol `ff_pd_1' can not be used when making a shared object; recompile with -fPIC

 > But the build is not a static library build.

But it uses a static (embedded) copy of libav, perhaps that one isn't
built with -fPIC?


 >> powerpc |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/b92b707ec32bf6f9a0c5834fd68d81d76d1a6365/

 > Weird messages:

 > Assembler messages:
 > Fatal error: can't create obj/esfilter.o: No such file or directory

 > Parallel build issue?

Sounds like it.


-- 
Bye, Peter Korsgaard
