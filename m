Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82903FF885A
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 10:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FCD4409EA;
	Tue,  5 May 2026 10:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GRKVFYfNaZF2; Tue,  5 May 2026 10:52:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D870B409C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777978325;
	bh=7UkoLsKwrdaEcdFVNAOl6K4KUwp93A73k3c4VwcDsks=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zr+W3xqXIID16alyKVPlLM1weQuRSyPLRQhReJbhbKEvNrOk+0nVQLyTQp7PoLu9b
	 81DT3k/qOn4rpN3IQXYtSpztrJ/VHHKjqYSiFqNyc3jzvsoatqnmMgXCDIX00pQ0B4
	 j8ITgVQxpRARpLd1rICBVNQXcFTSflOcSPn6byIxUb+7jtkxK/Hm2r+B2ToOkREuD0
	 KaQcusCFwbgjQnLRz7XsbA2ansYytOZ7cyk2QWjyBuIwdNzDoXCw4EVs/cHDiTT+/t
	 uzsXsMwwpnICI3OJpYRsMVnxqUYRQlaZIhC2kL58jHIl3vVQcVVdIBWDdApqRsF54z
	 +I79CoErG3owA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D870B409C8;
	Tue,  5 May 2026 10:52:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CBFE52DF
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1A2A40232
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RgKquBDxxOya for <buildroot@buildroot.org>;
 Tue,  5 May 2026 10:52:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6640040231
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6640040231
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6640040231
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:52:02 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id DE5B62C88D23;
 Tue, 05 May 2026 12:51:59 +0200 (CEST)
Message-ID: <a07882b1-5093-4ee6-9881-c95ff10af3be@bubu1.eu>
Date: Tue, 5 May 2026 12:51:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Joachim Wiberg <troglobit@gmail.com>
References: <20260501002320.1761716-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20260501002320.1761716-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777978320; bh=zf/DHb7CTFtJ0G8/Hmy8WFOGaF5R+nJTZL+IOgnjg1Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=cOnf4bkIyudSfKGszl743ur3mj46dpp5AzVady3oD67lDNyggr4PhntAc7Z47B8Lb
 atiW3tICCUcQQpsQpxnBerFa++9eL68FvVLGfdkJKIixBlPs4qLjSU5C84OxaHiVD9
 GHkJWZ3qQLL0qS7QRexQUMsUnQt4RQUtPebGuj/i4C9KxiL44WluctDh3x8oFgKEbJ
 /BFALsUrMaVSsR6lCsORl0EX/+0L/RRyM61dVHphKl71pkKVEiJ6KjZKrZoTR+ptDT
 8Dp57ajgFBUCmmaWXFx0KykKAOqez/K+iknYG7xEc2yVCgs/2gcXRQ1Nsj3n/t1cPd
 Jg7Q5PBlXwEBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=cOnf4bkI
Subject: Re: [Buildroot] [PATCH 1/3] package/openssh/S50sshd: immediately
 return if sending stop fails
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

On 5/1/26 02:23, Fiona Klute wrote:
> If sending the stop signal fails but the PID file exists the following
> shutdown wait turns into an endless loop. Avoid that and return the
> error immediately.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
Series applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
