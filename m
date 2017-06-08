From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 08 Jun 2017 21:23:31 +0200
Subject: [Buildroot] [PATCH v2 1/1] board/orangepi: add basic support
	for orangepi-zero board
In-Reply-To: <20170524215033.16342-1-geomatsi@gmail.com> (Sergey Matyukevich's
 message of "Thu, 25 May 2017 00:50:33 +0300")
References: <20170524215033.16342-1-geomatsi@gmail.com>
Message-ID: <87poee9tcc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergey" == Sergey Matyukevich <geomatsi@gmail.com> writes:

 > This patch adds basic support for orangepi-zero board.
 > Board support package includes the following components:

 > - mainline kernel v4.11
 > - mainline u-boot v2017.03
 > - extra kernel config options: spidev, spi nor flash, wifi
 > - dts patches to enable SPI NOR and spidev

 > More details about this board are available here:
 > - http://linux-sunxi.org/Orange_Pi_Zero

 > Note that at the moment networking is not supported right out of the box.
 > Ethernet submission to mainline kernel is a work in progress, see the
 > latest dwmac-sun8i branches at https://github.com/montjoie/linux

 > On-board SDIO WiFi chip XR819 is supported by off-the-tree wireless
 > driver available at https://github.com/fifteenhex/xradio

Any plans for submitting a package for that?

 > +++ b/board/orangepi/orangepi-zero/genimage.cfg
 > @@ -0,0 +1,36 @@
 > +# Minimal SD card image for the OrangePi PC

Typo: s/PC/Zero/

> +++ b/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch
 > @@ -0,0 +1,42 @@
 > +From 068c3baff3048a3db4ef2518ff917ce749cd8169 Mon Sep 17 00:00:00 2001
 > +From: Sergey Matyukevich <geomatsi@gmail.com>
 > +Date: Sat, 20 May 2017 11:24:26 +0300
 > +Subject: [PATCH 2/3] ARM: dts: orange-pi-zero: enable SPI NOR

Please drop the 2/3, they tend to get out of date.

> +
 > +Enable SPI NOR on orange-pi-zero board.
 > +
 > +For more information see:
 > +- http://linux-sunxi.org/Orange_Pi_Zero#SPI_NOR_flash
 > +
 > +Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

It would be nicer to add the v2 version that got merged, but oh well.

Committed with the typo fixed, thanks.

-- 
Bye, Peter Korsgaard
