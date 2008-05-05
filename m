From: Leonid <Leonid@a-k-a.net>
Date: Mon, 5 May 2008 07:54:13 -0700
Subject: [Buildroot] ATMEL SAM9 board
In-Reply-To: <290b1c870805020215s4d472318kdc72eddfc601f848@mail.gmail.com>
References: <290b1c870805020215s4d472318kdc72eddfc601f848@mail.gmail.com>
Message-ID: <406A31B117F2734987636D6CCC93EE3C0252938E@ehost011-3.exch011.intermedia.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am using buildroot on at91rm9200 based platform with NOR flash. It's
not latest buildroot, but the one published by Ulf Samuelson in 2006.
Leonid.

________________________________________
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org]
On Behalf Of pen ontable
Sent: Friday, May 02, 2008 2:15 AM
To: buildroot
Subject: [Buildroot] ATMEL SAM9 board

Hi all,

I have a prototype board based on AT91RM9200+AT45DB64.
I have evaluated the buildroot framework starting from the at91rm9200df
configurations set that is tailored on the AT91RM9200-EK. Changes were
made since my board has a different ethernet PHY and a different GPIO
map, to leds, MMC/SD, etc.. 

The most important difference with respect the at91rm9200df
configurations set is that I need the linux kernel mounts the root fs
read-write on the dataflash. 
I have changed the u-boot bootcmd and bootargs accordingly (defenv) and
the linux kernel .config in order to use only the legacy AT91RM9200 SPI
driver (the only SPI driver that detects the dataflash).

U-boot and linux work fine but I still have problems with the file
system image. It seems that the kernel doesn't find initrc (busybox),
there are not scripts outputs to console.

I suppose the problems can be solved (hints will be appreciated) but I
have to decide between keeping the AT91RM9200 board as production board
or to design a new board based on another ATMEL SAM9.

My question is: in your opinion/experience how good buildroot supports
ATMEL SAM9 + Dataflash or ATMEL SAM9 + NOR Flash platforms? 

Thank you,

Mike.
