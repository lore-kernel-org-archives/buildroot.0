Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8687DC05027
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 07:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23E3A81ED9;
	Thu,  9 Feb 2023 07:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23E3A81ED9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qnQMoHDmcvBt; Thu,  9 Feb 2023 07:19:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0699681E49;
	Thu,  9 Feb 2023 07:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0699681E49
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C661E1BF3A7
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 07:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FEF940883
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 07:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FEF940883
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wJkdH8wAFwH0 for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 07:19:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A75DF40882
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A75DF40882
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 07:19:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.208.163]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6DWi-1pWamZ3ZZg-006ikw; Thu, 09
 Feb 2023 08:19:23 +0100
Date: Thu, 9 Feb 2023 08:19:22 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20230209081922.054039f1@gmx.net>
In-Reply-To: <20230208184323.34219f84@gmx.net>
References: <20220926051956.3272067-1-buildroot@athaariq.my.id>
 <20230208144639.764af681@windsurf>
 <20230208184323.34219f84@gmx.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:xZWR1jUGXlKDaILFTgiPQyM5zODsd9qU3vbVhdrht0EB1HG450f
 UlnZy8e+m9eDUhzSoQYL96X3nLmCs2s2gEyepBlov5PPGnrUhdzr/K7k5TzrXoUVvSqf7Ni
 l8ZeOIZZNqGmVPlHPaNTYsxQdgGtSsTA4piShtG9XJIfcHQTxUM4BOtk7cWA24PZ7M2ieq8
 AkkFijFz0afxorUHeCQgQ==
UI-OutboundReport: notjunk:1;M01:P0:so4RXvXNfbk=;8OItWn9JFicYFUn7wwFxyfTGkj1
 zsaOotbIR4mUh34qHDhEWp7jUmPIir/jMPzs0Ed2lKTMm7515fCgiFSlWYF6mf1hYnnamLNQ7
 qzh0CM5qdwpoYLmwMAG6NEd4btxKt/5eWa5jvQ7pBNO/0VDZeG4QF3sYQgywIDFIotBs02VDL
 6pI8JRPS6d/HanpgEoq0CwfbDqquKuFL+A4xIhUJceGddRWaqzY2fsjs4okUfxa/3vlTx43ZC
 ZEpHvWPLBmRotQ97ps0r9KTWegid1JUYd1epFBwsN0kYI1MbQ1rHSXv7PJgxkqeUQd19egwf4
 Uku9f6lQpEkKi0B5k+yI+t975sQNRna2Om/cNxzBkhtUF3IQmIaVWwEHhOHtjTQUcz+hLA92A
 3DGSn/JNiM0OHIcFRz58+PhrguvdA5eFYQONU7gP55DsyxM8GveXkRtO66Sltt6CWAx1yutp3
 fsHc50vFAJFwt4WtS+724aTtmaOzrfcDQ6+b3F68Yj+YsWBwEXxEbcvmR2gnRSIfSQz+gB+Ty
 XCi5BFCMmRN+Zql0H82/E9pOKyq7dkxcwvTlhrsaJk1Ygmjev6BOZwzys5GuqnaRV42cGkyoJ
 Lmiz1ihYJGDw+hvuR1kcIluZ+JGRB67usPxImA/yG3iG+MLJIFasL6+R2HFnn/3naFfcqZpA0
 W0T59WJGM5lFpqInVcKeGp1WeD+l/KOKJ5SOq7uaQYhNCZbBLPdck78pRkfnbBOYKIwSeWs+y
 0VimsV50eIcOH+qwGxedsKyi19AGRyPSWcrfaOmDvyVCTiZL6m1hqej0uD+dfi/Gx+JvLeOal
 MY6vWWTf7wHuEgMxUGnzZPFWQOI8RHHoI0DBEZaoeaMcCselodsTt03DjXuEEA29HGWdZ8IW1
 1YJgnBmTalLGFsHrsPdpIXLHPe8fKfKs0Pv93OsSydSqS7btrQYPl66DYZLpAgDSXQR7arHkq
 TWr0RV9NDnRY1+Nz91bunuEZPbc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1675927164; bh=EadG/Wn/V09qwXP5ybJqzESULW/zEn/sAFCaPWiLhvo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=LnltTIR5mJE7WtRDV73mOIJm7wWWiJ04oPShdssXneG+kY+rULtQ2TRqhEcEl+mgd
 2tB+/xEsxhWopKGlL8DNkO2UN2fGfsF4kw4UvPxbhpG12pdM4g3kV12DE45aaiXDwH
 WfvJOYJJ0danD197+oIOqZHod9ZBA2QtnymnDtE2Bg6u1aPlLKC75wMuExvpop4SeF
 plRwvKF+Qsgrkxkd4Bj8sXVHkJVGV9buqtH9QBwhXtsNcLgMWzdrxzTdWtlcCJM3WQ
 jZxWfWxaK72gE6S3hGicpPVRrigTis8kLbqQhFmZv/gR5hITHnnzo7/jc0Z3mty0e1
 AyoZUx7WteEBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=LnltTIR5
