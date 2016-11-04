From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Fri, 4 Nov 2016 14:37:49 +0100
Subject: [Buildroot] [PATCH 1/4] configs: at91sam9x5ek: add development
 rootfs
In-Reply-To: <20161104131408.5wdirj3htguaecx4@rfolt0960.corp.atmel.com>
References: <20161103140841.28789-1-ludovic.desroches@atmel.com>
 <20161104114840.0810be25@free-electrons.com>
 <20161104131408.5wdirj3htguaecx4@rfolt0960.corp.atmel.com>
Message-ID: <20161104133749.hwnplruc2rmw4vu7@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/11/2016 at 14:14:08 +0100, Ludovic Desroches wrote :
> On Fri, Nov 04, 2016 at 11:48:40AM +0100, Thomas Petazzoni wrote:
> > Hello,
> > 
> > On Thu, 3 Nov 2016 15:08:38 +0100, Ludovic Desroches wrote:
> > > Add development rootfs based on linux4sam_5.4 for at91sam9x5ek for both
> > > NAND flash and SD card.
> > > 
> > > Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> > > ---
> > >  board/atmel/at91sam9x5ek_mmc/genimage.cfg  |  34 ++++++++++
> > >  board/atmel/at91sam9x5ek_mmc/post-image.sh |  20 ++++++
> > >  configs/at91sam9x5ek_dev_defconfig         |  99 ++++++++++++++++++++++++++++
> > >  configs/at91sam9x5ek_mmc_dev_defconfig     | 102 +++++++++++++++++++++++++++++
> > 
> > So after this patch, we would have:
> > 
> >   at91sam9x5ek_defconfig
> >   at91sam9x5ek_dev_defconfig
> >   at91sam9x5ek_mmc_dev_defconfig
> > 
> > But no minimal MMC configuration.
> > 
> > That's a lot of configurations for a single board. Can we rationalize a
> > bit, and chose one configuration only (either NAND or MMC), for which
> > we have the minimal and dev configurations?
> > 
> 
> I have in mind, but maybe I am wrong since the conversion is not recent,
> you told me having several defconfigs for the same board  won't be an issue.
> The concern was more about having a dev_defconfig.
> 
> Without a defconfig targetted to NAND or MMC, the customer will have to
> recompile the at91bootstrap and u-boot, this is something we would like
> to avoid. I think u-boot case could be handled because the difference is
> mainly about environment variables. Concerning at91bootstrap, it is more
> complex. If you have any suggestion to handle this case and so reducing
> the number of defconfig variants, I would be happy.
> 

I think the best would be to be able to merge defconfigs. So, you'd get
one iminimal defconfig per machine plus only one for the development
image.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
