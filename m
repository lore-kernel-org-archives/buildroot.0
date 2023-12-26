Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC18C4706F
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 20:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88FB6815CC;
	Tue, 26 Dec 2023 20:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88FB6815CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBGMLPuVFqrB; Tue, 26 Dec 2023 20:27:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8163381756;
	Tue, 26 Dec 2023 20:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8163381756
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14F7A1BF591
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E033F4090E
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E033F4090E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s7NVWrV8Pbjz for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 20:25:44 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DA59408D5
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 20:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DA59408D5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 029DAB00565;
 Tue, 26 Dec 2023 21:25:36 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 26 Dec 2023 21:25:36 +0100
Date: Tue, 26 Dec 2023 21:25:36 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZYs2wMUgwAbVW7I1@landeda>
References: <20231226151442.445276-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231226151442.445276-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703622341;
 bh=f+e+Z/6t0acOvT5n+QJwW9DSx1LH04F6dnfdLN8Zv3g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KUQ8glqODC+2daTCEOmdSCoK98b7CXd6hcPa2s4cgQD+2gaJRKsadUgEhQy+f4GEP
 BWeFzobXManSZ38cPmNnR0YN26JekdcXNb6tXE30Gp0UwiRh82/BggiqrIZ4CbKs1q
 x04z1JAjuGjJm3zKzs8UUy4smNNup+3Ki4OsMwfJf3bt7zPKl6KTt/RNU93Y+12w9E
 oA/T0Hk0uGaboWcodUtDAC9yBf96v1t172BCfizXCkL3VuXhjbSw4o5nA8gnvzWwF0
 /X8FnuByN/VSnpnxI4mC6og3JVco8RNtgFSJKLia7LGupdz1R/ffYTGZjDxDVEAyHC
 1kSEnAN6M9F1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KUQ8glqO
Subject: Re: [Buildroot] [PATCH 1/1] package/onevpl-intel-gpu: add CPE
 variables
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-12-26 16:14 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:intel:onevpl_gpu_runtime is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/detail/7F7056CA-A41D-4AB5-B9CC-9DE24A27B8BA
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/onevpl-intel-gpu/onevpl-intel-gpu.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
> index 0a62ebbb6a..da6da2ad61 100644
> --- a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
> +++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
> @@ -8,6 +8,8 @@ ONEVPL_INTEL_GPU_VERSION = 23.4.3
>  ONEVPL_INTEL_GPU_SITE = $(call github,oneapi-src,oneVPL-intel-gpu,intel-onevpl-$(ONEVPL_INTEL_GPU_VERSION))
>  ONEVPL_INTEL_GPU_LICENSE = MIT
>  ONEVPL_INTEL_GPU_LICENSE_FILES = LICENSE
> +ONEVPL_INTEL_GPU_CPE_ID_VENDOR = intel
> +ONEVPL_INTEL_GPU_CPE_ID_PRODUCT = onevpl_gpu_runtime
>  ONEVPL_INTEL_GPU_DEPENDENCIES = libva libvpl
>  
>  $(eval $(cmake-package))
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
