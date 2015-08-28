From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 28 Aug 2015 09:36:30 +0000
Subject: [Buildroot] [PATCH] u-boot: 2015.07 - fix creation of .config
In-Reply-To: <55D8FE3F.8080206@mind.be>
References: <1438351475-14447-1-git-send-email-abrodkin@synopsys.com>
 <20150731161818.2056383e@free-electrons.com>
 <1438355649.4848.41.camel@synopsys.com>
 <1438600559.13201.4.camel@synopsys.com>
 <1439295600.3252.2.camel@synopsys.com>
 <20150812102334.15742776@free-electrons.com> <55D8FE3F.8080206@mind.be>
Message-ID: <1440754590.14215.3.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, 2015-08-23 at 00:57 +0200, Arnout Vandecappelle wrote:
> On 08/12/2015 10:23 AM, Thomas Petazzoni wrote:
> > Dear Alexey Brodkin,
> > 
> > On Tue, 11 Aug 2015 12:20:01 +0000, Alexey Brodkin wrote:
> > 
> > > Any chance for this one to be applied?
> > > Note without this change or anything similar U-Boot from
> > > snsp_axs10x_defconfig fails to config.
> > 
> > I haven't had the time to look into this in detail. It would be great
> > if Yann, or J?rg could have a look. I remain unhappy with solving such
> > a problem by using a patch against U-Boot 2015.07, because it means
> > anyone specifying a slightly different U-Boot version (but based on
> > 2015.07) will still have the problem.
> 
>  I assume the problem will be fixed soon upstream, so the chance that some chip
> vendor releases a U-Boot based on 2015.07 is not that high. And if someone is
> making their own modified git copy of 2015.07, they'll notice _very_ quickly
> that it fails and with any luck they'll notice the patch in buildroot.
> 
>  Not fixing the problem at all in 2015.08 is obviously worse.
> 
>  We could do a sed independent of the U-Boot version, but that runs the risk of
> breaking some other random non-2015.07 version completely.
> 
>  The problem is in fact in Kconfig (as noted in Tom Rini's comment in
> http://patchwork.ozlabs.org/patch/502793/ ) so a fundamental solution is not easy.

So we're well beyond rc2 and release will inevitably happen from day to day still
this problem is not resolved. Anything else we're going to consider here?

-Alexey
