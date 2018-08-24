From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 23:18:24 +0200
Subject: [Buildroot] [PATCH] rauc: add patch to make it build with Linux
 < 3.0
In-Reply-To: <20180824210956.GQ9365@scaer>
References: <20180824123517.25634-1-thomas.petazzoni@bootlin.com>
 <20180824210956.GQ9365@scaer>
Message-ID: <20180824231824.228ae0e5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Aug 2018 23:09:56 +0200, Yann E. MORIN wrote:

> On 2018-08-24 14:35 +0200, Thomas Petazzoni spake thusly:
> > This commit adds a patch to RAUC that makes the eMMC boot partition
> > support optional. This allows RAUC to build successfully on systems
> > using Linux < 3.0.  
> 
> In your haste in proving me wrong with this emmc in rauc issue, you
> forgot a very important and crucial point: you are touching configure.ac
> with this patch, so you need RAUC_AUTORECONF = YES . ;-)

Gaah, indeed! In fact, I only tested the patch outside of the context
of Buildroot, forcing ac_cv_header_linux_mmc_ioctl_h=no to test the
Linux < 3.0 case.

> Sarcasm aside, with the above fixed:
> 
>     Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>     Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> To test this, apart the autoreconf change, I also removed that
> looked-for header from my system, to be sure to have the test fail.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
