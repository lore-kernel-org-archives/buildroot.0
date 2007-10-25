From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Thu, 25 Oct 2007 21:48:16 +0300
Subject: [Buildroot] Dataflash rootfs problems (still)
In-Reply-To: <006401c81724$6ccbdba0$7b00000a@atmel.com>
References: <6090c5eb0710240920o4e56f66et2c9f1761c97aea4e@mail.gmail.com>
	<1193243618.4415.6.camel@aeglos.sweden.atmel.com>
	<6090c5eb0710240954q368b3409k282c02a5e2fcbef4@mail.gmail.com>
	<471F904A.5050206@promwad.com>
	<1193266654.4415.21.camel@aeglos.sweden.atmel.com>
	<6090c5eb0710250917o712570e1u28d1264d4d6bc4f7@mail.gmail.com>
	<006401c81724$6ccbdba0$7b00000a@atmel.com>
Message-ID: <4720E4F0.20701@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson wrote:
>> What about using the SPI bitbang driver for the AT91??
>>
> 
> 
> Not a good idea since you are transferring large amount of data.
> Better to use the PDC and the H/W SPI.
> Just set down the speed of the SPI.
> 

It was some discussion about Atmel SPI and RM9200 on spi-devel mailing list and as far as I know
Atmel SPI (H/W SPI) is not working for RM9200 - that why Andrew Victor (AT91 maintainer)
still maintaining mtd_dataflash and at91 spi bitbang in his AT91 patches.
I reported about a half of year ago that it's still not working with RM9200.

You have only choice SPI bitbang on lower speed and verify data that is read and written.

Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
