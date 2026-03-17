Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C67DFED9EC
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 16:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0949483EDF;
	Tue, 17 Mar 2026 16:25:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JIrfKlsSoPr5; Tue, 17 Mar 2026 16:25:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48FC683EC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773764754;
	bh=ORJnwi/s5rjq9DbaZt1zZg2u3Nq/nu6ncz4WMElEIcA=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=stPqU0biRysoNYfigqorTiG158gakqm89GlwAnPN0V8aPNZ3aFHoYg0RQyktuqt+L
	 Mw0bswKFZ16ebHu1eurHz4Ji5V2joScDB+V5yF2egXbFgqczo01plKLulGGOwqwIVW
	 TzfiTB6QBWGi2nLzfdkUPnidE+4kmtKM/ZmtQhu/5TSkZyI6f4bACqxG2o6CjDkY4D
	 VNg42p4KqjOMpN+Sq/j2GLZr+ItcYSgDK0NYgjba+BsOIXumjQRweeqBI4WSysno5z
	 EWygxM8EKrfZjlWBFVtB9ecfFVYhfxlMbj406aBvTebP035rur7zxan0mL2Tg6piap
	 3rtfAlXQFdCtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48FC683EC4;
	Tue, 17 Mar 2026 16:25:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C60911B6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 16:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABD724167A
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 16:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsIpWNq1EreL for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 16:25:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2507F41677
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2507F41677
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2507F41677
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 16:25:50 +0000 (UTC)
Received: from [192.168.50.134] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id 2XEqwqErnP2aD2XEqwRg1Q; Tue, 17 Mar 2026 17:25:48 +0100
Message-ID: <a3328f9e-a552-40ec-b527-dd883c7286ae@benettiengineering.com>
Date: Tue, 17 Mar 2026 17:25:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Jesse Taube <Mr.Bossman075@gmail.com>
References: <20260317162303.3077615-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260317162303.3077615-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfKEr5I4m3s5TmBQYuAoEhQjHQyEMbG1cZD/UZ1T+NFeUaxHU832Wd5mWm8w/G78bwY00BkYzoCfdnFkBpwD8eYab1zChbNrhv5ahtR5XGhwvjLgEMjHz
 BOx/bLcNNQpTJjr8960fBblh2GJdVTuJ8UPC641+Io86t3LnzIUOsXX2SPYMp7KqubumfWyVfBeBs5yfLz1lj4w4U3djQxHT1t/XHSdkA4hfkz08WbvhqdnN
 Rj/PfofTBwer0elJLGnE3A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1773764748; bh=jQ+gs+fTpJe6Kc3nip3QahO85EStOvUYCYJWNhx+QFM=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=YaiYex3FP4oAZQTrXPqcs5OGeKne0ewuuBZZxO6ECQuW4pFquk3OENh6URZtOnde3
 0Snp0SbD0pu2TW9syWFZZZEIhbdHO9dGRe/WQb2KZ6bwLUz/cz/2I9qEmg9wEdSAYU
 xZ6lF2LkIDHrll3DFYQsbfmHIkWuTX/d9AsYti+jERQPa6RiP/m07VIBKYS2JDYv+E
 sYQoQEeB9KcgZIc6orAmeoB8/USJQsmf8GyVb0WZd0f0T4QuE8VtikkLN4mLgz2FdS
 L7/qWaJdEyzclOnEM0wJjI3qy4Uox8XeuquCVcnIa88TB06cIHO4MbnfbWDp4IByHe
 KZVf185q4mbiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=YaiYex3F
Subject: Re: [Buildroot] [PATCH] configs/imxrt1050-evk_defconfig: bump
 u-boot to fix the build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On 17/03/2026 17:23, Giulio Benetti wrote:
> Python setuptools has removed the obsolete pkg_resources python module in
> v82.0.0. This module is used by the binman command in U-Boot until
> v2025.10.
> Since the python-setuptools package has been updated to v82.0.0 in
> Buildroot, the iot-gate-imx8_ebbr_defconfig (using U-Boot v2025.07 and
> binman) fails to build with the following error [1]:
> 
>    ModuleNotFoundError: No module named 'pkg_resources'
> 
> Update the defconfig to use a more recent U-Boot v2026.01, to fix the
> build.

And at the same time bump Linux to version 6.18.18.

Can a maintainer reword the patch while applying?
Otherwise I can send a V2 patch.

Best regards
Giulio

> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/13476922027
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   board/freescale/imxrt1050evk/patches/linux/linux.hash | 2 +-
>   board/freescale/imxrt1050evk/patches/uboot/uboot.hash | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/board/freescale/imxrt1050evk/patches/linux/linux.hash b/board/freescale/imxrt1050evk/patches/linux/linux.hash
> index 216d9b9d39..020dc72386 100644
> --- a/board/freescale/imxrt1050evk/patches/linux/linux.hash
> +++ b/board/freescale/imxrt1050evk/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  0fcbbbbcd456e87bbbfc8bf37af541fda62ccfcce76903503424fd101ef7bdee  linux-6.12.43.tar.xz
> +sha256  f4855f382c1b735c84072bdef36db5bcd5dc7b0c37e42f5104317149a0a486ef  linux-6.18.18.tar.xz
> diff --git a/board/freescale/imxrt1050evk/patches/uboot/uboot.hash b/board/freescale/imxrt1050evk/patches/uboot/uboot.hash
> index 440526977b..b6a925ea4e 100644
> --- a/board/freescale/imxrt1050evk/patches/uboot/uboot.hash
> +++ b/board/freescale/imxrt1050evk/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
> +sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
