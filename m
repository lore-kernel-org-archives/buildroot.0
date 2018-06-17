From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Sun, 17 Jun 2018 21:23:16 +0200
Subject: [Buildroot] [PATCH 2/4] imx-gpu-viv: enable package for 64-bit
 i.MX processors
In-Reply-To: <20180617153134.05fe6b83@windsurf>
References: <20180612150221.31792-1-gary.bisson@boundarydevices.com>
 <20180612150221.31792-3-gary.bisson@boundarydevices.com>
 <20180617153134.05fe6b83@windsurf>
Message-ID: <20180617192316.GA28298@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

On Sun, Jun 17, 2018 at 03:31:34PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 12 Jun 2018 17:02:19 +0200, Gary Bisson wrote:
> 
> > diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> > index 97aeb15764..b42cd2bfd7 100644
> > --- a/package/freescale-imx/Config.in
> > +++ b/package/freescale-imx/Config.in
> > @@ -69,7 +69,12 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
> >  	bool
> >  	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q || \
> >  		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S || \
> > -		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
> > +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 || \
> > +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
> > +
> > +config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU_WAYLAND_ONLY
> 
> I don't really like the semantic of <something>_ONLY options, and it
> generally felt a bit unneeded. So I've used
> BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M directly in the imx-gpu-viv
> package. I've applied after changing this. Please double check that I
> didn't introduce any problem:
> 
>   https://git.buildroot.org/buildroot/commit/?id=84afda9ca6dad5fd828ba94fa60df52c81cc7814

Thanks, I understand that this naming wasn't great and your option seems
to work just fine (after a quick menuconfig testing).

The reason I wanted to have a config for that is because iMX8M is the
first CPU to be supported but basically all the next iMX8x processors
will be the same (iMX8QXP, iMX8QM). But we'll see how to them later, no
worries.

Thanks,
Gary
