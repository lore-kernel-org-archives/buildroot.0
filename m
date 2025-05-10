Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375B5C3ABC3
	for <buildroot@archiver.kernel.org>; Sat, 10 May 2025 17:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBA2482D07;
	Sat, 10 May 2025 17:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1kaLTRq3X-r; Sat, 10 May 2025 17:23:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 368B182D14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 368B182D14;
	Sat, 10 May 2025 17:23:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5522AE2
 for <buildroot@buildroot.org>; Sat, 10 May 2025 17:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4ECAE40BA9
 for <buildroot@buildroot.org>; Sat, 10 May 2025 17:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXa_G9BDGFP6 for <buildroot@buildroot.org>;
 Sat, 10 May 2025 17:23:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B0CE940859
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0CE940859
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0CE940859
 for <buildroot@buildroot.org>; Sat, 10 May 2025 17:23:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B812613F880;
 Sat, 10 May 2025 19:23:09 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 May 2025 19:23:09 +0200
MIME-Version: 1.0
Date: Sat, 10 May 2025 19:23:09 +0200
From: Julien Olivain <ju.o@free.fr>
To: Doug Kehn <rdkehn@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250509230843.334094-1-rdkehn@gmail.com>
References: <20250509230843.334094-1-rdkehn@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <4d0bb404d0daba6e9f77dfe481cb5362@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746897790;
 bh=dR2eKe6l4BkpVwXk5Mb3//CA79EpSKZr3YF5rtZTnNQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MuFGY7Tgc1dKcpYf9sbTEB1VBBJ3/REFEeaiDbzgK6MkG6i5ZYhc6TF4/tTYzMKpC
 rSvIcVpeA1C84a9cP95uXt+NXVUXkT/k6Fu6lRcBMhzwOV7BNDx5Ek9IcdJt9JB3Xc
 3+8ISQSLuL3drEqiFPKqgLIkbZYzIzjLrFCCJp37QkFM6n93blzSRyoCYXBHpR6VF2
 YEBBjIM1teSykCI8BFxLEe//l6FBY0hWWYtDUPF0ZmT3WhlgWER2c0kiSXm3Am0uA3
 j52U+mGkJ5OLa+bLPcYMiuJU2JYCLGpG6S1dwWToOuafS5Yr0HBF8dp+tjzYnLMJsh
 IjCFkLRrwjKHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MuFGY7Tg
Subject: Re: [Buildroot] [PATCH 1/1] package/nss-pam-ldapd: bump version to
 0.9.13
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

On 10/05/2025 01:08, Doug Kehn wrote:
> Signed-off-by: Doug Kehn <rdkehn@gmail.com>

Applied to master, thanks.

For info, I added a link to the release announce in the commit log.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
