From: suffecool at comcast.net <suffecool@comcast.net>
Date: Thu, 30 Oct 2008 19:36:23 +0000
Subject: [Buildroot] AT91SAM9G20 support?
Message-ID: <103020081936.29280.490A0CB70005979E0000726022007504380401010C0A00009A9C@comcast.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yeah, that's what I am discovering.  I am now looking at various kernel releases to see if and when 9G20 support was added (if at all).

Google searching found this link:
http://lkml.org/lkml/2008/6/13/62

where it appears that somebody back in June 2008 did a lot of work patching the kernel to get the 9G20 to be supported.  I'm downloading the 2.6.27 kernel now to see if it was added  into that one.

--kev

-------------- Original message -------------- 
From: "hartleys" <hartleys@visionengravers.com> 

> On Thursday, October 30, 2008 11:51 AM, suffecool at comcast.net wrote: 
> > Hello, 
> > 
> > Line 69 of target/device/Atmel/AT91_Config.in states that 
> > "Atmel AT91SAM9G20 ARM based systems" are not yet implemented. 
> > 
> > How difficult is this to do? I am willing to give it a shot 
> > if it simply involves creating/tweaking some configuration files. 
> > We were using the 9260 dev board, but have recently switched to 
> > the newer 9G20 board. However, when we push our 9260 kernel to 
> > the board and boot it with a 9G20-knowledgeable u-boot, it balks 
> > after uncompressing the kernel image with the following error: 
> > 
> > Uncompressing Linux......................done, booting the kernel. 
> > Error: unrecognized/unsupported machine ID (r1 = 0x00000658) 
> > Available machine support: 
> > ID (hex) NAME 
> > 0000044b Atmel AT91SAM9260-EK 
> > Please check your kernel config and/or bootloader. 
> > 
> > I initially thought this was a u-boot issue, but now I think it's 
> > just that buildroot does not yet know about 9G20 dev boards. 
> > 
> > Any direction/assistance would be appreciated. 
> 
> It appears the problem is actually in your kernel. 
> 
> U-boot passed a machine ID of (r1 = 0x00000658), which according to 
> arch/arm/tools/mach-types is: 
> 
> at91sam9g20ek MACH_AT91SAM9G20EK AT91SAM9G20EK 
> 1624 
> 
> But the linux kernel you are trying to bring up says that the only 
> machine supported is: 
> 
> Available machine support: 
> ID (hex) NAME 
> 0000044b Atmel AT91SAM9260-EK 
> 
> From arch/arm/tools/mach-types: 
> 
> at91sam9260ek MACH_AT91SAM9260EK AT91SAM9260EK 
> 1099 
> 
> It appears you have the 9G20 suppost in u-boot but still have a kernel 
> for the 9260. 
> 
> Hartley 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081030/0f11d448/attachment.htm 
