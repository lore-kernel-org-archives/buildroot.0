From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 6 Feb 2009 10:06:29 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com><873aeue676.fsf@macbook.be.48ers.dk><d6cda7730902041833r5e5af2ax26c0eebb48df19a4@mail.gmail.com><87vdrpaug2.fsf@macbook.be.48ers.dk><1233866252.4148.12.camel@elrond.atmel.com><d6cda7730902051828if9915d3u31cf79bf5a68fcac@mail.gmail.com><1233900994.26426.10.camel@elrond.atmel.com>
	<871vucar1o.fsf@macbook.be.48ers.dk>
Message-ID: <A56AD9EF90944EFB93E86E3692353870@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> ?The AT91 uboot patches and autoscripts rely on this very exact 
naming,
 Ulf> so if you commit your patch, you break the at91 support.

So they are broken for people using the simple linux build already?

==> The previous default was to use the advanced build, if my memory
        does not fail me.

        If you use a simple build then you do not get any help from the 
autoscript.

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

==> How can setting prefix/suffix retroactively help people that has 
forgotten
        to set prefix/suffix?

 >> The $(DATE) seams to be default to rootfs suffix already, all you have
 >> to do is change it per project to include the project or board name.

 Ulf> I think your major problem is that the DATE changes.
 Ulf> I think it is fair to allow DATE to be in the rootfs suffix.

Sure, setting prefix/suffix to $(DATE) should work - But it shouldn't
be default.

 Ulf> but I still think your needs are best accomodated by

 Ulf> ln -s $(LINUX_KERNEL_NAME) uImage

No, lets not add any more clutter to binaries/

==> If you do not like that solution, then letting people that
       want uImage , build the simple linux would work for me.
       But your opinion seems to be that you want to do things
       in a certain way, and you want to ensure that noone
       can do it in a different way, regardless if their use case
       is different from yours.
-- 
Bye, Peter Korsgaard


Best Regards
Ulf Samuelsson
