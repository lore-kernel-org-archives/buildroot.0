Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA09C606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 18:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=puwu8u5L
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 829848107D;
	Thu, 22 Oct 2026 18:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gb7SUlBppjzi; Thu, 22 Oct 2026 18:46:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 397AF81192
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792694779;
	b=kOFZQcgNhC5XVTxis56s33tG+If6lZge4TbeTf1XVw7VStYjVahuOY9K1vHXBMNM3fkr
	 rLmRR8PTlegFZu+MBu207/eGj7C0KpzgKVmbwzBibPDfxYs9nVIxFUi11OHC+HAmp9XM2
	 ByL7vuX2EcVppJnXY+hDOk/VrnttEhIwrutdvBNBfItBFNX5QxkhOhNAdyP1vGh6nx0of
	 o58VSDQHcWLWsQwrkMXO2a47biC0O7x5uj9zx+kGBah5sqdfq5KcHLwEQzwlLXqnyOvhu
	 TA4PMIhu1N+lWxntUkI2TQPQ+MNePFw1YNJVDeLkr1fVfeJ4CUeMV2aLm5ScAoShSqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792694779;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=55r1z+9/mRaeL/htvLHqvkalbn+LxmInjVc70aUyiRw=;
	b=NKgjMB1dhcLIz1d4UltUjlY08b1I1bcQkOSB603jMlYxyaLoYRHwlKxB2xw4XvgmUz7+
	 vNcZfFN5EbMQaxErBRKKNPbQtyd/piinOuq2EL8x0ROybZ+uhQ/maN85HxORpF3gpBdyv
	 h/V2W6YZ9YMNKdrlC+KGKfBK9zESb8SYQlDVQTee6AXGUGYBlyDFhz4YiKiwKLstqQBa5
	 XLuEk08mEK+bbEoX9NWXCKS3xCdX5DLrYM7Ws1nYk88EXe0EVHgx/ouanHTiifFnYdsbv
	 ES4kkNLzFPfZx7g9ZVUV0SE/OVVUF14m43qOg7K2bUWUbeETJ7PwkfNjdH35JNs+YPA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792694779;
	bh=55r1z+9/mRaeL/htvLHqvkalbn+LxmInjVc70aUyiRw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=puwu8u5LLW4PcLIUzZRKMbTy16axNMi0wBtAR9NCnY4Ndmje8Q0gE8olZELJ6zHXf
	 YQYtV2BqMtzZZ6sIu/Vn+sGLWFZRjxTO3dWFdp/lau3AqWEGdySYpRXy6JTsh7s6UK
	 jNJsUVe7LycA9oMwrw519sCQ7fLkmdIr2uRtD5DKUngPOQV84oc0kt+PxcRvAfI5i5
	 xL/k1OB+h3YJFyhUjbMTqnPgWf4bjql7IEvug8FgAwwt5DjCkOFXOGdx0FgX4/g2YG
	 jgqieZkUYFPBR+B/ap632TfXslWXki3bn1BXhZvSZMZr8HO9tzM+XGM6edzX7xt8Gu
	 u1WaYQY/q8Bwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 397AF81192;
	Thu, 22 Oct 2026 18:46:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FF013C1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35A5E40979
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2lTdI9xf7CW5 for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 18:46:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AD06C4094E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792694777;
 b=ZsG9GuYspL9/3IrE8xAzZ9SD5MSbY/+RZGY08V+o7GNqvb7Wj6wQl5drP7URbRIUcGvH
 /PmGxG8QacWkhT6OiYqvdyYfPWcCaOjqzHQe1/Xxd2e12EOkqLMyRh+o89bwFwWkEbm2B
 VQoONmfsr3BzoSzIn0DfMOWgv3YGaGSesXL5Ttg5HIc52t3UUqA5XESjd08gprkg2qj5b
 u0KUe1Xh8h54kopMIWaXN9gtRoACI0Adn6ggOOhSks/8vC0+bmMOD62u2M4KYcgHbxcUP
 8rkIngYCn487fHZBlLOyyqxygRQj/nvqRcV1ku03233/88ZGmVj408jGXoM1nFVFnyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792694777;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=iGmy3UVCmrUCqGCuKRFqn9OFTyKINtIWaHu0mAJutNE=;
 b=VDE2hwIsGGZe/jMBvfO8E+lW2OM6DE1zR0+BFGVKGxgg2EycfpnHyQMIm5+BXWl6WJt7
 iCBKivaQmqAKOt1vpLTBDvSm+lEFSZK4104aidRRfHg9+pwk1AqY9VcESfH2QksXj9m8o
 EP+qPBqT4n6JEmtiaFsR9carY8uuS9woTLAIJUeBbiZffYcgeK90rCVzbWJmxoQTiWSHr
 LcSqLAl31xrVZtUg9xYww6xw95pExB+2ZPTQYH3SzHtj3CDQ6Uv4sY3mZXOs6I+fHMCcm
 zoJ+gQDsJ8rPXB7MTirclwOmatf90zibxE4h6yix7ZueMueu+35uJznavCOy35ldGfw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=m96D3v38; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD06C4094E
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:46:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E64434E412BB;
 Thu, 22 Oct 2026 18:46:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BBF8760763;
 Thu, 22 Oct 2026 18:46:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B6F7110328501; 
 Thu, 22 Oct 2026 20:46:06 +0200 (CEST)
