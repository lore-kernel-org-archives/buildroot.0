From: Arthur COURTEL <arthur.courtel@smile.fr>
Date: Mon, 9 Dec 2019 12:39:09 +0100
Subject: [Buildroot] Errors when compiling uboot for rpi 3
In-Reply-To: <20191205213607.58c3e098@windsurf>
References: <1575547814.xk698xjfax.astroid@greyskull.none>
 <20191205213607.58c3e098@windsurf>
Message-ID: <CAL=Sv2LNuRsfd8jVfEOdsMCKjFrWH024dhtgdK=wy-ByXPH9jQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
There is a defconfig for uboot rpi3 32b.
Use this to get it:
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rpi_3_32b"
It builds a "uboot.bin" but I didn't tested it.

Best regards,
Arthur

On Thu, Dec 5, 2019 at 9:36 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Thu, 05 Dec 2019 12:20:09 +0000
> Ben Edwards <ben@artfuldodge.io> wrote:
>
> > Hi,
> >
> > I am very new to buildroot, so I am probably making some fundamental
> > mistake. I have configured buildroot with the raspberrypi3 defconfig and
> > then enabled uboot. The diff is
> >
> > --- configs/raspberrypi3_defconfig    2019-12-04 19:27:02.700303546 +0000
> > +++ configs/raspberrypi3_defconfig    2019-12-05 11:15:07.073552770 +0000
>
> This Buildroot defconfigs builds an ARM 32 bits system for the RaspberryPi.
>
> > @@ -1,37 +1,26 @@
> > +BR2_TARGET_UBOOT=y
> > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rpi_3"
>
> This U-Boot configuration apparently builds an ARM 64 bits bootloader
> for the RaspberryPi, and therefore uses some assembly code that cannot
> build with the ARM 32 compiler built as part of the
> raspberrypi3_defconfig.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
