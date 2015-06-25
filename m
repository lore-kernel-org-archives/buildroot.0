From: Arthur LAMBERT <lambertarthur22@gmail.com>
Date: Thu, 25 Jun 2015 14:07:47 +0200
Subject: [Buildroot] [PATCH v2 1/1] board: add support for Warpboard
In-Reply-To: <558B254C.2090606@mind.be>
References: <1434988018-16391-1-git-send-email-lambertarthur22@gmail.com>
 <558B254C.2090606@mind.be>
Message-ID: <20150625120747.GA8014@arthur-dreem>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wednesday 24 Jun 2015 ? 23:46:52 (+0200), Arnout Vandecappelle a ?crit :
> > new file mode 100644
> > index 0000000..d9706c1
> > --- /dev/null
> > +++ b/board/freescale/warpboard/linux/linux-001-add-sdm-firmware.patch
> > @@ -0,0 +1,145 @@
> 
>  Patches should have a description and Signed-off-by.
> 
>  But better yet, download it with BR2_LINUX_KERNEL_PATCH="http://... http://..."
> instead of including it in buildroot.
> 
> [snip]

I don't understand this suggestion. How can I download the patch instead if including it
in buildroot since this patch does not exist anywhere. Theses patch are not commit in any git
right now.

Also you suggest me to include imx_usb_loader in warpoard_defconfig. I tried to
flash my uboot by using the imx usb loader from buildroot but is does not work :

[arthur warpboard_v5] sudo dfu-util -D output/images/u-boot.imx -a boot
dfu-util 0.8

Copyright 2005-2009 Weston Schmidt, Harald Welte and OpenMoko Inc.
Copyright 2010-2014 Tormod Volden and Stefan Schmidt
This program is Free Software and has ABSOLUTELY NO WARRANTY
Please report bugs to dfu-util at lists.gnumonks.org

dfu-util: Invalid DFU suffix signature
dfu-util: A valid DFU suffix will be required in a future dfu-util release!!!
Opening DFU capable USB device...
ID 0525:a4a5
Run-time device DFU version 0110
Claiming USB DFU Interface...
Setting Alternate Setting #0 ...
Determining device status: state = dfuIDLE, status = 0
dfuIDLE, continuing
DFU mode device DFU version 0110
Device returned transfer size 4096
Copying data from PC to DFU device
Download	 [                         ]   0%            0 bytes failed!
state(10) = dfuERROR, status(14) = Something went wrong, but the device does not know what it was

I tried to update imx_usb_loader on last sha1 commit but same result.

To make it work I have to use an imx_usb_loader from github/warpboard which is different :
https://github.com/warpboard/imx_usb_loader/commits/warp/master

How can I integrate it ? Do I need to add a patch on imx_usb_loader package to use custom git ?

Thanks,
Arthur.
