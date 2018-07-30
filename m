From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 30 Jul 2018 10:59:57 +0200
Subject: [Buildroot] [PATCH 1/8] firmware-imx: bump to version 7.5
In-Reply-To: <20180729150825.76f085c1@windsurf>
References: <20180725150149.30774-1-gary.bisson@boundarydevices.com>
 <20180725150149.30774-2-gary.bisson@boundarydevices.com>
 <6f639664-4b81-033c-fa68-44d48e0a347f@mind.be>
 <20180729150825.76f085c1@windsurf>
Message-ID: <20180730085957.GA27423@g751.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Arnout,

On Sun, Jul 29, 2018 at 03:08:25PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 28 Jul 2018 23:53:44 +0200, Arnout Vandecappelle wrote:
> > On 25-07-18 17:01, Gary Bisson wrote:
> > > This new package includes new binaries for i.MX8QXP.
> > > 
> > > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>  
> > 
> >  I've applied this patch to master, the rest is changes requested.
> 
> I don't know if we have been clear enough with Gary about what changes
> we want. Do we want to stay with a virtual package ?

That's a good question. But I plan on offering the alternative series
without the virtual package, maybe that will help making the decision.
It shouldn't be too hard to do.

The way I see it using a virtual package is cleaner and is more
future-proof (I wouldn't be surprised another imx-vpu-xxx package shows
up in a near future).

However it also makes it "harder" to select imx-vpuwrap/libimxvpuapi
since it depends on imx-vpu, the provider package isn't automatically
selected as it used to.

> If so, what should
> be the name of the virtual package vs. the name of the package for the
> "old" i.MX VPUs ?
> 
> On my side, while I agree that imx-vpu-cnm violates the rule of "we
> name packages like their upstream name", I believe this is a violation
> that is acceptable because the naming chosen by Gary is the one that is
> the easiest to understand and the most obvious: imx-vpu is the virtual
> package, imx-vpu-hantro and imx-vpu-cnm are the providers.

Glad to hear someone agrees with that naming which really makes more
sense to me than what is done by NXP.

Regards,
Gary
