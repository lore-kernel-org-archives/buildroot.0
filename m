Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B054606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 02:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IcNip2Hc
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D84B606E2;
	Fri, 20 Nov 2026 02:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWLkjc5Ky3Up; Fri, 20 Nov 2026 02:40:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5704D606F0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795142427;
	b=kdndn2V29mTng+SskN5vc2VedGArGO9GrpIO4R/aixQ9bap47dbr1KhMxjsajTBTfT/F
	 WOamQFTXncngNfDtb/EK3gIcr15FqgUEa7SG6kQKGB92YT+iGeZ7sMl7PI+hF1DK7C/BP
	 R6NbUeomozEUjWl4w/WEVa2FLiCl4Rt9+Fcghg8FFpCZEy7SKVh8Wa7vxdtt8tNyyTNq1
	 RKc8b2aQQxbDfReat2OuHT10Zd1YD2CDeWhHwGuQR12yX5xpZD/U5LXMl/2woaQgP5oYP
	 Whhc4YSMcPS8qVz5dus8fNKqCGnyT6BXBV9txTCDHTWPtUI9A6fjepxpqnykZIaxi0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795142427;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=wUhT5jaCinXg27UyLiAOGgZMEsjccxsAIvrmPftftIc=;
	b=M0LrGLquJSYpbJdNmiSyHgIDNOnaIvzAk4VmBMxVUfZNqWm8BsFc7fm0OultHuLTRqtg
	 lMomF23NQkWJ4BtaEuY0PTk2vpjPIg4idLDl7ZGzv3tuazgBimhtH61ENWK7azwjM1w2+
	 pEW4TuG7zwkDqsoANjcPfhsborhKtLStSqP/VnsakKSDTw6tJRZeMgzmaOhbvEh3hRkEM
	 kLmKEH8KK4WiFFEHPBim0V70q1yhhoPQ4urAsjnIuxsjwxyiuZzeDRa+a6Xx+BFuM1uWG
	 jqgrX4H8l1Aa2YoOnfgq9tcOcY/7AHYoFzOzweDR7ezDeIm+8jZGIYSb9m0F9dAzF4g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795142427;
	bh=wUhT5jaCinXg27UyLiAOGgZMEsjccxsAIvrmPftftIc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IcNip2HcWl+4l0mo+YRaI32vVk4WwjsK7/hIU3g3cojc/aVw1xMj3g8mpUwOWyQ5H
	 BctYlDrzpfAS9AmEVavC1i2j1oQHU1pAsDW1D8xx109fUFVDkr9JAa8NMDGZn1RXDT
	 bY99Yzgu/qndyHznhx16EfRnmORwJCs3aFE+luOCYaJPPK13RpdUfIYgiJjazS4AAz
	 Jt0L4CA30e4Bi7hw0/4pC2XNTD7YkYG7UINoLTiXEYRWmphg6agGVFS31iwU3tZhqM
	 G8RgsSBgu+UaUeUQS8EOsV3ZrkuqEcaBENusv5vPHs9iXLAoViMKcZp4hdQMDHziRR
	 x1jIbsVvYtI0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5704D606F0;
	Fri, 20 Nov 2026 02:40:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 54AFD169
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4615F815CC
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-sV90i6PZw9 for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 02:40:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4F1298156B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F1298156B
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:40:24 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id D323E2C84AD2;
 Fri, 20 Nov 2026 03:40:22 +0100 (CET)
Message-ID: <f9dd7769-bf02-410c-80fc-d29e91382213@bubu1.eu>
Date: Fri, 20 Nov 2026 03:40:22 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yegor Yefremov <yegorslists@googlemail.com>, buildroot@buildroot.org
Cc: Olivier Singla <olivier.singla@gmail.com>
References: <20261119215005.2674763-1-yegorslists@googlemail.com>
Content-Language: en-US
In-Reply-To: <20261119215005.2674763-1-yegorslists@googlemail.com>
Subject: Re: [Buildroot] [PATCH] package/shellinabox: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Yegor,

let's give Olivier a bit of time to reply. But I also have a few 
comments. :)

On 11/19/26 22:50, Yegor Yefremov wrote:
> shellinabox is dead upstream: its last release, 2.20, dates from 2016
> and its last commit from January 2019.

It's a bit more complicated and confusing than that. 
https://github.com/shellinabox/shellinabox/releases/tag/v2.21 was 
published Sep 2025. But it's actually tagging a commit from 2019 that 
also just pushed code that got released in debian in 2018 already. 
*sigh* (some context here: 
https://github.com/shellinabox/shellinabox/commit/4f0ecc31ac6f985e0dd3f5a52cbfc0e9251f6361#commitcomment-32295280)

Buildroot carries the 2.20 release + the CVE fix. (but missing the 
selinux policy additions... but those wouldn't be usable in buildroot 
as-is anyway).

And also debian apparently carries a new security fix for this that got 
never merged upstream: https://github.com/shellinabox/shellinabox/pull/540

> It only keeps building in Buildroot thanks to local fixes,

> and as a web server exposing a
> terminal, it is not something to keep shipping unmaintained.

This part here is not really relevant and as it stand also 
unsubstantiated. (It also reads like the typical LLM text output, it 
sounds helpful but doesn't actually say anything useful.) So either 
specifically mention the open security issue or drop this part.

> 
> Remove the package, as suggested by Peter [1], and add a legacy option
> for it.

This removal (if it happens, let's give Olivier a bit of time to 
respond) will be applied to next (or master after the next -> master 
merge). So the legacy handling needs to be for "removed in 2027.02".

We should probably also pick up the security fix for 2026.11 and older.

If you resend this, can you base it on next and clarify the confusing 
release history? I've marked it as "Changes requested" for now.

> 
> [1] https://patchwork.buildroot.org/project/buildroot/patch/20261119103103.2602430-1-yegorslists@googlemail.com/
> 
> Suggested-by: Peter Korsgaard <peter@korsgaard.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---

[...]

Best,
Marcus

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
