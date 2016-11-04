From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Fri, 4 Nov 2016 14:01:58 +0100
Subject: [Buildroot] [PATCH 2/4] board: atmel: genimage: add 1M offset
 for FAT partition
In-Reply-To: <20161104114710.10ff39e6@free-electrons.com>
References: <20161103152000.04d6c15a@free-electrons.com>
 <20161104101517.7811-1-ludovic.desroches@atmel.com>
 <20161104114710.10ff39e6@free-electrons.com>
Message-ID: <20161104130158.i6pga25v22ismiml@rfolt0960.corp.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 04, 2016 at 11:47:10AM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 4 Nov 2016 11:15:17 +0100, Ludovic Desroches wrote:
> > With older SoCs and some SD cards, a 1024-bytes offset is needed to allow
> > ROM code to read the content of the FAT partition. As it is usual to get
> > a 1M bytes offset for the first partition, use this value to avoid boot
> > issues.
> > 
> > Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> > ---
> >  board/atmel/at91sam9x5ek_mmc/genimage.cfg     | 1 +
> >  board/atmel/sama5d2_xplained_mmc/genimage.cfg | 1 +
> >  board/atmel/sama5d3_xplained_mmc/genimage.cfg | 1 +
> >  board/atmel/sama5d4_xplained_mmc/genimage.cfg | 1 +
> >  4 files changed, 4 insertions(+)
> 
> I've applied to master, after removing the hunk changing
> board/atmel/at91sam9x5ek_mmc/genimage.cfg. Indeed, this file doesn't
> exist in master since I haven't committed your PATCH 1/4. It is indeed
> weird to:
> 
>  1/ Have patches making fixes *after* patches adding new features in a
>     patch series. It should be the other way around.
> 
>  2/ In PATCH 1/4, introduce a genimage.cfg file for the
>     at91sam9x5ek_mmc configuration that is wrong, and gets fixed in
>     PATCH 2/4.
> 

Sorry, in fact patch 1/4 was done for linux4sam_5.4 but I didn't sent it
because we had some issues with this release and we discovered the sd card
boot issue when testing the linux4sam_5.5 release.

> Anyway, this one is applied to master for SAMA5D{2,3,4}, we will handle
> 9x5EK separately.

Thanks

Ludovic

> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
