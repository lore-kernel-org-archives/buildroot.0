Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A8E606A326
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 01:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=r+KLmskd
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B12F860E1C;
	Fri, 20 Nov 2026 01:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Po3DVeHNZLy; Fri, 20 Nov 2026 01:51:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B930F60D98
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795139515;
	b=GHIzwCUATmBrZs9rzLCN1SGUhXSLsWt7IvftpoJ4WCu7JWiIAWAstaGwexzSsFpkqBfE
	 IFpN5Hk9222+8CPiD9bO0pgQPRhNalUdyCzTWRUQiSsG1NXx2ABOfDGCUeNh1TVbHGOKb
	 xQcZXDRScvtlJnT28nyS2l0i83PxHNRZJT5SG0RVkfGG7jz9D3d5AvfnpzpJgL4l4ccmt
	 murFSbUqT01VXNsBm2E4gvcnMjRr/8QZ4TmnTlBJb79xeNiJ8/+5J57yp5B+7dwKqfTP7
	 Emr+pLyxy8CCmcvBthrmQCaLoHgS2NdbQSxu6nSxoX7jMW5/f8CAU9VC6tuMFt+8y9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795139515;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:Cc:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=971M9dXUcEXszXidvM5p5ChgFbj1s3SzQ2yE3iW6hpw=;
	b=oAQYQGXWtaPs4Ixl51ZrDd6bUQJPCKemol78mGg09ztSHg+DtcggBJtVwzlnRlKMMRjP
	 1FBCIBOCB+OT7zpjHeC/15MGoWBkvvfH7bC5jIWHbnpTfiSrSr6v9iZtbAmB2mko3rUg4
	 ldjSfTr/+NWrlwzfEiCXi3BmcjnFkpmwLO/F+wFb7tVn+cC2TEBI6oo3DLxXBEuZSsvng
	 xEOs3Hh+qEWMl+AeqvDvWpSN1Jg10TbwolcqyMQZFl+N1vOcPYzrIzGrjtUYtgs4D8tfg
	 AaEqtp7wjtzZJTfQsI1tVv1qyzFS+CWARnvlZmPmV94u1vtRdrIC/3Rbv1Tfs8qakzg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795139515;
	bh=971M9dXUcEXszXidvM5p5ChgFbj1s3SzQ2yE3iW6hpw=;
	h=Date:To:References:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r+KLmskdwJ8rpIPn1kbeFvhZE/d7eubPXDPLaTgmMCmAsgBJhZNgQLyZippvlShtn
	 iwAOVM89hf9ySfxnhN5Md9G2lb3kIgGQAQDTjCtMLtkAdrzRQyrf1Rmnra4Jn0X0Lx
	 VLMoptepZq4w+DhvdYoRkNMphuZL0E26NNgILKlhjo5F3EaPlXdkMsN1G0HyVshH8X
	 n6n7txJJjPFWMQdb7WLPN8pEb18H1MIN3u2TCiIRYnsUerajn4J6CmeWeTRpTfR+3V
	 WdoHjVY5XrOs/b+upHVDGw9fmR4+GwnoLkyWBG0qzxhM9HM4ML6rkTDUECsxpisay9
	 tza//LRHgxCiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B930F60D98;
	Fri, 20 Nov 2026 01:51:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A609169
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00A4A401AE
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Who39fgKpxti for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 01:51:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 31C9A40087
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31C9A40087
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:51:52 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A95B02C81EFA;
 Fri, 20 Nov 2026 02:51:50 +0100 (CET)
Message-ID: <d64fedc4-41a2-4924-ac16-d391422e1590@bubu1.eu>
Date: Fri, 20 Nov 2026 02:51:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>
References: <20261114140316.956334-1-fiona.klute@gmx.de>
 <47f92296-e71d-459c-adff-6f1bfe9e863d@bubu1.eu>
 <630c8dd9-a8fe-40dd-b4c6-7cdafb5d5ddb@gmx.de>
 <dd3904e2-b2db-4aa3-afba-9952ded1cde3@bubu1.eu>
 <f22d6e61-cfd2-4625-a75d-c455d3f93a3f@gmx.de>
Content-Language: en-US
Cc: Buildroot List <buildroot@buildroot.org>
In-Reply-To: <f22d6e61-cfd2-4625-a75d-c455d3f93a3f@gmx.de>
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

Hi Fiona,

I do have more things to say here, though it feels a bit like spamming 
the list, because it's not really relevant to this specific patch 
anymore. But I also didn't want to just drop it, because I think that 
having this discussion in general is worthwhile :-).
So, read on for some ~~bikeshedding~~ thoughts about testing.

On 11/20/26 01:22, Fiona Klute via buildroot wrote:
> Am 19.11.26 um 16:41 schrieb Marcus Hoffmann:
>> On 11/19/26 16:23, Fiona Klute wrote:
>>> Am 19.11.26 um 15:32 schrieb Marcus Hoffmann:
>>>> Hi Fiona,
>>>>
>>>> On 11/14/26 15:03, Fiona Klute via buildroot wrote:
>> [...]
>>
>>>
>>> We don't test config via /etc/default/$DAEMON for other scripts 
>>> either, and I don't think it makes sense to: The only thing we could 
>>> really test is if the config snippet is actually sourced. That 
>>> doesn't seem worth the CI time. Testing all possible options and 
>>> other fun things someone might do in a script snippet (related: I've 
>>> recently used it to put services into cgroups) isn't really possible.
>>
>> It would test a bit more i.e. that the variable expansion works 
>> correctly in whatever shell the test uses.
>> But I agree that it is a bit marginal... :)
> The syntax is standard POSIX [1, "Use Alternative Value"], if it doesn't 
> work that's a bug in the shell.

Well, when reviewing a patch that isn't always immediately obvious (at 
least to me) without actually running the code and seeing what happens. 
A test does automate exactly that. And given that (hopefully) the test 
assertion is easier to read than the shell script it tests, I can be a 
lot more sure that what I'm merging does the correct thing without 
manually running shell snippets in my terminal. (It's not that bad for 
this patch, it's fairly easy to read still... but something in my brain 
still keeps telling me: "Are you sure it's actually correct though, 
without having run it?")

And the second reason I prefer having a test over not having one is that 
even if the current solution is obviously correct, it prevents someone 
in the future turning that into a "still looks correct, but is actually 
subtly wrong because shell syntax". Or renaming the variable and not 
realizing that this is (essentially) public API now.

Like I said: this is marginal here, we'll be fine without it, especially 
after this discussion. But I also wanted to elaborate on why I proposed 
a test in the first place.


> Which admittedly would be relevant, but 
> maybe a test for a different package. :D
> 
> Best regards,
> Fiona
> 

Best,
Marcus

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
