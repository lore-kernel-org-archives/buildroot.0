From: Guo Ren <guoren@kernel.org>
Date: Mon, 3 Jun 2019 15:00:12 +0800
Subject: [Buildroot] [PATCH V5 1/2] configs/qemu_cskyXXX_virt: new
 defconfig
In-Reply-To: <20190602123218.244963b8@windsurf>
References: <1559468510-22085-1-git-send-email-guoren@kernel.org>
 <20190602123218.244963b8@windsurf>
Message-ID: <CAJF2gTRd20OK5fcKaKmj3fYKekX3+PVb1_gjpr3y2X+w7-QAww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, Jun 2, 2019 at 6:32 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> > From: Guo Ren <ren_guo@c-sky.com>
> >
> > Add C-SKY defconfig for QEMU virt machine.
> >
> > Tested with https://gitlab.com/c-sky/buildroot/pipelines
> >
> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>
> Thanks, it looks a lot better, but there are still a few things to
> improve.
>
> First, the readme.txt file should be in the same patch.
Ok.

>
> Second, you should update the DEVELOPES file so that it covers those
> additional files (board/qemu/csky and configs/qemu_csky*).
Ok, it'll be another patch.

>
> See below for other comments.
>
>
> > diff --git a/board/qemu/csky/linux-ck610.config.fragment b/board/qemu/csky/linux-ck610.config.fragment
> > new file mode 100644
> > index 0000000..d80d0ee
> > --- /dev/null
> > +++ b/board/qemu/csky/linux-ck610.config.fragment
> > @@ -0,0 +1,5 @@
> > +CONFIG_COMPILE_TEST=y
> > +CONFIG_CPU_CK610=y
> > +CONFIG_CPU_PM_WAIT=y
> > +CONFIG_CSKY_APB_INTC=y
> > +CONFIG_GX6605S_TIMER=y
>
> Thanks, this is _much_ better!
>
> > diff --git a/configs/qemu_csky610_virt_defconfig b/configs/qemu_csky610_virt_defconfig
> > new file mode 100644
> > index 0000000..9a82d57
> > --- /dev/null
> > +++ b/configs/qemu_csky610_virt_defconfig
> > @@ -0,0 +1,20 @@
> > +# Architecture
> > +BR2_csky=y
> > +BR2_ck610=y
>
> You need to add an option like this:
>
> # Linux headers same as kernel, a 5.0 series
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
Ok.

>
> > +# System
> > +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
>
> Please don't enable mdev.
Ok, I'll use BR2_ROOTFS_DEVICE_CREATION_STATIC=y.

>
> > +BR2_TARGET_ROOTFS_INITRAMFS=y
> > +
> > +# Toolchain
> > +BR2_OPTIMIZE_2=y
> > +BR2_SHARED_STATIC_LIBS=y
> > +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> > +BR2_PACKAGE_HOST_GDB=y
>
> Please remove those options.
OK.

>
> > +# Kernel
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
> > +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> > +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck610.config.fragment"
>
> And of course, it should be changed similarly in all other defconfigs.
OK.

Best Regards
 Guo Ren
