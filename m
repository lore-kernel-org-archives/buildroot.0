From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 11:31:53 +0100
Subject: [Buildroot] [EXT] Re: [PATCH] boot/mv-ddr-marvell: support
 custom GIT settings
In-Reply-To: <SN2PR18MB07361F184E2286FF9C3EB1B0CAB40@SN2PR18MB0736.namprd18.prod.outlook.com>
References: <20181224131814.20804-1-kostap@marvell.com>
 <20181224185742.GF2703@scaer>
 <SN2PR18MB07361F184E2286FF9C3EB1B0CAB40@SN2PR18MB0736.namprd18.prod.outlook.com>
Message-ID: <20181226113153.696dc370@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Kostya,

On Tue, 25 Dec 2018 09:09:26 +0000, Kostya Porotchkin wrote:

> > As I see you're an @marvell.com, do you need that to use an internal
> > repository during development? If so, then why can't you just use the
> > OVERRIDE_SRCDIR mechanism instead?  
> [KP] It is more than just a local repository. I have to allow CI server to automatically build test and release images from the current internal GIT trees.

Sorry, but this is not a valid justification. With this justification,
we would have to add version selection to *all* Buildroot packages.
Indeed, one might want to do CI testing on any random user-space
library or application. So if your use-case for wanting version
selection in mv-ddr-marvell is CI testing, then we won't accept this
patch.

However, if people porting ATF/U-Boot to new Marvell-based platforms
need to have their own custom version of mv-ddr-marvell, then having
version selection can be accepted because it puts this package in the
same situation as uboot, linux or atf, where we do offer version
selection.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
