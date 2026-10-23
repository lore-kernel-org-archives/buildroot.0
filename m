Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C7C606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 09:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PkNEOKx3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ED2480F61;
	Fri, 23 Oct 2026 09:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id soTcKh1Ukeeq; Fri, 23 Oct 2026 09:18:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CC5AA811CB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792747111;
	b=Ztx3U4vnkWhHqL/ugRXYo4J+FGrxAnwbGeA9DhsnfelhvB3MgQNB77MFMZb4d8Vo7LIu
	 Awc7CbaMSRI/zASeH1CoNtLxXOLFDMg8q8PNauZyEIbJKPrpbJYPhbcoV4DXQBWqDg+X4
	 tmnJ/wzECMiWN+IBLdeWZUJUU3jeveGOoDsg2U7rXnEnb0ZiNaD/SGUmXj+X5M69I9KQJ
	 w59zE5+1bjHOdO8etB1gGoeedUPeGb0iRoIJC5ekpUoI2TW02rNj8FkNlINO3Xr1UHHXI
	 OsKtu/O8Ujv/vpr0MhUujlK4KC+rZhIUeGT5iuKoom9dw3RoB+NKMzypRqKwkVOxIUA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792747111;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:To:Cc:
	 References:Content-Language:In-Reply-To:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=/Y1ycuL/9FwZxAIGltn+WpgyhCT96TSPkayrJkmtF+k=;
	b=A+o6osR+lK0wxVUyiPBUGvMACrUg/rtQ1Lid5G9AOukDUYDlxzbe2JrqyKXHV5qtJoVp
	 gikN0MEHdQWofavZxExweQpto15YkB8gQ+SKkYSpxypcv6HyVaCAUzViqgkavt6V4JVw/
	 tDkHlL0ZNNKk3w1DFAhIXVh+RxylWwzVrR9Qx1i2gTxXUQXDIZ1zGHjxL9DDuhHh3v34K
	 gl8odnFTfPCQXvkoi3P5hnZaItyCz1OhuOVaJMzg9fNRk/xM5Z6iN1NrAUCv6WPLClEZC
	 rtl6DVPV9UPQeelXRvnlgkCTBG13MOvVlvUIMNaWYF8yP87SebGvb4c7ZqhuOSiWnog==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792747111;
	bh=/Y1ycuL/9FwZxAIGltn+WpgyhCT96TSPkayrJkmtF+k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PkNEOKx3nDWgg/Voc+G6D0umsWk3OzVrgtcJNHVJFFhuWKfww190u1MTiQVCN9HkQ
	 Z/pcx2hAvf0tFE6HefBb1PUaEP3rkpFW47UjarjMuaNrSRlEM56hzI8w2iWyW3Gj4c
	 pKsSn8gnrKUHXObKYL3qlddEwAls73QfT6GXkHa6T4pEyglrIEzRq7auGnyDf01CKL
	 ycPklI0Lk48w4392sUGjITtJjaToDfhOPNL2h8rBLl1DkPYgAe6bVGp+XvFRhCDJhd
	 6xXzKEu5wwAdolU9BYIkFlbbzpI9jhIK4LZjvdCSQTWMeYt3HFbLW3NjtAjfbcen7M
	 409Okn4d0wc2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC5AA811CB;
	Fri, 23 Oct 2026 09:18:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7790612C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68A09408EE
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MI-u7vUketkU for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 09:18:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D483F408EA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792747109;
 b=H9W8rpncfeYv5kpbdublq+W/8wkGlcR+//tOXtzUXSC0gpK3WsCeQGAECGp0CMiNHsCs
 1PbOFnIFxbVMI9QQnLlpvrSY8BuZG7rkRiSkYmsJhQJNHHZqhL33bdjdbaRZuIbNYmpdF
 S9SI+6Q3/vil430FaSpQAdlwcHZ4YSTV2Fq/AHWw0bZKorCxIhwPjah2L4609pr+o1cqg
 QkRE87gmk3KobJ8/z4zgp93BA+wr3AsfsaLBWaRXY6ks07HKjLrVQ6gAXQnZ/L7jkmMmB
 hsUIqjNe8tDjTppos+uXDm6A2WZRGlJxxH24YOP1fLGLd9/WZQ8euiqHmFaXsi+3J1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792747109;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Last-TLS-Session-Version;
 bh=Ej3L43On2UIlrQGifbJJA9qSe1C/fpQzdQaOxNSKo8A=;
 b=d672hGYd9vI9xc5GwojOrLy+JwcSzpqqgrDXoKCfxRJxUEnHkxPU62hp8Fvn08BgQaIj
 6lLVW9RMmONqz/DEgKYCdG0LK+y7h/6okKCU+b7+SYTnsJ+bUWFVrYn23+6T2+PdDbpIr
 DrqYmqSm7VB1uDf3cUbQhNOaO0q0gSI6TQNl+OFxXnyVJoStwlN8XYfq2LrtbOs85b6VI
 4drVUAMU6iI2t14IfLPHMWPmKC8vUVHDDQusXMLteS/Qh86jJSNHulR4LCRN09w3ZKqoA
 175/tTlmYgs2uy1AvkY/8ywndwAZEBueFPpyPdRXMws+Mcju3V39f6scyAwJggofwoA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zUmy4sCM; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D483F408EA
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:18:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A06E94E412CC;
 Fri, 23 Oct 2026 09:18:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7207860398;
 Fri, 23 Oct 2026 09:18:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E25A110328501; 
 Fri, 23 Oct 2026 11:18:21 +0200 (CEST)
