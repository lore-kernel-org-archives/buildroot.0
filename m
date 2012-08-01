From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Aug 2012 22:43:56 +0200
Subject: [Buildroot] [PATCH 00/11] RFC: Manual content reorganization
In-Reply-To: <1332285001-12881-1-git-send-email-s.martin49@gmail.com>
References: <1332285001-12881-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20120801224356.6b0d0bd3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 21 Mar 2012 00:09:50 +0100,
Samuel MARTIN <s.martin49@gmail.com> a ?crit :

> This patch series aims to reorganize the manual content, as well as
> complete it... thought there are still lacks here and there after that ;-)
> 
> This work intends to make the manual:
> - understable and clear for new comers, even if they are not familiar with
> embedded development;
> - useful for developers, contributors, even people that may want to redistribute
> third-party SDK/BSP based on Buildroot
> - as the entry point (anyone discovering/needing/using Buildroot should find
> its way out straight forward reading the manual)

Those are good objectives that I fully agree with.

> Although I am well aware that these are ambitious goals and this patch series
> does not acheive nor address all these points, at least, it is a starting point.
> 
> Let's talk about the new organization.
> 
> Overview of the new table of content:
> 1.  About Buildroot
> 2.  Starting up
>       Think this chapter like a tutorial.
>       Includes system requirements, how to get Buildroot and the first steps
>       using it.
> 3.  Working with Buildroot
>       Intends to present basics to make Buildroot fitting your needs using
>       the available customization knobs.

Is this where we would put details like what's the difference between
the three toolchain backends? Where we would explain how Buildroot
reacts when one removes package from menuconfig and runs 'make'?

> 4.  Troubleshooting

What do you intend to put here? Our FAQ?

> 5.  Going further in Buildroot's innards
>       Explains some topics like about embedded development, cross-compilation,
>       etc, and gives more advanced tips about Buildroot usages.

I am not sure it is a good idea to mix topics not directly related to
Buildroot (embedded development, cross-compilation) with recommendation
on using Buildroot itself.

For example, is this where you would recommend to use post-build
scripts instead of custom target skeleton? How to have a custom
additional device table?

I am not sure to see clearly where's the boundary between (3) and (5).
For example, in (3) you will probably want to explain the
different /dev management mechanism, which will lead you to explain
device table concepts and so on.

> 6.  Developer Guidelines
>       Intends to provide all relevant information for anyone wanting to hack in
>       Buildroot.
> 7.  Getting involved
>       Provides all the way to keep informed about the Buildroot development.
> 8.  Contibuting to Buildroot
>       Gives tips about patch submission.

I am not sure to understand where's the boundary between 6, 7 and 8
here.

I think we also need to differentiate two developer levels maybe:

 * The new developer, which generally needs a tutorial and reference on
   how to add packages

 * The hardcore developer, for which we will maybe want to provide
   details about Buildroot internals (even though I'm not sure those
   will ever be documented).

> 9.  Legal notice
>       Intends to give legal/license details about Buildroot itself, software
>       used/built by Buildroot, how to redistribute SDK based on, etc.
> 10. Appendix


> BTW, over the last days, some other topics came out of my mind, but I have
> intentionally omitted them, letting their respective authors writing
> documentation about them. For example:
> - patches policy/howto, for which some great changes are on their way to be
> integrated;

Good point. Should be added to the "new package reference", that should
be more clearly defined above.

> - init system, maybe a paragraph about systemd (that is in the queue) and/or a
> comparative between the others available init systems could be added:
> - package's license explaination;
> - ... anything else i missed ;-)
> 
> 
> Right now, I'm not happy with everything I did.
> For example, now I use a deeper toc (4 title levels in this patch set vs. 3 on
> the current git master). This has a side effect on the html manual, indeed the
> toc only shows the first two level, this reduce the readability, IOW the fact
> that one can quickly find the relevant piece of information he/she is looking
> for.
> 
> So, IOW, I'd like to know whether I'm on right path, the one the Buildroot
> community want to take.

I think it's a good strategy to first defined the organization of the
manual before diving into the implementation of such organization. I
would suggest to work on the Wiki page at
http://elinux.org/Buildroot:ManualOrganization. First by listing, in
random order and without any organization, the topics we think should
be discussed in the manual. And then, work on a proposed organization.
Most likely, it'll be similar to what you're proposing, but I think
that listing beforehand all the topics is a good idea.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
