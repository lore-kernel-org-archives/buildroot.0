From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 29 Jan 2009 15:33:21 +0100
Subject: [Buildroot] target/device/Atmel kernel patches
References: <87ab9d4w6j.fsf@macbook.be.48ers.dk><1233005366.2298.118.camel@elrond.atmel.com><871vup4ul9.fsf@macbook.be.48ers.dk><1233008389.2298.129.camel@elrond.atmel.com>
	<87vds114op.fsf@macbook.be.48ers.dk>
Message-ID: <FE6DCE243B7A4724B6B33E85771AD61F@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
>
> Hi.
>
> Ulf> No, Just because you like to run with the latest kernel,
> Ulf> that view is not shared by everyone else.
> >>
> >> Ok, so what patches can be removed? I take it that atleast *SOME* of
> >> those 10 versions can go?
>
> Ulf> I have customers still working on 2.6.22 ...
>
> Working as in doing active development? Really?

Yes,
I have about 250 ARM9 customers, and I would say
that it normally takes 18-24 months from the decision to goahead
to the first release of a product.
This is for people switching to Linux from another platform.

People working on multiple products, with previous experience
of Linux on AT91 will have shorter time for new products.

The first release of the product does not mean it enters mainteance mode.
There is further active developement after the first release to add feature.

At one point in development, there is a decision to freeze kernel version
and any errors found will be handled by patching that kernel version,
sometimes backpatching from newer kernels.

Once that point is reached, then it becomes a very serious decision
to move to a new kernel.

One of our key customer is working on a major release
using the 2.4.x kernel version they selected in 2004.

Your approach, will automatically disqualify the use of Buildroot
for any customers following normal behaviour.

I have met two customers using buildroot this week,
and they point out that the only use they find for buildroot
is as a way to get the latest patches/build recipes, and they cannot
do anything useful with buildroot itself due to its higly volatile nature.
They need stability, and they do not want to make their own decisions.

>
> Ulf> I think you need to understand that some people
> Ulf> are planning for 10-15 year lifetime of products.
> Ulf> They do not neccessarily update the kernel very often.
> Ulf> If they do, they are likely to juyst add tweaks to
> Ulf> their kernel instead of upgrading to a new version.
>
> I work at a company developing display technology for the military
> market, so you don't need to tell me about long term support ;)
>
> But the problem is that you are mixing up configuration control of a
> project, and development of buildroot. When you do a project you
> ofcourse need to get your individual components under configuration
> and be able to reproduce your build if you ever need to fix
> something. This ALSO includes buildroot version.
>
> Completely next to that is the state of buildroot svn. This has to be
> suitable for starting new projects off, so it needs recent versions of
> packages with the latest bugfixes included.
>
> For starting a new project, selecting anything else than the 2.6.28
> (or even better, the latest 2.6.29-rcX) seems pretty silly to me, but
> I'm even stretching it to include 2.6.27 just in case.

I was told some time ago, that the latest version of Xenomai for ARM only
runs on 2.6.26 kernels.
I do not know if this has changed, but there are drawbacks on beeing too
hasty.

If you continue your thinking, then you will soon delete 2.6.27 and then
2.6.28 etc.
making this something you can use for evalution but nothing more.
The user interface for building linux is clean and simple
and I think that people using old kernels, know how to come around
any difficulty they will stumble upon and can handle that with
custom patches, without the main buildroot team beeing involved.

>
> So again, what kernel versions in arch-arm can we remove from svn?
>

If we want to cover 95% of the cases, we need to keep kernel versions which
are minium 2 years or younger, but 3 years is desirable.

> Ulf> If you implement the patch downloading, there is
> Ulf> very little reason to remove functionality.
>
> Of course there is, otherwise the number of configuration combinations
> to test would grow astronomically.
>

No, because the kernel is orthogonal to the file system,
I see that we need to test kernels when they are are released
and then the kernels should be frozen.

I do not remember anyone complaining about not beeing able
to compile an old kernel, and then the failure was in the build.

If someone complains, then they will be told to upgrade anyway.

> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


Best Regards
Ulf Samuelsson