Date: Thu, 22 Oct 2026 20:46:05 +0200
To: =?utf-8?B?5oi057u0?= <daiwei@sunkaisens.com>
Cc: buildroot <buildroot@buildroot.org>, 
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>
Message-ID: <atpZzNo7PB9DfkmU@windsurf>
References: <20260920074056.1320014-1-daiwei@sunkaisens.com>
 <aq_Qf67Tgr75QV-B@windsurf> <artm6-0i7bQ4gJSM@windsurf>
 <845128ba-bcca-4acc-97b7-658e7bdf9859.daiwei@sunkaisens.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <845128ba-bcca-4acc-97b7-658e7bdf9859.daiwei@sunkaisens.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] 
 =?utf-8?b?5Zue5aSN77yaIFtQQVRDSCAxLzNdIHBhY2thZ2Uv?=
 =?utf-8?q?strongswan=3A_enable_kernel-libipsec?=
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG8sCgpPbiBUdWUsIFNlcCAyOSwgMjAyNiBhdCAwNTowMToyOVBNICswODAwLCDmiLTnu7Qg
d3JvdGU6Cj4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5IG92ZXIgdGhlIGhvbGlkYXkuIEFmdGVy
IGNoZWNraW5nIHRoZSBvZmZpY2lhbCBkb2NzLCBJCj4gYmVsaWV2ZSBQYXRjaCAxIHNob3VsZCBi
ZSByZXZlcnRlZCBhbmQga2VwdCBvdXQgb2YgbWFzdGVyIGZvciBub3cuIFN0cm9uZ1N3YW4KPiBl
eHBsaWNpdGx5IG5vdGVzOgo+IAo+IGxpYmlwc2VjIGlzIG5vdCBpbnRlbmRlZCBmb3Igc2NlbmFy
aW9zIHdpdGggaGlnaCBhbW91bnRzIG9mIHRyYWZmaWMgb3IgaGlnaAo+IGJ1cnN0IHRyYWZmaWMu
IEl0IGlzIG5vdCBvcHRpbWl6ZWQgZm9yIHBlcmZvcm1hbmNlIGFuZCBidWZmZXJzIGVhY2ggcGFj
a2V0IGluCj4gbWVtb3J5LiAKPiBJbiBjb21iaW5hdGlvbiB3aXRoIGluc3VmZmljaWVudCBwcm9j
ZXNzb3IgcG93ZXIgdGhpcyB3aWxsIGxlYWQgdG8gYSBvdXQgb2YKPiBtZW1vcnkgY29uZGl0aW9u
IGFuZCBhIGNyYXNoIG9mIGNoYXJvbiBvciB0aGUgd2hvbGUgZGV2aWNlLiAKPiBTQSBhbmQgcG9s
aWN5IGxvb2t1cHMgYXJlIGFsc28gbm90IHBhcnRpY3VsYXJseSBvcHRpbWl6ZWQuICAKPiAKPiBJ
IHByaW1hcmlseSB1c2UgdGhpcyBwbHVnaW4gdG8gcHJldmVudCBpbnN0YWxsaW5nIFNBcyBpbnRv
IHRoZSBrZXJuZWwgSVBzZWMKPiBzdGFjay4gSW4gc3RhbmRhcmQgWEZSTSwgCj4gc2Vuc2l0aXZl
IHN0YXRlIG1hdGVyaWFscyBsaWtlIEsgYW5kIFhSRVMgc3RvcmVkIGluIHRoZSBrZXJuZWwgU1BE
L1NBRCBjYW4gYmUKPiByZWFkIGluIHJlYWwgdGltZSAoZS5nLiwgdmlhIGlwIHhmcm0pLAo+IGlu
dHJvZHVjaW5nIG1ham9yIHNlY3VyaXR5IHJpc2tzIGZvciB0cmFmZmljIGRlY3J5cHRpb24uIFN0
aWxsLCBnaXZlbiBvZmZpY2lhbAo+IHdhcm5pbmdzIGFib3V0IE9PTSByaXNrcyBhbmQgcG9vciBw
ZXJmb3JtYW5jZSwgCj4gd2Ugc2hvdWxkIHdhaXQgZm9yIHRoaXMgZmVhdHVyZSB0byBzdGFiaWxp
emUgYmVmb3JlIGFkZGluZyBpdCB0byBtYXN0ZXIuCgpUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2su
IEkgaGF2ZSB1cGRhdGVkIHRoZSBzdGF0dXMgb2YgeW91ciBwYXRjaCBpbgpwYXRjaHdvcmsgYWNj
b3JkaW5nbHkuCgpUaGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVy
IGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBh
bmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
