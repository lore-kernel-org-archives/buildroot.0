Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9F5C001DB
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 02:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49D9060B5D;
	Mon, 14 Aug 2023 02:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49D9060B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nyfJrAa5FG1T; Mon, 14 Aug 2023 02:19:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9051460BD2;
	Mon, 14 Aug 2023 02:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9051460BD2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6ADC41BF48B
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 02:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F186409AC
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 02:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F186409AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c3pxpClzAxYX for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 02:19:27 +0000 (UTC)
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D51B040866
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 02:19:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D51B040866
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 37E2JBV2030406;
 Mon, 14 Aug 2023 10:19:11 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Mon, 14 Aug 2023 10:19:10 +0800
Date: Mon, 14 Aug 2023 10:19:06 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 <kilian.zinnecker@mail.de>, <buildroot@buildroot.org>
Message-ID: <ZNmPGrnwvKL3Fo-O@APC323>
References: <20230812110359.27170-1-peterlin@andestech.com>
 <2300152.ElGaqSPkdT@kilian-aisec>
 <20230812142759.2bc8cee3@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230812142759.2bc8cee3@windsurf>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 37E2JBV2030406
Subject: Re: [Buildroot] [PATCH] andes_ae350_45: Fix build issues of AE350
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
Cc: ycliang@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Aug 12, 2023 at 02:27:59PM +0200, Thomas Petazzoni wrote:
> On Sat, 12 Aug 2023 14:00:00 +0200
> Kilian Zinnecker <kilian.zinnecker@mail.de> wrote:
> 
> > So I think setting BR2_RISCV_ISA_CUSTOM_RVA=y is correct. However, you could 
> > try whether it works, if you then completely remove the 
> > BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS?
> 
> The U-Boot version used by the andes_ae350_45 defconfig indeed includes:
> 
> # Newer binutils versions default to ISA spec version 20191213 which moves some
> # instructions from the I extension to the Zicsr and Zifencei extensions.
> toolchain-need-zicsr-zifencei := $(call cc-option-yn, -mabi=$(ABI) -march=$(RISCV_MARCH)_zicsr_zifencei)
> ifeq ($(toolchain-need-zicsr-zifencei),y)
>         RISCV_MARCH := $(RISCV_MARCH)_zicsr_zifencei
> endif
> 
> So it should already be doing the right thing automatically. However,
> the fact that the defconfig forces its own ARCH_FLAGS=-march=rv64imafdc
> is probably what breaks the build.
> 
> So I agree with Kilian here: please try without any:
> 
> BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="ARCH_FLAGS=-march=rv64imafdc"
> 
> and see if that helps. However in that case, you might need indeed to
> keep the addition of BR2_RISCV_ISA_CUSTOM_RVA=y as part of the fix:
> please double check that.
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Hi Thomas, Kilian,

Yeah, I should not override the ARCH_FLAGS with BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS.
I've rebuilt it without any problems, so I will remove the configuration and
add a patch to set R2_RISCV_ISA_CUSTOM_RVA.

Thanks for your review!

Best regards,
Peter Lin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
