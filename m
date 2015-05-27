From: Laurent Joli <l.joli@expemb.com>
Date: Wed, 27 May 2015 09:58:16 +0200
Subject: [Buildroot] sky2 not created
In-Reply-To: <20150527094643.0dcb2107@free-electrons.com>
References: <CAJtzDg-NoVNk_W8CnV0y0sY+dhZNCKTu66tfePnyUoDNj+bTeg@mail.gmail.com>
 <20150527094643.0dcb2107@free-electrons.com>
Message-ID: <CAJtzDg9LiZjeTJcRXp=Eng8kfynfDjdYrtKD=kVJ=GJjuGobWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

First of all, Thank you for your answer.

I would like create *a sky2.ko as a module.*

I use buildroot-2015.05-rc3 and do what you say :

make qmx6_defconfig
        make linux-menuconfig
        ... select the sky2 driver ...
make

So, after the complete build, I have this "*.ko"

.-(XXX/buildroot/buildroot-2015.05-rc3/output/images/rootfs)-----------------------------------------------------------------------------------------------------------------------------
`--> find . -iname '*.ko'
./lib/modules/3.10.17/kernel/fs/binfmt_misc.ko
./lib/modules/3.10.17/kernel/fs/udf/udf.ko
./lib/modules/3.10.17/kernel/fs/isofs/isofs.ko
./lib/modules/3.10.17/kernel/fs/fat/msdos.ko
./lib/modules/3.10.17/kernel/fs/configfs/configfs.ko
./lib/modules/3.10.17/kernel/fs/nls/nls_iso8859-15.ko
./lib/modules/3.10.17/kernel/sound/core/snd-rawmidi.ko
./lib/modules/3.10.17/kernel/sound/core/snd-hwdep.ko
./lib/modules/3.10.17/kernel/sound/usb/snd-usb-audio.ko
./lib/modules/3.10.17/kernel/sound/usb/snd-usbmidi-lib.ko
./lib/modules/3.10.17/kernel/lib/crc-ccitt.ko
./lib/modules/3.10.17/kernel/lib/crc7.ko
./lib/modules/3.10.17/kernel/lib/libcrc32c.ko
./lib/modules/3.10.17/kernel/lib/crc-itu-t.ko
./lib/modules/3.10.17/kernel/drivers/i2c/algos/i2c-algo-pcf.ko
./lib/modules/3.10.17/kernel/drivers/i2c/algos/i2c-algo-pca.ko
./lib/modules/3.10.17/kernel/drivers/net/wireless/ath/ath6kl/ath6kl_core.ko
./lib/modules/3.10.17/kernel/drivers/net/wireless/ath/ath6kl/ath6kl_sdio.ko
./lib/modules/3.10.17/kernel/drivers/input/serio/serport.ko
./lib/modules/3.10.17/kernel/drivers/input/mouse/psmouse.ko
./lib/modules/3.10.17/kernel/drivers/input/evbug.ko
./lib/modules/3.10.17/kernel/drivers/mxc/mlb/mxc_mlb150.ko
./lib/modules/3.10.17/kernel/drivers/media/v4l2-core/videobuf2-vmalloc.ko
./lib/modules/3.10.17/kernel/drivers/media/platform/mxc/capture/ov5640_camera_mipi.ko
./lib/modules/3.10.17/kernel/drivers/media/platform/mxc/capture/csi_v4l2_capture.ko
./lib/modules/3.10.17/kernel/drivers/media/platform/mxc/capture/fsl_csi.ko
./lib/modules/3.10.17/kernel/drivers/media/platform/mxc/capture/ipu_csi_enc.ko
./lib/modules/3.10.17/kernel/drivers/media/platform/mxc/capture/ov5642_camera.ko
./lib/modules/3.10.17/kernel/drivers/media/platform/mxc/capture/ipu_prp_enc.ko
./lib/modules/3.10.17/kernel/drivers/media/platform/mxc/capture/adv7180_tvin.ko
./lib/modules/3.10.17/kernel/drivers/media/platform/mxc/capture/ipu_bg_overlay_sdc.ko
./lib/modules/3.10.17/kernel/drivers/media/platform/mxc/capture/ipu_still.ko
./lib/modules/3.10.17/kernel/drivers/media/platform/mxc/capture/ov5640_camera.ko
./lib/modules/3.10.17/kernel/drivers/media/platform/mxc/capture/mxc_v4l2_capture.ko
./lib/modules/3.10.17/kernel/drivers/media/platform/mxc/capture/ipu_fg_overlay_sdc.ko
./lib/modules/3.10.17/kernel/drivers/media/usb/gspca/gspca_main.ko
./lib/modules/3.10.17/kernel/drivers/media/usb/uvc/uvcvideo.ko
./lib/modules/3.10.17/kernel/drivers/usb/gadget/u_serial.ko
./lib/modules/3.10.17/kernel/drivers/usb/gadget/g_serial.ko
./lib/modules/3.10.17/kernel/drivers/usb/gadget/g_ether.ko
./lib/modules/3.10.17/kernel/drivers/usb/gadget/usb_f_acm.ko
./lib/modules/3.10.17/kernel/drivers/usb/gadget/usb_f_obex.ko
./lib/modules/3.10.17/kernel/drivers/usb/gadget/g_zero.ko
./lib/modules/3.10.17/kernel/drivers/usb/gadget/usb_f_serial.ko
./lib/modules/3.10.17/kernel/drivers/usb/gadget/g_mass_storage.ko
./lib/modules/3.10.17/kernel/drivers/usb/gadget/usb_f_ss_lb.ko
./lib/modules/3.10.17/kernel/drivers/usb/gadget/libcomposite.ko
./lib/modules/3.10.17/kernel/drivers/pci/pci-stub.ko
./lib/modules/3.10.17/kernel/crypto/tcrypt.ko

As you can see I have not my module.

Regards,
Laurent JOLI

2015-05-27 9:46 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Laurent Joli,
>
> On Tue, 26 May 2015 18:34:43 +0200, Laurent Joli wrote:
>
> > When I ticked for Marvell driver : SKY2 and  SKY2_DEBUG
> >
> > At the end of the build, I have not sky2.ko in my rootfs.
> >
> > What can I do for obtain sky2 drivers ?
>
> Depends on how you enabled these drivers: as a module, or statically
> linked into the kernel?
>
> Also, what was your exact flow of work?
>
> Basically, you need to do:
>
>         make qmx6_defconfig
>         make linux-menuconfig
>         ... select the sky2 driver ...
>         make
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150527/5e90a4b8/attachment.html>