Message-ID: <e9c9eedd-7b75-4cdb-b017-ff3e67a3b7be@bootlin.com>
Date: Fri, 23 Oct 2026 11:18:20 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com
References: <20261022151358.2260712-1-dario.binacchi@amarulasolutions.com>
 <20261022151358.2260712-2-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
In-Reply-To: <20261022151358.2260712-2-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/6] package/uboot-tools: add host
 mkfwumdata support
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

CgpPbiAxMC8yMi8yNiAxNzoxMywgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gQWRkIGFuIG9wdGlv
biB0byBidWlsZCBhbmQgaW5zdGFsbCB0aGUgbWtmd3VtZGF0YSB0b29sIG9uIHRoZSBob3N0Lgo+
IAo+IG1rZnd1bWRhdGEgZ2VuZXJhdGVzIHRoZSByYXcgaW1hZ2Ugb2YgdGhlIEZXVSAoRmlybXdh
cmUgVXBkYXRlKQo+IG1ldGFkYXRhLCB3aGljaCBpcyBuZWVkZWQgZm9yIHRoZSBpbml0aWFsIGlu
c3RhbGxhdGlvbiBvZiB0aGUgRldVCj4gbXVsdGkgYmFuayB1cGRhdGUgb24gdGhlIGJvYXJkLgo+
IAo+IFRoZSB0b29sIGlzIGxpbmtlZCBhZ2FpbnN0IGxpYnV1aWQsIGhlbmNlIHRoZSBkZXBlbmRl
bmN5IG9uCj4gaG9zdC11dGlsLWxpbnV4LiBUbyBhdm9pZCBhZGRpbmcgdGhpcyBkZXBlbmRlbmN5
IHRvIGFsbCB0aGUgdXNlcnMgb2YKPiBob3N0LXVib290LXRvb2xzLCB0aGUgdG9vbCBpcyBidWls
dCBvbmx5IHdoZW4gZXhwbGljaXRseSBzZWxlY3RlZC4KClJldmlld2VkLWJ5OiBLb3J5IE1haW5j
ZW50IDxrb3J5Lm1haW5jZW50QGJvb3RsaW4uY29tPgoKVGhhbmsgeW91IQotLSAKS8O2cnkgTWFp
bmNlbnQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIGtlcm5lbCBlbmdpbmVlcmluZwpodHRw
czovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
