From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 21:36:14 +0200
Subject: [Buildroot] [PATCH v3 6/6] package/amd-catalyst-driver: Add AMD
 proprietary graphic stack support
In-Reply-To: <20160727162408.GA5657@free.fr>
References: <1469521290-20446-1-git-send-email-romain.perier@free-electrons.com>
 <1469521290-20446-7-git-send-email-romain.perier@free-electrons.com>
 <20160726203918.GE5925@free.fr>
 <57986DBF.5040608@free-electrons.com>
 <20160727162408.GA5657@free.fr>
Message-ID: <20160727213614.7f8584de@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Jul 2016 18:24:08 +0200, Yann E. MORIN wrote:

> > So, either you merge a package containing a module which won't build
> > or you ask the user to patch manually his kernel...  
> 
> And this is exactly what we should not even mention, IMHO.
> 
> So, my deepest opinion is that we should *not* have that package at all,
> given that it can't build/run.
> 
> However, as Thomas said and as you will have experienced, this is not
> something that is easy to package, and some people need it. We can at
> least provide the recipe to build it; this is obviously not the best
> solution, as it won't work out-of-the-box.
> 
> Yes, we will provide a package that cannot build and, even if it would,
> would not run. No, we can't do anything about it. No, we should *not*
> try to do anything about it.

I discussed it with Romain today and here is my proposal: we simply
don't do anything to try to fix this problem. It is up to the user to
figure out what is the most acceptable solution (if any).

This way, the most complicated packaging part is in Buildroot upstream,
which makes 99% of the work simpler for our users, they "simply" have
to deal with this licensing oddity.

We can simply add a warning in the Config.in help text of the package
that it may not build due to the proprietary kernel module using kernel
symbols not exposed to proprietary modules.

How does that sound?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
