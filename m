From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Mar 2018 08:48:08 +0100
Subject: [Buildroot] [PATCH next v2 3/5] support/scripts/pkg-stats-new:
 add current version information
In-Reply-To: <5aa0aaabf354_230cd1b5a053590@ultri3.mail>
References: <20180307232558.2d9b358f@windsurf>
 <5aa0aaabf354_230cd1b5a053590@ultri3.mail>
Message-ID: <20180308084808.5ff15bbb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 08 Mar 2018 00:14:51 -0300, Ricardo Martincoski wrote:

> > With this:
> > 
> >  - If the package specifies only a target version, the target version
> >    is saved.
> > 
> >  - If the package specifies only a host version, the host version is
> >    saved.
> > 
> >  - If the package specifies both a target version and a host version,
> >    the target version always wins. So the scripts doesn't handle
> >    differentiating host and target versions for the same package, but
> >    at least we are consistent in the fact that we will always report
> >    the target version.
> > 
> > How does that sound ?  
> 
> Sounds good.
> Nit: please recheck with flake8.

Will do.


> > I'm just cutting after 20 characters, and adding "..." at the end, and
> > it seems good enough to me (compared to doing a regexp to try to guess
> > if it's a git hash or not).  
> 
> OK since you are only changing the display of the version, not the string that
> will be compared to the new column.
> 
> The few version strings in the tree that are not sha1 larger than 20 are:
> 2.0.0.alpha20140727b
> kvm-unit-tests-20171020
> rel_imx_4.9.x_1.0.0_ga
> 
> For me these are OK:
> 2.0.0.alpha20140727...
> kvm-unit-tests-2017...
> rel_imx_4.9.x_1.0.0...

Yes, I'm only changing the display of the version, and I'm also adding
"..." which helps the reader understand that the version string has
been cut.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
