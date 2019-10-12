From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 12 Oct 2019 17:09:18 +0200
Subject: [Buildroot] [PATCH 1/1] configs: beaglebone: bump kernel and
 uboot version
In-Reply-To: <461360105a304a50319274febeb5a8a5af34bae5.camel@gmail.com>
References: <20191011190610.15778-1-lothar.felten@gmail.com>
 <d8df3178-2284-2d90-4907-a1c25518960d@mind.be>
 <461360105a304a50319274febeb5a8a5af34bae5.camel@gmail.com>
Message-ID: <CAGm1_kuoDn3BqFRS4oW-Jg2KFSEmMokAswoq0ccdrKLk5WHpwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 11, 2019 at 10:12 PM Lothar Felten <lothar.felten@gmail.com> wrote:
>
> Hi Arnout,
>
> On Fri, 2019-10-11 at 22:03 +0200, Arnout Vandecappelle wrote:
> >  Hi Lothar,
> >
> > On 11/10/2019 21:06, Lothar Felten wrote:
> > > Switch to Linux kernel version 4.19.38 from the TI SDK 06.00.00.07
> > > (TI SDK release date: 7.8.2019)
> > > Added beaglebone blue
> > > Updated uboot to version 2019.07
> > >
> > > Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> >
> >
> >  Applied to master, thanks.
>
> Thanks!
>
> >
> >  Could you also do an update of beaglebone_qt5_defconfig (preferably
> > with a
> > runtime test that it actually works). As reported by Carlos, it is
> > currently
> > broken because it's still using a 4.1 kernel that needs GCC 5.
> >
> >  beaglebone_qt5 also doesn't have bonegreen yet.
>
> I'm trying to build it, but there are many changes required and
> probably some debugging too. I also need to get my EVM back before I
> can do any testing.

FYI: interesting discussion about PowerVR and kernel:
https://marc.info/?l=linux-omap&m=157088580705855&w=2

Yegor

> >
> >  Regards,
> >  Arnout
>
> Best regards,
> Lothar
>
> >
> > > ---
> > >  configs/beaglebone_defconfig | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/configs/beaglebone_defconfig
> > > b/configs/beaglebone_defconfig
> > > index fbb259f57..d88b4253e 100644
> > > --- a/configs/beaglebone_defconfig
> > > +++ b/configs/beaglebone_defconfig
> > > @@ -1,21 +1,21 @@
> > >  BR2_arm=y
> > >  BR2_cortex_a8=y
> > >  BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
> > > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
> > > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> > >  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
> > >  BR2_LINUX_KERNEL=y
> > >  BR2_LINUX_KERNEL_CUSTOM_GIT=y
> > >  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/processor-
> > > sdk/processor-sdk-linux.git"
> > > -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4796173fc58688055a99a1cef19a
> > > 839174067220"
> > > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4dae378bbe721277b08699d1d88f
> > > fae12acc9b09"
> > >  BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
> > >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > > -BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-
> > > boneblack am335x-bonegreen am335x-evmsk"
> > > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-
> > > boneblack am335x-bonegreen am335x-evmsk am335x-boneblue"
> > >  BR2_TARGET_ROOTFS_EXT2=y
> > >  BR2_TARGET_ROOTFS_EXT2_4=y
> > >  BR2_TARGET_UBOOT=y
> > >  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> > >  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> > > -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07"
> > > +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.07"
> > >  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
> > >  BR2_TARGET_UBOOT_NEEDS_DTC=y
> > >  # BR2_TARGET_UBOOT_FORMAT_BIN is not set
> > >
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
