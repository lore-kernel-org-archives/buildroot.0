From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Jun 2020 14:09:34 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/freescale-imx/firmware-imx:
 Clean up the image/target semantic
In-Reply-To: <20200630115910.GB791671@p1g2>
References: <1593419148-26821-1-git-send-email-stephane.viau@oss.nxp.com>
 <1593419148-26821-4-git-send-email-stephane.viau@oss.nxp.com>
 <20200630115910.GB791671@p1g2>
Message-ID: <20200630140934.7b56150f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 30 Jun 2020 13:59:10 +0200
Gary Bisson <gary.bisson@boundarydevices.com> wrote:

> > +ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_VPU_MALONE),y)
> > +FIRMWARE_IMX_INSTALL_TARGET = YES  
> 
> Instead of setting FIRMWARE_IMX_INSTALL_TARGET at multiple places,
> wouldn't it be ok to have it set to YES at the beginning, and worst case
> scenario none of the macros are defined and it does nothing?
> 
> Just trying to simplify the package even more. Same goes for
> FIRMWARE_IMX_INSTALL_IMAGES_CMDS.

Yes, I did notice the same thing when reviewing an earlier version of
the patch. But since I didn't had a very strong preference, I didn't
comment on this. I agree setting INSTALL_TARGET = YES and
INSTALL_IMAGES = YES makes things a bit simpler.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
