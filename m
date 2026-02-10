Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A28EEB2700
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 19:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED8F883D50;
	Tue, 10 Feb 2026 19:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HPj0cevk5643; Tue, 10 Feb 2026 19:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FA1183C0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770752242;
	bh=BmiWWs6vpKb6H2d5DiMhOkZ6lZzJ66YVnNU9h3FPG/s=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ngtIfYhUJE55hRpNWADYaoeUPmY4NzHVLGN+j4dv8vCkrtP1SX8fYM8qNk6Uifhtt
	 BwN5+zeVnBJ1dcJ3wUt4iymSlSO6PeP7QWgnMlIpfWjo9PVyqLZYV7eSDRNhWEYbnn
	 3pLygFA+2RXVCuLsyWmRV7JHxg2uBNUVHP8oqayH/0V78y27DylCQ9fuiyyk3sG2to
	 vA+S32nKr4p0AQlkG2Ruzzcim81YTvgvl54dHzUe0mYpPcxm6yiqCgt2tGqjay2/4t
	 MT156pBwpPvCOX5AUwaTDiq0ID8H4axbJYwn0UhxXQI6zJkHio07fb4Dzf4QX4q0Xy
	 CgizjO/lCiyhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FA1183C0E;
	Tue, 10 Feb 2026 19:37:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 46B5323D
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 19:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B8B3403B3
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 19:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JsXllvRbFe4O for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 19:37:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E907140083
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E907140083
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E907140083
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 19:37:20 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 687912C801B0;
 Tue, 10 Feb 2026 20:37:18 +0100 (CET)
Message-ID: <f3f52af6-1504-4ca8-b95a-a558bced811a@bubu1.eu>
Date: Tue, 10 Feb 2026 20:37:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sebastien LAVEZE <slaveze@smartandconnective.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20260210144308.689103-1-slaveze@smartandconnective.com>
Content-Language: en-US
In-Reply-To: <20260210144308.689103-1-slaveze@smartandconnective.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770752238; bh=MqC4XYoTbvEaPaHs6fsjm3wmk5Tqefg7fUkpEmmJM8M=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=JWPPoDkQnCBSyZCdQfhRcC5HfzYnE7ckUxqFFxwHltNOmoR7G/nVoKnbSP9nXXtcS
 slzrWdPOKMIoNVa2ZEU2KfYFTeEWQbq9G/7vTszW9pg20IaYzuWkqar1rODoTThrih
 plbv5gBa1SlAlYVwt5z6Z1w36yRHcAxcJWcNBb47axVjU5fE4kGZHpkNggrG7iQ3Gx
 Hq/9Cm7KZeN+zT3Vq2Cf/HPd7QkOQMbWmauf39t7ZspDO6xlbHrbXr8ylCqceQDOuw
 Owc1m6fEKqxZ4gx46fG0CKHNoVexUVHC0RijpXLcI7AVVR7dMgT7riNOkXFzo3uH3r
 TK0iAikRgV+0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=JWPPoDkQ
Subject: Re: [Buildroot] [RFC PATCH] package/pkg-cargo: add HOST_* variables
 for target build
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sebastien,

On 2/10/26 15:43, Sebastien LAVEZE wrote:
> From: Sebastien Laveze <slaveze@smartandconnective.com>
> 
> Cargo builds both host (build.rs) and target in the same build stage.
> 
> Host-side build scripts (build.rs) using cc-rs resolve tools/flags through
> HOST_* before falling back to unprefixed variables. Without HOST_* set, they
> can incorrectly pick target compiler/flags and fail in mixed-bitness setups
> (e.g. 64-bit host with 32-bit target).

This sounds sensible.

Do you have a defconfig that reproduces the problem?

> 
> https://docs.rs/cc/1.2.55/cc/#external-configuration-via-environment-variables
> 
> Signed-off-by: Sebastien Laveze <slaveze@smartandconnective.com>
> ---
>   package/pkg-cargo.mk | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> [...]

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
