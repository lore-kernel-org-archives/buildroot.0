Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A90C8303C
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 09:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5255810BA;
	Tue,  8 Jul 2025 09:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BHmLRyK9fCsq; Tue,  8 Jul 2025 09:13:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F18AD80F2F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F18AD80F2F;
	Tue,  8 Jul 2025 09:13:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0827712E
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 09:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2F7A4018B
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 09:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vP5qV0pRnwhy for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 09:13:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E344A40177
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E344A40177
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E344A40177
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 09:13:13 +0000 (UTC)
Received: from [192.168.178.42] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id ADA082C845F4;
 Tue, 08 Jul 2025 11:13:10 +0200 (CEST)
Message-ID: <716bc2f5-9f9c-4dd1-8c2f-14c26a301c79@bubu1.eu>
Date: Tue, 8 Jul 2025 11:13:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>, buildroot@buildroot.org
References: <20250527152342.4288-1-fl@n621.de>
 <20250531143928.25446-2-fl@n621.de>
Content-Language: en-US
In-Reply-To: <20250531143928.25446-2-fl@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1751965990; bh=yl9XNB8wSma4WdDRoPCV+gwpIbsSKlCsDWmg6Qwar0g=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=s89Lncb66Gd9AGJqa6rzJPw8eSwfX8FM+trHjAef/sXxDyUrb1heLsR9J/WaiMBP1
 Mea/Z3+2oqSt5rm0YpAVk8HpXE5/R2Sib5DiO77PsJopafSe8Nt1iAENhd5Ozc9RU9
 aZX61SXBFMpKFk8ZpJ+VbHFTZDaUkj+E8LklihpJcX8bnt1iwz0RRRTYmXX+x3IHdV
 E5oiSC83lb2dwQTlBvDvc/cIUDZ9Ou//v532RgsUTLluCXdlGuXbjedmSZ4YUuk9Ku
 d+xUJ4lryX7rMvmUrNfR6y5ehv24Mj+ybF90gP8uzjy/87VAJb6WYAi7fu12sfIoLc
 Fh4MKddi93mLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=s89Lncb6
Subject: Re: [Buildroot] [PATCH v2 1/2] package/network-manager: make crypto
 library optional
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

Hi Florian,

this is great, as it saves quite a bit of disk space by not requiring 
gnutls + dependency chain anymore :).

On 31.05.25 16:39, Florian Larysch wrote:
> The network-manager package currently pulls in either gnutls or libnss,
> neither of which are very common and it might be the only reason why
> they are present on a system.
> 
> However, most of NetworkManager works just fine without any cryptography
> support, it only seems to be used in test cases and 802.1X support code.
> 
> Remove the dependency but use a library if it is present.
> 
> Note that this changes the default behavior. If network-manager was the
> only package pulling in gnutls, it won't do this anymore and use the
> "null" backend. Add a note about this to the manual.
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Tested-by: Marcus Hoffmann <buildroot@bubu1.eu>
Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>

> ---
[...]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
