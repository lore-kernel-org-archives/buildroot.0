From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Feb 2015 11:48:33 +0100
Subject: [Buildroot] Large changesets
In-Reply-To: <20150224104300.GA24526@vostro>
References: <20150224104300.GA24526@vostro>
Message-ID: <20150226114833.4eeedca1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Tue, 24 Feb 2015 12:43:00 +0200, Alex Suykov wrote:

> What's the best way to submit a relatively large patchset for review?
> Especially considering there may be v2, v3 etc.
> 
> I'm working on some init-related stuff, and the first stage there is
> moving service file installation code (that's /etc/init.d/*, *.service)
> out of project .mk files and into pkg-generic.mk.
> 
> So there's one patch that does pkg-generic changes, followed by one
> patch per package for each package that has service files, that's 70+
> patches already, a bit too much to post right away I think.

I would suggest to first submit only the patches touching the core
infrastructure, and maybe one or two patches showing how the change can
be used in existing packages. This will allow us to discuss whether the
change to the package infrastructure is OK or not, before looking at
all the packages that will have to be modified.

Note that at some point in the past, Maxime Hadjinlian proposed
something similar, and our reaction at the last Buildroot meeting was a
bit negative about this. We thought the benefits were not really worth
the effort. But maybe you can convince us otherwise, with a different
proposal ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
