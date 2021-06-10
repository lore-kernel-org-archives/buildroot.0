From: David Laight <David.Laight@ACULAB.COM>
Date: Thu, 10 Jun 2021 15:32:51 +0000
Subject: [Buildroot] [git commit branch/2021.02.x] Config.in: disable
 PIC/PIE for Nios2
In-Reply-To: <87mtrxkbdy.fsf@dell.be.48ers.dk>
References: <20210610075846.7C12686F32@busybox.osuosl.org>
 <c01bf1d9ae8f40dd93b68a6d22c41103@AcuMS.aculab.com>
 <87mtrxkbdy.fsf@dell.be.48ers.dk>
Message-ID: <35e591b01b1b4b9d8d804b37d143d139@AcuMS.aculab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Korsgaard
> Sent: 10 June 2021 16:06
> 
> >>>>> "David" == David Laight <David.Laight@ACULAB.COM> writes:
> 
> Hi,
> 
>  >> Recently in Buildroot the option BR2_PIC_PIE has been enabled by default along
>  >> with other hardening features [1]. Since then the nios2 defconfig
>  >> qemu_nios2_10m50_defconfig is failing to boot due to a segfault in init program:
> 
>  > You probably just don't want to enable PIE for nios2 at all.
> 
> Notice that this commit was about disallowing PIE for nios2.

Indeed, but maybe you want a stronger note that you really
don't want any of the 'hardening' features on such a slow processor.

...
> Yes, I also cannot recommend people using nios2 (or microblaze for that
> matter) for Linux systems.

Never mind Linux, I don't think I'd even run VxWorks.
We have about 4 instructions to set up %sp and then jump
straight to the C code loop.
No os, no libc, no nothing, just a code loop.

The one that does 64 channels of 64k hdlc (for SS7) running
at 62.5MHz doesn't ever write to the stack.
I did 'cheat', there are some custom instructions for the
bitstuffing and abort/flag detection.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
