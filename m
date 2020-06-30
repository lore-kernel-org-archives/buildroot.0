From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Jun 2020 14:08:29 +0200
Subject: [Buildroot] [PATCH v2 2/4] package/freescale-imx/firmware-imx:
 Add option for all i.MX FW needs
In-Reply-To: <20200630115341.GA791671@p1g2>
References: <1593419148-26821-1-git-send-email-stephane.viau@oss.nxp.com>
 <1593419148-26821-3-git-send-email-stephane.viau@oss.nxp.com>
 <20200630115341.GA791671@p1g2>
Message-ID: <20200630140829.14425eac@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 30 Jun 2020 13:53:41 +0200
Gary Bisson <gary.bisson@boundarydevices.com> wrote:

> > +config BR2_PACKAGE_FIRMWARE_IMX_VPU_CODA
> > +	bool
> > +	depends on BR2_PACKAGE_FIRMWARE_IMX
> > +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS
> > +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX37_3STACK
> > +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX50
> > +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
> > +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
> > +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
> > +
> > +config BR2_PACKAGE_FIRMWARE_IMX_VPU_MALONE
> > +	bool
> > +	depends on BR2_PACKAGE_FIRMWARE_IMX
> > +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
> > +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X  
> 
> So here you are either copying all the VPU Malone blob or all the VPU
> CODA blob no matter the platform being used?
> 
> Since we cleaning things up, I'd rather have a generic
> BR2_PACKAGE_FIRMWARE_IMX_VPU config for all the platforms that require a
> VPU blob (from firmware-imx).
> Then in the .mk I'd only copy the VPU blob associated to the platform
> selected (mx27, mx6, mx8 etc).
> That way we don't embed imx27 blob when we build for imx6. As someone
> mentioned in the previous, there's no need to embeds blobs we know are
> useless.

Could you list which blobs are relevant for each platform, so we get a
sense of what is needed and what is not ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
