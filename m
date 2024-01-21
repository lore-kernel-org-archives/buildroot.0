Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2CBC47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 16:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DF8360ADD;
	Sun, 21 Jan 2024 16:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DF8360ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TBp0mJ8Bu6QG; Sun, 21 Jan 2024 16:56:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C5D660AD1;
	Sun, 21 Jan 2024 16:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C5D660AD1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E254D1BF865
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 16:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B979741744
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 16:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B979741744
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8p-pOaLdVjFh for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 16:56:18 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CD0D41742
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 16:56:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CD0D41742
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4ABA213F880;
 Sun, 21 Jan 2024 17:56:12 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Jan 2024 17:56:12 +0100
Date: Sun, 21 Jan 2024 17:56:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Za1MrFCVYzJ6mm7D@landeda>
References: <20240114123845.810225-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240114123845.810225-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705856175;
 bh=5dkbOMv4i40Y/tyTyAEagyV50CXzeTfZVRm1wp7DCc8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n2Z47PJ5cxumz3kMbxBzd3u3Q+SqZU/zQOj5vbC53L4iRAnKcQNQ/GjBE0WKrfMNF
 sOD/HPl4JcsVlMTVkqztOEXORjFyTTDtptbBSueZPrMBTweqPMh2iDi5TqbBGqaytD
 gvHXVBVwrq2ixBmrD+IY0G2W6aw+EG/NfXB/VzIqwEksd11Xy7aqARTOpvDDqg9GC+
 DiYQ7GoIQNv+IygjB9/eWE1HmHntTalQZ9c7bhLG+tdxTU/sGazIeUoZen5MvfFDna
 NmgVSZEVfyKUw9JyX7Gckaxlnjbbkp6+cNZnAelzajebKq4h4P/YPg2/Weo0g00Ktj
 x0/DztUnRTfOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=n2Z47PJ5
Subject: Re: [Buildroot] [PATCH v2,1/1] package/criu: disable on aarch64_be
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-01-14 13:38 +0100, Fabrice Fontaine spake thusly:
> armv8a aarch64_be raises the following build failure since the addition
> of the package in commit 3e4b479f39c15ffdf307ec8395d856680c727204:
> 
> Error (compel/arch/aarch64/src/lib/handle-elf-host.c:30): Unsupported Elf format detected
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8eaa881a926d138a0bfd3f1076246088994e883f
>  - http://autobuild.buildroot.org/results/8de9b4d6b26e06f6b4457a31366bdc0d8a8c34ae
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Fix condition to only exclude aarch64_be, not armeb
> 
>  package/criu/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/criu/Config.in b/package/criu/Config.in
> index 4c295acf4f..a5adc0cedd 100644
> --- a/package/criu/Config.in
> +++ b/package/criu/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
>  	default y if BR2_ARM_CPU_ARMV6
>  	default y if BR2_ARM_CPU_ARMV7A
>  	default y if BR2_ARM_CPU_ARMV7M
> -	default y if BR2_ARM_CPU_ARMV8A
> +	default y if BR2_ARM_CPU_ARMV8A && !BR2_aarch64_be
>  	default y if BR2_aarch64
>  	default y if BR2_x86_64
>  	default y if BR2_powerpc64le # Only support powerpc64 with LE
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
