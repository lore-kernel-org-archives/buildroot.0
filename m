From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Feb 2016 09:36:17 +0100
Subject: [Buildroot] problem adding new package libcapn
In-Reply-To: <56C3BEBE.5040901@mind.be>
References: <56C10733.8040706@proximus.be> <56C3970E.5090405@mind.be>
 <20160216224543.6a2a3558@free-electrons.com>
 <56C3BEBE.5040901@mind.be>
Message-ID: <20160217093617.38ad4359@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Feb 2016 01:28:46 +0100, Arnout Vandecappelle wrote:

> > I have the impression that this 'git submodule' thing is used more and
> > more, and that Buildroot not having support to automatically fetch
> > submodules is causing troubles to a number of people.
> 
>  I think what we really see more and more is that packages are distributed
> straight from git instead of through release tarballs. Tarballs often have the
> submodules handled properly.

Right. And the fact that Github generated tarballs don't have the
contents of the sub-modules.

> > Not later than today, a colleague of mine also asked me about this,
> > since he is packaging something that uses submodules.
> > 
> > But very often, submodules are used to "bundle" libraries that should
> > rather be packaged as separate packages.
> 
>  But in that case there is often a tight dependency between them, which makes
> unbundling tough and usually unwanted by upstream. WebEngine is the perfect example.

It depends on the cases. Apparently for this libcapn case, Johan says
that the jansson version being bundled is the same as the one packaged
in Buildroot.

>  Actually, we are doing a kind of bundling as well (or at least, having tight
> dependencies) by fixating a specific version of each package, and worse yet by
> patching them.

I don't follow you here. We are clearly not doing any bundling: if two
packages needs libfoo, then only one copy of libfoo is going to be
installed.

If however those two packages start to use bundled version of libfoo,
then we are possibly going to have two copies of it in the root
filesystem. Or worst, only one copy, with one overwriting the other.
And in either case, it means that security issues are not handled, etc.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
