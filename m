From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 05 Sep 2016 18:22:04 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-09-02
In-Reply-To: <20160903232302.40ff0733@free-electrons.com>
References: <20160903063033.788551028C6@stock.ovh.net>
 <1496256.AqCB2eOqyL@sagittea> <20160903232302.40ff0733@free-electrons.com>
Message-ID: <4479898.zYZWECoz4p@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 03 September 2016 23:23:02 Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 03 Sep 2016 20:59:08 +0200, J?r?me Pouiller wrote:
> > > 4. The problem is already solved, because the
> > > util-linux-2.28.1.tar.xz tarball is now on
> > > http://sources.buildroot.net/, and Buildroot automatically falls
> > > back to this address. Therefore, the build failure will no longer
> > > occur.
> > 
> > It means this error will occurs each time a package using
> > KERNEL_MIRROR will be upgraded?
> 
> Sadly, yes.
> 
> > Do autobuilder owners could update their wget version?
> 
> Could be a solution. My autobuilder is intentionally running a very
> old system so that we catch such issues. Upgrading wget would solve
> this problem, but Buildroot users that must use old systems (which is
> sometimes the case in corporate environments) would still face the
> same issue. So keeping an old system for testing on our side is also
> a way of making sure that we face the same problems as those users,
> and can anticipate/fix them when possible.

I didn't check autobuilder code, but it should be possible to detect 
this case (old wget + SSL problem + 404 while checking mirror). We may 
associate this failure with a special package name? So developers know 
it should normally be ignored.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
