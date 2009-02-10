From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Feb 2009 10:17:37 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <1234219930.4143.16.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Mon\, 09 Feb 2009 23\:52\:10 +0100")
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<873aeue676.fsf@macbook.be.48ers.dk>
	<1233865432.4148.6.camel@elrond.atmel.com>
	<87eiycarei.fsf@macbook.be.48ers.dk>
	<D071C392448744ECA7A451C54A46ABE6@aeglos>
	<d6cda7730902060631o54f2944rddc0f7cd8278a11a@mail.gmail.com>
	<1234200240.4143.8.camel@elrond.atmel.com>
	<87hc3376b4.fsf@macbook.be.48ers.dk>
	<1234219930.4143.16.camel@elrond.atmel.com>
Message-ID: <874oz27iry.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> Why? It looks like it uses LINUX26_KERNEL_NAME.
 >> 

 Ulf> They work with the patches to u-boot which assumes
 Ulf> that the name look like they used to.
 Ulf> If the new naming remains, who is going to fix the u-boot patches?

See, that's the problem about adding feature patches to BR. Don't
expect other developers to spend time on fixing those things up.

 Ulf> AGAIN: How can you RETROACTIVELY set _SUFFIX/_PREFIX
 Ulf> if you forgot to set _SUFFIX/_PREFIX and thus
 Ulf> overwrote another project.

Another project would have another BR2_PROJECT setting, and hence use
another directory, right? That was the idea behind the project thing,
wasn't it?

 Ulf> Which again means fixing u-boot patches.
 Ulf> Who is going to do that
 Ulf> You suggested previously that the person breaking the build
 Ulf> needs to fix it.
 Ulf> Does that still apply?

For bugfixes yes, but for feature patches for some kind of hardware
the developer might not have access to - No.

Sure, we should try to make sure everything still works, but we also
HAVE to make it easy to do so - That means among others that the
various platforms should behave similary.

-- 
Bye, Peter Korsgaard
