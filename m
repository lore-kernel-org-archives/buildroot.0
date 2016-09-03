From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Sep 2016 23:23:02 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-09-02
In-Reply-To: <1496256.AqCB2eOqyL@sagittea>
References: <20160903063033.788551028C6@stock.ovh.net>
 <2181287.8UlWShMbI3@sagittea>
 <20160903203613.2a7f0a32@free-electrons.com>
 <1496256.AqCB2eOqyL@sagittea>
Message-ID: <20160903232302.40ff0733@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 03 Sep 2016 20:59:08 +0200, J?r?me Pouiller wrote:

> > 4. The problem is already solved, because the util-linux-2.28.1.tar.xz
> > tarball is now on http://sources.buildroot.net/, and Buildroot
> > automatically falls back to this address. Therefore, the build
> > failure will no longer occur.  
> 
> It means this error will occurs each time a package using KERNEL_MIRROR 
> will be upgraded?

Sadly, yes.

> Do autobuilder owners could update their wget version?

Could be a solution. My autobuilder is intentionally running a very old
system so that we catch such issues. Upgrading wget would solve this
problem, but Buildroot users that must use old systems (which is
sometimes the case in corporate environments) would still face the same
issue. So keeping an old system for testing on our side is also a way
of making sure that we face the same problems as those users, and can
anticipate/fix them when possible.

> > However, we could discuss whether it really makes sense to use
> > https:// as the main download location when all downloads anyway fall
> > back to downloading from sources.buildroot.net over http://.  
> 
> sources.buildroot.net should provide an https access?

I am not a security expert, I am not sure if this is really useful. I
don't think there's anything secret in those communications, and the
integrity of the downloaded tarballs is verified using hashes.

Maybe the solution to the whole problem is to use http:// when
available over https:// ? Though admittedly more and more sites tend to
redirect http to https and force people to use secure connections
(which is a good thing).

I'm open to suggestions from others on this.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
