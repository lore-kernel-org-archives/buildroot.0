From: Michael S. Zick <minimod@morethan.org>
Date: Sun, 29 Nov 2009 05:23:09 -0600
Subject: [Buildroot] BB update Was:  Build jobbing
In-Reply-To: <200911290453.34368.minimod@morethan.org>
References: <200911271522.58858.minimod@morethan.org>
	<87iqct39zz.fsf@macbook.be.48ers.dk>
	<200911290453.34368.minimod@morethan.org>
Message-ID: <200911290523.11206.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun November 29 2009, Michael S. Zick wrote:
> 
> Between the configuration menu/matrix and the runtime cpuid thingy -
> I expect I can get this system to turn out something better than 1984 MIPS code.
> 

Dream on. . .

First footnote of interest found:

"Floating-point operations on very small numbers (denormalized numbers) and illegal
numbers (NaNs) must be handled by software.  Also some IEEE exceptions and exceptional
results will cause an FPU exception.  The FPU emulator is thus mandatory for full IEEE
compliance, ___even when the system has a hardware FPU___."

Emphasis added.

So we can't configure with a simple:
soft-float / hard-float configuration variable - -
the choices are: soft-float / sort-of-hard-float + a bit of help.

That will also impact that "help message" about not loading the FPU emulator into
a kernel more recent than 1997....
If your running MIPS, and your core has hardware floating point and you choose:
hard-float - - you still need the FPU emulator loaded for IEEE compliance.

Translation: the FPU emulator is not optional, you need it regardless of the 
hard-float / soft-float selection.

I guess we have to go all the way back to the uClibc question:
"does your machine have an FPU?" yes/no
to
"does your machine have an FPU?" yes/sort-of/no

Just in case I needed a reminder of why I retired from this *&^&*% twenty years ago.
As if I need another one.  ;)

Mike
