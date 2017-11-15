From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Thu, 16 Nov 2017 00:20:36 +0300
Subject: [Buildroot] [PATCH/next 4/5] solidrun/macchiatobin: add new
 board
In-Reply-To: <20171114205302.GA2527@kwain>
References: <20171112201646.15558-1-geomatsi@gmail.com>
 <20171112201646.15558-5-geomatsi@gmail.com>
 <20171113122702.o63kfb7j4iny6sfl@sapphire.tkos.co.il>
 <20171113200610.ztfqw55iyk52i53a@speedy.hunter>
 <20171113233628.64f1e58d@windsurf.home>
 <20171114074148.GC25491@kwain>
 <20171114092024.juocxhwoaqd7xiql@bars>
 <20171114094237.GA4995@kwain>
 <20171114202700.dckpamhga4x5nfuc@speedy.hunter>
 <20171114205302.GA2527@kwain>
Message-ID: <20171115212036.owp6x4phejpelpdc@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Antoine,

Thanks for the update on upstream status of this board.

> > By the way, could you please advise how to switch eth0
> > from SFP to RJ45 when using mainline kernel 4.14 ?
> 
> You need to apply the dt patches I provided. You should then be able to
> use eth0 and eth1 with either an SFP or an RJ45 cable, depending on
> what's (dynamically) connected. To sum up, you just need to plugin
> either the SFP or the RJ45 cable to start using the interface in the
> right mode. You can switch from one to the other without rebooting the
> board.
> 
> To get this board supported in Buildroot with an upstream kernel, I
> would suggest to put the device tree patches I gave you, so that the
> kernel can not rely on the bootloader configuration. And as soon as 4.15
> is out the patches can be removed from Buildroot.

With those 3 dts patches J5 management interface is working fine
even with upstream U-Boot. So I will add those patches to board
files for the time being, just to enable network access to the board
right out of the box.

Regards,
Sergey
