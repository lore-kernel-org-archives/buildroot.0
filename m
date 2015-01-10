From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 10 Jan 2015 21:48:32 +0100
Subject: [Buildroot] [PATCH v3] linux: add fbtft kernel extension
Message-ID: <trinity-2bbfe20d-7483-4696-96fd-10d5a86139a3-1420922912380@3capp-gmx-bs51>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, Jan 10, 2015 at 03:27:40PM +0100, Thomas Petazzoni wrote:
> Dear Peter Seiderer,
> 
> On Sat,  3 Jan 2015 21:01:47 +0100, Peter Seiderer wrote:
> > Tested with RaspberryPi B+ and PiTFT Mini Kit - 320x240 2.8" TFT
> > (see [1] and [2]) and the following target configuration changes:
> > - cmdline.txt: add 'fbcon=map:10 fbcon=font:VGA8x8'
> > - add /etc/modules-load.d/fbtft.conf with 'fbtft_device'
> > - add /etc/modprobe.d/00-fbtft.conf with 'options fbtft_device name=adafruit28 rotate=90 gpios=dc:25'
> > 
> > [1] http://h65951.serverkompetenz.net/PeterSeiderer/upload/PiTFT_2_8_ct/Image9893.jpg
> > [2] http://h65951.serverkompetenz.net/PeterSeiderer/upload/PiTFT_2_8_ct/Image9897.jpg
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> 
> Thanks, applied, after doing a bunch of (hopefully) improvements:
> 
>     [Thomas:
>       - Rename prompt of the Linux extension to "FB TFT drivers"

Looks much better...

>       - Remove the full name of the kernel config options in the help
>         text. Giving their CONFIG_<foo> name is enough.

O.k.

>       - Remove the mention of CONFIG_SPI_BCM2708, since this makes the
>         description RaspberryPi specific, while these drivers can work
>         with any SPI controller.

Maybe add some hint to not forget to enable platform specific spi driver
would be helpful?

>       - Refactor the code in linux-ext-fbtft.mk to avoid duplication
>         between the < 3.15 and >= 3.15 cases.

Thanks, your solution is a lot better...

>       - Make the fbtft package a promptless package, since there is no
>         point in selecting only this package, without the kernel
>         extension.

O.k.

>       - Change the license to GPLv2, since it's kernel code.]

Mhhh, in some way your are right, but it seems wrong for me that the
buildroot license entry does not reflect what the package author stated
in his own files....what would be the right buildroot entry in case
of dual-license files?

Thanks for committing...

Regards,
Peter

> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
