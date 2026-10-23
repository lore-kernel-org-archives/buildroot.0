Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E17606A320
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 09:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Dej3mUxq
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57B3F60642;
	Fri, 23 Oct 2026 09:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNV026K-M7oU; Fri, 23 Oct 2026 09:35:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7D56960648
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792748156;
	b=TAN8dwKrBXT+hAP1KiL3gDGnXgpy5yQPJt0CrQ+VWhzheWKcbztva1CWeeBMPYeRL+CC
	 R2HaAZX9YCCGs4gYEwU8OAgns2Q6Yo/1R0NX01DtMKHQ8ZAeQouLTeNGTsSDGUqzTniM+
	 EuHj579Pq9ZCpgni5rlcm0h3/b2/R17Keth3j4YpsqAw3MAYM+lSS5GgGdcJTYTRKR8jg
	 shPdI8FMQncQLC9iOfFnAhMzEDFTNzJjlsYVq9wUrLz4nrsVSs7sr6xeSCbyTcxz2iX3R
	 mNNEKOUvUL6/U80UUHXkS5n8byaA+J/0Kjtp5Qp/+KbuVo9SgLVwqC6hS7WqXjAa6BA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792748156;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:To:Cc:
	 References:Content-Language:In-Reply-To:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=7QHEhk6cvxxfjsoWFaCDzgnTPIWKs7XyMuGFrqGmQ40=;
	b=NtyBGQXRJzySgi97WnOd6L7qQ1R8eR5GKs2b4viilvnj/DxY5tSJG+HbWaXyes7QpvSG
	 +hOJ0qaGcUBq9g0j0BOZyevPLNot0UHdLLiA+cCyJY00ADiLgbBNkSOXUAxo3WQaRJ91O
	 pvr5HQFz12ZAuMDodHrepqHtbX7vx6wC3RW7KLuO4VIKi6ZzcqoxU0cCtsRqOT5VDxxkV
	 weI3Xqq7ri1tcqfLHKT+NnLKs4UIoE8h1jYtFBV+BbV0RTkF3/s5Qn/1C8VtUAbYXJGPA
	 oiquteNWzQj/jmem6PqkKvbKgcbyBrAWtwLHgI8LGtX0E2P5W6qXOEXpNEJKLfw6Pzg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792748156;
	bh=7QHEhk6cvxxfjsoWFaCDzgnTPIWKs7XyMuGFrqGmQ40=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Dej3mUxqMITxkTdAIj4qGiVW1HSJgGz3Z3ScxGMcn2RGYnZkZCRMZJmrkuBC5VFWF
	 vMKXfDmRjcQzwWCSJYQSQq1EEAdsiK1m81F7yDZgnerPjH8JtamiG6Owxg4WegQ+/J
	 mLHNsk8611M72+aUlqJpd7p05u+r6qA+y2UIQygaylJezE2BEAY9RofCJa1f+v0SZy
	 Yz7UDMk44BpPqPh2FCmnTFlZdsMpWh6FZwoz6aN4+av/u+dp8NAYyEuNIPtW3YtSsI
	 j2Q6JpZHkoKW0I1gL0A+W/4diha6+q+ACe+myShrmypZiRv2ExJUhX+ZEni3K8GYyJ
	 GUmJ1jP2TJwsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D56960648;
	Fri, 23 Oct 2026 09:35:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A09212C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0052160648
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7XP6GN7k-_i for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 09:35:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8242660642
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792748153;
 b=EEXo4AtNnXbFQajrqpjr420sqqQL5SAR32jLaF+RJoL8LvTkjjJhfTx7Hof/uzg1/zhv
 BZHgVMmXskZLuOW4cfbD7mSHAO4vB3ZAlK2Aa7Z4c40s0CpdzXYz0doUzNVAxcseLuWKK
 bPSxaWRP/Hqp7C27ud8OYE3lCL1uTcOLjR9M+65d4NC/5NDfUwFvXcgfsa3PdxJXl6SzG
 Z/98hkAYU6mUDwzA8BCHKbwnMv5uEeN1n4yOY93J/wIPd9+G6cFw06J4UsdvaHeZPBGuA
 ZBa887LUD8H/mjMi4wmyaRPSMbCmfotBtoqBky830MuGBwlPzsTyI0NVlXoTLp1OjhQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792748153;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Last-TLS-Session-Version;
 bh=dcG1xn8QVtTp6EoashAVPqCZwrdV9mLAcI2fGh/4BQ8=;
 b=Jrq7L78tVVmHZgsqKD34nwcli82k5Bmy7/iEuqtELTMxtvghZlDuV8rsaM8fvFaf5EjA
 +UpeuNEjbBeUWAyMueEQ76m4ovNBU8MN60UvW2UmeuM76lE20bSyKcGFvzdUIqlKmBsKC
 9TL3v9517U8LtdbwaTrsdcTlcN+Kme8ZAeIJEwP5CIyiT+opZp5ot2se0C9Inr7jzCFyd
 2zIfHiiDLq+bxc4rR445CR3dwCUUc2y7tgdycmQPST0zgBi3rw5wmsr87LP0HLW4aMTm6
 8NJo6CgyXaGDOC3NBan2L73E2w2nNw4Lg7xk7l+dhtuwIs4dhSR+9pe1RBoPyX4eWNQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=mu29jMUA; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8242660642
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:35:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0E803C5145F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:36:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 44BE260398;
 Fri, 23 Oct 2026 09:35:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DAD2D10328E83; 
 Fri, 23 Oct 2026 11:35:47 +0200 (CEST)
Message-ID: <63aaf86f-624f-4c5a-a51e-cf0b8b1c321c@bootlin.com>
Date: Fri, 23 Oct 2026 11:35:47 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com
References: <20261022151358.2260712-1-dario.binacchi@amarulasolutions.com>
 <20261022151358.2260712-6-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
In-Reply-To: <20261022151358.2260712-6-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 5/6] boot/arm-trusted-firmware: add
 stm32-ddr-phy-binary support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgpPbiAxMC8yMi8yNiAxNzoxMywgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gV2hlbiB0aGUgc3Rt
MzItZGRyLXBoeS1iaW5hcnkgcGFja2FnZSBpcyBlbmFibGVkLCBidWlsZCBURi1BIGFmdGVyIGl0
Cj4gYW5kIHBvaW50IFNUTTMyTVBfRERSX0ZXX1BBVEggdG8gaXRzIHN0bTMybXAyIGZpcm13YXJl
IGRpcmVjdG9yeS4KClJldmlld2VkLWJ5OiBLb3J5IE1haW5jZW50IDxrb3J5Lm1haW5jZW50QGJv
b3RsaW4uY29tPgoKVGhhbmsgeW91IQotLSAKS8O2cnkgTWFpbmNlbnQsIEJvb3RsaW4KRW1iZWRk
ZWQgTGludXggYW5kIGtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
