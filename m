Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD4BEB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 19:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9B616110B;
	Tue, 25 Jul 2023 19:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9B616110B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zMnd4a5E4yOb; Tue, 25 Jul 2023 19:14:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A0DA610F5;
	Tue, 25 Jul 2023 19:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A0DA610F5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 753071BF83B
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B664610F5
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B664610F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RxfUmL0iaoh3 for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 19:14:34 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01395610EF
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 19:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01395610EF
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c1a3:ebab:98d8:8372])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id CA394780373;
 Tue, 25 Jul 2023 21:14:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jul 2023 21:14:28 +0200
Date: Tue, 25 Jul 2023 21:14:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230725191428.GH3544423@scaer>
References: <20230724211425.2059699-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230724211425.2059699-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690312470;
 bh=JGW/qZ+WxD0htRLaOooYgCEA5uKoaHA3ZkCTSYzVqnE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rCfkZNnK9IPrxMDOwYb91XxZjSPehq873D5l6PeriCoSCtYV//xtIb3FhTVTLVimb
 HxBb5THFYBjjNNEqavbd3mdlUcNRxNQRJbZw3/Ha/D0c2y/HtL5b8WDKYqRwHiVH9l
 aLik9TTZYF7ttxZ/67SU2Mpo5qzVHubEAExNrW4fSh0OUyMpvkzfCi9m55uMblCHMD
 axw90cPwGOPeDxGgk9jX0XCufi1wGqpwryRrQGrS3WfhUvN1d5g08Fvi+9am9uwtsj
 dHlCWBDlRcz8AZtRz0p0C02rEdrUKBf2sB9ZVNYith71z1LMy4ZY23+xZxrPzUpUV4
 j7OP0nWIBFbiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rCfkZNnK
Subject: Re: [Buildroot] [PATCH 1/1] package/opensc: renumber patch
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

Bernd, All,

On 2023-07-24 23:14 +0200, Bernd Kuhls spake thusly:
> Buildroot commit c02707a34226c15426b9cac35aefda7d7e9b0125 added two
> upstream patches with the same number, renumber the younger patch.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...0.patch => 0002-fixed-compatibility-with-LibreSSL-3.7.0.patch} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename package/opensc/{0001-fixed-compatibility-with-LibreSSL-3.7.0.patch => 0002-fixed-compatibility-with-LibreSSL-3.7.0.patch} (100%)
> 
> diff --git a/package/opensc/0001-fixed-compatibility-with-LibreSSL-3.7.0.patch b/package/opensc/0002-fixed-compatibility-with-LibreSSL-3.7.0.patch
> similarity index 100%
> rename from package/opensc/0001-fixed-compatibility-with-LibreSSL-3.7.0.patch
> rename to package/opensc/0002-fixed-compatibility-with-LibreSSL-3.7.0.patch
> -- 
> 2.39.2
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
