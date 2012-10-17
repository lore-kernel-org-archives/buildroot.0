From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Oct 2012 22:41:06 +0200
Subject: [Buildroot] [PATCH 0/7] Introduce the _AVAILABLE mechanism
In-Reply-To: <201210172216.43837.yann.morin.1998@free.fr>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <201210172147.15828.yann.morin.1998@free.fr>
 <20121017220525.6e7e173b@skate>
 <201210172216.43837.yann.morin.1998@free.fr>
Message-ID: <20121017224106.6bb0ad49@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Wed, 17 Oct 2012 22:16:43 +0200, Yann E. MORIN wrote:

> > From a quick review, it sounds sufficient indeed. What surprises me
> > is why we didn't think about this solution the other day when
> > discussing your _AVAILABLE patch set.
> 
> To be honest, I'm surprised too I did not think about it. ;-]
> 
> In fact, as an after-thought, I do know why. That's because I was
> thinking the other way-around: a package that depends on a sub-option
> of another package, sub-option which in turn depends on a third
> package.  *That* one would require an _AVAILABLE for sub-options.

Aaah yes.

> For example, libuuid which is a sub-option of util-linux (although
> that one sub-option has no dpendency; but you get the idea) is select
> by a few other packages (eg. parted, ntfs-3g...).
> 
> And going *that* route is IMHO not what we want.

Our example was the one of python-dpkt, which was doing a:

	depends on BR2_PACKAGE_PYTHON
	select BR2_PACKAGE_PYTHON_ZLIB

or BR2_PACKAGE_PYTHON_ZLIB is not a package per-se, but a sub-option of
the python package. And this this sub-option does a select, we should
introduce a BR2_PACKAGE_PYTHON_ZLIB_AVAILABLE, I don't see a way around
it.

Except modifying kconfig, as we discussed, of course...

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
