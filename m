From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Sep 2010 16:15:01 +0200
Subject: [Buildroot] AVR32 kernel install bug
In-Reply-To: <op.vitc9tjfsev97k@joachim-lappis>
References: <op.vinvdkgksev97k@joachim-lappis> <20100907150948.4de996e3@surf>
	<op.vis0txzcsev97k@joachim-lappis>
	<op.vitc9tjfsev97k@joachim-lappis>
Message-ID: <20100910161501.7f692bf3@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joachim,

Thanks for all your tests!

On Fri, 10 Sep 2010 13:09:19 +0200
"Joachim Pihl" <joachim.pihl@sensordevelopments.com> wrote:

> I have found two packages to be problematic: gdb for target does not  
> compile for AVR32, gdbserver and host gdb is OK. Also, U-boot 2010.06
> does not compile (asm/unaligned.h error). 2010.03 compiles just fine.

For gdb on the target, we can probably mark it as not available on
AVR32. Having gdb on the target is not a very common need anyway. It's
on my TODO-list to upgrade the AVR32 toolchain that we have, it would
also upgrade the gcc version, but I'm not sure it's going to fix the
gdb on target problem.

Concerning U-Boot, we have a patch called:
  u-boot-2010.03-fix-avr32.patch
in boot/u-boot/, which adds an include of <asm-generic/unaligned.h>.

Maybe this patch just needs to be ported over to U-Boot 2010.06, or
even better, pushed in upstream U-Boot ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
