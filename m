From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 06 Feb 2009 09:49:23 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <1233900994.26426.10.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Fri\, 06 Feb 2009 07\:16\:34 +0100")
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<873aeue676.fsf@macbook.be.48ers.dk>
	<d6cda7730902041833r5e5af2ax26c0eebb48df19a4@mail.gmail.com>
	<87vdrpaug2.fsf@macbook.be.48ers.dk>
	<1233866252.4148.12.camel@elrond.atmel.com>
	<d6cda7730902051828if9915d3u31cf79bf5a68fcac@mail.gmail.com>
	<1233900994.26426.10.camel@elrond.atmel.com>
Message-ID: <871vucar1o.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> ?The AT91 uboot patches and autoscripts rely on this very exact naming,
 Ulf> so if you commit your patch, you break the at91 support.

So they are broken for people using the simple linux build already?

 Ulf> If you add KERNEL_VERSION to the root fs name you do things
 Ulf> automatically, if you dont then everything is manually, and you
 Ulf> have a risk of mismatch between name and actual version.  I
 Ulf> would not mind that the rootfs contains kernel version, but it
 Ulf> will break the at91 u-boot autoscripts which means that it
 Ulf> should avoided at this point, and introduced in a future
 Ulf> buildroot.

 Ulf> To avoid bugs due to people forgetting to update onfig the kernel name
 Ulf> needs to depend BOTH on PROJECT and LINUX_VERSION.

Then set prefix/suffix.

 >> The $(DATE) seams to be default to rootfs suffix already, all you have
 >> to do is change it per project to include the project or board name.

 Ulf> I think your major problem is that the DATE changes.
 Ulf> I think it is fair to allow DATE to be in the rootfs suffix.

Sure, setting prefix/suffix to $(DATE) should work - But it shouldn't
be default.

 Ulf> but I still think your needs are best accomodated by 

 Ulf> ln -s $(LINUX_KERNEL_NAME) uImage

No, lets not add any more clutter to binaries/

-- 
Bye, Peter Korsgaard
