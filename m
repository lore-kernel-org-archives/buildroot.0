From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 08 Jun 2017 21:59:47 +0200
Subject: [Buildroot] [PATCH] swupdate: switch to local config librt
	dependency
In-Reply-To: <20170608214532.7b77d220@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 8 Jun 2017 21:45:32 +0200")
References: <097cb7c8a9791944b484ec31f2cc5660331411c6.1496939346.git.baruch@tkos.co.il>
 <20170608214532.7b77d220@free-electrons.com>
Message-ID: <87lgp29rnw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> With glibc 2.17 being 4.5 years old, upstream maintainers start to push back
 >> on these librt patches. Is it time to stop support for external toolchains
 >> with older glibc? This means retiring CodeSourcery x86 and SH toolchains.

 > That's a good question. I think supporting relatively old
 > configurations is a strength of Buildroot, so I try to be careful when
 > removing support for old stuff. But maybe glibc 2.17 is now really too
 > old.

 > Thoughts of other developers?

As always, it is a tradeoff. We have already removed gcc 4.8 (released
March 2013) even though older bootloader/kernels tend to break when
built with "too new" gcc versions.

I don't recall the same level of breakage when moving to newer glibc
versions. Is there any reason to stay with 2.17 instead of newer
version (incompatibility/bloat/..)? 2.17 presumably is also missing a
number of security fixes and nice new features.

I suggest we stop caring about these ancient <= 2.17 glibc versions when
we introduce 2.26, especially if upstream doesn't want these fixes any
more.

-- 
Bye, Peter Korsgaard
