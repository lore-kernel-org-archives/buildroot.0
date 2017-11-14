From: Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>
Date: Tue, 14 Nov 2017 21:53:02 +0100
Subject: [Buildroot] [PATCH/next 4/5] solidrun/macchiatobin: add new
 board
In-Reply-To: <20171114202700.dckpamhga4x5nfuc@speedy.hunter>
References: <20171112201646.15558-1-geomatsi@gmail.com>
 <20171112201646.15558-5-geomatsi@gmail.com>
 <20171113122702.o63kfb7j4iny6sfl@sapphire.tkos.co.il>
 <20171113200610.ztfqw55iyk52i53a@speedy.hunter>
 <20171113233628.64f1e58d@windsurf.home>
 <20171114074148.GC25491@kwain>
 <20171114092024.juocxhwoaqd7xiql@bars>
 <20171114094237.GA4995@kwain>
 <20171114202700.dckpamhga4x5nfuc@speedy.hunter>
Message-ID: <20171114205302.GA2527@kwain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergey,

On Tue, Nov 14, 2017 at 11:27:00PM +0300, Sergey Matyukevich wrote:
> 
> No, interfaces do not work in U-Boot. Probably U-Boot matters,
> but even with the same mainline U-Boot interface eth2 works
> just fine on devel-4.14/all kernel.

This is expected. The mainline 4.14 kernel relies on the U-Boot
configuration for some parts while the devel-4.14/all contains all the
patches to configure the network interfaces (+ comphy) from scratch.

So, it seems to me the upstream U-Boot 2017.09 has an issue while
configuring the network interface. There are chances the issue is within
the comphy configuration / driver in this U-Boot version.

> By the way, could you please advise how to switch eth0
> from SFP to RJ45 when using mainline kernel 4.14 ?

You need to apply the dt patches I provided. You should then be able to
use eth0 and eth1 with either an SFP or an RJ45 cable, depending on
what's (dynamically) connected. To sum up, you just need to plugin
either the SFP or the RJ45 cable to start using the interface in the
right mode. You can switch from one to the other without rebooting the
board.

To get this board supported in Buildroot with an upstream kernel, I
would suggest to put the device tree patches I gave you, so that the
kernel can not rely on the bootloader configuration. And as soon as 4.15
is out the patches can be removed from Buildroot.

Antoine

-- 
Antoine T?nart, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
