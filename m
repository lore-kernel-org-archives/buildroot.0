From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Sun, 14 Feb 2016 16:01:09 -0300
Subject: [Buildroot] [PATCH 3/3] configs/firefly_rk3288: new board
In-Reply-To: <87ziv8qnnk.fsf@dell.be.48ers.dk>
References: <1453478020-311-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1453478020-311-4-git-send-email-ariel@vanguardiasur.com.ar>
 <87ziv8qnnk.fsf@dell.be.48ers.dk>
Message-ID: <56C0CEF5.8000806@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

El 10/02/16 a las 18:08, Peter Korsgaard escribi?:
>>>>>> "Ariel" == Ariel D'Alessandro <ariel@vanguardiasur.com.ar> writes:
> 
>  > Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
>  > ---
>  >  configs/firefly_rk3288_defconfig | 40 ++++++++++++++++++++++++++++++++++++++++
>  >  1 file changed, 40 insertions(+)
>  >  create mode 100644 configs/firefly_rk3288_defconfig
> 
>  > diff --git a/configs/firefly_rk3288_defconfig b/configs/firefly_rk3288_defconfig
>  > new file mode 100644
>  > index 0000000..28becfd
>  > --- /dev/null
>  > +++ b/configs/firefly_rk3288_defconfig
>  > @@ -0,0 +1,40 @@
>  > +BR2_arm=y
>  > +BR2_cortex_a15=y
>  > +BR2_ARM_FPU_NEON_VFPV4=y
>  > +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
>  > +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> 
> Our defconfigs are normally very minimal, E.G. only a basic busybox
> based image and a kernel/bootloader - In other words the basics to start
> your own development from.
> 
> There has been some discussion about doing more full blown "demo"
> defconfigs, so I'm fine with adding a more complicated
> firefly_rk3288_demo_defconfig in addition to the basic one.

I see. So, I could submit a firefly_rk3288_demo_defconfig with Qt5
enabled and a firefly_rk3288_defconfig without it, just the minimal
stuff. Do you agree?

> 
> 
>  > +BR2_TARGET_GENERIC_HOSTNAME="firefly-rk3288"
>  > +BR2_TARGET_GENERIC_ISSUE="Welcome to FIREFLY RK3288!"
>  > +BR2_TARGET_GENERIC_GETTY_PORT="/dev/console"
> 
> The /dev/ should afaik not be there and we default to "console" already,
> so this can be dropped.

OK, will drop it.

> 
>> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/firefly/firefly-rk3288/pre-image.sh"
>  > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/firefly/firefly-rk3288/post-image.sh"
>  > +BR2_LINUX_KERNEL=y
>  > +BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  > +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git at github.com:mmind/linux-rockchip.git"
>  > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ccb89e9b5657b4911c16d08e1581121222ee12c4"
> 
> Will this commit stay available or is this a branch that gets rebased?

It's a devel branch from Heiko, so it will rebased almost for sure.
However, this commit is probably to stay available as it isn't one of
the latest ones.

Of course, the right thing to do here is to take the kernel from
mainline and patch it with the Midgard stuff. I'm planning doing this in
the future, but just for now I think that building from that Heiko's
commit won't cause any trouble.

> 
> What kernel version is this? I see you don't set the kernel-headers
> version.

It's a 4.4.0-rc5 kernel. Missed that, I'll set the proper kernel-headers
for this version.

> 
>> +BR2_LINUX_KERNEL_DEFCONFIG="rk3288_veyron"
>  > +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
>  > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-firefly"
>  > +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>  > +BR2_PACKAGE_QT5=y
>  > +BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
>  > +BR2_PACKAGE_QT5BASE_EXAMPLES=y
>  > +BR2_PACKAGE_QT5BASE_GUI=y
>  > +BR2_PACKAGE_QT5BASE_EGLFS=y
>  > +BR2_PACKAGE_MALI_T76X=y
>  > +BR2_TARGET_ROOTFS_EXT2=y
>  > +BR2_TARGET_ROOTFS_EXT2_4=y
>  > +# BR2_TARGET_ROOTFS_TAR is not set
>  > +BR2_TARGET_UBOOT=y
>  > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  > +BR2_TARGET_UBOOT_CUSTOM_GIT=y
>  > +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.denx.de/u-boot.git"
>  > +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2016.01"
> 
> As this is mainline u-boot you can simply set:
> 
> BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.01"
> 
> And Buildroot will download the 2016.01 tarball.

Right, will do.

> 
> Other than that it looks good, thanks. Care to send updated patches
> fixing these issues?
> 

Yeah, I'm sending a patchset v2 ASAP. Thanks!

-- 
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
