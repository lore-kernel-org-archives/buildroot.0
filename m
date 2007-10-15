From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 15 Oct 2007 21:27:16 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
References: <0710132305350.9729@somehost><016c01c80ef8$e931c350$9900a8c0@atmel.com><0710151840550.11188@somehost>
	<20071015185501.GO20951@aon.at>
Message-ID: <016201c80f61$b81c0eb0$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

link: www.avrfreaks.net
----- Original Message ----- 
From: "Bernhard Fischer" <rep.dot.nop@gmail.com>
To: <buildroot@uclibc.org>
Sent: Monday, October 15, 2007 8:55 PM
Subject: Re: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc


> On Mon, Oct 15, 2007 at 07:40:05PM +0200, Cristian Ionescu-Idbohrn wrote:
>
>>> However, Bernhard has a policy which is to always use the latest stuff,
>>> which makes IMHO Buildroot, nothing more than a (nice) toy.
>>
>>I don't see very much wrong with that, as long as you keep things tight.
>>Branching was suggested more than once.  What do you say?  More work?
>>Yes.  More satisfied "customers"?  Oh, yes.  Me for one.  I would rather
>>use something that is controllable (mind you, not top of the notch) than
>>something that is constantly broken.
>
> Well top notch would be always pulling the upstream repos. I don't
> remember to have done this even a single time in buildroot.
> There is a subtile difference between these three:
> - top notch
> - current, stable release, usually containing the best-fit bugfixes
> - outdated packages with known bugs (sometimes all over the place).
>
> I'm sure there is endless discussion archived out there about the pros
> and cons of each of them, so i'll spare my keyboard interrupts and your
> time.


I think the most important thing is to allow the user of buildroot
to make his/her own decision on strategy.
It should be possible to use a specific version of a package
but also to use the latests experimental version for other packages
possbily with own developed patches. (which hopefully are submitted later)

For this to work, there is a need for a stable source tarball server
which can be used, if the main location disappears.

I rather see multiple makefile fragments, than multiple trunks.

instead of

include package/*/*.mk

we could have

include    project/.distribution        # Override release versions
include    package/*/*.mk



<package>.mk could contain
+++++++++++++++++++++
ifneq ($(<PACKAGE>_RELEASE),)
include    <package>/$(<PACKAGE>_RELEASE)/<package>.mk
else
include    <package>/$(RELEASE)/<package>.mk
endif
--------------------------------

or similar.

This would allow some people to keep an old release and others
to work on new stuff.

It may be a good idea to allow patches to be applied based on a list
instead its name.

Best Regards
Ulf Samuelsson?
