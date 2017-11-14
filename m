From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 14 Nov 2017 23:27:00 +0300
Subject: [Buildroot] [PATCH/next 4/5] solidrun/macchiatobin: add new
 board
In-Reply-To: <20171114094237.GA4995@kwain>
References: <20171112201646.15558-1-geomatsi@gmail.com>
 <20171112201646.15558-5-geomatsi@gmail.com>
 <20171113122702.o63kfb7j4iny6sfl@sapphire.tkos.co.il>
 <20171113200610.ztfqw55iyk52i53a@speedy.hunter>
 <20171113233628.64f1e58d@windsurf.home>
 <20171114074148.GC25491@kwain>
 <20171114092024.juocxhwoaqd7xiql@bars>
 <20171114094237.GA4995@kwain>
Message-ID: <20171114202700.dckpamhga4x5nfuc@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Antoine,

> > Thanks for detailed summary of mcbin networking support. However it sill looks
> > like there is a missing piece here. I have checked behavior of both mainline 4.14
> > (516fb7f2e73dcc) and marvell-mainline devel-4.14/all (a3d9036af3c6033). I did no
> > changes to kernel/dts/defconfig at all other than enabling Marvell PHYs for mainline
> > kernel. But the result is still the same: 1Gb eth2 interface works with devel-4.14/all,
> > but doesn't work with mainline. Though PHY is recognized and attached, mii-diag also
> > provides sane report. Tx packet counter in ifconfig is increased, but no packets
> > on wire.
> > 
> > Probably I am missing something obvious. I will do more checks and comparisons
> > later this week. Setup is just the same: mainline U-Boot 2017.09 and images
> > built using this patchset.
> 
> Note that I never tested with the upstream U-Boot. Do the interfaces
> work in U-Boot?

No, interfaces do not work in U-Boot. Probably U-Boot matters,
but even with the same mainline U-Boot interface eth2 works
just fine on devel-4.14/all kernel.

By the way, could you please advise how to switch eth0
from SFP to RJ45 when using mainline kernel 4.14 ?

Regards,
Sergey
