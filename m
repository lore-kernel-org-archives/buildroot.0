From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 14 Oct 2007 01:31:51 +0200 (CEST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <1192307460.26495.27.camel@elrond.atmel.sweden>
References: <20071012210141.1DF69A5E1B@busybox.net>
	<0710131046500.9729@somehost>
	<1192269439.26495.4.camel@elrond.atmel.sweden>
	<0710131212520.9729@somehost>
	<1192300638.26495.13.camel@elrond.atmel.sweden>
	<0710132115250.9729@somehost>
	<1192307460.26495.27.camel@elrond.atmel.sweden>
Message-ID: <0710132305350.9729@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 13 Oct 2007, Ulf Samuelsson wrote:

> The guys at Atmel do the gcc ports for AVR32.

I see.

> I am trying to make it easier for other people to build it.

That's nice of you.

> This change does not break any other arch.

Fair enough.  You may be right.

> It used to be "-cp", and the change to "cp" broke the AVR32 arch.

Alright.  Why don't you then make that '-cp' conditional on AVR32 and
leave it 'cp' for all other?  In a way that would help identify oddities
with AVR32 everywhere.  One size fits all is quite hard to find.

> > But doesn't that mean that the AVR32 tool is broken?
> > What am I missing here?
>
> Yes and No.

I was expecting that ;)

> By reverting the patch, which broke the AVR32 build,
> it is possible to create an AVR32 gcc compiler which
> uses an non-shared libgcc.a to create a uClibc based root gfs.

Thanks for the explanation.

> Can you explain why all other archs are broken?

I'm afraid I can't.  And I won't bother trying to. It may be unfair to
blame all buildroot brokenness on you.  Still, buildroot is broken in
various places.  One thing gets fixed and two other break.  That's my
experience of the passed weeks :(

> If the build works for all other archs, then the cp will work.

Yes, I agree.  'cp' shouldn't be a problem in this context.  Still, if for
some misterious reason it doesn't get built, '-cp' doesn't break the build
making us aware of that and things break later in other places?  Trouble
shooting that scenario will be more painful, IMO.

> You have not explained in what way you suffer.

Thanks, I got better after getting out the previous post ;)

I'll try to explain.  Every time I check out a new tree, it takes one or
several days to get it to build.  And when I think I'm done (save some
patches not yet accepted upstream), check out a new tree, apply my
patches, I start seeing things breaking again in various ways and I have
to start all over again.  And that's _very_ frustrating!

Happened again today :(

> No, I care about other archs as well, but I do not belive that they are
> broken by the patch.

Good to know.

> I regularily build ARM and i386 as well.

Care to share your i386 .config with the rest of us?

> Can you show why this breaks anything?
> Remember: It used to be this way until this summer.

You mean the 'cp' thing?  See above.

Can we try getting some stability in this project?
Can we get a 'make allconfig' that just builds?
Sooner rather than later?

ATM, I see lockfile-progs (patch available in bugtrack) and microperl
won't build.

Please find attached some patches (various fixes).


Cheers,

-- 
Cristian
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br-2007-10-14.submit.patch
Type: text/x-diff
Size: 13136 bytes
Desc: 
Url : http://busybox.net/lists/buildroot/attachments/20071014/a3b62cd5/attachment.bin 
