From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 26 Jul 2018 11:58:11 +0200
Subject: [Buildroot] [PATCH 0/8] imx: update multimedia packages to
 4.9.88_2.0.0_ga
In-Reply-To: <20180726114521.22054034@windsurf>
References: <20180725150149.30774-1-gary.bisson@boundarydevices.com>
 <7bddd977-45ca-5b84-6aca-842c6de86e7c@mind.be>
 <20180726114521.22054034@windsurf>
Message-ID: <20180726095811.GA5860@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Jul 26, 2018 at 11:45:21AM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 26 Jul 2018 11:26:51 +0200, Arnout Vandecappelle wrote:
> 
> >  I'm sorry for all the work that you did, but I don't really agree that this is
> > a good idea. The upstream package really is called imx-vpu, so we prefer to keep
> > that name. We changed the name for openssl because there really was no other
> > way, but I do prefer to avoid that.
> > 
> >  So I think it's just a matter of finding a better name for the virtual package.
> > What about imx-vpu-provider?
> 
> I have not reviewed the patch series carefully enough yet, but a
> question is: do we need a virtual package at all?

Up to you, I'm ok either way, just thought it'd be cleaner this way.

> I guess the imx-vpu API is not going to be used by gazillions of
> packages. If I read PATCH 5/8 correctly, it's in fact only used by two
> packages, right ?

Yes, libimxvpuapi and imx-vpuwrap are the only 2 users of imx-vpu right
now.

> Can't we simply have those two packages do:
> 
> ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M),y)
> use the new imx-vpu package
> else
> use the old imx-vpu package
> endif
> 
> And ditto in their Config.in ?

Ok.

> Virtual packages are great when there is really an arbitrary number of
> providers and/or an arbitrary number of users.
> 
> OpenSSL for examples has only two providers, but it has a very large
> number of users. Ditto jpeg. MySQL does not have a lot of users, but it
> might potentially have.
> 
> Also, the i.MX VPU stuff is highly platform-specific, it provides a
> very specialized API, it's very unlikely that we will see gazillions of
> packages depending on the i.MX VPU API.

Ok, I'll make a v3 like this then.

Regards,
Gary
