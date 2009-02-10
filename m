From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 10 Feb 2009 14:50:49 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com><873aeue676.fsf@macbook.be.48ers.dk><1233865432.4148.6.camel@elrond.atmel.com><87eiycarei.fsf@macbook.be.48ers.dk><D071C392448744ECA7A451C54A46ABE6@aeglos><d6cda7730902060631o54f2944rddc0f7cd8278a11a@mail.gmail.com><1234200240.4143.8.camel@elrond.atmel.com><87hc3376b4.fsf@macbook.be.48ers.dk><1234219930.4143.16.camel@elrond.atmel.com><874oz27iry.fsf@macbook.be.48ers.dk><078a01c98b68$c18b47c0$f53018ac@Glamdring>
	<87ab8u5ub5.fsf@macbook.be.48ers.dk>
Message-ID: <083a01c98b86$99d10260$f53018ac@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
> >> See, that's the problem about adding feature patches to BR. Don't
> >> expect other developers to spend time on fixing those things up.
> 
> Ulf> I think you want people to discuss things before committing.
> 
> Sure.
> 
> Ulf> Yet, this patch was committed before an agreement was made.
> Ulf> THAT is the problem.
> 
> That's part of the problem. I mentioned some of the other issues in my
> earlier mail. The reason for the change was the hardcoded (and imho
> odd) naming convention. I explicitly asked Thiago to commit soon so we
> could get it in the release. It's ofcourse unfortunate that FOSDEM got
> in between and that you have special at91 specific magic in the tree
> which got broken.
> 
> >> Sure, we should try to make sure everything still works, but we also
> >> HAVE to make it easy to do so - That means among others that the
> >> various platforms should behave similary.
> >> 
> 
> Ulf> Each platform in u-boot behaves differently anyway.
> Ulf> You define the functionality of u-boot in the board header file.
> 
> Sure, that's why the only sane default is to use the filenames the
> upstream projects use as that's what people expect.
> 
> This doesn't mean that we shouldn't provide a setting (like the
> suffix/prefix thing) to use other names if people want that, but it
> shouldn't be default.


The default IS to use the filenames the upstream projects use.
You get that by selecting the standard build.
When you select an "advanced" configuration, you should
expect things to be a little different, don't you agree?

There is a setting to generate the u-boot autoscript.
If you use that, you really want the stuff to be compatible
with the u-boot patches.
I am OK with using that to set the default filename to 
the previous "complex" file name, and let the
normal #Image possibly with PREFIX/SUFFIX
be the default otherwise.

The patches for U-boot are generic and coould be applied
for any architecture.

The problem I am trying to solve is with newbies calling in 
wanting help with the configuration of u-boot.
That can be done with a short email instead of 30-60
minutes conversation, with this fully working.


> 
> -- 
> Bye, Peter Korsgaard
>



Best Regards
Ulf Samuelsson
