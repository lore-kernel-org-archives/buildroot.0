From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 22:16:40 +0200
Subject: [Buildroot] [PATCH] stress-ng: workaround sparc64 gcc ICE
In-Reply-To: <20160515194634.GY26720@waldemar-brodkorb.de>
References: <20160514184227.GA2898@waldemar-brodkorb.de>
 <20160515213855.75ba5344@free-electrons.com>
 <20160515194634.GY26720@waldemar-brodkorb.de>
Message-ID: <20160515221640.0093f0f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 15 May 2016 21:46:35 +0200, Waldemar Brodkorb wrote:

> > > diff --git a/package/stress-ng/0001-disable-vector-sparc64.patch b/package/stress-ng/0001-disable-vector-sparc64.patch
> > > new file mode 100644
> > > index 0000000..e740b76
> > > --- /dev/null
> > > +++ b/package/stress-ng/0001-disable-vector-sparc64.patch
> > > @@ -0,0 +1,21 @@
> > > +Reported upstream:
> > > +https://bugs.launchpad.net/ubuntu/+source/stress-ng/+bug/1581843  
> > 
> > It was weird to report a gcc bug against the package that fails to
> > build.  
> 
> Why? I think ICE must be reported to GCC upstream.
> I reported a bug to stress-ng, and someone else reported some time
> ago a gcc bug regarding the same code failing for powerpc.
> What is weird here?

That you reported the bug to stress-ng.

When I have a compiler failure, I never report the bug to the package
causing the compiler failure, but directly to the gcc developers.

> > > + /* NetBSD does not define MAP_ANONYMOUS */
> > > + #if defined(MAP_ANON) && !defined(MAP_ANONYMOUS)  
> > 
> > What about using the patch that was actually committed upstream, i.e
> > http://kernel.ubuntu.com/git/cking/stress-ng.git/commit/?id=9b5a3aaffdd613f03c10ebe3550b89193e9993ef
> > according to the bug report you're pointing to?  
> 
> First, it was committed after my buildroot submission, second it
> does not apply for the old version used in buildroot and can't be
> used.

And the backport is complicated?

> Either we update to latest and add the patch, or we add my
> hack.

What I dislike with adding the hack is that we will most likely forget
about it and never update to the latest upstream version. And when
we'll update (if we ever do), since the hack is not the same as what
was done upstream, we'll be confused.

Or at least, could you send an updated version of your patch that
points to the better upstream patch, so that we remember about dropping
your hack when bumping stress-ng?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
