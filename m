Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860A4C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 02:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B36F881E68;
	Sun, 13 Nov 2022 02:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B36F881E68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KaMWKBpFJ9Ft; Sun, 13 Nov 2022 02:41:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0FE481D70;
	Sun, 13 Nov 2022 02:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0FE481D70
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 529041BF4DA
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 02:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2899F408F1
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 02:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2899F408F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id brjU1MIq1jrC for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 02:41:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F090408E3
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F090408E3
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 02:41:21 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 2AD2fFKR093929
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 10:41:15 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Sun, 13 Nov 2022 10:41:15 +0800
Date: Sun, 13 Nov 2022 10:38:26 +0000
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: <buildroot@buildroot.org>
Message-ID: <Y3DJIug0WIBvJljr@APC323>
References: <20221112125113.18264-1-peterlin@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221112125113.18264-1-peterlin@andestech.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 2AD2fFKR093929
Subject: Re: [Buildroot] [PATCH] package/rustc: Add BR2_riscv_g to condition
 of tier2 host tools
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Nov 12, 2022 at 08:51:13PM +0800, Yu Chien Peter Lin wrote:
> BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS should be
> enabled when BR2_riscv_g is selected, otherwise the packages depends
> on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS need to enable
> BR2_RISCV_ISA_CUSTOM_RV{M,A,F,D,C} explicitly to make rustc available.

Sorry, I need to enable RVC for rustc, please revoke this patch.

Peter Lin

> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
>  package/rustc/Config.in.host | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> index 822de68dbb..143425f1cd 100644
> --- a/package/rustc/Config.in.host
> +++ b/package/rustc/Config.in.host
> @@ -61,9 +61,9 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
>  	default y if BR2_powerpc64le && BR2_TOOLCHAIN_USES_GLIBC
>  	# riscv64gc-unknown-linux-gnu
>  	# "g" stands for imafd, and we also need "c".
> -	default y if BR2_RISCV_64 && BR2_RISCV_ISA_RVI && BR2_RISCV_ISA_RVM && \
> +	default y if BR2_RISCV_64 && (BR2_riscv_g || BR2_RISCV_ISA_RVI && BR2_RISCV_ISA_RVM && \
>  			BR2_RISCV_ISA_RVA && BR2_RISCV_ISA_RVF && \
> -			BR2_RISCV_ISA_RVD && BR2_RISCV_ISA_RVC && \
> +			BR2_RISCV_ISA_RVD && BR2_RISCV_ISA_RVC) && \
>  			BR2_TOOLCHAIN_USES_GLIBC
>  	# s390x-unknown-linux-gnu
>  	default y if BR2_s390x && BR2_TOOLCHAIN_USES_GLIBC
> -- 
> 2.34.1
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
