From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Fri, 18 Nov 2016 14:56:25 +1100
Subject: [Buildroot] [RFC PATCH 1/1] pkg-autotools: generic configure
 fix for powerpc64
In-Reply-To: <20161118004854.GC16063@tungsten.ozlabs.ibm.com>
References: <56063c394c473bf4292658511bae0dd99583be07.1479356115.git.sam.bobroff@au1.ibm.com>
 <20161117110529.55c3578e@free-electrons.com>
 <20161118004854.GC16063@tungsten.ozlabs.ibm.com>
Message-ID: <20161118035625.GA21421@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[snip]

> > > +suffix=.powerpc64.orig
> > 
> > Do we really want to keep the original files?
> 
> Well, no, but now that you mention it, what about this idea:
> 
> Use the patch backup file as a way to see if the patch has been applied
> already and if it has been, skip patching.
> 
> At the moment, if you interrupt the configure process (which is quite
> long) and then re-run the build, it will fail because the patching
> fails.

^--- I've realised that this is wrong, and I should just remove the
backup file. If configure is already patched, it isn't detected as
needing a patch so this problem doesn't happen!

Cheers,
Sam.
