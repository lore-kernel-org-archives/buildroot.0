From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 24 Mar 2009 09:29:42 +0100
Subject: [Buildroot] help
In-Reply-To: <33966b5d0903232133y17f08766me879b0149154b34c@mail.gmail.com>
	(mzee mzee's message of "Tue\, 24 Mar 2009 04\:33\:06 +0000")
References: <33966b5d0903230724l7508be23m9e114af609f41cb6@mail.gmail.com>
	<87iqm0l1gy.fsf@macbook.be.48ers.dk>
	<33966b5d0903232133y17f08766me879b0149154b34c@mail.gmail.com>
Message-ID: <87ab7bl3wp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "mzee" == mzee mzee <wanyumba@gmail.com> writes:

Hi,

 Peter> U-Boot seems to think you have ppc405 instead. Did you try a ppc
 Peter> compile before? Can you build u-boot by hand with the buildroot cross
 Peter> compiler? Where is your .config?

 mzee> here is my .config file
 mzee> #
 mzee> # Kernel
 mzee> #
 mzee> # BR2_KERNEL_none is not set
 mzee> BR2_KERNEL_LINUX_ADVANCED=y
 mzee> # BR2_KERNEL_LINUX is not set
 mzee> # BR2_KERNEL_HURD is not set
 mzee> BR2_PACKAGE_LINUX=y
 mzee> BR2_PACKAGE_LINUX_FORMAT="uImage"

This seems to be your problem. Change to bzImage and disable U-Boot
compilation and it should work.

I have changed the defaults in svn to use bzImage for i386/x86_64
instead of uImage.

-- 
Bye, Peter Korsgaard
