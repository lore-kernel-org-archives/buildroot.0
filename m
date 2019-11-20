From: Jerry Huang <jerry.huang@nxp.com>
Date: Wed, 20 Nov 2019 09:47:36 +0000
Subject: [Buildroot] [EXT] Re: [PATCH 6/9]
 package/freescale-qoriq/cadence: new package
In-Reply-To: <20191120103625.5413f1cc@windsurf.home>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
 <20191120040725.32207-7-jerry.huang@nxp.com>
 <20191120101322.00088afe@windsurf.home>
 <VI1PR04MB51363A932B60CC5F422C9A4AFE4F0@VI1PR04MB5136.eurprd04.prod.outlook.com>
 <20191120103625.5413f1cc@windsurf.home>
Message-ID: <VI1PR04MB513630CF20C32B7E238E9E55FE4F0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Best Regards
Jerry Huang

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Wednesday, November 20, 2019 5:36 PM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: buildroot at busybox.net
> Subject: Re: [EXT] Re: [Buildroot] [PATCH 6/9] package/freescale-qoriq/cadence:
> new package
> 
> Caution: EXT Email
> 
> Hello,
> 
> On Wed, 20 Nov 2019 09:30:26 +0000
> Jerry Huang <jerry.huang@nxp.com> wrote:
> 
> > > Also, "cadence" is not descriptive enough as a package name.
> > > freescale-qoriq-cadence-dp-firmware perhaps? It's a bit long, but at
> > > least it's descriptive.
> > I think "cadence-dp-firmware" can be used for its name.
> > Because it is under sub-directory " freescale-qoriq", we can remove
> > the prefix " freescale-qoriq" from package name.
> 
> Being inside the freescale-qoriq doesn't improve things in any way: the
> namespace of package names (and therefore variables) is global in Buildroot.
> 
> > > Indentation is not correct, we also need a link to some upstream web
> > > site that gives details about this firmware.
> > Sure, I will adjust it.
> >
> > > Just curious: the DisplayPort really needs a firmware that runs on
> > > the main CPU, at EL3 ? This is pretty scary :-/ How does it get loaded ?
> > Yes, LS1028ARDB need this firmware for display port.
> > We used the command "hdp load" in uboot before starting Linux kernel.
> 
> OK. Where is this firmware image stored? You just install it to $(BINARIES_DIR).
> Should it be installed in the rootfs instead, so that U-Boot can pick it up from
> there ?
The post image scripts will create one full images including uboot, rcw, firmware, kernel ITB/rootfs.
This firmware is stored NOR flash if booting the board from QSPI/FlexSPI boot,
Or it is stored one partition on SD/eMMC when booting from SD card or eMMC chip.

Then, U-boot can pick it up from flash, SD or eMMC.

> Thanks,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.c
> om&amp;data=02%7C01%7Cjerry.huang%40nxp.com%7C7af319f85d8c4ad276
> 4008d76d9d1d2e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637
> 098393876225198&amp;sdata=%2F8LtHwidlTszcsesa9IwePY%2FUJQt7iuJQi%2F
> T%2BfSOu9w%3D&amp;reserved=0
