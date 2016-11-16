From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Thu, 17 Nov 2016 09:49:50 +1100
Subject: [Buildroot] [PATCH 1/1] sdl: fix building on powerpc64 and
 powerpc64le
In-Reply-To: <20161116123331.44f50097@free-electrons.com>
References: <a57a3d0430e248ee08148cef326cbf60283205ad.1478489382.git.sam.bobroff@au1.ibm.com>
 <20161107225106.5e9e61b6@free-electrons.com>
 <53f345eb-3ea1-02ef-06bf-72f011b3728a@mind.be>
 <20161108051006.GB6803@tungsten.ozlabs.ibm.com>
 <99a8adb3-3fa3-7050-e31f-16d2ee67ea12@mind.be>
 <20161109043021.GA10982@tungsten.ozlabs.ibm.com>
 <eijmfdxo6o.ln2@ID-313208.user.individual.net>
 <f3f4937e-e29f-e504-371f-f393346f5ade@mind.be>
 <20161116123331.44f50097@free-electrons.com>
Message-ID: <20161116224950.GA2559@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 16, 2016 at 12:33:31PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 13 Nov 2016 21:18:46 +0100, Arnout Vandecappelle wrote:
> 
> >  Nice idea, but it's only possible for internal toolchains. Unless if we merge
> > the ld-wrapper patches (last news of which was: it shouldn't be needed).
> > 
> >  I'm slightly inclined to go for patching configure or libtool.m4 instead.
> 
> Can we move forward with this topic? Could somone summarize the problem
> and options we have with advantages/drawbacks?
> 
> We've got quite a lot of build failures because of that. In the latest
> autobuild report, we've got 7 build failures on powerpc64le (on a total
> of 41 build failures), and I suspect a significant number of them are
> due to this libtool issue.

Sorry I've been quiet but I've been working on this :-)

I've built and used scripts to scan about 1,000 packages, and it looks
like about 100 of them have this problem. I'll post an RFC patch shortly
and answer your questions, above.

However, I've also run into several failures that are different issues,
so this isn't going to fix them all.

Cheers,
Sam.
