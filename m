From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 30 Jan 2009 18:49:28 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot:	target/device/Atmel/arch-avr32/kernel-pa etc...
In-Reply-To: <20090130100919.5b8c93ba@hcegtvedt>
References: <20090130085310.9730F765E9@busybox.osuosl.org>
	<87zlh9np10.fsf@macbook.be.48ers.dk>
	<20090130100919.5b8c93ba@hcegtvedt>
Message-ID: <1233337768.4147.93.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2009-01-30 klockan 10:09 +0100 skrev Hans-Christian Egtvedt:
> On Fri, 30 Jan 2009 10:04:11 +0100
> Peter Korsgaard <jacmet@uclibc.org> wrote:
> 
> > >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> > 
> 
> <snipp>
> 
> >  ulf> Added:
> >  ulf>    trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-100-avr32.patch
> > 
> > What does this do to the headers?
> > 
> 
> I think this might have some fixes in arch/avr32/include which uClibc
> needs.
> 
> >  ulf>    trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-201-avr32-atmel_mpopfb-disable-debug.patch
> > 
> > That seems completely unrelated to kernel headers.
> > 
> 
> Yes it is.
> 
> >  ulf>    trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-202-avr32-atmel_mpopfb-add-signal-to-disable-line-caching.patch
> > 
> > This one as well.
> > 
> 
> Yes it is.
> 
> >  ulf>    trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-203-avr32-fix-arch-header-byteorder.patch
> > 
> > OK.
> > 
> 
> Vital for uClibc to build.
> 
> >  ulf>    trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-204-avr32-ap700x-fix-det_pin-for-nand-flash.patch
> > 
> > That also seems unrelated.
> > 
> 
> Yes it is.
> 


HC has all these patches in the kernel-headers directory in his tree.
I thought initially that was a little risky.

I therefore tried putting them in the avr32 specific parts, 
but I have seen strange effects on some packages.
That is why I tried this approach.

Have read a little bit more on the kernel-headers, 
and it appears that I can keep the stuff in the
AVR32 parts and then define 

KERNEL_HEADERS_PATCH_DIR=target/device/Atmel/arch-avr32/2.6.[27.6|28.2]

for AVR32 targets.

Does that make sense?


BR
Ulf Samuelsson
