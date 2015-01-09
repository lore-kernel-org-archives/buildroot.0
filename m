From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 9 Jan 2015 21:21:20 +0100
Subject: [Buildroot] [PATCH] Linux kernel module for Waveshare 3.2inch
 RPi LCD (B) V3 touch controller
Message-ID: <trinity-3729d3fe-9b4d-466b-b7ff-526c7b743a64-1420834880672@3capp-gmx-bs63>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> Gesendet: Donnerstag, 08. Januar 2015 um 21:24 Uhr
> Von: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: buildroot at busybox.net
> Betreff: Re: [Buildroot] [PATCH] Linux kernel module for Waveshare 3.2inch RPi LCD (B) V3 touch controller
>
> Dear Peter Seiderer,
> 
> On Thu,  8 Jan 2015 21:09:55 +0100, Peter Seiderer wrote:
> > This kernel module enables the (easy?) using of the ADS7846 SPI touch controller
> > on Waveshare 3.2 LCD (B) modules.
> > 
> > Alternatives would be:
> > - the old way: add device definition/register call to arch/arm/mach-bcm2708/bcm2708.c
> > - the new way: use device tree support and add an entrie for ads7846
> 
> I'm sorry, this is not your fault, but this ads7846_device thing is an
> absolute abomination. Why is RaspberryPi *THE* platform propagating all
> the worst possible abominations? Why is it *THE* platform doing all the
> non-standard stuff? Why is it so crappy.
> 
> People, please read this: if you want to learn embedded Linux, don't
> buy Raspberry Pi. It is the worst platform ever in terms of embedded
> Linux development best practices. Ever.
> 
> Do yourself a favor, and buy properly supported stuff: the Atmel
> Xplained comes to mind, the BeagleBone Black as well of course.
> 
> Sorry, but this ads7846_device is just pure crap. The alternatives you
> mentioned are the only good solutions: change your board file if you're
> using an old style ARM kernel, or change your Device Tree if you're
> using a new style ARM kernel.
> 

No strong opinion for this patch from my side, primary goal was to
support Lou to get his waveshare32b running with buildroot...

The fbtft patch is more important (for me), because I use it myself
for my adafruit28 display (with uses an ft6x06 touchscreen for which
I added an old way arch/arm/mach-bcm2708/bcm2708.c board file patch)...

Maybe the way to go is to wait (or add?) for raspberry pi linux-3.18
kernel support in buildroot with device tree overlay support (see [1],[2])?

> I don't know what the policy of Buildroot should be about accepting
> crap, but on my side, I will not add such a package to Buildroot.
> 

Anyone with pro/con opinion?

> Again: don't take this personally, this is absolutely not against you.
> Just me being fed up with Raspberry Pi crap.
> 

No problem, was astonished too about the creative solutions (instead of
prober solutions) found for raspberry pi ;-)

But are other manufacturers so much better, TI/Freescale like to fork
kernel trees with proprietary extensions too (including closed source
libraries)?

My decision for raspberry pi was because of support for (hopefully)
good audio out (using the hifiberry dac, but not yet delivered)...

Regards,
Peter

[1] http://www.raspberrypi.org/documentation/configuration/pin-configuration.md
[2] http://www.raspberrypi.org/forums/viewtopic.php?f=29&t=93015

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> 
