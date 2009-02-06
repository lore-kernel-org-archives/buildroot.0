From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 06 Feb 2009 09:41:41 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <1233865432.4148.6.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Thu\, 05 Feb 2009 21\:23\:52 +0100")
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<873aeue676.fsf@macbook.be.48ers.dk>
	<1233865432.4148.6.camel@elrond.atmel.com>
Message-ID: <87eiycarei.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 >> To me the sane thing would just be for the files to be named whatever
 >> the kernel names them (uImage/zImage/bzImage/..), but even if we don't
 >> do that we should atleast make the 2 Linux types use the same style.

 >> We can add BR2_KERNEL_PREFIX/SUFFIX (defaulting to "") if people
 >> really to do something special.
 >> 
 >> Ulf, what do you say?
 >> 

 Ulf> I think that we should have a symbolic link to xImage as we do for
 Ulf> u-boot.bin for those that do not like the more complex filenames.
 Ulf> Then there is no need for a 

I think the suggestion to either use the rootfs suffix/prefix or
introduce a kernel version of them makes more sense than adding more
clutter with symlinks (and the potential problems they give)

 Ulf> uImage really does not give you *any* information on the contents.

Similar to rootfs.powerpc.squashfs doesn't tell you much about what
files you have in there. When people see uImage or u-boot.bin, it's
completely clear what type of image format it is, as that's what they
are used to from compiling the kernel/u-boot/whatever by hand.

 Ulf> When testing several configurations for the same kernel,
 Ulf> adding some kind of revision information is important.
 Ulf> THat is why the date is there, a little simplistic, but
 Ulf> it works for me.

That's the point I guess - It's a pretty random decission that
obviously doesn't work for others.

This unstable kernel name doesn't work very well with scripts - E.G. I
have an updatelinux script in U-Boot which downloads a fixed filename
from tftp and writes it to flash.

But sure, we can support *_SUFFIX set to $(DATE) for the people who
wants something like that.

-- 
Bye, Peter Korsgaard
