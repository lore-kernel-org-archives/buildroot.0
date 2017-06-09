From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Fri, 9 Jun 2017 17:38:53 +0300
Subject: [Buildroot] [PATCH v2 1/1] board/orangepi: add basic support
 for orangepi-zero board
In-Reply-To: <87poee9tcc.fsf@dell.be.48ers.dk>
References: <20170524215033.16342-1-geomatsi@gmail.com>
 <87poee9tcc.fsf@dell.be.48ers.dk>
Message-ID: <20170609143853.vrv5525g7zatymy7@bars>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  > On-board SDIO WiFi chip XR819 is supported by off-the-tree wireless
>  > driver available at https://github.com/fifteenhex/xradio
> 
> Any plans for submitting a package for that?

It doesn't look like xradio driver or its flavors are anywhere on its way to
mainline kernel. So yes, I plan to add this package to simplify the use of
zero board right out of the box.

Meanwhile I have some doubts about supplementary firmware package.
IIUC normally xr819 firmware is extracted from vendor's SDK.
Extracted firmware can be obtained e.g. from Armbian project.
Would it be alright to point at Armbian github in firmware package ?

> > +++ b/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch
>  > @@ -0,0 +1,42 @@
>  > +From 068c3baff3048a3db4ef2518ff917ce749cd8169 Mon Sep 17 00:00:00 2001
>  > +From: Sergey Matyukevich <geomatsi@gmail.com>
>  > +Date: Sat, 20 May 2017 11:24:26 +0300
>  > +Subject: [PATCH 2/3] ARM: dts: orange-pi-zero: enable SPI NOR
> 
> Please drop the 2/3, they tend to get out of date.

Do you mean all the patch indices in Subjects ?

> > +
>  > +Enable SPI NOR on orange-pi-zero board.
>  > +
>  > +For more information see:
>  > +- http://linux-sunxi.org/Orange_Pi_Zero#SPI_NOR_flash
>  > +
>  > +Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> 
> It would be nicer to add the v2 version that got merged, but oh well.
> 
> Committed with the typo fixed, thanks.

Thanks !

Regards,
Sergey
