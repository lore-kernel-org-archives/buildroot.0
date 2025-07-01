Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F11C83038
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 20:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCEE480BBC;
	Tue,  1 Jul 2025 20:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZdy6RdcRI4S; Tue,  1 Jul 2025 20:27:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 059C680BD5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 059C680BD5;
	Tue,  1 Jul 2025 20:27:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F701128
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E90B6418E5
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qm_AymlZlgKm for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 20:27:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18B15417E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18B15417E2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18B15417E2
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:27:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E17B219F57E;
 Tue,  1 Jul 2025 22:27:35 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 01 Jul 2025 22:27:35 +0200
MIME-Version: 1.0
Date: Tue, 01 Jul 2025 22:27:35 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250701170432.664876-1-bernd@kuhls.net>
References: <20250701170432.664876-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <f1196cf43a8d4517da17e714c34bfa90@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751401658;
 bh=IM20buEeUgtnk+mjzaIcAg9r4YhXqYgtdnCv9OJUf/Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=trzmNQH98t6L5/LXPrQgPOU14Vcuokzipokl2ZsM5A65iJ7tDiAAEW7Ugh58RPgAV
 taMUQW/o8AgNFVbsC0hTpRZOPECl4UVw8ZWnKs+ehml1g7RyAc9KMbTwHpxl/YDFgy
 xziZX3c8za1BQvAZJdBFH67xlrRf0jstaVka9CFO+aBKhf2Gz5u35i+pFjHECggxWc
 KJeu9s++d1nnSgaPL7Tf9VsiDwK4Gvxmpe3aMfFTzhqqemWFgc6ZN4C3s96ycLB+aL
 y9FcJmQJTJiLOnXLqOXbdeajtt6Jrz9kWOJ6czZk11/5CIccOO2FNiuVE5IS/1K4m9
 D1NldCZoGH0mQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=trzmNQH9
Subject: Re: [Buildroot] [PATCH 1/1] package/python-emailproxy: bump version
 to 2025.6.25
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

On 01/07/2025 19:04, Bernd Kuhls wrote:
> Release notes: https://github.com/simonrob/email-oauth2-proxy/releases
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
