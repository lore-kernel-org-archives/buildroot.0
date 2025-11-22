Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0615CFC51F
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 16:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C0DF840BA;
	Sat, 22 Nov 2025 16:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hg5e81j_OeEF; Sat, 22 Nov 2025 16:44:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 907D6840A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 907D6840A5;
	Sat, 22 Nov 2025 16:44:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 77F02350
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7614641012
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WB8XAfvgo-Je for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 16:44:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9DB5D40FDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DB5D40FDC
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DB5D40FDC
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:44:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9010919F59C;
 Sat, 22 Nov 2025 17:44:11 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Nov 2025 17:44:11 +0100
MIME-Version: 1.0
Date: Sat, 22 Nov 2025 17:44:11 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Will Newton <will.newton@gmail.com>
In-Reply-To: <20251122125442.2235928-1-bernd@kuhls.net>
References: <20251122125442.2235928-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <b012bc068b7cb0e4c5301572ac4ec292@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763829853;
 bh=hBBLzBj2BxsrXkoNYN6jM/9W76d/BHbbE1/+xe98KPs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z7ueUL3sy+/arKlSNrgkLAHVQEM8X5M5dR2Zvy/CzIfVk8Ev9oMPp8iVSlwa7FHFd
 KFZ1niDFAAm1ZbponIpucc+l5g4OVrFgrCOyfapHeuveUnWd5R4VESYzeR5qotYjU1
 +QhZOQBm1ZYLCJnWIwcKaRWdvwuHzgoLYDcakGd6QJGo4ekdYpE2OTThCWPMx89WCM
 pC39umnJZLbRDybp/IZsOZY8k95wFWe8r79+2iFXH7bNY+lVed/be/z2BGf/GwnZYS
 RJ9hWzvJXJ03XrzdWFUJqSKVhAX2hlok6GGc69+mpsqhoPFC8UzjflxKS2Oox5klY8
 yUpXpvbr7EKBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z7ueUL3s
Subject: Re: [Buildroot] [PATCH 1/1] package/time: fix build with newer gcc
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 22/11/2025 13:54, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/2d4/2d440a31fc49366d77289f1d21080e1861c6ee21/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
