From: Gary Bisson <bisson.gary@gmail.com>
Date: Mon, 10 Feb 2020 17:26:56 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/mfgtools: drop package
In-Reply-To: <20200109191020.1282319-2-joerg.krause@embedded.rocks>
References: <20200109191020.1282319-1-joerg.krause@embedded.rocks>
 <20200109191020.1282319-2-joerg.krause@embedded.rocks>
Message-ID: <20200210162656.GD335587@p1g2.work>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jorge,

On Thu, Jan 09, 2020 at 08:10:20PM +0100, J?rg Krause wrote:
> As suggested in [1] the package mfgtools is dropped.
> 
> NXP did replaced the old mfgtools with the version number 0.2
> enterily with the uuu (Universal Update Utility) which is somehow
> named mfgtools 3.0 although the version scheme for the uuu tool is
> 1.xx.yyy.
> 
> As the old mfgtools scripts are not compatible with the new uuu
> tool and as imx-uuu goes hand-in-hand with imx-uuc, which we ship
> for the target, the mfgtools package is dropped.

I know I'm the one who pushed for that commit to happen but now want to
mitigate the claim above.

True uuu depends on imx-uuc and mfgtools (1st of its name) too. BUT by
looking at imx-uuc, the two use cases are separated into 2 different
files:
- uu.c: daemon that uses utp protocol to communicate with host
- ufb.c: daemon that uses fastboot protocol to communicate with host

So I think it should be safe to have both host clients co-existing for
now. Maybe uu.c will be removed at some point in the future but I guess
NXP will leave it there for a while.

Regards,
Gary
