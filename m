From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Mon, 12 Aug 2019 12:20:22 +0530
Subject: [Buildroot] [PATCH 1/3] board/friendlyarm: Add support for
 friendlyarm nanopi neo4 board
In-Reply-To: <20190803075528.1942993b@windsurf.home>
References: <20190604085307.15756-1-shyam.saini@amarulasolutions.com>
 <20190803075528.1942993b@windsurf.home>
Message-ID: <CA+drQ_N1iFps9SKm5fDCu=huiPApud+R0necShBr_pxsXnyB0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


Sorry for the late reply.

> Hello Shyam,
>
> On Tue,  4 Jun 2019 14:23:05 +0530
> Shyam Saini <shyam.saini@amarulasolutions.com> wrote:
>
> > This initial support includes:
> >         Linux v5.2-rc1
> >         Custom U-Boot
> >         Arm Trusted Firmware v2.0
> >         Buildroot default packages
> >
> > Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
>
> I have finally applied this series. There were a few things to adjust
> though, which were identical in all three patches, so I'll only comment
> on this one, but it also applied to the 2 other patches in this series.
>
> First, the commit title should be:
>
>         configs/nanopi_neo4: new defconfig

Will take care of these things next time for sure.

>
>
>
> > diff --git a/configs/nanopi_neo4_defconfig b/configs/nanopi_neo4_defconfig
> > new file mode 100644
> > index 0000000000..f75f4367a9
> > --- /dev/null
> > +++ b/configs/nanopi_neo4_defconfig
> > @@ -0,0 +1,55 @@
> > +# Architecture
> > +BR2_aarch64=y
> > +BR2_cortex_a72_a53=y
> > +
> > +# Linux headers 5.1 series
> > +BR2_KERNEL_HEADERS_5_1=y
>
> All defconfigs that build their own kernel should use the "Same as
> kernel" mechanism for kernel headers. So this should have been:
>
> # Linux headers same as kernel, a 5.2 series
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_2=y

>
>
> > +# Kernel
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="v5.2-rc1"
>
> I switched to using the final 5.2 kernel.
>
> > +BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
>
> And dropped this one, to simply use the default ext4 filesystem size.
>
> As I said, I fixed those details on all three defconfigs, and applied
> all of them.
>

I have noted all your feedback for the future patches.

Thanks a lot for making these changes on your own and the feedback.