Subject: Re: [Buildroot] [PATCH 1/1] board/raspberrypi4: bump kernel version
 to 5.15.68
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 8 Feb 2023 18:43:23 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> On Wed, 8 Feb 2023 14:46:39 +0100, Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:
>
> > Hello Athaariq,
> >
> > On Mon, 26 Sep 2022 05:20:15 +0000 (UTC)
> > Athaariq Ardhiansyah <buildroot@athaariq.my.id> wrote:
> >
> > > First of all, kernel support for Raspberry Pi is way too old relative to stable version. Second, we actually have several bug fixes regarding the kernel including HDMI hotplug and more problems on graphic stacks. However, I only have Raspberry Pi 4B so I cannot test the changes for other Raspberry Pi models. For anyone who has those boards, please help us to bump and test the kernel.
> > >
> > > Signed-off-by: Athaariq Ardhiansyah <buildroot@athaariq.my.id>
> >
> > Thanks for your patch. It would indeed be nice to update our
> > RaspberryPi defconfigs, but there are a number of questions which need
> > to be answered before we can apply your patch.
> >
> > First of all, a small detail: your commit log must be wrapped at ~80
> > columns. Also, it shouldn't use 1st person sentence "I only have".
> >
> > > diff --git a/board/raspberrypi/linux.fragment b/board/raspberrypi/linux.fragment
> > > new file mode 100644
> > > index 0000000000..798b2e91da
> > > --- /dev/null
> > > +++ b/board/raspberrypi/linux.fragment
> > > @@ -0,0 +1,7 @@
> > > +# Dynamic CPU Clock
> > > +CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE=n
> > > +CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
> > > +
> > > +# Fix Kernel Module won't Load
> > > +CONFIG_MODULE_COMPRESS_XZ=n
> > > +CONFIG_MODULE_COMPRESS_NONE=y
> >
> > Why is this Linux kernel configuration fragment needed? There is no
> > explanation in your commit log. Changing the default CPU governor
> > should not be needed, and the second chunk about kernel module
> > compression is a bit strange and deserves some explanation.
> >
>
> Upstream defconfigs changed to CONFIG_MODULE_COMPRESS_XZ (see [1] and [2]),
> alternative would be to enable the following in the buildroot
> raspberry*_defconfigs:
>
> 	BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> 	BR2_PACKAGE_XZ
> 	BR2_PACKAGE_KMOD
> 	BR2_PACKAGE_KMOD_TOOLS
> 	BR2_PACKAGE_HOST_KMOD_XZ
>
> Regards,
> Peter

...ups, and the missing links:

    [1] https://github.com/raspberrypi/linux/commit/c45b4223a4e4a8cfe39edbb4949329ea478fa4e2
    [2] https://github.com/raspberrypi/linux/issues/4966

Regards,
Peter

>
>
> > > diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
> > > index 5942f7c4e1..6d90a8f004 100644
> > > --- a/configs/raspberrypi4_64_defconfig
> > > +++ b/configs/raspberrypi4_64_defconfig
> > > @@ -6,13 +6,14 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
> > >
> > >  BR2_SYSTEM_DHCP="eth0"
> > >
> > > -# Linux headers same as kernel, a 5.10 series
> > > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> > > +# Linux headers same as kernel, a 5.15 series
> > > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> > >
> > >  BR2_LINUX_KERNEL=y
> > >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
> > > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,155b736f0ff883415d374ba743473f5ef146814b)/linux-155b736f0ff883415d374ba743473f5ef146814b.tar.gz"
> > >  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
> > > +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi4-64/linux.fragment"
> > >
> > >  # Build the DTB from the kernel sources
> > >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > > @@ -23,6 +24,9 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> > >  BR2_PACKAGE_RPI_FIRMWARE=y
> > >  BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
> > >  BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi4-64/config_4_64bit.txt"
> > > +BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI=y
> > > +BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_BT=y
> > > +BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_WIFI=y
> >
> > Why is this being added?
> >
> > >  # Required tools to create the SD image
> > >  BR2_PACKAGE_HOST_DOSFSTOOLS=y
> > > diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
> > > index 4e5580c140..f0947c329c 100644
> > > --- a/configs/raspberrypi4_defconfig
> > > +++ b/configs/raspberrypi4_defconfig
> > > @@ -6,13 +6,14 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
> > >
> > >  BR2_SYSTEM_DHCP="eth0"
> > >
> > > -# Linux headers same as kernel, a 5.10 series
> > > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> > > +# Linux headers same as kernel, a 5.15 series
> > > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> > >
> > >  BR2_LINUX_KERNEL=y
> > >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
> > > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,155b736f0ff883415d374ba743473f5ef146814b)/linux-155b736f0ff883415d374ba743473f5ef146814b.tar.gz"
> > >  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
> > > +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi4/linux.fragment"
> > >
> > >  # Build the DTB from the kernel sources
> > >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > > @@ -23,6 +24,10 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> > >  BR2_PACKAGE_RPI_FIRMWARE=y
> > >  BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
> > >  BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi4/config_4.txt"
> > > +BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI=y
> > > +BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_BT=y
> > > +BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_WIFI=y
> > > +BR2_PACKAGE_RPI_USERLAND=y
> >
> > Why is rpi-userland being added here, and not to the other defconfig above?
> >
> > Also, you're updating rpi-firmware, rpi-userland and RaspberryPi
> > defconfigs in the same commit. Is this because they need to be updated
> > in sync? If that's the case, is there a potential problem if we update
> > rpi-firmware/rpi-userland, but not the defconfigs for RaspberryPi 1/2/3 ?
> >
> > Thanks a lot for your feedback!
> >
> > Thomas
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
