From: Suniel Mahesh <sunil@amarulasolutions.com>
Date: Fri, 4 Sep 2020 23:13:57 +0530
Subject: [Buildroot] [PATCH v2 1/4] configs/rockpro64: new defconfig
In-Reply-To: <532ab3ec-2bc5-aa1c-5097-5f360f4584e8@mind.be>
References: <20200829093506.25260-1-sunil@amarulasolutions.com>
 <20200829093506.25260-2-sunil@amarulasolutions.com>
 <532ab3ec-2bc5-aa1c-5097-5f360f4584e8@mind.be>
Message-ID: <CAM+7aWvJdAx5M_xvXHH28NENJVdes8QTGyzUMyNtPB91oj10+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Thu, Sep 3, 2020 at 2:16 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 29/08/2020 11:35, Suniel Mahesh wrote:
> [snip]
> > +# Bootloader
> > +BR2_TARGET_UBOOT=y
> > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> > +BR2_TARGET_UBOOT_LATEST_VERSION=y
>
>  Please always use a fixed version (i.e. CUSTOM_VERSION with 2020.07 as the
> version number).

Yes, I will follow the suggestion from next onwards..

>
> > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rockpro64-rk3399"
> > +BR2_TARGET_UBOOT_NEEDS_DTC=y
> > +BR2_TARGET_UBOOT_NEEDS_PYTHON=y
>
>  This is a blind option, after running a config it will be reset to no. It is
> set by some of the other options that require python packages.
>
>  Just to be sure: you really do need python to build U-Boot in this config?

Yes it's a blind option, I have done a quick test to confirm. It is not needed.
Thanks for the correction.

>
>
>  I've made those two fixes in all four patches and applied to master, thanks.

Appreciate your effort and thanks for applying the patches.

Regards
Suniel

>
>  Regards,
>  Arnout
>
> > +BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
> > +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> > +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
> > +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> > +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
> > +BR2_TARGET_UBOOT_SPL=y
> > +BR2_TARGET_UBOOT_SPL_NAME="idbloader.img"
