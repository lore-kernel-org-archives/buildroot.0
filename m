From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Nov 2017 23:36:28 +0100
Subject: [Buildroot] [PATCH/next 4/5] solidrun/macchiatobin: add new
 board
In-Reply-To: <20171113200610.ztfqw55iyk52i53a@speedy.hunter>
References: <20171112201646.15558-1-geomatsi@gmail.com>
 <20171112201646.15558-5-geomatsi@gmail.com>
 <20171113122702.o63kfb7j4iny6sfl@sapphire.tkos.co.il>
 <20171113200610.ztfqw55iyk52i53a@speedy.hunter>
Message-ID: <20171113233628.64f1e58d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Nov 2017 23:06:10 +0300, Sergey Matyukevich wrote:

> This issue is not specific to MacchiatoBin board. I observed it last week
> testing images for another arm64 board - Orange Pi Zero Plus2 board.
> I haven't investigated it yet.
> 
> Meanwhile this is not the only problem with mainline BSP. It turned out that
> network interfaces do not work properly neither on v4.13.11 nor in fresh v4.14.
> Kernel v4.13.11 doesn't enable them in DTS. Kernel v4.14 does enable them,
> but I couldn't make them work: Tx looks ok, but no Rx. Meanwhile on kernel from
> devel-4.14/all branch from https://github.com/MISL-EBU-System-SW/mainline-public
> management 1Gb interface appears to be working fine.

The fact that network interfaces don't work on mcbin with the stock
4.14 is not expected. I've added in Cc: my colleague Antoine T?nart who
worked on this topic.

Antoine, do you know which patches are missing in 4.14 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
