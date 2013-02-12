From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Feb 2013 22:50:43 +0100
Subject: [Buildroot] need smaller filesystem for NOR
In-Reply-To: <511A7C8E.9010407@mind.be>
References: <1360344317.17385.31.camel@genx.eng.msli.com>
 <20130208183807.2b2fe572@skate>
 <1360359245.28641.79.camel@genx.eng.msli.com>
 <1360628370.13529.110.camel@genx> <511A7C8E.9010407@mind.be>
Message-ID: <20130212225043.4ecc0f25@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 12 Feb 2013 18:31:58 +0100, Arnout Vandecappelle wrote:

>   A jffs2 filesystem should be mounted through /dev/mtdN, not through 
> /dev/mtdblockN. So root=/dev/mtd13 is a better idea.

Really? I've always used root=/dev/mtdblockX without any problems. Your
statement even seems to contradict
http://www.linux-mtd.infradead.org/faq/jffs2.html#L_mtdblock :

"""
There are two cases where this does not work. The first is when JFFS2
is used as a root filesystem. For now, this requires the mtdblock
device to be specified for root= on the kernel command line. The second
case is when the mount binary that is being used does not play nicely
with the above format. The BusyBox version of mount is known to not
work without the mtdblock device. 
"""


> > Next I tried to edit my jffs options in the .config for my recovery
> > 'failsafe' buildroot:
> > Filesystem images  --->
> >   [*] jffs2 root filesystem
> >   Flash Type (Select custom page and erase size)  --->
> >   (0x1065) Page Size
> >   (0xC60) Erase block size
> 
>   Those numbers are unlikely. 0x1065 is a very odd number (literally). 
> Also, the erase block size is always larger than the page size, and for 
> NOR I think it's normally equal to it.

I remember dataflash having bizarre erase block sizes, but I don't
think it was an odd number.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
