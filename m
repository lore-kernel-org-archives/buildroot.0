From: Robert P. J. Day <rpjday@crashcourse.ca>
Date: Fri, 17 Apr 2015 12:28:55 -0400 (EDT)
Subject: [Buildroot] a philosophical question about Config.in and
 "comment" directives
In-Reply-To: <55313266.9000600@mind.be>
References: <alpine.LFD.2.11.1504170840320.7665@localhost>
 <20150417150042.GA5271@free.fr> <55313266.9000600@mind.be>
Message-ID: <alpine.LFD.2.11.1504171224440.12726@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Apr 2015, Arnout Vandecappelle wrote:

> On 17/04/15 17:00, Yann E. MORIN wrote:
> > Rovert, All,
> >
> > On 2015-04-17 08:58 -0400, Robert P. J. Day spake thusly:
> > [--SNIP--]
> >>   to distinguish between these two "levels" of dependency, i think it
> >> would be far clearer to rewrite a file like that as:
> >>
> >>   if BR2_arm
> >>
> >>   config BR2_PACKAGE_A10DISP
> >>         bool "a10disp"
> >>         depends on BR2_LINUX_KERNEL
> >>         help
> >>           Program to change the display mode of Allwinner ARM SOCs running
> >>           the linux-sunxi kernel (and not the mainline kernel.)
> >>
> >>           http://github.com/hglm/a10disp
> >>
> >>   comment "a10disp needs a Linux kernel to be built"
> >>         depends on !BR2_LINUX_KERNEL
> >>
> >>   endif
> >>
> >> that layout makes it far clearer that the entire option depends on
> >> arm or you see *nothing* and, further, internally, the dependencies
> >> in the comment list *only* those dependencies that the user will be
> >> warned that they need if they want this selection.
>
>  I completely agree.
>
> >>
> >>   i just think having the dependency line
> >>
> >>   depends on BR2_arm
> >>
> >> in both the config and comment directives is unnecessary duplication,
> >> and that that kind of dependency should be moved up to encompass the
> >> entire Config.in file, however that's best done.
> >>
> >>   thoughts?
> >
> > Well, you are right that "it would make moere sense" from a theoretical
> > point of view, and that there is no functional difference.

  i know there's no functional difference, and that's why i'm quite
prepared for people to suggest it's just meaningless code churn.

> > BTW, there are other such architectural options, like MMU, that we
> > handle the same way as well.

  in fact, that was exactly the other example that jumped out at me --
the duplication of the test for BR2_USE_MMU in quite a number of
recipes. that's the test that got me thinking about this.

  anyway, just my $0.02 ...

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
