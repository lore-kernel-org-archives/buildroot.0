From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Aug 2012 21:40:09 +0200
Subject: [Buildroot] trouble running an ARM uImage
In-Reply-To: <CALo-6+gUf2nptY=7yaUVa_0hgF0aniLg9gV5Ai35b9P0UkXzZQ@mail.gmail.com>
References: <CALo-6+gUf2nptY=7yaUVa_0hgF0aniLg9gV5Ai35b9P0UkXzZQ@mail.gmail.com>
Message-ID: <20120802214009.7edeb432@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 2 Aug 2012 11:28:33 -0700,
Charles Krinke <charles.krinke@gmail.com> a ?crit :

> I am having trouble running a Linux kernel built with several
> toolchains with my AM3517 project. The only one that seems to work
> correctly is the external installation of CodeSourcery's 2010.09.
> 
> A uImage built with the toolchain inside buildroot, selecting 2011.09
> or 2012.03 gives me what appears to be a proper uImage, and u-boot

We don't have a CodeSourcery 2012.03 toolchain supported in Buildroot
for ARM, as far as I know.

> loads it, but it doesnt run. It just stops in u-boot after the message
> "Uncompressing Linux... done, booting the kernel.".
> 
> I have ensured the mkimage I am using comes from /tools in u-boot. As
> I recall, only 3 things are necessary to build a uImage. 1) ARCH 2)
> CROSS_COMPILE & 3) mkimage.
> 
> My experience is that the linux kernel is very insensitive to
> toolchains, that is, any old arm toolchain should work fine.
> 
> Am I caught up in gnu versus eabi? What other things can I check to
> figure out how to move forward?

Please enable CONFIG_EARLYPRINTK in your kernel configuration, and pass
"earlyprintk" to the kernel command line.

Are you sure you have the same kernel configuration in all your tests?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
