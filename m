From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 10 Aug 2016 19:32:57 +0000
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to
	arc-2016.09-eng008
In-Reply-To: <20160810212736.6a814ad9@free-electrons.com>
References: <1470849040-9200-1-git-send-email-vzakhar@synopsys.com>
 <20160810212736.6a814ad9@free-electrons.com>
Message-ID: <1470857474.3428.41.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2016-08-10 at 21:27 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> Thanks for this new update!
> 
> On Wed, 10 Aug 2016 20:10:40 +0300, Vlad Zakharov wrote:
> > 
> > As described at:
> > 4520524ba055706236db9f00dd79f1b2e2e87fde
> > this commit continues a series of updates of ARC tools.
> > This time we're updating tools to arc-2016.09-eng008.
> > 
> > Main updates were made for gcc. It was switched to GCC 6 and to
> > OSABI v4.
> 
> Beware that using GCC 6 is causing to cause a number of issues related
> to GCC 6 itself and not to ARC. We already have one GCC 6 toolchain for
> ARM, and we have a number of build failures caused by this toolchain
> due to the use of GCC 6.

That bump will for sure introduce new breakages while fixing some we already
know about. But we had to make that bold movement at some point because that
make us use almost upstream GCC with very few off-the-tree patches for ARC.

And indeed our goal is to find and fix as many issues as we can in that new
toolchain. So we'll continue to monitor BR autobuilder failures on daily basis.

As usual it would be good to rebuild BR pre-built tools for ARC out of this
commit so we have better coverage in running build jobs.

-Alexey
