From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Thu, 24 Mar 2016 09:43:44 +0100
Subject: [Buildroot] [PATCH 1/4] configs: atmel: unify and update
 defconfig for Xplained boards
In-Reply-To: <20160324094006.172567ac@free-electrons.com>
References: <1458808152-15778-1-git-send-email-ludovic.desroches@atmel.com>
 <20160324094006.172567ac@free-electrons.com>
Message-ID: <20160324084344.GD12245@odux.rfo.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Mar 24, 2016 at 09:40:06AM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> I'm adding in Cc: Alexandre Belloni, who has worked on Atmel defconfigs
> in the past.
> 

He was in Cc.

> > - use bootstrap as first stage bootloader
> 
> As opposed to? Did you mean at91bootstrap3 rather than "bootstrap"?
> 

As opposed to u-boot spl which is less tested than at91bootstrap3.

> On Thu, 24 Mar 2016 09:29:09 +0100, Ludovic Desroches wrote:
> 
> > diff --git a/configs/atmel_sama5d3_xplained_defconfig b/configs/atmel_sama5d3_xplained_defconfig
> > index 665a3d7..16e4521 100644
> > --- a/configs/atmel_sama5d3_xplained_defconfig
> > +++ b/configs/atmel_sama5d3_xplained_defconfig
> > @@ -2,26 +2,28 @@ BR2_arm=y
> >  BR2_cortex_a5=y
> >  BR2_ARM_ENABLE_VFP=y
> >  BR2_ARM_INSTRUCTIONS_THUMB2=y
> > -# Linux headers same as kernel, a 3.18 series
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_GIT=y
> >  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> > -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="03329ca4cf6b94acc5c65b59b2d1f90fdeee0887"
> > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-4.1-at91"
> 
> This is not good. linux-4.1-at91 is a branch name, which means that the
> actual source behind this branch name will change over time, making
> this defconfig non-reproducible. You must stick to a tag or a commit id.
>

In fact it was the plan in order to prevent the need to update these
defconfig files. If I must stick to a tag then I will use linux4sam
releases.

> >  BR2_TARGET_AT91BOOTSTRAP3=y
> > +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
> > +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
> > +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="at91bootstrap-3.x"
> 
> Same comment as for the kernel.
> 
> >  BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3_xplainednf_uboot"
> >  BR2_TARGET_UBOOT=y
> > -BR2_TARGET_UBOOT_BOARDNAME="sama5d3_xplained_nandflash"
> > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> >  BR2_TARGET_UBOOT_CUSTOM_GIT=y
> >  BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/linux4sam/u-boot-at91.git"
> > -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="677f3c2340b72131beebace8e96cac17b9569887"
> > -BR2_TARGET_UBOOT_SPL=y
> > +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="u-boot-2015.01-at91"
> 
> Same comment.
> 
> (and ditto for the other defconfigs)
> 
> Thanks!
> 
> Thomas

Regards

Ludovic
