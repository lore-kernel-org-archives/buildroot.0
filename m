From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Mar 2008 10:30:33 +0100
Subject: [Buildroot] avr32 patches vs. x86 breakage
In-Reply-To: <1206090774.2562.82.camel@nigel-x60> (Nigel Kukard's message of
	"Fri\, 21 Mar 2008 09\:12\:54 +0000")
References: <1206079232.2562.60.camel@nigel-x60>
	<87k5jw34gp.fsf@macbook.be.48ers.dk> <20080321085200.GB8894@mx.loc>
	<1206090774.2562.82.camel@nigel-x60>
Message-ID: <874pb01l1i.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nigel" == Nigel Kukard <nkukard@lbsd.net> writes:

Hi,

 >> They should fix their arch and you should not add kludge to work around
 >> such bugs, imo.

 Nigel> In an ideal situation yes .... but buildroot is an opensource
 Nigel> project with no time constraints imposed on its contributors.

But that doesn't mean that contributors don't care.

 Nigel> If I contributed a patch to add an arch to GCC, and it broke 2
 Nigel> months down the line when people began to use it, are you just
 Nigel> going to remove it out of buildroot until it gets fixed? What
 Nigel> happens if it broke support for everything except its own
 Nigel> arch?  What happens if there were thousands of users of it,
 Nigel> more than any other arch?

If you would not be ready to support your work and no one else would
step up to do it (or if I could/would myself) - Then yes. No one gains
by stuff just sitting in the tree bitrotting.

 Nigel> In this case its the AVR32 support which breaks x86 .... I'm sure there
 Nigel> are more users of AVR32 than x86. 1) its impractical to remove AVR32
 Nigel> support until its fixed, we don't know how long it will take  2) its
 Nigel> senseless to drop support for x86 because an AVR32 patch breaks it.

 Nigel> People new to buildroot trying it out don't want to scrape
 Nigel> through years of mailing lists to try find these few mails
 Nigel> about everything building fine on x86, then WHAM BAM
 Nigel> .... corruption in the weirdest ways in the generated
 Nigel> images. It puts people off and they get the first impression
 Nigel> that buildroot doesn't work ... something I've seen happen
 Nigel> ALOT!

True. Keeping a metadist like buildroot working for all archs and
combinations of packages is HARD.

 Nigel> Only alternative I can see is adding kludge to work around
 Nigel> horribly broken patches until someone fixes them or no one
 Nigel> bitches and they are removed like 6-12 months later. This way
 Nigel> everything works out of the box.

The problem is that noone would ever fix the real issues behind those
kludges.

 Nigel> The proposed kludge isn't too bad either, its merely splitting
 Nigel> the patches up into different dirs. I am willing to spin a set
 Nigel> of patches to implement these changes.

Ok, I would like to hear from John first if he's going to fix the
atmel patch.

-- 
Bye, Peter Korsgaard
