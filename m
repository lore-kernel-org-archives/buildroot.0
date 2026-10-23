Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF0C606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 09:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=M0o518Z8
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9491A60668;
	Fri, 23 Oct 2026 09:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uzl-2QlFHjKm; Fri, 23 Oct 2026 09:20:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AB22A60664
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792747213;
	b=Bpv3XS39YPkRCMT2WXG5TTfQqncaqazkaZl5MwOIF8J8a+AgxmQmRRSg/InlwmYxQd4k
	 orkr3ps0e2m+k/MzazZ0qIK7A9arlES7GBvBgJW01lQyLUQRDv0rPDKgxsgKeOBVdFcKk
	 e/aJvTKsq1GPZuqCseALE/Htmreebet5xUva9TJ3Anco/3ajAGeg75ViRnqcpEbdABLNU
	 yHB15IAoC3X0MjNmjd1Fmudxh9w+2/K3zibuM21u2Y44asLjX0Bpxov0WkLPqm/hovSWD
	 MUbx5ScWLLElWReE8QXcTPd2KdzDyJgfD/LetaStH4LzmqPy8friousxIvz6mDQpydQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792747213;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:To:Cc:
	 References:Content-Language:In-Reply-To:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=JIEwjKZ+9e/2RIExT4/+que4tJMVSxZKwKEWhLUTw0Q=;
	b=S+K7cwCuH0CMpdxjAGTCajnc7LAyeV4ArvUfW6sJMbf7GASQi7zNl6qVwXTOgEk0Osg/
	 GY6aVyk2jCWVWmViez8Dq264MBJ2BiUVNXUmsP1rQ3e4fBUfNBmnRdmJFhVvIW54sZgnA
	 /apo0GKsvO6EJGuJQ1PZiYmVmeOtpxO7Yb0AQlJ/jeC6zdQfwByHxZ3tOQYnGZ6YK3KlG
	 EO9rItX/mCjxFHRTKX/bJ/OdM1xRtuLhNFw/08moOccsbMcTK1MGm/PSCrHlhebUfuXNN
	 OSUas7uhvzwY8nEUXZggEmmRD00JP/fOR4RydcBJVAwiiKe7xFIfv2VJtakC0OHn6aw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792747213;
	bh=JIEwjKZ+9e/2RIExT4/+que4tJMVSxZKwKEWhLUTw0Q=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=M0o518Z8JwtI+DXY5Y8/TaTdgb3CY9hl0xHYx4VJ4ryraTId08tV55gC3ZzZpGNWl
	 S2HcjxPO1t57Kt4rzsfUaH3BSBBa5uBvHD5RAD221TpCPYtsVZMUDNbWE3wBpuFdJm
	 yzAT2Yy6csnRLrPezKEa6HnzzvHEWm0BbeatUKBemaVb5+c5CdXP88KcwgWsSnzsYs
	 fFdKxkTuKgeztUdaWo17XWBmy4ZDOY0OVfJXmSN+iL6F4Fqo0/nn4SSm8I7JDa2UcG
	 K0qhOnJkVJAEX024eoHa9Ony9n2fgCvdQmhfunaN0d7dmHd5srIHeZxF2ScKW3I2na
	 3hjHnKl2W+Sdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB22A60664;
	Fri, 23 Oct 2026 09:20:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5901C371
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AB48811DC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:20:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWafJyCZCR9I for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 09:20:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4E586811DA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792747211;
 b=nGQP9P6zjOyqt1NqPWlxX70JxDLrOamUhYJ2/XjmPLoydz5+WPGoctt0Ypb+9drAcTWj
 YYChFs7aaZBynnzs1AIbYPbSVyFooTZxUxog+9dPa41FpjhQwbMSaxWYO4qsY7kreNody
 8t+LdRsn4Fzs3aqrrjchk1cavxGtCsck1qH89z9FVQKCLG/6KOKZsO2R1kVWxFj2V0291
 5J9pQLbPsJ1cACIrPwcFblloLjrji59JQdaVlHorh6RaN1ewEVR+25FnE2BtxU3e0RijG
 9Ko7994LAKWEoF42pCU8q7cUCblv5EykI7de1QKMR/q6yzG9CyxPncALYg78S/tD4mQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792747211;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Last-TLS-Session-Version;
 bh=YkCXG57QhM9E5sKZgmdPyYOlqfkw1uJdtbYzE6Iu1+s=;
 b=BsN7Hkxo+4x2PVvocFLN1ms8OyxJooNOVgTBg3Gzgi/LjexK0b/VEuURCh+IKgd7FA3a
 cLApR4IVyWZMPjfVPCiyW178UGr2ZrW4TvhhgkIVzAThdRj5xqdz+Q4zP5Fy9PePoDS4f
 DsvJoLdv2v0IPh+4/6tCaxMeNHHzTIjKD07+swe/3ZPZ5OqJCwMMeU/cYRfsQj5oGQY5f
 82MHlxQoZG1ITlcDx7gz2WuAAXVTzJyAR434K0VfykrhSuk5wqIQRCf66hUSJbtWMvtyd
 XDuAgkI34bCXuDUxFr59u2YV2YyX2Df8m1w0ZABlQAxRvPpHI+xaKzy1NHPQrYa9VaQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GdsvB1Zg; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E586811DA
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:20:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1A899C51460;
 Fri, 23 Oct 2026 09:21:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5C7EF60398;
 Fri, 23 Oct 2026 09:20:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 625DF10328E83; 
 Fri, 23 Oct 2026 11:20:07 +0200 (CEST)
Message-ID: <a6cebca2-6c35-44b4-b15a-d6db1f3a8248@bootlin.com>
Date: Fri, 23 Oct 2026 11:20:06 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com
References: <20261022151358.2260712-1-dario.binacchi@amarulasolutions.com>
 <20261022151358.2260712-4-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
In-Reply-To: <20261022151358.2260712-4-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 3/6] boot/arm-trusted-firmware: pass HOSTLD
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

CgpPbiAxMC8yMi8yNiAxNzoxMywgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gU3RhcnRpbmcgZnJv
bSB2Mi4xMywgVEYtQSBzZWxlY3RzIHRoZSBob3N0IGxpbmtlciBmcm9tIHRoZSBIT1NUTEQKPiB2
YXJpYWJsZSwgd2hpY2ggQnVpbGRyb290IGV4cG9ydHMgYXMgdGhlIHBsYWluIGhvc3QgbGQuIFRo
ZSBob3N0IHRvb2xzCj4gYXJlIHRoZW4gbGlua2VkIHdpdGhvdXQgdGhlIEMgbGlicmFyeSwgYW5k
IHRoZSBidWlsZCBmYWlscywgZS5nLiBmb3IKPiB0aGUgc3RtMzJtcDIgc3RtMzJpbWFnZSB0b29s
Ogo+IAo+ICAgIC91c3IvYmluL2xkOiBzdG0zMmltYWdlLmM6KC50ZXh0LnN0YXJ0dXArMHg5OTkp
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX3N0YWNrX2Noa19mYWlsJwo+IAo+IFBhc3MgdGhl
IGhvc3QgQyBjb21waWxlciBhcyBIT1NUTEQsIGFzIGFscmVhZHkgZG9uZSBmb3IgSE9TVENDLgoK
UmV2aWV3ZWQtYnk6IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+CgpU
aGFuayB5b3UhCi0tIApLw7ZyeSBNYWluY2VudCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQg
a2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
