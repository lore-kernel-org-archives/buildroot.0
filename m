From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 25 Oct 2007 18:51:35 +0200
Subject: [Buildroot] Dataflash rootfs problems (still)
References: <6090c5eb0710240920o4e56f66et2c9f1761c97aea4e@mail.gmail.com>
	<1193243618.4415.6.camel@aeglos.sweden.atmel.com>
	<6090c5eb0710240954q368b3409k282c02a5e2fcbef4@mail.gmail.com>
	<471F904A.5050206@promwad.com>
	<1193266654.4415.21.camel@aeglos.sweden.atmel.com>
	<6090c5eb0710250917o712570e1u28d1264d4d6bc4f7@mail.gmail.com>
	<006401c81724$6ccbdba0$7b00000a@atmel.com>
	<6090c5eb0710250946h4e180f83gbe06b1991a2a2159@mail.gmail.com>
Message-ID: <00de01c81728$f9ce0ba0$7b00000a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, i'll give a try, as far as i'm concerned there are two choices for SPI
driver on the kernel:

- AT91_SPI
- ATMEL_SPI

Which one is better?, i've tested ATMEL_SPI this afternoon, but the kernel
doesn't detects my dataflash, can you point me to a source of information to
read steps to define my dataflash speed and get detected on boot?.

==> The AT91_SPI is the original SPI for AT91
        The Atmel_SPI is a newer version which also supports AVR32.
        This is probably the one to go for long term, but I did not try it myself.
        Try disabling the SD/MMC card interface.
        You probably want to address questions like this to the linux kernel mailing
        list instead of the buildroot list.

My previous kernel was detecting the dataflash itself, but when i define the
speed on my board config, the dataflash isn't detected anymore.

2007/10/25, Ulf Samuelsson <ulf@atmel.com>:
>
> > What about using the SPI bitbang driver for the AT91??
> >
>
>
> Not a good idea since you are transferring large amount of data.
> Better to use the PDC and the H/W SPI.
> Just set down the speed of the SPI.
>
> >> ons 2007-10-24 klockan 21:34 +0300 skrev Ivan Kuten:
> >> > >
> >> > > During the 1st boot, Dropbear creates and "writes" the generated
> keys,
> >> maybe
> >> > > is this *write* operation the one screwing up the dataflash?
> >> > >
> >> >
> >> > We have similar problems with Dataflash&RM9200
> >> > *write* operation is unreliable - we had corrupted filesystem after
> >> reboot.
> >> > Our solution was to use r/o only on dataflash.
> >> >
> >>
> >> I would reduce speed to 5 Mbps or lower. or implement the external
> gate.
> >> Moving to the AT91SAM9260 is of course a nice alternative.
> >> Lower cost, (soon) much higher speed (with the AT91SAM9260A)
> >> Better BootROM (I defined it :-)
> >>
> >>
>


Best Regards
Ulf Samuelsson
