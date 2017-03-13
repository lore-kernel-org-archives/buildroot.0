From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Mon, 13 Mar 2017 18:08:14 +0100
Subject: [Buildroot] [PATCH 2/2] ti-uim: bump to latest version
In-Reply-To: <20170313065401.mc43t7k34qkwy7di@tarshish>
References: <af8528c725dbee3b80a8a99b2adba50a6ff4114d.1489038337.git.baruch@tkos.co.il>
 <075bbc11df38f8280c99d15834ec461dad0d6654.1489038337.git.baruch@tkos.co.il>
 <20170309075330.vauudriqhipx3cq2@piout.net>
 <20170309172209.k76ucsihxbylnds6@tarshish>
 <20170309215203.ner2duo4ocnoiss5@piout.net>
 <20170313065401.mc43t7k34qkwy7di@tarshish>
Message-ID: <20170313170814.2uc4z36mh3qmeuuo@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/03/2017 at 08:54:01 +0200, Baruch Siach wrote:
> Thanks for the tip. Unfortunately hciattach doesn't work for me here.
> 
> Looking through the code I see that btwilink depends on st_drv. Both kernel 
> space st_drv and userspace hciattach_ti.c try to load the same .bts firmware 
> file. I can't see how that could work together.
> 
> Did you use a different Bluetooth driver with hciattach?
> 

Yep, my previous email was not clear but you simply don't use a kernel
driver when using hciattach. hciattach will directly communicate on the
serial interface.

Again, I didn't use that since 2013 so I'm not sure what the status is.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
