From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 10:07:23 +0200
Subject: [Buildroot] [PATCH 1/5] board/freescale/common/imx: make
 imx8-bootloader-prepare more generic
In-Reply-To: <20180719080023.GA23715@g751.home>
References: <20180719073253.22433-1-gary.bisson@boundarydevices.com>
 <20180719073253.22433-2-gary.bisson@boundarydevices.com>
 <20180719094527.6275cd12@windsurf>
 <20180719080023.GA23715@g751.home>
Message-ID: <20180719100723.4e421707@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Jul 2018 10:00:54 +0200, Gary Bisson wrote:

> > I don't think it's worth keeping some kind of "backward compatibility"
> > here. Just change configs/freescale_imx8mqevk_defconfig to pass the DTB
> > name as argument.  
> 
> Fair enough, I'm fine with that. However, should I keep the check on the
> arguments number to throw an error if no argument is provided?
> 
> Or is the check on UBOOT_DTB existence sufficient?

I think the latter is sufficient.

Or, alternatively, change the script radically to use getopt to avoid
using positional arguments. But I don't think it's worth the effort for
now, just keep things simple.

> I'll wait for a day before respinning the series to see if there are
> other comments.
> 
> Also, not related to the patch, the series doesn't appear "properly" in
> the mailing list archive, patches aren't answers to the cover letter.
> Other strange thing in Patchwork, patch 4/5 is part of "Untitled series
> #56383" instead of the real series, is it normal?
> I just want to make sure I'm not missing some settings in my
> git-send-email config although it just seems that the server
> received/treated the emails in the wrong order.

This is a known patchwork limitation. Your e-mails arrived out of order
(I was initially missing patch 3/5 here and the cover letter, and they
arrived a few minutes later). When e-mails arrive out of order,
patchwork gets confused and is not able to assign patches to the proper
series. IOW, there's no problem on your side, it's patchwork that
doesn't behave properly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
