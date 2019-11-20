From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 10:36:25 +0100
Subject: [Buildroot] [EXT] Re: [PATCH 6/9]
 package/freescale-qoriq/cadence: new package
In-Reply-To: <VI1PR04MB51363A932B60CC5F422C9A4AFE4F0@VI1PR04MB5136.eurprd04.prod.outlook.com>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
 <20191120040725.32207-7-jerry.huang@nxp.com>
 <20191120101322.00088afe@windsurf.home>
 <VI1PR04MB51363A932B60CC5F422C9A4AFE4F0@VI1PR04MB5136.eurprd04.prod.outlook.com>
Message-ID: <20191120103625.5413f1cc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Nov 2019 09:30:26 +0000
Jerry Huang <jerry.huang@nxp.com> wrote:

> > Also, "cadence" is not descriptive enough as a package name.
> > freescale-qoriq-cadence-dp-firmware perhaps? It's a bit long, but at least it's
> > descriptive.  
> I think "cadence-dp-firmware" can be used for its name.
> Because it is under sub-directory " freescale-qoriq", 
> we can remove the prefix " freescale-qoriq" from package name.

Being inside the freescale-qoriq doesn't improve things in any way: the
namespace of package names (and therefore variables) is global in
Buildroot.

> > Indentation is not correct, we also need a link to some upstream web site that
> > gives details about this firmware.  
> Sure, I will adjust it.
> 
> > Just curious: the DisplayPort really needs a firmware that runs on the main CPU,
> > at EL3 ? This is pretty scary :-/ How does it get loaded ?  
> Yes, LS1028ARDB need this firmware for display port.
> We used the command "hdp load" in uboot before starting Linux kernel.

OK. Where is this firmware image stored? You just install it to
$(BINARIES_DIR). Should it be installed in the rootfs instead, so that
U-Boot can pick it up from there ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
