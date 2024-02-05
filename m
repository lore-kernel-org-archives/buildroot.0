Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8271CC48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3300541A88;
	Mon,  5 Feb 2024 21:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3300541A88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uxxYfc9gTd7X; Mon,  5 Feb 2024 21:55:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 626CB41A60;
	Mon,  5 Feb 2024 21:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 626CB41A60
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA00E1BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF81C403A2
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:55:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF81C403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iDEh6sxvU6yv for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:55:03 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7EB024012F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:55:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EB024012F
Received: from ymorin.is-a-geek.org (unknown [194.78.211.220])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 38B4A19F769;
 Mon,  5 Feb 2024 22:54:56 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Feb 2024 22:54:45 +0100
Date: Mon, 5 Feb 2024 22:54:45 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <ZcFZJdnTiBKGVmyp@landeda>
References: <cover.1707060159.git.yann.morin.1998@free.fr>
 <d49b322f135647c46b0a6ba3d077e11269dae161.1707060159.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d49b322f135647c46b0a6ba3d077e11269dae161.1707060159.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707170101;
 bh=zAHqfxduCyGzbwibgbJ5H1PjONgVMAcPey3jNsZ0niI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lucSEsFEHMmEiafT+4335ff/4S6OOd4kYk/5WDXGbWKmAsDCQrD/EawhYH3Z6QaaM
 9OUt8N+MCnhhUQgDpp89TYZX09TYHQBtgYCkSHZroduRW9uQqVyAuHEmYHC78chdXa
 cCl/oEq7t+Bq2zjraIbpDuSAc4lkkSEcWaC3nyIfResyH75NAMwevSQbOhSO8eR2tr
 SjGNYuNia6gFnE1AUhuzbsT/OIWtyNFfkRSayAJp4UydEf3XY8Sqhch/S7N+FIWzNn
 kNmDr7iTBxuiplP1o7dWtEK1jNRtLm3Y0qQPMrga6zbcz8D+B2MQ41+BJroWLgL39p
 9jIgutppOdgYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lucSEsFE
Subject: Re: [Buildroot] [PATCH 1/4] package/containerd: drop
 CONTAINERD_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-02-04 16:22 +0100, Yann E. MORIN spake thusly:
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> Commit 35af2bb8011ea57642777acf5613afa244d325d7 set
> CONTAINERD_CPE_ID_PRODUCT to containerd but this is not needed as
> CONTAINERD_CPE_ID_PRODUCT will be set to the package name
> (i.e. containerd) by default
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/containerd/containerd.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
> index 61a8472ddd..d3ca102797 100644
> --- a/package/containerd/containerd.mk
> +++ b/package/containerd/containerd.mk
> @@ -9,7 +9,6 @@ CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
>  CONTAINERD_LICENSE = Apache-2.0
>  CONTAINERD_LICENSE_FILES = LICENSE
>  CONTAINERD_CPE_ID_VENDOR = linuxfoundation
> -CONTAINERD_CPE_ID_PRODUCT = containerd
>  
>  CONTAINERD_GOMOD = github.com/containerd/containerd
>  
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
