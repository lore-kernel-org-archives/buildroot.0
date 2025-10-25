Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6B9CCD1BF
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 21:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B00840A9E;
	Sat, 25 Oct 2025 21:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYzwfqr60WbX; Sat, 25 Oct 2025 21:12:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3A3540A5D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3A3540A5D;
	Sat, 25 Oct 2025 21:12:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22B0F976
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 21:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08A4340A5D
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 21:12:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QMLM6Al-Amp0 for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 21:12:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 39DFA40A56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39DFA40A56
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39DFA40A56
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 21:12:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 183AFB0051E;
 Sat, 25 Oct 2025 23:12:07 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Oct 2025 23:12:07 +0200
MIME-Version: 1.0
Date: Sat, 25 Oct 2025 23:12:07 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251021090422.736371-1-buildroot@bubu1.eu>
References: <20251021090422.736371-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <6300d036fb0761c8ef9622c738ff2f10@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761426729;
 bh=FiF8pdK5N7IVhtLcXnp+94a4p5h7ohEmhpN6cBQjUrA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TFfkLGZorrCpD6vw7mijQ+MGs4gcGKq1hhMF/jXE6yWrKmf5cpl3MXqdVZw0qNFGg
 t36Fn/m0W/jk2XPNYvOx/tGVF/EdemNwkHSWxHgwmgZ1kRowK7mvdJfMwo5FzXJD/Y
 43YG1IPjA1+bAQml2YxB+95eT1D7si5as3Ff6Qj6071Skihzog1i4roCk6a0BVKz1b
 77086lmCPyu2ZGpgodZbZquQ1oDrrHabqYAjQLoK3GRedQbqxlou524885GwDn99SV
 Prl8+tTAHyqorrJg17wS/MZzKkwf9ictj4H4sQnMEDYjTxZBisdtCW/4pKGVb4thiX
 aBgH3EHfQAr0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TFfkLGZo
Subject: Re: [Buildroot] [PATCH] package/python-uvicorn: bump to 0.38.0
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

On 21/10/2025 11:04, Marcus Hoffmann via buildroot wrote:
> Officially supports python 3.14 now:
> https://uvicorn.dev/release-notes/#0380-october-18-2025
> 
> LICENSE.md file changed due revert of copyright holder name:
> https://github.com/Kludex/uvicorn/commit/ce79f95d065c053b36449f67b3b2cefee5ecf167
> 
> Both uvicorn and starlette are currently undergoing some discussions
> around the copyright holder (but not the license):
> https://github.com/Kludex/starlette/issues/3042
> 
> The LICENSE.md file will very likely be updated again soon.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
