From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jun 2012 10:04:58 +0200
Subject: [Buildroot] Compiling grub on x86_64
In-Reply-To: <4FE81898.4020606@mind.be>
References: <4FE81898.4020606@mind.be>
Message-ID: <20120625100458.4a3e62c8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 25 Jun 2012 09:51:52 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>   I have an x86 project using and internal toolchain and grub as the boot loader.  We recently switched to x86_64 (for 
> syscall performance reasons).  Unfortunately, grub fails to even configure: the compiler can't generate executables.  
> It's missing -lgcc_s.  I guess this is because the toolchain is built without multilib support and grub uses the -m32 
> switch.
> 
>   I'm unusually stumped at this point.  Building a toolchain with multilib support seems the easy way out, but that's a 
> bit heavy just to be able to compile grub.  A 64-bit build of grub will probably not work because BIOSes don't 
> understand 64-bit.  So the best thing I can come up with is to have a separate buildroot config just to build grub.  
> Does anyone have better ideas?

No, it's a difficult problem. And the issue came up several times on
the list already. How much effort would it be to also generate a
multilib 32bits/64bits toolchain when x86_64 is used?

>   With this in mind, it's probably best to remove the BR2_x86_64 option from the grub config, or at least limit it to 
> external toolchains that may work (i.e. Sourcery).

At least for now, yes, making sure that Grub can't be selected with
internal toolchains on x86_64 seems like a good idea.

>  BTW, Thomas & Peter, am I correct in assuming that grub is not 
> included in the autobuilds?

Correct. At least here, my random builds use randpackageconfig, so only
the package choices are randomized. The kernel and bootloaders builds
are therefore never exercised at the moment. The purpose of the random
autobuilds is to find missing dependencies, issues on specific
architectures, etc.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
