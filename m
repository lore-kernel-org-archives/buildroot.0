From: xu min <xuminready@gmail.com>
Date: Mon, 14 Dec 2020 16:58:46 -0800
Subject: [Buildroot] [PATCH 2/2] Defconfigs: fix rock64_defconfig
In-Reply-To: <f087b97a-7e71-9f9d-16d3-ad69ceaf09b5@gmail.com>
References: <20201214192321.9987-1-xuminready@gmail.com>
 <20201214192321.9987-2-xuminready@gmail.com>
 <f087b97a-7e71-9f9d-16d3-ad69ceaf09b5@gmail.com>
Message-ID: <CAMpS7mTQmO1V5O9hxBP=DoU3GY0oCQUbxNjReeQi8ys6Xa-d4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

Thank you. I just submit another patch configs/rock64: update defconfig
<https://patchwork.ozlabs.org/project/buildroot/patch/20201215004903.8829-1-xuminready@gmail.com/>
to
replace these two patches.

The original u-boot is also from ayufan-rock64. I tested
the ayufan-rock64/linux-mainline-u-boot. No compile error, and it works on
my Rock64 board.

Thanks
Min

On Mon, Dec 14, 2020 at 2:08 PM Romain Naour <romain.naour@gmail.com> wrote:

> Hello Min,
>
> Adding Michal in Cc.
>
> Le 14/12/2020 ? 20:23, Min Xu a ?crit :
> > Signed-off-by: Min Xu <xuminready@gmail.com>
>
> Please squash your two patches since you add again this defconfig with an
> updated BSP. As explained in the commit log [1] the rock64 defconfig was
> removed
> since it was broken for a long time due to a too old uboot version
> (2017.09).
>
> Also this is not really a fix since you bump uboot from 2017.09 to 2020.07
> from
> ayufan-rock64 fork.
>
> [1] a5fa2469e6506ea4f5a91739aa099f63a10e45ce
>
> Best regards,
> Romain
>
>
> > ---
> >  configs/rock64_defconfig | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/configs/rock64_defconfig b/configs/rock64_defconfig
> > index 30bf12c061..df03e357e2 100644
> > --- a/configs/rock64_defconfig
> > +++ b/configs/rock64_defconfig
> > @@ -17,16 +17,16 @@ BR2_TARGET_ROOTFS_EXT2=y
> >  BR2_TARGET_ROOTFS_EXT2_4=y
> >  BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
> >  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> > -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> > -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v1.4"
> >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3328"
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="bl31/*.elf"
> >  BR2_TARGET_UBOOT=y
> >  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> >  BR2_TARGET_UBOOT_CUSTOM_GIT=y
> > -BR2_TARGET_UBOOT_CUSTOM_REPO_URL="
> https://github.com/ayufan-rock64/linux-u-boot.git"
> >
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="2017.09-rockchip-ayufan-1035-gd646df03ac"
> > +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="
> https://github.com/ayufan-rock64/linux-mainline-u-boot.git"
> > +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="release-2020-07"
> >  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock64-rk3328"
> >  BR2_TARGET_UBOOT_NEEDS_DTC=y
> > +BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
> >  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> >  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> >  BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
> >
>
>

-- 

*Best Regards*

*XuMin's Ready?*
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201214/b4f66137/attachment.html>
