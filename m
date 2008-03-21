From: Nigel Kukard <nkukard@lbsd.net>
Date: Fri, 21 Mar 2008 09:12:54 +0000
Subject: [Buildroot] avr32 patches vs. x86 breakage
In-Reply-To: <20080321085200.GB8894@mx.loc>
References: <1206079232.2562.60.camel@nigel-x60>
	<87k5jw34gp.fsf@macbook.be.48ers.dk>  <20080321085200.GB8894@mx.loc>
Message-ID: <1206090774.2562.82.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernhard,

> >The real problem is that apparent quality issues of some of the arch
> >specific patches.
> 
> They should fix their arch and you should not add kludge to work around
> such bugs, imo.

In an ideal situation yes .... but buildroot is an opensource project
with no time constraints imposed on its contributors.

If I contributed a patch to add an arch to GCC, and it broke 2 months
down the line when people began to use it, are you just going to remove
it out of buildroot until it gets fixed? What happens if it broke
support for everything except its own arch?  What happens if there were
thousands of users of it, more than any other arch?

In this case its the AVR32 support which breaks x86 .... I'm sure there
are more users of AVR32 than x86. 1) its impractical to remove AVR32
support until its fixed, we don't know how long it will take  2) its
senseless to drop support for x86 because an AVR32 patch breaks it.

People new to buildroot trying it out don't want to scrape through years
of mailing lists to try find these few mails about everything building
fine on x86, then WHAM BAM .... corruption in the weirdest ways in the
generated images. It puts people off and they get the first impression
that buildroot doesn't work ... something I've seen happen ALOT!

Only alternative I can see is adding kludge to work around horribly
broken patches until someone fixes them or no one bitches and they are
removed like 6-12 months later. This way everything works out of the
box.

The proposed kludge isn't too bad either, its merely splitting the
patches up into different dirs. I am willing to spin a set of patches to
implement these changes.

-N


-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080321/4bc080ca/attachment.pgp 
