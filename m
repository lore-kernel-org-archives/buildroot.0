Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E07C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 16:56:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD9CD60C4D
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 16:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD9CD60C4D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C3B780D82;
	Sun, 14 Nov 2021 16:56:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k8eZpk9n2-kO; Sun, 14 Nov 2021 16:56:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86C7880D84;
	Sun, 14 Nov 2021 16:56:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9FAA11BF30F
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 16:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FA2F80D82
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 16:56:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QgSWWAYhT-GJ for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 16:56:18 +0000 (UTC)
X-Greylist: delayed 00:08:15 by SQLgrey-1.8.0
Received: from libero.it (smtp-18-i2.italiaonline.it [213.209.12.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C91F880D84
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 16:56:17 +0000 (UTC)
Received: from oxapps-15-090.iol.local ([10.101.8.100])
 by smtp-18.iol.local with ESMTPA
 id mIfemIwGUilKSmIfemsciW; Sun, 14 Nov 2021 17:47:59 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1636908479; bh=JIE4RBx9wx6ecWD+x9kSX8PfWmBCIosDsjvQt7QlFOA=;
 h=From;
 b=aG5knPC6h03OFun3YwLXcwtLYBuN00UA9Z6HfRAVT9BLLd6L8eExCG+IVGOpEZtD+
 SzaPCIxcZIAMDqbxApgir4wwXAEon9CK3xwgLxuFOsq8Q4LMTyaYNWYq5wztNR6Ty0
 R6YxvUqX9OPB5TmpAsdmBHk/fjnZwfxARnnhhTYi+ZGfQ8RayR/amrXj5ZPteLMbmH
 ddz86J8CCMUG2JYyJ9y8dl9xT6y2yIc3ud4sRamPkMKxJFwmNeMFlAgWrdqCHqSq1d
 rhOAii1Qsbq9NY+nwA0HUhXAYvb6xv8mvANcXgIujG1U3LGw1Vm7nphYBb39QhtE+l
 Xg7qkgNdZHzYQ==
X-CNFS-Analysis: v=2.4 cv=aYqkITkt c=1 sm=1 tr=0 ts=61913dbf cx=a_exe
 a=1zo9O5OOLDVXMJ/sd9tkAw==:117 a=HbgeEQMBq2gA:10 a=IkcTkHD0fZMA:10
 a=Rcx2N4IabdcA:10 a=uP1ucDPQAAAA:8 a=xtXFGUsqcHPXvADOlXoA:9 a=QEXdDO2ut3YA:10
 a=9a9ggB8z3XFZH39hjkD6:22
Date: Sun, 14 Nov 2021 17:47:58 +0100 (CET)
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
Message-ID: <787392691.81637.1636908478851@mail1.libero.it>
In-Reply-To: <60a8f99e-b1dd-02e7-9ee6-0ac569e58642@mind.be>
References: <20211101182429.11450-1-dariobin@libero.it>
 <60a8f99e-b1dd-02e7-9ee6-0ac569e58642@mind.be>
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev35
X-Originating-IP: 79.24.99.64
X-Originating-Client: open-xchange-appsuite
x-libjamsun: BQCvKrxGEiW5AQka2/R9lgx8WF98/IRq
x-libjamv: fBSiQdc0I1Q=
X-CMAE-Envelope: MS4xfJcmeZITAcQpymv0Yk6CvotgUbHbsLecnhJuYt7k0J2Y6BnsTJzEP2kEGQ+qn8MALSyQWM9RxWw0Ft25bHCZ2f3r5Uu6Ep+ak36NJeY3ueASd2z0YFbz
 lR/vCmkwHfEdCINoYsftnLspKN83f0lp9FnhWzfxsHYZ2yDVJgQhIUB88pUAb6xhnkYzsXGe8P7XXS6OHR4TM+N9EKIF5zOPdMtX1yAHEiEgRiZz2DTOcyVj
 eSV+Tju2Lt0WXH7AD/hHVtVfS8IuRmaOnawNAbqANn8=
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f429_disco: fix kernel
 bootup
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
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: Dario Binacchi <dariobin@libero.it>
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

> Il 09/11/2021 23:00 Arnout Vandecappelle <arnout@mind.be> ha scritto:
> 
>  
> On 01/11/2021 19:24, Dario Binacchi wrote:
> > The kernel generated by the configuration for the STM32f429-discovery
> > board is buggy:
> > 
> >   Unhandled exception: IPSR = 00000006 LR = fffffff1
> >   CPU: 0 PID: 1 Comm: init Not tainted 4.11.0 #2
> >   Hardware name: STM32 (Device Tree Support)
> >   task: 9041a000 task.stack: 907c0000
> >   PC is at ret_fast_syscall+0x2/0x4a
> >   LR is at tty_ioctl+0x1ad/0x75c
> >   pc : [<0800d942>]    lr : [<080c2e05>]    psr: 4000000b
> >   sp : 907c1fa8  ip : 0000001c  fp : 905961a2
> >   r10: 00000000  r9 : 907c0000  r8 : 0800dae0
> >   r7 : 00000036  r6 : 905e7e60  r5 : 00000000  r4 : 905e7ebc
> >   r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000000
> >   xPSR: 4000000b
> >   CPU: 0 PID: 1 Comm: init Not tainted 4.11.0 #2
> >   Hardware name: STM32 (Device Tree Support)
> >   [<0800fbf9>] (unwind_backtrace) from [<0800f05b>] (show_stack+0xb/0xc)
> >   [<0800f05b>] (show_stack) from [<0800f553>] (__invalid_entry+0x4b/0x4c)
> > 
> > Inspired by commit a3e3d9c198 ("configs/stm32f469_disco_xip_defconfig:
> > alternative defconfig for XIP") I updated the stm32f429_disco_defconfig
> > configuration to use a newer kernel. Current setup kernel + rootfs fits
> > in 1.6MB on-chip flash memory.
> > 
> > Fixes:
> 
>   (nitpick) you normally put the fixes tag before the thing that gets fixed, not 
> before the changes you made to fix them. So in this case, it would become before 
> the Unhandled exception above.

Ok, I will do it.

> 
> >   - Move kernel to new flash bank due to growth of dtb size.
> >   - Fix kernel start address in afboot-stm32 bootloader.
> > 
> > For better binary size optimization gcc LTO is turned on.
> > 
> > Signed-off-by: Dario Binacchi <dariobin@libero.it>
> > ---
> >   .../stm32f429-disco/flash.sh                  |   2 +-
> >   .../stm32f429-disco/linux.config              | 120 ++++++++++++++++++
> >   ...9i-disco-update-kernel-start-address.patch |  30 +++++
> >   ...sco-don-t-force-init-in-chosen-boota.patch |  32 -----
> >   configs/stm32f429_disco_defconfig             |   9 +-
> >   5 files changed, 156 insertions(+), 37 deletions(-)
> >   create mode 100644 board/stmicroelectronics/stm32f429-disco/linux.config
> >   create mode 100644 board/stmicroelectronics/stm32f429-disco/patches/afboot-stm32/0001-stm32f429i-disco-update-kernel-start-address.patch
> >   delete mode 100644 board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch
> > 
> > diff --git a/board/stmicroelectronics/stm32f429-disco/flash.sh b/board/stmicroelectronics/stm32f429-disco/flash.sh
> > index b19e0a6019..3e2bf121d3 100755
> > --- a/board/stmicroelectronics/stm32f429-disco/flash.sh
> > +++ b/board/stmicroelectronics/stm32f429-disco/flash.sh
> > @@ -21,6 +21,6 @@ ${OUTPUT_DIR}/host/bin/openocd -f board/${BOARD_NAME}.cfg \
> >     -c "flash info 0" \
> >     -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f429i-disco.bin 0x08000000" \
> >     -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f429-disco.dtb 0x08004000" \
> > -  -c "flash write_image erase ${OUTPUT_DIR}/images/xipImage 0x08008000" \
> > +  -c "flash write_image erase ${OUTPUT_DIR}/images/xipImage 0x0800C000" \
> 
>   I'm a bit confused, but I think I get it now... We have 3 disco configs:
> 
> - stm32f429_disco_defconfig is XIP
> - stm32f469_disco_defconfig is in spiflash
> - stm32f469_disco_xip_defconfig is XIP
> 
>   So, perhaps, to make things clearer, we should rename this defconfig to 
> stm32f429_disco_xip_defconfig?

Yes, I agree with you, and I would rename stm32f469_disco_defconfig to stm32f469_disco_sd_defconfig too. 

> 
> [snip]
> > diff --git a/board/stmicroelectronics/stm32f429-disco/patches/afboot-stm32/0001-stm32f429i-disco-update-kernel-start-address.patch b/board/stmicroelectronics/stm32f429-disco/patches/afboot-stm32/0001-stm32f429i-disco-update-kernel-start-address.patch
> > new file mode 100644
> > index 0000000000..715ade694d
> > --- /dev/null
> > +++ b/board/stmicroelectronics/stm32f429-disco/patches/afboot-stm32/0001-stm32f429i-disco-update-kernel-start-address.patch
> > @@ -0,0 +1,30 @@
> > +From 9cdee858b36e2de7d6717e56fd3d08ad9ad25cde Mon Sep 17 00:00:00 2001
> > +From: Dario Binacchi <dariobin@libero.it>
> > +Date: Sun, 31 Oct 2021 08:52:52 +0100
> > +Subject: [PATCH] stm32f429i-disco: update kernel start address
> > +
> > +As of GNU/Linux v5.14 kernel device tree binary grows above 0x08008000
> > +and overwrites kernel binary.
> > +Therefore this commit moves kernel to the next flash bank.
> > +
> > +Signed-off-by: Dario Binacchi <dariobin@libero.it>
> 
>   Since the DTS comes from the upstream kernel AFAICS, it would seem that this 
> patch should be sent upstream as well. Have you done that? If so, please add an 
> Upstream: <URL>.

I have not sent any patches, which probably would be rejected as I only see now 
that the commit 2e499dcff3ef8 ("Add possibility to use custom kernel load address") 
allows you to override the the default kernel load address. So, I thinks it's better
to patch the afboot package in buildroot. 
 
> 
> > +---
> > + stm32f429i-disco.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/stm32f429i-disco.c b/stm32f429i-disco.c
> > +index 8b27641..14a6f1e 100644
> > +--- a/stm32f429i-disco.c
> > ++++ b/stm32f429i-disco.c
> > +@@ -88,7 +88,7 @@ static void fmc_wait_busy(void)
> > +
> > + void start_kernel(void)
> > + {
> > +-	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(0x08008000 | 1);
> > ++	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(0x0800C000 | 1);
> > +
> > + 	kernel(0, ~0UL, 0x08004000);
> > + }
> > +--
> > +2.17.1
> > +
> > diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch b/board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch
> > deleted file mode 100644
> > index d6d5c61aae..0000000000
> > --- a/board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch
> > +++ /dev/null
> > @@ -1,32 +0,0 @@
> > -From ded9afa688184b3240a92c2b8f114c545a09bc3f Mon Sep 17 00:00:00 2001
> > -From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > -Date: Sat, 12 Mar 2016 23:14:41 +0100
> > -Subject: [PATCH] ARM: stm32f249-disco: don't force init= in /chosen/bootargs
> > -
> > -There is no reason to override the kernel's default init= value, as
> > -this breaks userspace that assumes the kernel default of /init is
> > -used. Since stm32 is often used with a minimal bootloader
> > -(afboot-stm32) that doesn't provide any mechanism to override the DTB,
> > -we need to adjust the kernel command line in the Device Tree source.
> > -
> > -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ----
> > - arch/arm/boot/dts/stm32f429-disco.dts | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
> > -index f0b731d..2bae81c 100644
> > ---- a/arch/arm/boot/dts/stm32f429-disco.dts
> > -+++ b/arch/arm/boot/dts/stm32f429-disco.dts
> > -@@ -53,7 +53,7 @@
> > - 	compatible = "st,stm32f429i-disco", "st,stm32f429";
> > -
> > - 	chosen {
> > --		bootargs = "root=/dev/ram rdinit=/linuxrc";
> > -+		bootargs = "root=/dev/ram";
> > - 		stdout-path = "serial0:115200n8";
> > - 	};
> > -
> > ---
> > -2.6.4
> > -
> > diff --git a/configs/stm32f429_disco_defconfig b/configs/stm32f429_disco_defconfig
> > index 2c0641a6c5..58367fca0b 100644
> > --- a/configs/stm32f429_disco_defconfig
> > +++ b/configs/stm32f429_disco_defconfig
> > @@ -1,13 +1,14 @@
> >   BR2_arm=y
> >   BR2_cortex_m4=y
> >   BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
> > +# BR2_UCLIBC_INSTALL_UTILS is not set
> > +BR2_GCC_ENABLE_LTO=y
> >   BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
> >   BR2_LINUX_KERNEL=y
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
> 
>   You *must* keep this (and the linux-headers version) explicitly, relying on 
> the default is not OK. Indeed, if the default kernel is update in Buildroot 
> (which happens every couple of weeks), then it's possible it will grow again and 
> doesn't fit any more.

OK

> 
> 
> > -BR2_LINUX_KERNEL_DEFCONFIG="stm32"
> > +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> > +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
> >   BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> > +BR2_LINUX_KERNEL_XZ=y
> 
>   Err, now I'm really confused, this is a XIP kernel right, so it shouldn't be 
> compressed?

Yes, you are right.
> 
>   Regards,
>   Arnout

Thanks and regards,
Dario

> 
> >   BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
> >   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >   BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f429-disco"
> >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
