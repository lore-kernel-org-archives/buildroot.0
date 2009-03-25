From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 25 Mar 2009 18:14:05 -0400
Subject: [Buildroot] External toolchain
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909014E2516@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

This might not be the correct list to ask this on but I'll try anyway..

I have been using Buildroot with an external toolchain provided by
Cirrus Logic for an ARM ep93xx based board. This toolchain has worked
fine ever since I started using it.

$ arm-linux-gcc --version
arm-linux-gcc (GCC) 4.1.1
Copyright (C) 2006 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is
NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.

I just grabbed the latest 2.6.29 kernel and it appears the 4.1.1
compiler is not compatible, this is in include/linux/compiler-gcc4.h:

/* GCC 4.1.[01] miscompiles __weak */
#if __GNUC_MINOR__ == 1 && __GNUC_PATCHLEVEL__ <= 1
# error Your version of gcc miscompiles the __weak directive
#endif

Ok.. Fine... I needed/wanted to switch to a newer toolchain for
sometime. On recommendation from another ep93xx user I downloaded the
Code Sourcery G++ 207q3-51 toolchain.

$ arm-none-linux-gnueabi-gcc --version
arm-none-linux-gnueabi-gcc (CodeSourcery Sourcery G++ Lite 2007q3-51)
4.2.1
Copyright (C) 2007 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is
NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.

Now I have a problem I can't figure out.

I can get Buildroot to use the Code Sourcery toolchain and it compiles
the 2.6.29 kernel fine. But, when I try to boot the kernel it just hangs
after the "Uncompressing Linux.... done, booting the kernel." step.

I went back to kernel 2.6.28.8 and tried it with the Code Sourcery
toolchain, same results. But, if I switch back to the Cirrus 4.1.1
toolchain the kernel boots fine.

Am I just missing something? Any help would be appreciated.

Thanks,
Hartley
