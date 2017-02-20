From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 09:41:19 +0100
Subject: [Buildroot] [PATCH 00/58] python pypi library mass version bump.
In-Reply-To: <20170219212054.2x6hosogfxbztldl@localhost.localdomain>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
 <20170219211718.42744cc8@free-electrons.com>
 <20170219212054.2x6hosogfxbztldl@localhost.localdomain>
Message-ID: <20170220094119.28e1827d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Feb 2017 22:20:54 +0100, Lionel Flandrin wrote:

> Could we automate that somehow? Would simply importing the package be
> sufficient for a basic runtime test? Alternatively could we run the
> package-provided tests (if they exist)?

The idea for this automation is what I've posted a few weeks ago:

  http://lists.busybox.net/pipermail/buildroot/2017-February/183326.html

It's a runtime testing infrastructure. For now, it only has a very
small test for the Python interpreter itself, but we could very well
have something that also tests Python packages.

> If you're writing any non-trivial python application with buildroot
> you're almost certain to hit missing and/or outdated packages. It's
> been my experience in the past few weeks, almost all the python
> packages I've wanted to use were either missing or outdated, some of
> them quite severely.
> 
> Furthermore as "embedded" platforms become less and less constrained
> more and more people will want to move to higher level languages like
> python.
> 
> In this situation how can buildroot integrate *and* maintain
> potentially thousands of python packages "by hand"?

Let me return you another question: what do you propose to do?

As you say, Python is going to be more and more widely used in embedded
systems, and the Python culture is many small libraries/modules each
providing a very specific set of functionality, hence a large number of
libraries/modules. There's not much Buildroot can do about it. Should
we not support Python at all? That doesn't seem like a reasonable
option.

So, yes, there are lots of packages in Buildroot for Python modules.
But while their number is large, their complexity is very very small
compared to other packages. Their .mk file typically has zero logic
beyond just calling the python-package infrastructure. We have a very
convenient scanpypi script to generate/update them. So we already have
pretty good tools to handle this large number of packages, and those
tools can be improved with:

 1. A tool that automatically detects when new upstream versions are
    available.

 2. The runtime test infrastructure.

Of course, your help is more than welcome! :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
