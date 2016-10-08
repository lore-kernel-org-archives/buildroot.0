From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Oct 2016 16:02:28 +0200
Subject: [Buildroot] [PATCH v2 04/20] python3: make it exclusive from
 python
In-Reply-To: <20161008135130.GB3802@free.fr>
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392756013-27757-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <8nrfcdx2pk.ln2@ID-313208.user.individual.net>
 <20161005213018.7a5567da@free-electrons.com>
 <20161008122434.GA3802@free.fr>
 <20161008145107.277673a8@free-electrons.com>
 <20161008135130.GB3802@free.fr>
Message-ID: <20161008160228.71f9e08f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 8 Oct 2016 15:51:30 +0200, Yann E. MORIN wrote:

> Plain and simple: if a python module supports both python and python3,
> and both are enabled, that python module is built for both python and
> python3.

Well, that's horrible from a filesystem size point of view, and I'm not
really sure this would solve Bernd's issue. I'm pretty sure Bernd would
like to have a given set of modules built for Python 2, and another set
of modules built for Python 3.

> If for your system you only need A for python and B for python3, then it
> is *your* responsibility to remove A for python3 and B for python in a
> post-build script. That's what we've been advertising in similar cases
> when people only wanted a subset of a package, and what you've been
> suggesting when we were arguing about the libudev stuff (i.e. build the
> full eudev and get rid of the udevd program in a post-build script). ;-)

Well, yes, you could see it this way.

But on the eudev thing, you still get it wrong: having libudev
installed separately from udevd is not an option offered by upstream.
You had to hack all around the place to make this possible.

Building Python modules with just python2 or just python3 is perfectly
fine from upstream's point of view.

So please don't confuse things :)

> > Please explain how to solve the Kconfig problem first. Until there is
> > no solution for the Kconfig problem, there is really no point in even
> > thinking about the build problems.  
> 
> I don't think there is a "kconfig problem" to start with. ;-)

With your solution, indeed. However, I'm not sure it is worth the
hassle supporting this mechanism. But it can certainly be done.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
