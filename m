From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Fri, 04 Apr 2008 14:59:57 +0200
Subject: [Buildroot] Flash for AT91RM9200
In-Reply-To: <6090c5eb0804040554w3d675e90q52c6bd8724925374@mail.gmail.com>
References: <039401c895a7$61f39304$85f0af0a@corp.atmel.com>
	<6090c5eb0804040452s11dc749m4fb3c1e44c341295@mail.gmail.com>
	<1207311272.1106.4.camel@localhost>
	<6090c5eb0804040554w3d675e90q52c6bd8724925374@mail.gmail.com>
Message-ID: <1207313997.1106.15.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2008-04-04 at 14:54 +0200, Jorge S. wrote:
> Hi Hans:
> 
> Thanks for your urgent reply. 
> 
> What do you think about a combo solution? 
> 
> - SPI Dataflash for booting

Does not work for AVR32 devices, AVR32 AP700X only supports booting from
NOR flash. Will be changed in future devices though.

> - Some at least 128 MiB Flash for rootfs...
> 

Seems sane, depends on your application. I guess GUI with tons of
graphics?

> Any known problem on the AVR32 world with big nand flashes? 
> 

I have heard one report on 2 GB NAND device being slow to mount, but
that may be kernel JFFS2 related and/or extreme slow once when writing
cleanmarkers problem.

Others report 1 GB being fast and nifty.

PS! I only work with AVR32 products, so I have little knowledge about
the ARM line. I guess Ulf can fill in the missing spots.


-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
