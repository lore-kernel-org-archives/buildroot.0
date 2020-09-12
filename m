From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Sat, 12 Sep 2020 18:18:14 +0200
Subject: [Buildroot] [PATCH 0/2] weston: fix i.MX support
In-Reply-To: <20200912142713.6da9e0d5@windsurf.home>
References: <20200619125500.524503-1-gary.bisson@boundarydevices.com>
 <20200912142713.6da9e0d5@windsurf.home>
Message-ID: <20200912161814.GA4355@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Sep 12, 2020 at 02:27:13PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 19 Jun 2020 14:54:58 +0200
> Gary Bisson <gary.bisson@boundarydevices.com> wrote:
> 
> > Gary Bisson (2):
> >   package/weston: add imx-gpu-viv as possible egl provider
> >   package/weston-imx: remove deprecated package
> 
> Thanks, series applied.

Thanks, that is awesome!

> For the first patch, I think we need to add a proper libgbm virtual
> package. I had a patch series for that, but it's not trivial as not all
> gbm implementations implement the full/recent GBM API. I had some ideas
> to address that, but needs some more investigation/time.

Yes that would indeed be a better solution, I've noticed other packages
that have added dependency on Mesa3d for libgbm (kmscube, glmark2
pending patch[1]).

From the cover letter of this series I also mentioned another patch sent
before that is necessary for a proper build of Weston with imx-gpu-viv
[2].
I thought that was that patch that was problematic as, as you pointed
out already, the sed isn't an elegant solution but I still believe it's
the less intrusive one.
Let me know what you think of it.

Regards,
Gary

[1] http://patchwork.ozlabs.org/project/buildroot/patch/20200104193919.91589-2-bernd.kuhls at t-online.de/
[2] http://patchwork.ozlabs.org/project/buildroot/patch/20200402130842.918696-3-gary.bisson at boundarydevices.com/
