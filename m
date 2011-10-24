From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2011 21:47:47 +0200
Subject: [Buildroot] Some topics for the Buildroot Developer Day
In-Reply-To: <20111024165904.GB9199@pengutronix.de>
References: <20111024173815.2277c6dd@skate>
 <20111024165904.GB9199@pengutronix.de>
Message-ID: <20111024214747.279c6e72@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 24 Oct 2011 18:59:04 +0200,
Robert Schwebel <r.schwebel@pengutronix.de> a ?crit :

> >  * Testing infrastructure. Possible to put build results on the Web
> >    server? Common format for them?
> 
> This would surely be an interesting topic. We have worked on a test
> infrastructure for ptxdist for a while now; in fact, we are in the 3rd
> iteration:
> 
> - The first one was "expect" based. It failed because tcl is *just* so
>   ugly, and the risk of getting eye cancer was simply too high ...
> 
> - The 2nd one was Python / pexpect based (failed because our method to
>   connect the serial port's file descriptor to pexpect was discontinued
>   some python minor revisions later). And it turned out that our initial
>   idea to easily re-use tests due to the object orientation of Python
>   didn't work, because the test adaptions to a scenario often are bigger
>   then the test itself.
> 
> - We have a kermit based infrastructure now, with shell wrappers; the
>   kermit code is ugly as hell, but it works reliably and is well
>   wrapped.
> 
> If somebody is interested, I can show how we do that.

Sure, would be interesting to hear what you're doing in terms of
testing.

> However, we also do not have the infrastructure for a sane
> representation + website presentation of test results, so this is
> definitely something where we might collaborate nicely.

Ok. However note that for the moment, we're only trying to do automated
*build* testing. Automated *runtime* testing is an entirely different
story.

> Does buildroot have a possibility to split between runtime and build
> time dependencies? This is something we are fighting with.

Yes and no. In Buildroot, packages express their dependencies
in their Config.in and their .mk file. The dependencies in the .mk file
are build dependencies, since they are guaranteed to be built before
that package. However, dependencies in Config.in can go beyond the
build dependencies, so some of them can be seen as runtime
dependencies. But we haven't formalized that in any sort of way.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
