From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Sep 2010 15:09:48 +0200
Subject: [Buildroot] AVR32 kernel install bug
In-Reply-To: <op.vinvdkgksev97k@joachim-lappis>
References: <op.vinvdkgksev97k@joachim-lappis>
Message-ID: <20100907150948.4de996e3@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 07 Sep 2010 13:54:46 +0200
"Joachim Pihl" <joachim.pihl@sensordevelopments.com> wrote:

> Trying to build defconfig for ATNGW100 AVR32 card, and having this
> problem (after moving to uClibc 0.9.30 to avoid asm/unaligned.h
> problem):

Ah, so the toolchain didn't build with uClibc 0.9.31 ? Strange, I
thought I tested this. Will try to reproduce.

> >>>   Installing kernel
> cp  
> /home/joachim/buildroot-2010.08/output/build/linux-2.6.34.1/arch/avr32/boot/uImage  
> /home/joachim/buildroot-2010.08/output/images
> cp: cannot stat  
> `/home/joachim/buildroot-2010.08/output/build/linux-2.6.34.1/arch/avr32/boot/uImage':  
> No such file or directory
> make: ***  
> [/home/joachim/buildroot-2010.08/output/build/linux-2.6.34.1/.stamp_installed]  
> Error 1
> 
> uImage can actually be found in  
> /home/joachim/buildroot-2010.08/output/build/linux-2.6.34.1/arch/avr32/boot/images/,  
> so there seems to be a difference of opinion between two or more
> scripts here. Building on Ubuntu 10.04LTS

Thanks for the report! I've pushed an untested fix at
http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=for-2010.11/kernel-image-formats&id=4b682d0fb9c3a6276267a875a0e3bb7e0c49e91d.

It's in my kernel-image-formats branch that I will push sooner or later
to Peter.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
