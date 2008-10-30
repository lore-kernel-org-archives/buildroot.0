From: hartleys <hartleys@visionengravers.com>
Date: Thu, 30 Oct 2008 15:27:44 -0400
Subject: [Buildroot] AT91SAM9G20 support?
In-Reply-To: <103020081851.6417.490A022A000046150000191122070209530401010C0A00009A9C@comcast.net>
References: <103020081851.6417.490A022A000046150000191122070209530401010C0A00009A9C@comcast.net>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909C28DDE@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, October 30, 2008 11:51 AM, suffecool at comcast.net wrote:
> Hello,
>  
> Line 69 of target/device/Atmel/AT91_Config.in states that
> "Atmel AT91SAM9G20 ARM based systems" are not yet implemented.
> 
> How difficult is this to do?  I am willing to give it a shot
> if it simply involves creating/tweaking some configuration files.
> We were using the 9260 dev board, but have recently switched to
> the newer 9G20 board.  However, when we push our 9260 kernel to
> the board and boot it with a 9G20-knowledgeable u-boot, it balks
> after uncompressing the kernel image with the following error:
> 
> Uncompressing Linux......................done, booting the kernel.
> Error: unrecognized/unsupported machine ID (r1 = 0x00000658)
> Available machine support:
> ID (hex)     NAME
> 0000044b  Atmel AT91SAM9260-EK
> Please check your kernel config and/or bootloader.
> 
> I initially thought this was a u-boot issue, but now I think it's
> just that buildroot does not yet know about 9G20 dev boards.
> 
> Any direction/assistance would be appreciated.

It appears the problem is actually in your kernel.

U-boot passed a machine ID of (r1 = 0x00000658), which according to
arch/arm/tools/mach-types is:

at91sam9g20ek		MACH_AT91SAM9G20EK	AT91SAM9G20EK
1624

But the linux kernel you are trying to bring up says that the only
machine supported is:

Available machine support:
ID (hex)     NAME
0000044b  Atmel AT91SAM9260-EK
