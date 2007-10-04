From: Brian Austin <brian.austin@cirrus.com>
Date: Thu, 04 Oct 2007 08:46:59 -0500
Subject: [Buildroot] Adding Cirrus  EP93XX  ARM to buildroot
In-Reply-To: <003c01c8063e$26e48a70$b07ee255@atmel.com>
References: <1191361900.4187.48.camel@localhost.localdomain>
	<4702D760.4020707@promwad.com> <20071003204012.GE20951@aon.at>
	<47041DC1.8020301@promwad.com>
	<003c01c8063e$26e48a70$b07ee255@atmel.com>
Message-ID: <1191505619.3704.20.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That sounds easy enough.

For the kernel I was planning on doing the same thing that is done with
the kernel headers used for the toolchain.

wouldnt that make sense?


On Thu, 2007-10-04 at 06:08 +0200, Ulf Samuelsson wrote:
> > 
> >> Depends a bit.. From the sounds, all but the configs should reside in
> >> generic parts.
> >> That said, I'm not too keen on building up a shadow of kernel.org, so
> >> please
> >> 1) update your patches against current linus tree (or -mm, however you
> >> see fit)
> >> 2) submit your patches upstream
> > 
> > Bernhard,
> > 
> > Let me not argee here. You are forcing "keep up-to-date" policy instead of
> > "stable release" policy.
> > 
> > Cirrus Patches may be not a part of buildroot but refer as URL on Cirrus web site.
> > 
> > In embedded world is it often that you have to stick to some old kernel version because
> > of dependency on 3rd components specific to that particular kernel version.
> > 
> > Take into account reasoning of usual linux developer - I do not want to update my kernel
> > patches for every (month,week) -mm released. I want to have a stable base - which remains stable
> > after half-of-year.
> > 
> > And submitting patches to mainstream takes long time. And we want Cirrus support now.
> > 
> > Best regards,
> > Ivan
> > 
> 
> It is a significant problem, which is can be be resolved easily, 
> as long as packages can be rebuilt without changing the makefile fragment.
> If the Makefile fragment for a package is ifdef'ed, then you can supply your own
> file which contains the desired  package version numbers.
> 
> ifeq ($(<PACKAGE>_VERSION),)
> <PACKAGE>_VERSION:=X.Y.Z
> endif
> 
> If the introduction of a new package, require that the Makefile fragment
> changes, then the problem becomes worse.
> 
> Bernard wants you to freeze the buildroot source code for a specific customer.
> Assume you have 50 customers, then you have 50 source trees to maintain.
> If you want to add a single package for each customer, you have to edit 50 source trees.
> Clearly not acceptable.
> 
> 
> 
> Best Regards
> Ulf Samuelsson
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
