From: Joachim Pihl <joachim.pihl@sensordevelopments.com>
Date: Mon, 13 Sep 2010 07:36:09 +0200
Subject: [Buildroot] AVR32 kernel install bug
In-Reply-To: <20100910161501.7f692bf3@surf>
References: <op.vinvdkgksev97k@joachim-lappis> <20100907150948.4de996e3@surf>
	<op.vis0txzcsev97k@joachim-lappis>
	<op.vitc9tjfsev97k@joachim-lappis> <20100910161501.7f692bf3@surf>
Message-ID: <op.viyhujc1sev97k@joachim-lappis>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Sep 2010 16:15:01 +0200, Thomas Petazzoni  
<thomas.petazzoni@free-electrons.com> wrote:

> For gdb on the target, we can probably mark it as not available on
> AVR32. Having gdb on the target is not a very common need anyway. It's
> on my TODO-list to upgrade the AVR32 toolchain that we have, it would
> also upgrade the gcc version, but I'm not sure it's going to fix the
> gdb on target problem.

Try, and if it doesn't work then disable gdb on target. It's sometimes  
nice to have gdb on board (e.g. when you get access to the device through  
a firewall only), but not a must for me right now.
>
> Concerning U-Boot, we have a patch called:
>   u-boot-2010.03-fix-avr32.patch
> in boot/u-boot/, which adds an include of <asm-generic/unaligned.h>.
>
> Maybe this patch just needs to be ported over to U-Boot 2010.06, or
> even better, pushed in upstream U-Boot ?

It is unlikely to go away all by itself, so upstream is really the only  
sensible way to go. The patch is there and it works, so why not make sure  
the mainstream absorbs it?

-- 
Joachim Pihl
Development engineer
SENSOR DEVELOPMENTS AS
Tlf: +47 913 39 891
Nordre Kuller?d 21
NO-3241 Sandefjord
NORWAY
