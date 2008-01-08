From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 9 Jan 2008 00:00:02 +0100
Subject: [Buildroot] How is the RM9200 status of buildroot ?
References: <05f701c85243$52e4c530$6e00a8c0@JONATHAN>
Message-ID: <01ce01c8524a$65be7fa0$080514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Hi all,
> 
> 
> 
> I juste started my new custom board and the cpu seem to work. I would like
> to start building my root file system and my file system. I would like to
> know if the buildroot for the RM9200 is working or I have to use something
> else ?
> 
> 
> 
> Regards
> 
> 
> 
> Jonathan
> 

Since I introduced the AT91RM9200 support I should answer.

The goal of the AT91RM9200 buildroot was to get 
AT45DB642 dataflash supported properly.

If your board is using a parallel flash, there will be some limitations.
Default configurations for linux won't work (but you can easily create your own)
The U-Boot version has never been tested with recent parallel flash.
There is no at91bootstrap/dataflashboot, so you have to rely
on U-Boot to copy itself to SDRAM, not hard but not tested.

Buildroot contains applications which run and others which doesn't,
so you have to figure out why.
Some applications will run using the uclibc toolchain built by buildroot,
and others will only run if you use an external glibc based toolchain.

To get a basic system running is very easy, compared to other build systems I tested.

Twas some time since I loaded the AT91RM9200 on a target, since
I mostly spend time on the AT91SAM926x nowadays,
but if you find a problem, they can usually be fixed quite fast.


Best Regards
Ulf Samuelsson
