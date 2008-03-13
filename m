From: Mark Jackson <mpfj@mimc.co.uk>
Date: Thu, 13 Mar 2008 13:19:03 +0000
Subject: [Buildroot] rcS segfault
Message-ID: <47D929C7.9010706@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm running the Atmel ATSTK1000 AVR32 dev kit.

I have checked out the latest buildroot, and done a ...

# make atstk1002_defconfig
# make

All the packages and the kernel compile okay.

But when I boot the dev kit, I get the following error:-

rcS[186]: segfault at 7f89c000 pc 2ab13878 sp 7f89ab54 ecr 24
Can't open /dev/ttyS0: No such file or directory
Can't open /dev/ttyS0: No such file or directory
...

The uarts appear to have been created okay ...

atmel_usart.0: ttyS0 at MMIO 0xffe01000 (irq = 7) is a ATMEL_SERIAL
atmel_usart.2: ttyS2 at MMIO 0xffe01800 (irq = 9) is a ATMEL_SERIAL

Can anyone shed some light on what might be going on with the rcS script ?

Regards
Mark
