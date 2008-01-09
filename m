From: Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>
Date: Wed, 9 Jan 2008 10:44:15 -0500
Subject: [Buildroot] How is the RM9200 status of buildroot ?
In-Reply-To: <01ce01c8524a$65be7fa0$080514ac@atmel.com>
References: <05f701c85243$52e4c530$6e00a8c0@JONATHAN>
	<01ce01c8524a$65be7fa0$080514ac@atmel.com>
Message-ID: <002601c852d6$7d1d72a0$6e00a8c0@JONATHAN>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I would like to thanks you guys to point me to the right thing. 

Here a little bit of information about our board.

CPU = RM9200
FLASH = AT49BV642D connected in a 16bit data bus SDRAM = 2 x
MT48LC8M16A2P-7E from Micron Technology. We have 2 SDRAM connected in
parallel with 16 bits databus. I think we based this design on the dk board
supplies by atmel. 

Since a relatively new to all of the arm9 cpu + linux, I think I will have
some fun to get all of this working :)

I would like to know if it is possible to do some basinc testing on my board
to know if my memories setup is working correctly before going to far with
linux etc. ? I have acces to a jtag interface if this can help. 

Regards

Jonathan

-----Message d'origine-----
De?: buildroot-bounces at uclibc.org [mailto:buildroot-bounces at uclibc.org] De
la part de Ulf Samuelsson
Envoy??: 8 janvier 2008 18:00
??: buildroot at uclibc.org
Objet?: Re: [Buildroot] How is the RM9200 status of buildroot ?


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
Default configurations for linux won't work (but you can easily create your
own)
The U-Boot version has never been tested with recent parallel flash.
There is no at91bootstrap/dataflashboot, so you have to rely
on U-Boot to copy itself to SDRAM, not hard but not tested.

Buildroot contains applications which run and others which doesn't,
so you have to figure out why.
Some applications will run using the uclibc toolchain built by buildroot,
and others will only run if you use an external glibc based toolchain.

To get a basic system running is very easy, compared to other build systems
I tested.

Twas some time since I loaded the AT91RM9200 on a target, since
I mostly spend time on the AT91SAM926x nowadays,
but if you find a problem, they can usually be fixed quite fast.


Best Regards
Ulf Samuelsson
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
