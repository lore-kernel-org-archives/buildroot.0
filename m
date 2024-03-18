Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D12C54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 09:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE4B181492;
	Mon, 18 Mar 2024 09:54:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7hxSJY7aCgXu; Mon, 18 Mar 2024 09:54:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16BC981586
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16BC981586;
	Mon, 18 Mar 2024 09:54:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67A731BF365
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 09:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61E104054D
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 09:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0kwMJ3ZElRYN for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 09:54:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A10C24052F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A10C24052F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A10C24052F
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 09:54:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC0C5C0009;
 Mon, 18 Mar 2024 09:54:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rm9hD-002Z17-0g;
 Mon, 18 Mar 2024 10:54:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
References: <20240318092759.7874-1-javad.rahimipetroudi@mind.be>
 <20240318092759.7874-2-javad.rahimipetroudi@mind.be>
Date: Mon, 18 Mar 2024 10:54:19 +0100
In-Reply-To: <20240318092759.7874-2-javad.rahimipetroudi@mind.be> (Javad
 Rahimipetroudi's message of "Mon, 18 Mar 2024 10:27:59 +0100")
Message-ID: <87wmpzhnlg.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] configs/avenger96: bump Linux version
 to 6.6.21 LTS
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
Cc: Marleen Vos <marleen.vos@mind.be>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Javad" == Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com> writes:

 > This patch upgrades Kernel version to 6.6.21 LTS on avenger96 board.
 > Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
 > ---
 >  configs/avenger96_defconfig | 10 ++--------
 >  1 file changed, 2 insertions(+), 8 deletions(-)

 > diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
 > index 45600ef2fe..ba3d093d59 100644
 > --- a/configs/avenger96_defconfig
 > +++ b/configs/avenger96_defconfig
 > @@ -2,9 +2,6 @@
 >  BR2_arm=y
 >  BR2_cortex_a7=y
 
 > -# Linux headers same as kernel, a 5.8 series
 > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y

These two lines needs to be updated for 6.6, not dropped - Otherwise the
version will change once we default to 6.7 / 6.8.

> -
 >  # System configuration
 >  BR2_GLOBAL_PATCH_DIR="board/arrow/avenger96/patches"
 >  BR2_ROOTFS_OVERLAY="board/arrow/avenger96/overlay/"
 > @@ -13,10 +10,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-im
 >  # Kernel
 >  BR2_LINUX_KERNEL=y
 >  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
 > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.21"
 >  BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
 > -BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157a-dhcor-avenger96"
 > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32mp157a-dhcor-avenger96"
 >  BR2_LINUX_KERNEL_INSTALL_TARGET=y
 >  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 > @@ -39,9 +36,6 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 PLAT=stm32
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin *.stm32"
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 >  BR2_TARGET_UBOOT=y
 > -BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 > -BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 > -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"

Your commit message says linux but you are changing the u-boot version
here?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
