From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Aug 2017 19:58:05 +0300
Subject: [Buildroot] [PATCH 1/1] configs: add defconfig for TS-7680
In-Reply-To: <1184350253.134774.1502379121796.JavaMail.zimbra@savoirfairelinux.com>
References: <20170810144951.20841-1-julien.grossholtz@savoirfairelinux.com>
 <20170810145752.2i45xfkeuu3spryw@tarshish>
 <1184350253.134774.1502379121796.JavaMail.zimbra@savoirfairelinux.com>
Message-ID: <20170810165805.32jddb7jpulp4tdw@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

On Thu, Aug 10, 2017 at 11:32:01AM -0400, Julien Grossholtz wrote:
> ----- Mail original -----
> > De: "Baruch Siach" <baruch@tkos.co.il>
> > ?: "Julien Grossholtz" <julien.grossholtz@gmail.com>
> > Cc: buildroot at buildroot.org, "Julien Grossholtz" <julien.grossholtz@savoirfairelinux.com>
> > Envoy?: Jeudi 10 Ao?t 2017 10:57:52
> > Objet: Re: [Buildroot] [PATCH 1/1] configs: add defconfig for TS-7680
> > 
> > On Thu, Aug 10, 2017 at 10:49:51AM -0400, Julien Grossholtz wrote:
> >> The TS-7680 is an i.MX286 ARM ARM926EJ-S board with 10/100 Ethernet,
> >> USB port, eMMC and CAN ports.
> >> 
> >> The TS-7680 uses a 3.14.28 Linux kernel provided by Technologic Systems:
> >> https://github.com/embeddedarm/linux-3.14.28-imx28
> >> 
> >> U-Boot is not provided as the manufacturer recommends not to update the
> >> built-in bootloader.
> >> 
> >> For more informations please see:
> >> https://wiki.embeddedarm.com/wiki/TS-7680
> >> 
> >> Signed-off-by: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
> > 
> > [snip]
> > 
> >> diff --git a/configs/ts7680_defconfig b/configs/ts7680_defconfig
> >> new file mode 100644
> >> index 0000000..0153685
> >> --- /dev/null
> >> +++ b/configs/ts7680_defconfig
> >> @@ -0,0 +1,20 @@
> >> +BR2_arm=y
> >> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> >> +BR2_KERNEL_HEADERS_VERSION=y
> >> +BR2_DEFAULT_KERNEL_VERSION="3.14.28"
> >> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
> >> +BR2_GCC_VERSION_4_9_X=y
> > 
> > gcc version 4.9 will be removed in the near future. You would better make sure
> > that your kernel/bootloader build with more recent gcc versions.
> 
> Good to know. I was not able to compile the kernel with newer gcc releases. 
> I will try to find a workaround.
> Any other gcc release would be OK ? 

The defconfig should preferably work with all current gcc version. For the 
kernel you might want to check commit 3711edaf01a from the linux-3.14.y stable 
branch.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
