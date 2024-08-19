Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A272AC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 18:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4238240143;
	Mon, 19 Aug 2024 18:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSceDw9AYY83; Mon, 19 Aug 2024 18:57:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 207CD40188
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 207CD40188;
	Mon, 19 Aug 2024 18:57:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DD101BF3CD
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 18:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B09040188
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 18:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ak1FtZqs5vCC for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 18:57:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9571D40143
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9571D40143
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9571D40143
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 18:57:28 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 118DE3521185; Mon, 19 Aug 2024 20:57:25 +0200 (CEST)
Date: Mon, 19 Aug 2024 20:57:25 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <ZsOVlbDayeReLjLV@waldemar-brodkorb.de>
References: <ZsORVO5sPhPtEjSN@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZsORVO5sPhPtEjSN@waldemar-brodkorb.de>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724093846; bh=sjifHFIGEAfEtBTqxZigCwTJNyLcTQUnR0a/6FyyU64=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p24aTwSW7vBH+qqBos+ExcpbZWVYtcpR/xU5y2BYPHy1XJJjylsAS+hYHRyg69bMi
 StBA68z9IatOMn2km017grLHnR4tWXQZ+23HN880h8mrRPQ9laTs1OQgMhc4c3SbtT
 RDxdf2IMe/kBv+rLLioQwYKYSwLElw9H4+V/MFqn4vjhflcPUudja8j2/v5naZj2A7
 oOCGgsYCMwy7yMfcC3JUB9l8CGMi6bXR46502YD2n2zDLQp1eFB1/NB2OH4Df/EzFe
 4aA2/1Z7YQxY7JL0t41NEeCY0RKpIJKMIqOSaRJhFMW6UMecUHZdh5mPfBhYOrZtMY
 NLe6b08sXMpPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=p24aTwSW
Subject: Re: [Buildroot] [PATCH] package/botan: security update to 3.5.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I forgot to mention, the License hash changed because the year was
updated from 2023 to 2024.

Waldemar Brodkorb wrote,

> See here for complete changelogs:
> https://botan.randombit.net/news.html#version-3-5-0-2024-07-08
> https://botan.randombit.net/news.html#version-3-4-0-2024-04-08
> 
> CVE-2024-34702: Fix a DoS caused by excessive name constraints. (GH
> 
> CVE-2024-39312: Fix a name constraint processing error, where if
> permitted and excluded rules both applied to a certificate, only the
> permitted rules would be checked.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/botan/botan.hash | 4 ++--
>  package/botan/botan.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/botan/botan.hash b/package/botan/botan.hash
> index 37e00ea9cc..d948271900 100644
> --- a/package/botan/botan.hash
> +++ b/package/botan/botan.hash
> @@ -1,4 +1,4 @@
>  # From https://botan.randombit.net/releases/sha256sums.txt
> -sha256  368f11f426f1205aedb9e9e32368a16535dc11bd60351066e6f6664ec36b85b9  Botan-3.3.0.tar.xz
> +sha256  67e8dae1ca2468d90de4e601c87d5f31ff492b38e8ab8bcbd02ddf7104ed8a9f  Botan-3.5.0.tar.xz
>  # Locally computed
> -sha256  1833cde7c7cc03296b1ef2ddc178b1cd7fd1c476840f32cf6aedb09ab0bc9004  license.txt
> +sha256  db9168bdccaaea26557094436652577cc9bf43164e8be078d88aef1342fe4fb6  license.txt
> diff --git a/package/botan/botan.mk b/package/botan/botan.mk
> index e0bd258f57..561e7bf702 100644
> --- a/package/botan/botan.mk
> +++ b/package/botan/botan.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BOTAN_VERSION = 3.3.0
> +BOTAN_VERSION = 3.5.0
>  BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
>  BOTAN_SITE = http://botan.randombit.net/releases
>  BOTAN_LICENSE = BSD-2-Clause
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
