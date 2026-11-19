Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E914E606A67C
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 15:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Hv7wDu2d
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0590813AA;
	Thu, 19 Nov 2026 15:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMFOWgFqSYaN; Thu, 19 Nov 2026 15:41:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D15058138E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795102879;
	b=eFpQyH5qTGUoQiU8397ZKeccvWnYMuRjOSGx4/aknAv6Bpjao1KKsAXTjaf2dMx0qKya
	 9zMRhzbr8pz8ORdsY1niXgZ9pTDanvIVBsSNyoXck/C5beYnY+MqSd0LWuIPy8I4OXAIf
	 dG7P9/AP0zkgcDQSdJSG3Ro6ZcaPALjz5NOBotVqcHRJrIpLJM148091HMRCR4xVNdave
	 4cH79sPZtvFCDhrCiTAXcO5DuocMz5cXcOj3BRN1CmX212xKwfC1HKZbiZJSLZeo3YGJX
	 VBXsHQL02MU9eLQuKmn5AQLAmkc7q/x81xz8OPNyAMw9MpjFGb96KfQ7eHo5lMbz8VA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795102879;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=zYHg1b7s6SCm5FtWC1qTF1vzHrcUsx4vd0Gy5EPmu+c=;
	b=pLxNan4r7Oho0LMezhWmdRPP3/0us8odSY8VYy9E5tchxnR5nf0HZKMuEXtPLw/Y3b1J
	 rwlmrw3g2bHFgUCgSi41XAqm86iTdqMaIdpM4cNlP4gKIK5Kwp+iTjomEaIbUCulNVcJx
	 eIoQPxsXsDC3RmGCSJxSPNYf/TBPYhwivKsDJcOBMfLXso0aR8YgqgbIiEg1KxGSYGVJi
	 kStNLcYwH3ke76yhyFfnoN0mJT3SArJqsHkMnUKSmRzH2mqkPi90qlAoR/KwuWVUV8bk8
	 JMVpEM24xI2KAq+uNHmdb8QnLFgHY4KWyYtw1p3adEYd5XKsLLzKvT9okcAooplaDFQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795102879;
	bh=zYHg1b7s6SCm5FtWC1qTF1vzHrcUsx4vd0Gy5EPmu+c=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Hv7wDu2dIg3V6EcuE0lpYg1RybBihMtfefd1CSVa0h+dJ2aVDpHypBvRcgtwhna/n
	 FgFH8EyQus6z4CIg/MHXnaTRWLsIt8QTk8TzRCVJlI1OapcWgk9oGbpde+McL8mE7T
	 wa1TUhQrcMwDBT3Y6VQ/f1pGXSglQ2rnz0u8jUmHRKSk3aevT4soXUe6DpJk9j64VU
	 OO09aZ/oiWOO8ISyjPNXMpUaeyyEFPZOstraUgejmj0MhxVCjvD8LnrUx6fYCi7+Ju
	 +ho+8obdPtv8gaDNVvG8/IE/c4UNflBBzmVpWcS2mpMHC2BwJg4ycZrUuHe2+GQhY+
	 oiet7AbtBlhHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D15058138E;
	Thu, 19 Nov 2026 15:41:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C3CD7465
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 15:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B61D040562
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 15:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vHs4h9r4h9rL for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 15:41:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4D40740556
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D40740556
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 15:41:15 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C86332C81D02;
 Thu, 19 Nov 2026 16:41:13 +0100 (CET)
Message-ID: <dd3904e2-b2db-4aa3-afba-9952ded1cde3@bubu1.eu>
Date: Thu, 19 Nov 2026 16:41:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20261114140316.956334-1-fiona.klute@gmx.de>
 <47f92296-e71d-459c-adff-6f1bfe9e863d@bubu1.eu>
 <630c8dd9-a8fe-40dd-b4c6-7cdafb5d5ddb@gmx.de>
Content-Language: en-US
In-Reply-To: <630c8dd9-a8fe-40dd-b4c6-7cdafb5d5ddb@gmx.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/cgroupfs-v2-mount: allow
 setting mount options
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
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/19/26 16:23, Fiona Klute wrote:
> Am 19.11.26 um 15:32 schrieb Marcus Hoffmann:
>> Hi Fiona,
>>
>> On 11/14/26 15:03, Fiona Klute via buildroot wrote:
[...]

> 
> We don't test config via /etc/default/$DAEMON for other scripts either, 
> and I don't think it makes sense to: The only thing we could really test 
> is if the config snippet is actually sourced. That doesn't seem worth 
> the CI time. Testing all possible options and other fun things someone 
> might do in a script snippet (related: I've recently used it to put 
> services into cgroups) isn't really possible.

It would test a bit more i.e. that the variable expansion works 
correctly in whatever shell the test uses.
But I agree that it is a bit marginal... :)

> 
> Best regards,
> Fiona

Marcus

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
