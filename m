From: Mike Frampton <mikeframpo@gmail.com>
Date: Fri, 20 Nov 2020 21:03:09 +1300
Subject: [Buildroot] [PATCH v2 3/3] configs/qcom_db410c: new defconfig
In-Reply-To: <20201119143039.726f1485@windsurf.home>
References: <20201119090854.48955-1-mikeframpo@gmail.com>
 <20201119090854.48955-4-mikeframpo@gmail.com>
 <20201119143039.726f1485@windsurf.home>
Message-ID: <CABqcFR=RDj0qCxQkvUb719GkttaZ9JfZJ-MeXY+3UaN9Aiw07A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks very much for the feedback.

On Fri, Nov 20, 2020 at 2:30 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Mike,
>
> Thanks as well for this new iteration!
>
> On Thu, 19 Nov 2020 22:08:54 +1300
> Mike Frampton <mikeframpo@gmail.com> wrote:
>
> > +OUTIMG=$BINARIES_DIR/boot-db410c.img
> > +KERNEL_BUILD=$BUILD_DIR/linux-release_qcomlt-5.4
> > +
> > +cp $KERNEL_BUILD/arch/arm64/boot/dts/qcom/apq8016-sbc.dtb $BINARIES_DIR
> > +cp $KERNEL_BUILD/arch/arm64/boot/Image.gz $BINARIES_DIR
>
> Why is this needed ? Buildroot should have already copied the DT and
> kernel image to BINARIES_DIR.

For some reason it doesn't in my configuration. When I look in
linux/linux.mk, I found that
LINUX_INSTALL_DTB is only defined if BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
is not set. I'm not sure why?

> > +How to set up the SD card
> > +=========================
> > +
> > +The bootloader on the DB410c expects the SD card to be formatted in a
> > +particular way. The simplest way to set up the SD card correctly is to flash
> > +a prebuilt Debian image on to the card to set up the required partitions.
>
> This is a bit annoying, having to depend on flashing the SD card with
> another system first. What is so special that we can't do in Buildroot ?

I agree. I know that linaro have some tools for setting up the SD
card, I just haven't had much
success with them in the past :-/. I'll have another look and see if I
can get them working.
