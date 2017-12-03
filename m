From: daggs <daggs@gmx.com>
Date: Sun, 3 Dec 2017 17:01:03 +0100
Subject: [Buildroot] [PATCH 7/8] odoridc2: add defconfig for mainline
 image
In-Reply-To: <20171203142628.58be19b8@windsurf.lan>
References: <20171203125619.30919-1-daggs@gmx.com>
 <20171203125619.30919-7-daggs@gmx.com>
 <20171203142628.58be19b8@windsurf.lan>
Message-ID: <trinity-6d3f3593-c2f7-4504-bb3f-88e0cae4b2c0-1512316862900@3c-app-mailcom-bs06>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Thomas,

> Sent: Sunday, December 03, 2017 at 3:26 PM
> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Dagg Stompler" <daggs@gmx.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 7/8] odoridc2: add defconfig for mainline image
>
> Hello,
> 
> On Sun,  3 Dec 2017 14:56:18 +0200, Dagg Stompler wrote:
> > Signed-off-by: Dagg Stompler <daggs@gmx.com>
> > ---
> >  configs/odroidc2_mainline_defconfig | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >  create mode 100644 configs/odroidc2_mainline_defconfig
> 
> Please squash patches 2/8 to 8/8 all together. There is no point in
> doing such fine grain splitting.
no problem.

> 
> > diff --git a/configs/odroidc2_mainline_defconfig b/configs/odroidc2_mainline_defconfig
> > new file mode 100644
> > index 0000000000..37f0623a70
> > --- /dev/null
> > +++ b/configs/odroidc2_mainline_defconfig
> > @@ -0,0 +1,29 @@
> > +# Architecture
> > +BR2_aarch64=y
> 
> You need to specify explicitly the kernel headers version. See other
> defconfigs.
> 
> > +# System
> > +BR2_TARGET_GENERIC_HOSTNAME="odroidc2"
> > +BR2_TARGET_ROOTFS_EXT2=y
> > +BR2_TARGET_ROOTFS_EXT2_4=y
> > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/hardkernel/odroidc2/post-image-mailine.sh"
> > +BR2_ROOTFS_POST_BUILD_SCRIPT="board/hardkernel/odroidc2/post-build.sh"
> > +
> > +# Kernel
> > +BR2_LINUX_KERNEL=y
> 
> You need to specify explicitly the kernel version.
> 
> > +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> > +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/hardkernel//odroidc2/odroidc2_mainline_defconfig"
> > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxbb-odroidc2"
> > +BR2_LINUX_KERNEL_IMAGE=y
> > +
> > +# U-Boot
> > +BR2_TARGET_UBOOT=y
> 
> You need to specify explicitly the U-Boot version.
ok.

> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> 
