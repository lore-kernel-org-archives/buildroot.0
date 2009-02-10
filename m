From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Feb 2009 10:28:35 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <013101c98b56$14a0a350$f53018ac@Glamdring> (Ulf Samuelsson's
	message of "Tue\, 10 Feb 2009 09\:02\:44 +0100")
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<873aeue676.fsf@macbook.be.48ers.dk>
	<1233865432.4148.6.camel@elrond.atmel.com>
	<87eiycarei.fsf@macbook.be.48ers.dk>
	<D071C392448744ECA7A451C54A46ABE6@aeglos>
	<d6cda7730902060631o54f2944rddc0f7cd8278a11a@mail.gmail.com>
	<1234200240.4143.8.camel@elrond.atmel.com>
	<87hc3376b4.fsf@macbook.be.48ers.dk>
	<1234219930.4143.16.camel@elrond.atmel.com>
	<d6cda7730902091725o4f4adce7iddd0676ae1684a25@mail.gmail.com>
	<013101c98b56$14a0a350$f53018ac@Glamdring>
Message-ID: <87zlgu63p8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> I don't see anywhere where the kernel name is referenced in u-boot
 Ulf> except for the generation of the script, which I fixed. Looks like
 Ulf> Peter is also unable to guess what you are talking about. Perhaps you
 Ulf> might care to enlighten us.

 Ulf> ==> Look at the u.-boot patches in device/Atmel/arch-arm/

Ulf, see again why hiding that kind of "magic" under target/device is
bad? If things break for specific platforms because they have feature
patches hidden away under target/device then I think it's pretty
unrealistic for other developers to fix it.

 Ulf> ==> I designed the advanced linux configuration to tightly fit
 Ulf> together with u-boot
 Ulf>        to mimize the hassle of getting the board up and running.
 Ulf>        You can always build the classic linux configuration
 Ulf> target/linux/Makefile.in",
 Ulf>        so unless you are prepared to go the whole way, why meddle?

So maybe the problems we're seing is in that design? I don't use the
linux-advanced stuff, but my feeling is that there's too much "magic"
going around here, and that things are too specialized.

But that's a discussion for another day.

 Ulf>        Peter has said on other occasions: "fix the problem you
 Ulf> created, or revert the patch".

And I agree with that, but it's ofcourse not black/white. What I mean
is that if you make changes, then you need to work with the other
developers to help fix up stuff and/or change it so stuff doesn't
break.

In other words, try to think bigger than just your specific platform.

-- 
Bye, Peter Korsgaard
