From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Feb 2018 17:55:51 +0100
Subject: [Buildroot] [PATCH 1/3] imx-mkimage: new package
In-Reply-To: <20180219164406.GA22465@t450s.lan>
References: <1518960511-4823-1-git-send-email-karl.erik.larsson@gmail.com>
 <1518960511-4823-2-git-send-email-karl.erik.larsson@gmail.com>
 <20180218155100.3e4e090f@windsurf>
 <20180219164406.GA22465@t450s.lan>
Message-ID: <20180219175551.761f4da4@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Feb 2018 17:44:06 +0100, Gary Bisson wrote:

> > I'm not sure this package needs to be under package/freescale-imx/.
> > This sub-directory was initially created to share the
> > FREESCALE_IMX_SITE and FREESCALE_IMX_EXTRACT_HELPER definitions, but
> > you don't use them.  
> 
> Actually there are plenty of packages in that folder that don't need the
> extract helper nor the site address. Would you like those moved out of
> it? (imx-kobs, imx-uuc, imx-vpuwrap etc..).

I don't have a very clear cut opinion about this. If they don't need to
be in package/freescale-imx/, then in theory they should be outside
yes.

> Another aspect of that folder is BR2_PACKAGE_FREESCALE_IMX_PLATFORM,
> although it is accessible at other places, which has an effect on which
> packages are available.

Yeah, but that's just Config.in values, which are available to all
packages without problem.

> > Why are you building just the tool in iMX8M ? There is also one in src/
> > and in iMX8dv. What are the differences ? Should we build/install all
> > of them ? Conditionally ?  
> 
> That is where new BR2_PACKAGE_FREESCALE_IMX_PLATFORM values would be
> needed to separate iMX8M, iMX8QM and iMX8QX.
> 
> As a FYI, iMX8dv was some sort of development version of i.MX8, this
> will not be supported moving forward, only the 3 families listed above.

OK, thanks for the info!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
