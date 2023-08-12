Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA5DC0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 12:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3E03608D8;
	Sat, 12 Aug 2023 12:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3E03608D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XVN1CSViCDU6; Sat, 12 Aug 2023 12:00:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 352B960EB3;
	Sat, 12 Aug 2023 12:00:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 352B960EB3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0EC051BF282
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 12:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBCDB40533
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 12:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBCDB40533
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6A5hVAX5YdCV for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 12:00:07 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7FEBC40579
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 12:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FEBC40579
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id 2F29CA046C;
 Sat, 12 Aug 2023 14:00:04 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix02.mail.de (Postfix) with ESMTP id 12216A03C3;
 Sat, 12 Aug 2023 14:00:04 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 33DCE10012D;
 Sat, 12 Aug 2023 14:00:01 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 14:00:00 +0200
Message-ID: <2300152.ElGaqSPkdT@kilian-aisec>
In-Reply-To: <20230812110359.27170-1-peterlin@andestech.com>
References: <20230812110359.27170-1-peterlin@andestech.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2405
X-purgate-ID: 154282::1691841603-90D0F7B6-00C688E0/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691841604;
 bh=p1Nq/Aa5+WjN7M2liyDnkIOdi+T8oM7VkwNIzcG4CZ8=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=cwFBcFD+R3/InieNDvpAuuA1LcsWXZz/vkKzThfEP9gaLQaGnBsnUuMBxN8+QxNvE
 QlX2sVTJG/qyFG8UPLqu6pMMpmORLeNs0CTzvOAxS0vZV4bArlvEBWYavfiA6/2t+T
 DeYDBWnvwpmZw/B0/XxWCcDDLwj9vKJLzLTzSstQPoU3dpZycmDnFdeGct4tA3+fE4
 lUPut892O+rOid904eBqlklKn5QxRiSOqJclBOs4ASz11RSTYvVdnwP1QBWcpIUpd2
 Vbu6/8sT2PjonU9bD9moN8LwO5lLNss/o3W6Nq5gxOA+rTPdzUJ0ws8dkilH+bUn3U
 b1GEAvLRDTEmg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=cwFBcFD+
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Yu Chien Peter Lin <peterlin@andestech.com>, ycliang@andestech.com,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yu Chien Peter,

> - Select RVA extension so the toolchain uses glibc by default
> - Enable Zifencei and Zicsr for gcc-12 to fix U-Boot build failure

Yeah, this zifencei_zicsr extension flag thing is annoying ...

> Fixes:
> - https://gitlab.com/buildroot.org/buildroot/-/jobs/4839059655
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
>  configs/andes_ae350_45_defconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/configs/andes_ae350_45_defconfig
> b/configs/andes_ae350_45_defconfig index 998276635b..faf29b8b6b 100644
> --- a/configs/andes_ae350_45_defconfig
> +++ b/configs/andes_ae350_45_defconfig
> @@ -1,6 +1,7 @@
>  BR2_riscv=y
>  BR2_riscv_custom=y
>  BR2_RISCV_ISA_CUSTOM_RVM=y
> +BR2_RISCV_ISA_CUSTOM_RVA=y
>  BR2_RISCV_ISA_CUSTOM_RVF=y
>  BR2_RISCV_ISA_CUSTOM_RVD=y
>  BR2_RISCV_ISA_CUSTOM_RVC=y
> @@ -38,7 +39,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
>  BR2_TARGET_UBOOT_SPL=y
> -BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="ARCH_FLAGS=-march=rv64imafdc"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="ARCH_FLAGS=-march=rv64imafdc_zifencei_zic
> sr" BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y

I am not sure, whether you need to specify custom makeopts for uboot after 
all: Looking at the current andes_ae350_45_defconfig (https://gitlab.com/
buildroot.org/buildroot/-/blob/4de60e41c3487946712da6d889ef89d325c2032a/
configs/andes_ae350_45_defconfig), it seems, that there is no special/custom gcc 
version defined. Hence the gcc version should be buildroot's current default 
version, i.e., v12.3.0. For this version, buildroot already adds the flags for 
zifencei and zicsr extension, see here:

https://gitlab.com/buildroot.org/buildroot/-/blob/
4de60e41c3487946712da6d889ef89d325c2032a/arch/arch.mk.riscv#L38-39

And I also believe, that these defines should be sufficient to set the rv64imafdc 
flags:

>  BR2_RISCV_ISA_CUSTOM_RVM=y
> +BR2_RISCV_ISA_CUSTOM_RVA=y
>  BR2_RISCV_ISA_CUSTOM_RVF=y
>  BR2_RISCV_ISA_CUSTOM_RVD=y
>  BR2_RISCV_ISA_CUSTOM_RVC=y

So I think setting BR2_RISCV_ISA_CUSTOM_RVA=y is correct. However, you could 
try whether it works, if you then completely remove the 
BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS?

Best regards,
Kilian



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
