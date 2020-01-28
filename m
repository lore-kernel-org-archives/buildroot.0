From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 28 Jan 2020 08:38:24 +0100
Subject: [Buildroot] Requirements for QML in RPi4
In-Reply-To: <CAPmASetzc-+RCHJT5sqM4QjO-bDfbTuAsJizB26f-5=skjJFbA@mail.gmail.com>
References: <CAPmASevs=kKKCspFM0M_ydbeSzNJLGEEiGmrgb6Ap-RqUtE-Ag@mail.gmail.com>
 <20200127164125.1ec2b7ff@gmx.net>
 <CAPmASevGW-0BY78ETy=p+c3p_cOnWG0DO3d8FV=+U6ij9DynpQ@mail.gmail.com>
 <CAPmASetzc-+RCHJT5sqM4QjO-bDfbTuAsJizB26f-5=skjJFbA@mail.gmail.com>
Message-ID: <20200128083824.52d81ada@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andrea,

please keep buildroot at busybox.net on CC

On Mon, 27 Jan 2020 21:11:21 +0100, Andrea Simeoni <andreasimeoni73@gmail.com> wrote:

> I rebuilt the image with the attached config file.
> Now I don't get the error about DRM but... nothing happens. I run a QML
> application (the default example) but on the screen I can still read the
> console output.

Thats bad....and sorry no more help from my side as I have not (yet) an
RPi4 hardware to test myself ;-)

Regards,
Peter

>
> Here the modules loaded:
>
> # lsmod
> Module                  Size  Used by
> evdev                  24576  1
> joydev                 20480  0
> brcmfmac              315392  0
> brcmutil               16384  1 brcmfmac
> sha256_generic         20480  0
> bcm2835_codec          36864  0
> bcm2835_v4l2           45056  0
> v4l2_mem2mem           24576  1 bcm2835_codec
> cfg80211              610304  1 brcmfmac
> bcm2835_mmal_vchiq     32768  2 bcm2835_codec,bcm2835_v4l2
> raspberrypi_hwmon      16384  0
> hwmon                  16384  1 raspberrypi_hwmon
> videobuf2_dma_contig    20480  1 bcm2835_codec
> rfkill                 28672  1 cfg80211
> v4l2_common            16384  1 bcm2835_v4l2
> videobuf2_vmalloc      16384  1 bcm2835_v4l2
> videobuf2_memops       16384  2 videobuf2_dma_contig,videobuf2_vmalloc
> videobuf2_v4l2         24576  3 bcm2835_codec,bcm2835_v4l2,v4l2_mem2mem
> videobuf2_common       45056  4
> bcm2835_codec,bcm2835_v4l2,v4l2_mem2mem,videobuf2_v4l2
> videodev              200704  6
> bcm2835_codec,v4l2_common,videobuf2_common,bcm2835_v4l2,v4l2_mem2mem,videobuf2_v4l2
> media                  36864  3 bcm2835_codec,videodev,v4l2_mem2mem
> vc_sm_cma              36864  1 bcm2835_mmal_vchiq
> rpivid_mem             16384  0
> fixed                  16384  0
> rpi_ft5406             16384  0
> rpi_backlight          16384  0
> uio_pdrv_genirq        16384  0
> uio                    20480  1 uio_pdrv_genirq
> sch_fq_codel           20480  6
> ipv6                  458752  24
>
>
> Il giorno lun 27 gen 2020 alle ore 17:38 Andrea Simeoni <
> andreasimeoni73 at gmail.com> ha scritto:
>
> >
> > You seem to have a RPi4-64bit config, trying to run
> >> mesa vc4?
> >>
> >
> > IIRC it was needed to get accelerated GPU.
> >
> >
> >
> >> dtoverlay=vc4-fkms-v3d
> >>
> >
> > Unfortunately it doesn't work. I read the links, and the situation seems a
> > bit confusing.
> >
> >
> > Alternatively your can try RPi4-32bit and enable
> >> rpi-userland/BR2_PACKAGE_RPI_USERLAND
> >> instead of mesa...
> >>
> >
> > I don't need 64-bit but I need QML+GPU. I'm going to try RPi4+32bit w/
> > userland.
> > I hope it will works! I will report the results.
> >
> >
