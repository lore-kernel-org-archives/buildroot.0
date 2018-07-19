From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 10:08:37 +0200
Subject: [Buildroot] [PATCH 2/5] board/boundarydevices: update
 post-build.sh for i.MX8MQ platforms
In-Reply-To: <20180719080341.GB23715@g751.home>
References: <20180719073253.22433-1-gary.bisson@boundarydevices.com>
 <20180719073253.22433-3-gary.bisson@boundarydevices.com>
 <20180719095843.2efcdd0a@windsurf>
 <20180719080341.GB23715@g751.home>
Message-ID: <20180719100837.5f35ecfa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Jul 2018 10:03:41 +0200, Gary Bisson wrote:

> > Finally, why do you copy the bootloader as u-boot.<defconfig_name> ?  
> 
> That is actually what the upgrade.cmd looks for, it was wrong to copy it
> as u-boot.imx in the first place anyway.
> https://git.buildroot.net/buildroot/tree/board/boundarydevices/common/upgrade.cmd#n66

And so the upgrade.cmd logic is broken today, independently from the
i.MX8 addition? If so, that definitely calls for a separate patch.

(However, it's not clear to me why you had two upgrade scripts, and
which one was used in which situation).

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
