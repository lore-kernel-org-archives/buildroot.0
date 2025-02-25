Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024D8C021B2
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 20:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE05380E41;
	Tue, 25 Feb 2025 20:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9IBfGiopZrr; Tue, 25 Feb 2025 20:00:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D687D80E90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D687D80E90;
	Tue, 25 Feb 2025 20:00:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 584D42292
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 19:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C86140D6C
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 19:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFqL63o3qIvQ for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 19:59:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6604640D69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6604640D69
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6604640D69
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 19:59:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D3305B00539;
 Tue, 25 Feb 2025 20:59:53 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 25 Feb 2025 20:59:53 +0100
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 20:59:53 +0100
From: Julien Olivain <ju.o@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
In-Reply-To: <20250225155040.3209582-2-buildroot@heine.tech>
References: <20250225155040.3209582-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.10
Message-ID: <d21700582ae53ed1b3a19b54c86a4932@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740513595;
 bh=xNAJ0ln6arUfw/jBHA1FBIEeRRcQT4xsKpbBk3Uu2+s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PLpjmG3YwwYqvAkkciTCLyVIl9aVPE33HZonn2Pr7xXWhKXqfBuGQtrPzG5lIR6Tc
 5T+K1iXNoXYe1rEwNOuB0MztGqkONd+T84xUmQp8fMtIYmW4JWcjRtLYVVpRQ3vHGF
 dCr1t/APA1GztS5SxpWKAWd1OuQP4LVmfoR/AgmAPNEGem3tyMaKBF0U+q1PIZzPJZ
 yhOWh6f0mMCobaPBCTnidLgO8NmQQ4UxTv584z29zOeqNKuAoRLDBsLjLDuxJyKVHX
 2Cl2kv6H4D+55L3lNpugS9v/El/WgAoMg81VjwzY+h+wFo39bm44gcjsAJJG1uizzi
 9FwWVfHN3K69Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PLpjmG3Y
Subject: Re: [Buildroot] [PATCH] package/procps-ng: fix build with missing
 pidfd_open
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

On 25/02/2025 16:50, Michael Nosthoff via buildroot wrote:
> port back patch introduced shortly after the 4.0.5 release.
> 
> Fixes:
>   checking for __NR_pidfd_open... no
>   configure: error: Neither pidfd_open or __NR_pidfd_open found. 
> Disable pidwait with configure option --disable-pidwait
> 
> happening with this defconfig:
> 
> BR2_arm=y
> BR2_cortex_a15_a7=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_INIT_SYSTEMD=y
> BR2_PACKAGE_PROCPS_NG=y
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
