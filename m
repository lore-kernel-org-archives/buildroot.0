From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 19 Jul 2018 10:15:17 +0200
Subject: [Buildroot] [PATCH 2/5] board/boundarydevices: update
 post-build.sh for i.MX8MQ platforms
In-Reply-To: <20180719100837.5f35ecfa@windsurf>
References: <20180719073253.22433-1-gary.bisson@boundarydevices.com>
 <20180719073253.22433-3-gary.bisson@boundarydevices.com>
 <20180719095843.2efcdd0a@windsurf>
 <20180719080341.GB23715@g751.home>
 <20180719100837.5f35ecfa@windsurf>
Message-ID: <20180719081517.GA24518@g751.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Jul 19, 2018 at 10:08:37AM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 19 Jul 2018 10:03:41 +0200, Gary Bisson wrote:
> 
> > > Finally, why do you copy the bootloader as u-boot.<defconfig_name> ?  
> > 
> > That is actually what the upgrade.cmd looks for, it was wrong to copy it
> > as u-boot.imx in the first place anyway.
> > https://git.buildroot.net/buildroot/tree/board/boundarydevices/common/upgrade.cmd#n66
> 
> And so the upgrade.cmd logic is broken today, independently from the
> i.MX8 addition? If so, that definitely calls for a separate patch.

Yes, although you could set uboot_defconfig to "imx" and then it would
work(around). It became clear this wasn't the solution now that U-Boot
doesn't produce u-boot.imx for ARM64.

> (However, it's not clear to me why you had two upgrade scripts, and
> which one was used in which situation).

It was legacy, 6x_upgrade was created at the beginning of our i.MX6
journey. But since we switched to U-Boot v2017.07, we used standard
bootdistro variables and renamed the script to be more generic:
upgrade.scr.
https://git.buildroot.net/buildroot/commit/board/boundarydevices/common?id=505ae63b

Regards,
Gary
