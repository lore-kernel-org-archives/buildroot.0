Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C468ECCA470
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 19:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8254D60ABD;
	Tue,  7 Oct 2025 19:45:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ZVxtsP04fWn; Tue,  7 Oct 2025 19:45:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 810F260A93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 810F260A93;
	Tue,  7 Oct 2025 19:45:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 79696226
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B6AC80FDD
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3nEMPfued3ny for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 19:45:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6DA4C80FD7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DA4C80FD7
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DA4C80FD7
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:45:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 7E2832003C3;
 Tue,  7 Oct 2025 21:45:38 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 07 Oct 2025 21:45:38 +0200
MIME-Version: 1.0
Date: Tue, 07 Oct 2025 21:45:38 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251006211044.3344025-1-bernd@kuhls.net>
References: <20251006211044.3344025-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <afc4de0822f6deac6d77c7aa34ecc562@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759866339;
 bh=2a1F60I6k3BC3i31d8P1tOIG+iGnZT4rAsgTtRiCDTA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PxG2fdMhHC4cbHK8Eoo7+frsLNcrK8saTZ53Nblm2b73dqq/XQ9jra6I53s6RWKpI
 zRAXpA+d718F9o75811sdL3X+TB20ZuSOjQL0ha77jOUuaryID+oi7MJoNtyKKbPdQ
 R06G5J9uuH2acrG3YKEsQFadG2N+Nu+hSfjlq20eul1C4XwTdfo2YloL7rEKBixj8/
 iRQJnBQmzMeJsraNkH14Ih4XkqiBeUlTASAhKKdf84PC4KMi65vB83ds1cx+JeVawY
 Jrnu+6Dg87oHMtVeQT1T5SUdr5aIQ+D9wW2crSQDvY9uOqfSPAhkFta2ifgEJdoW6W
 MCIz6NlUhAIhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PxG2fdMh
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libtheora: bump version to
 1.2.0
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

On 06/10/2025 23:10, Bernd Kuhls wrote:
> Release notes:
> https://xiph.org/press/2025/theora-release-1.2/
> https://gitlab.xiph.org/xiph/theora/-/blob/v1.2.0/CHANGES?ref_type=tags
> 
> Removed patch 0001 which is not needed anymore due to upstream commit:
> https://gitlab.xiph.org/xiph/theora/-/commit/14045376ee6897f20f6bb9815f246172da748e50
> 
> Removed patch 0002 which is included in this release.
> 
> Updated license hash due to upstream commit:
> https://gitlab.xiph.org/xiph/theora/-/commit/b68e2e53b30365f52204521d00b5db3d1cc439d5
> 
> Disabled assembly code on arm following Debian:
> https://sources.debian.org/src/libtheora/1.2.0%2Bdfsg-6/debian/rules#L14
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks. For info, I changed the conditional 
_CONF_OPTS override
to a conditional append. This also fixed a check-package error. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/5e769b87ecfb5d61c6f32fac3f8cdf2fb24e91a6

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
