From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Nov 2016 14:53:49 +0100
Subject: [Buildroot] [PATCH 1/4] configs: at91sam9x5ek: add development
 rootfs
In-Reply-To: <20161104131408.5wdirj3htguaecx4@rfolt0960.corp.atmel.com>
References: <20161103140841.28789-1-ludovic.desroches@atmel.com>
 <20161104114840.0810be25@free-electrons.com>
 <20161104131408.5wdirj3htguaecx4@rfolt0960.corp.atmel.com>
Message-ID: <20161104145349.685e7bc3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 4 Nov 2016 14:14:08 +0100, Ludovic Desroches wrote:

> > That's a lot of configurations for a single board. Can we rationalize a
> > bit, and chose one configuration only (either NAND or MMC), for which
> > we have the minimal and dev configurations?
> 
> I have in mind, but maybe I am wrong since the conversion is not recent,
> you told me having several defconfigs for the same board  won't be an issue.
> The concern was more about having a dev_defconfig.

Well, the issue is the overall multiplication of defconfigs, so both
the fact that you have separate defconfigs for MMC and NAND, and the
fact that you want to have those "dev_defconfig" contribute to the
multiplication of defconfigs.

> Without a defconfig targetted to NAND or MMC, the customer will have to
> recompile the at91bootstrap and u-boot, this is something we would like
> to avoid. I think u-boot case could be handled because the difference is
> mainly about environment variables. Concerning at91bootstrap, it is more
> complex. If you have any suggestion to handle this case and so reducing
> the number of defconfig variants, I would be happy.

Is it possible to have a single at91bootstrap for both the NAND and MMC
scenarios? I guess you can decide depending on the boot source whether
you should load u-boot from NAND or from MMC. However, this means you
need to have both the NAND code and MMC code compiled in the same
at91bootstrap image. Maybe this makes the at91bootstrap image too big?
I'm not sure what are the constraints of the ROM code in terms of first
stage bootloader size on this SoC.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
