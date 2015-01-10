From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 15:27:40 +0100
Subject: [Buildroot] [PATCH v3] linux: add fbtft kernel extension
In-Reply-To: <1420315307-22645-1-git-send-email-ps.report@gmx.net>
References: <1420315307-22645-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150110152740.6a817647@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Sat,  3 Jan 2015 21:01:47 +0100, Peter Seiderer wrote:
> Tested with RaspberryPi B+ and PiTFT Mini Kit - 320x240 2.8" TFT
> (see [1] and [2]) and the following target configuration changes:
> - cmdline.txt: add 'fbcon=map:10 fbcon=font:VGA8x8'
> - add /etc/modules-load.d/fbtft.conf with 'fbtft_device'
> - add /etc/modprobe.d/00-fbtft.conf with 'options fbtft_device name=adafruit28 rotate=90 gpios=dc:25'
> 
> [1] http://h65951.serverkompetenz.net/PeterSeiderer/upload/PiTFT_2_8_ct/Image9893.jpg
> [2] http://h65951.serverkompetenz.net/PeterSeiderer/upload/PiTFT_2_8_ct/Image9897.jpg
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Thanks, applied, after doing a bunch of (hopefully) improvements:

    [Thomas:
      - Rename prompt of the Linux extension to "FB TFT drivers"
      - Remove the full name of the kernel config options in the help
        text. Giving their CONFIG_<foo> name is enough.
      - Remove the mention of CONFIG_SPI_BCM2708, since this makes the
        description RaspberryPi specific, while these drivers can work
        with any SPI controller.
      - Refactor the code in linux-ext-fbtft.mk to avoid duplication
        between the < 3.15 and >= 3.15 cases.
      - Make the fbtft package a promptless package, since there is no
        point in selecting only this package, without the kernel
        extension.
      - Change the license to GPLv2, since it's kernel code.]

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
