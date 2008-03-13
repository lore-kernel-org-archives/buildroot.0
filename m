From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 13 Mar 2008 14:58:50 +0100
Subject: [Buildroot] rcS segfault
In-Reply-To: <47D929C7.9010706@mimc.co.uk>
References: <47D929C7.9010706@mimc.co.uk>
Message-ID: <1205416731.8626.17.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2008-03-13 at 13:19 +0000, Mark Jackson wrote:
> I'm running the Atmel ATSTK1000 AVR32 dev kit.
> 
> I have checked out the latest buildroot, and done a ...
> 
> # make atstk1002_defconfig
> # make
> 
> All the packages and the kernel compile okay.
> 
> But when I boot the dev kit, I get the following error:-
> 
> rcS[186]: segfault at 7f89c000 pc 2ab13878 sp 7f89ab54 ecr 24

This is because of one of the bash patches, remove the bash32-011 patch.
You will need to update bash32-012 patch to reflect that.

It might be related to a bug in GCC, I do not recall exactly now.

> Can't open /dev/ttyS0: No such file or directory
> Can't open /dev/ttyS0: No such file or directory
> ...
> 
> The uarts appear to have been created okay ...
> 
> atmel_usart.0: ttyS0 at MMIO 0xffe01000 (irq = 7) is a ATMEL_SERIAL
> atmel_usart.2: ttyS2 at MMIO 0xffe01800 (irq = 9) is a ATMEL_SERIAL
> 
> Can anyone shed some light on what might be going on with the rcS script ?
>

See above :)

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
