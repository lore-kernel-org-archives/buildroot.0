From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Nov 2018 23:06:46 +0100
Subject: [Buildroot] [PATCH 1/1] bdwgc: update bdw-gc.pc to fix link
 with guile
In-Reply-To: <20181106192735.16800-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 6 Nov 2018 20:27:34 +0100")
References: <20181106192735.16800-1-fontaine.fabrice@gmail.com>
Message-ID: <87muqka6fd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > When bdw-gc is linked with libatomic_ops, bdw-gc.pc must contain the
 > needed libraries (such as -latomic_ops) otherwise build of applications
 > such as guile will fail on link stage:

 > .libs/libguile_2.0_la-posix.o: In function `scm_tmpnam':
 > posix.c:(.text+0x2080): warning: the use of `tmpnam' is dangerous, better use `mkstemp'
 >   CCLD     guile
 > /home/buildroot/autobuild/run/instance-2/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libgc.so: undefined reference to `AO_fetch_compare_and_swap_emulation'
 > /home/buildroot/autobuild/run/instance-2/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libgc.so: undefined reference to `AO_store_full_emulation'

 > So set ATOMIC_OPS_LIBS to -latomic_ops when a system atomic_ops library
 > is used and use ATOMIC_OPS_LIBS in bdw-gc.pc.in

 > Fixes:
 >  - http://autobuild.buildroot.org/results/2b23d445e57a5e0f417f5cb9417b0a668bb7bf1c

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
