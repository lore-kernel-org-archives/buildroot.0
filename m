From: Alexander Dahl <post@lespocky.de>
Date: Fri, 7 Sep 2018 08:25:58 +0200
Subject: [Buildroot] [PATCH 1/1] board: resurrect support for RIoTboard
In-Reply-To: <20180906212511.0b720b5c@windsurf>
References: <20180903020333.23622-1-nikolay.dimitrov@retrohub.org>
 <20180906212511.0b720b5c@windsurf>
Message-ID: <20180907062558.imbz6siycccqnmzk@falbala.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

FWIW, yesterday I used DistroKit [1] master to build a SD card image
for RIoTboard and it just worked. You might have a look at that?

On Thu, Sep 06, 2018 at 09:25:11PM +0200, Thomas Petazzoni wrote:
> Please replace this by using genimage. For Freescale/NXP platforms,
> there is even a common genimage.cfg file. See how
> configs/freescale_imx6dlsabreauto_defconfig does it.
> 
> Thanks to genimage, it will directly produce a SD card image that has
> the bootloader, a partition table, etc.

+1, ptxdist/DistroKit also uses genimage for that:

https://git.pengutronix.de/cgit/DistroKit/tree/configs/platform-v7a/config/images/riotboard.config

> Is there a reason to still use a uImage ?

I don't think so, a generic arm zImage does well.

> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
> 
> Why 4.15 specifically ?

No need for that. The board runs a recent vanilla kernel v4.18.x.

HTH & Greets
Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180907/26605cc3/attachment.asc>
