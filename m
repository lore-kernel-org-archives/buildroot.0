Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5671606A31E
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 11:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ehVGh6kf
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B19F2409C4;
	Fri, 27 Nov 2026 11:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JjYdnzeouH7; Fri, 27 Nov 2026 11:37:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EE7DD4091D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795779425;
	b=oNcutKcEnKySkmG1RZqisI6dx/QU5gJQ6yb0iC+Z5iW3sAPiZCM6nnN2ApXBhuivUSjo
	 bbYxqXeQY4NKU4zQxZQr/GE96wpFLN5kG5rDKVALTcunpMxaRhm/q7AayT6+vJAnhcC6b
	 u4zVtUN8F1c1pzqTPeyfzHpEWU/PvQHw0Yk4m3C2ET6LOyBPbLJTfEKDiqPtQBJpeewPW
	 WGrvq2YkJwZwGI0Y3qLlQQ2gXQfJUQMNWntprgEwIIHDTVot0HTE7Q035xuzNNlRXh6vT
	 yQJexPlOSgdQckey9i//IZBcRsKxNioikhMUpTkAVGwdJDx8O1+wspRYIIkk8o0oYcQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795779425;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=l0aCywTSiOYTv9X+xVQZK4vRf8UEQJJ4WqJ63Ox/LaQ=;
	b=nhs7CV42nawdKN9nS+ksLoiefuRp5C+kuiqWqCBUk3+CclNe6sqQ09NJOmSzL1JxmH4U
	 sYrv4RrMrVuFCYBmjT7eCfshRx/4degIdJ6NtOGq6saFdaLobA8u7k7UfR0sSrGWomneR
	 WGP55MsW2SS1bPKEnAk94cUjnpbx6UsaOKtB1vtIMN6MhY5ImsLHXE5YsnqrJcUl2p1Y0
	 Nnnrst9GSdI1JbRbnL80BkknET43fr5zhfd9fSuy3x+OvUhkCNl2YiofFOUddZzxBcPuQ
	 rfTSHqDc4ygAtqh9MIRPmWk5vhy6mifVazMM3pGOohTB30OTuJMb3AagJym3UCtbwuQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795779425;
	bh=l0aCywTSiOYTv9X+xVQZK4vRf8UEQJJ4WqJ63Ox/LaQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ehVGh6kfpdbgwyUamsWPKY1AWAGGoc+VWvCve2Z1bBYsAjFKr2mllf9ClXGrxm0Ep
	 PQOfdz0qefVU652KGpxdc2M0u9NYrum5y2AuptmpBKnMMKEV/pQkY2q5zAultCeVj6
	 StLSFxIE6SeemGoQFbasv1OBpaVLwSYXKYAjF97+nInYXHNkpdKn4WwHQBNryYrvVD
	 yyamXQpPuuZfaQHReYTpOVFgWPNnwwC8Rb4qu4Jsmx4g6hGJAiYz5kxX15r8R3TYDU
	 1bi2BZQioF6ywb2o/wekPscRjd3EhXL2Yrtr1SKymXEM1cyoGS8CQOuKJJN5v7Vh/P
	 RHmH9nWd6gwhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE7DD4091D;
	Fri, 27 Nov 2026 11:37:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A8DE2266
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A68564008B
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5IuJZU4yaQWx for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 11:37:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C2B014004D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2B014004D
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:37:00 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 00B2C2C8507A;
 Fri, 27 Nov 2026 12:36:57 +0100 (CET)
Message-ID: <5df7454d-7603-4645-96c5-46de192c0f15@bubu1.eu>
Date: Fri, 27 Nov 2026 12:36:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 buildroot@buildroot.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
References: <20261127082141.697043-1-chakrabortyshubham66@gmail.com>
Content-Language: en-US
In-Reply-To: <20261127082141.697043-1-chakrabortyshubham66@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/zstd: security bump to version 1.6.0
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/27/26 09:21, Shubham Chakraborty wrote:
> Fixes CVE-2026-124851:
> https://www.cve.org/CVERecord?id=CVE-2026-124851
> 
> For release notes and full change log, see:
> https://github.com/facebook/zstd/releases/tag/v1.6.0
> https://github.com/facebook/zstd/blob/v1.6.0/CHANGELOG
> 
> Tested using:
>   utils/test-pkg -c /tmp/zstd-full.config -p zstd
>   (Result: 6 builds, 0 skipped, 0 build failed)
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
Applied to master, thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
