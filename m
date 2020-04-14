From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 14 Apr 2020 08:46:24 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/mfgtools: drop package
In-Reply-To: <3e5e773be990132bab2d0067c5e2d69d02c8fe31.camel@embedded.rocks>
References: <20200109191020.1282319-1-joerg.krause@embedded.rocks>
 <20200109191020.1282319-2-joerg.krause@embedded.rocks>
 <20200210162656.GD335587@p1g2.work>
 <3e5e773be990132bab2d0067c5e2d69d02c8fe31.camel@embedded.rocks>
Message-ID: <20200414064624.GA277362@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jorg,

On Mon, Apr 13, 2020 at 10:24:06PM +0200, J?rg Krause wrote:
> Hi Gary,
> 
> On Mon, 2020-02-10 at 17:26 +0100, Gary Bisson wrote:
> > Hi Jorge,
> > 
> > On Thu, Jan 09, 2020 at 08:10:20PM +0100, J?rg Krause wrote:
> > > As suggested in [1] the package mfgtools is dropped.
> > > 
> > > NXP did replaced the old mfgtools with the version number 0.2
> > > enterily with the uuu (Universal Update Utility) which is somehow
> > > named mfgtools 3.0 although the version scheme for the uuu tool is
> > > 1.xx.yyy.
> > > 
> > > As the old mfgtools scripts are not compatible with the new uuu
> > > tool and as imx-uuu goes hand-in-hand with imx-uuc, which we ship
> > > for the target, the mfgtools package is dropped.
> > 
> > I know I'm the one who pushed for that commit to happen but now want to
> > mitigate the claim above.
> 
> Thanks for your feedback and sorry for my late reply.
> 
> > True uuu depends on imx-uuc and mfgtools (1st of its name) too. BUT by
> > looking at imx-uuc, the two use cases are separated into 2 different
> > files:
> > - uu.c: daemon that uses utp protocol to communicate with host
> > - ufb.c: daemon that uses fastboot protocol to communicate with host
> 
> In fact, I am using mfgtools without imx-uuc, but with U-Boot.
> 
> > So I think it should be safe to have both host clients co-existing for
> > now. Maybe uu.c will be removed at some point in the future but I guess
> > NXP will leave it there for a while.
> 
> So, lets just update mfgtools to latest version (1.3.154), right?

No, mfgtools 1.x.y really is 'uuu', not mfgtools any more.

So since 'mfgtools' doesn't have any more build issues, I'd say we keep
it as-is for people that use it. So the idea is _not_ to drop it.

Then just have your uuu addition patch, so basically both tools
co-exist in Buildroot (as they serve different purposes).

Regards,
Gary
