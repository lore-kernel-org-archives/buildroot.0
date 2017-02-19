From: Lionel Flandrin <lionel@svkt.org>
Date: Sun, 19 Feb 2017 22:20:54 +0100
Subject: [Buildroot] [PATCH 00/58] python pypi library mass version bump.
In-Reply-To: <20170219211718.42744cc8@free-electrons.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
 <20170219211718.42744cc8@free-electrons.com>
Message-ID: <20170219212054.2x6hosogfxbztldl@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 19, 2017 at 09:17:18PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 19 Feb 2017 14:11:57 -0500, Adam Duskett wrote:
> 
> > I personally tested to make sure that all of these changes build properly on my
> > machine before submitting.
> 
> The one problem I have with such a mass version bump is precisely that
> a build test for Python modules is completely insufficient. Only a
> runtime test can determine whether the bump is OK or not. As Yegor
> said, a number of those modules gain new dependencies between one
> version and another, and those can sometimes only be noticed by doing a
> runtime test.
> 
> Thomas

Could we automate that somehow? Would simply importing the package be
sufficient for a basic runtime test? Alternatively could we run the
package-provided tests (if they exist)?

In general I wonder if this python package situation is going to be
maintainable in buildroot in the long run. There are nearly 200 python
packages at the moment on the master branch, more than 10% of all
buildroot packages.

There are more than 20 thousand packages on pypi.python.org.

If you're writing any non-trivial python application with buildroot
you're almost certain to hit missing and/or outdated packages. It's
been my experience in the past few weeks, almost all the python
packages I've wanted to use were either missing or outdated, some of
them quite severely.

Furthermore as "embedded" platforms become less and less constrained
more and more people will want to move to higher level languages like
python.

In this situation how can buildroot integrate *and* maintain
potentially thousands of python packages "by hand"?

I hope this doesn't come off as whiny, I'm extremely thankful for all
the work people have put building and maintaining the current
infrastructure, and once all the packages you want to use are in there
it's a pleasure to use. I just wanted to offer a piece of constructive
criticism.

Cheers,
-- 
Lionel Flandrin
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170219/e0aeefc8/attachment.asc>
