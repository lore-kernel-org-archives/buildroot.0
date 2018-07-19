From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 19 Jul 2018 10:03:41 +0200
Subject: [Buildroot] [PATCH 2/5] board/boundarydevices: update
 post-build.sh for i.MX8MQ platforms
In-Reply-To: <20180719095843.2efcdd0a@windsurf>
References: <20180719073253.22433-1-gary.bisson@boundarydevices.com>
 <20180719073253.22433-3-gary.bisson@boundarydevices.com>
 <20180719095843.2efcdd0a@windsurf>
Message-ID: <20180719080341.GB23715@g751.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Jul 19, 2018 at 09:58:43AM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 19 Jul 2018 09:32:50 +0200, Gary Bisson wrote:
> > - Making sure to use proper ARCH for mkimage command
> > - Remove obsolete 6x_bootscript/6x_upgrade references
> > - Copy bootloader as u-boot.<defconfig_name>
> > 
> > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> 
> This patch is doing quite a few things that are in fact separate, which
> kind of calls for separate patches.

Ok.

> Removing the use of the obsolete 6x_bootscript and 6x_upgrade scripts
> should be one patch, which also removes those files (in the same patch).

Ok.

> Then, adding support for using a ARCH/UBOOT_BINARY value that depends
> on BR2_aarch64 should be another patch.

Ok.

> Finally, why do you copy the bootloader as u-boot.<defconfig_name> ?

That is actually what the upgrade.cmd looks for, it was wrong to copy it
as u-boot.imx in the first place anyway.
https://git.buildroot.net/buildroot/tree/board/boundarydevices/common/upgrade.cmd#n66

Regards,
Gary
