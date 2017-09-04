From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 4 Sep 2017 14:53:20 +0300
Subject: [Buildroot] [PATCH 1/1] New board: SolidRun ClearFog Base
In-Reply-To: <199cf974-e7bb-433a-b3eb-ff1ec4f171fa@cesnet.cz>
References: <20170904104128.rbpp3qjkgyi6kafu@sapphire.tkos.co.il>
 <199cf974-e7bb-433a-b3eb-ff1ec4f171fa@cesnet.cz>
Message-ID: <20170904115319.nsjf2xu3ih6qlxwe@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jan,

On Mon, Sep 04, 2017 at 01:35:57PM +0200, Jan Kundr?t wrote:
> > > diff --git a/configs/clearfog_defconfig b/configs/clearfog_defconfig
> > > new file mode 100644
> > > index 0000000..797c072
> > > --- /dev/null
> > > +++ b/configs/clearfog_defconfig ...
> > 
> > Please use the internal toolchain for the basic defconfig.
> 
> I can make that change, but I wonder what the rationale is. I see that it's
> probably not obvious from the attached config, but it is actually set to use
> the Linaro toolchain to save time during the build. Do you still want me to
> change this?

All defconfigs use a Buildroot internal toolchain. These are sort of demo to 
the capabilities of Buildroot. Also, the internal toolcain generates smaller 
images since it uses uClibc.

> > > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/solidrun/clearfog/post-image.sh"
> > > +BR2_LINUX_KERNEL=y
> > > +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12.10"
> > > +BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7" ...
> > 
> > Please set BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE to the version you tested.
> 
> I created this file via `make menuconfig` followed by `make savedefconfig`.
> In there, I used the default version of U-Boot, the 2017.07. Should I really
> go and change this to hardcode a version which will eventually get obsolete
> in future? I'm not familiar with U-Boot's releases, just double-checking
> here.

As long as you build the same sources you should get the same result, sans 
toolchain issues. The bootloader and the kernel are sensitive packages that 
frequently break between releases on any given target board. For that reason 
Buildroot defconfigs always set known working versions of both.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
