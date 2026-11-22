Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CE4606A31A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 20:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WWxLYdY+
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BAD940611;
	Sun, 22 Nov 2026 20:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BqM_D1DeC3vN; Sun, 22 Nov 2026 20:27:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 62B1040604
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795379273;
	b=oG0gvLf2T+RPJqnB8nSSuHVjGglcjvnD+5ROy8T5z8Qq923/GwSo/VvlLw9RXj3oBm8P
	 NDXBgggvQUzK6K6acJG57LN3KCZeYY0pkSUlx0VKVGF8r6ZMQe/MXo+MrzR5/LpqAqZ+s
	 G4M+XrZSdt362xs7EtTOo4nD6LgWNjR8CdEswOjnG5MtD067m2txXS9YtY/g/azJ4am7Q
	 it04FkXjEp/omP7lerDpilq3LVBkJidFNYTROrin7Xsz2NHBtXBvXv2X6v3D648EyoUkn
	 90cV2PoQfstoK/7wG7kbE6ngJKTNe6QTLwv1AVkE8mJFrbr0C0SMvMThdl8axXbAUPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795379273;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Date:X-Gm-Features:Message-ID:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tf/BzaTOJ29iXi5bH4YSxoan2t5otlti0xKN9S63bCY=;
	b=qQPQm6rCrlhNmTydUNk4sHs7qv+Ry4lYfnQHLtRxqRfy6Y5A4/8LtYYyle1On9S9CbfN
	 FMA2T2eI5dB9PDrixw7kkgXoFIFmTom8JNTe4cgE1m3hPt9ZVQPsSNLLpZNUOHLEdtH0u
	 gXgcWS8t77SRpjrX/6qRuTAyL5PYwuqLs4V6Z/iYiKPelCGjDdonYyTjAfv8SNG30Sbxp
	 rtnXTVGx2DDKygtlR5VNHCgm4TY/bb/ofNCjS4DLiO6RYaod0lw3l/H+kw/nKl26eQakJ
	 rISt7R5oAo9Ur4Vb0Y2XaKSq1BvERr01e6+ua/PapWiKkeW1VbqJMTRW0zHnKXqG6fA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795379273;
	bh=tf/BzaTOJ29iXi5bH4YSxoan2t5otlti0xKN9S63bCY=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WWxLYdY+S2qJDVI679LuDcFafOJi8dipilWjums2NFXaH0pyGOwlUqYfRq6d6MlsN
	 oebnZf3iCL+PLl/5lc+ST/kylhz1oiw6oaM+jlxte2x8k2kju5a4DP20Ci4bW79Ba9
	 ziGcGhmLOWjyVGfcKvHWEzcBARW3wqZHn5wd+GahhPyj0QOAOo1xMuCayLnyoMuVv1
	 41c2gQlBr2t6u19gVEmL6Tq6iBmZztAJkPOwTlhrodGj3PunQ920Fva+UbPn3MbxmV
	 e81F0/5ZHjL8rBz2HwUt/7IPxj5La286sSCt/9r7eNrxAceiF7gl3d0MDGZsaVTqyU
	 uMkhh7Iab/xxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62B1040604;
	Sun, 22 Nov 2026 20:27:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C159499
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4922D40604
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVcjTjU38Uai for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 20:27:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4472A40602
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4472A40602
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:27:50 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6baa6f27904so553820a12.0
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 12:27:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795379269; x=1795984069;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=qggZEHq8g+3o8VJxctPxm06LvQlXIcq+egZWUuB+1dU=;
 b=V5VxuwSN/N38oeQSujInZDK5nRJtzI/YKg1rQgRVoKFM7Cs/9aZ0uGG31NddLqCclv
 aH5gEhCxNAXg/Op0STHKE95UELhAvzEg858ySufxWxxcjF2+QbWK5IcvUvV7r8iGnA39
 /RheN08D8P/ZxPqWsCCQe1r9T7VUmodc2ctuI+EI/aafCyPVRQSp9UjlIzO1fHB/9Ny8
 hxn0rkFzSOqfrtcRfc1u72qcDUGtUT5oHGHUtAG15LPDuB6EldH1sVALXOdA3/LIEjeY
 yq+ufBkiHb797rvvKmhcVVhAqnk0Mql1gWe4fYJSJqqnR3KR8yL+eVh/RNZBZD/0Oxte
 +qIw==
X-Gm-Message-State: APuU4Z8D9x17WHjpf0LyAiXqZZFXH8UxXe37PR93vfrHZ0wW6/uB8ptG
 yFDLTai7aLj8/hvIk+8NEpmDoxjkScT4ehwFRV3DkWPGVOgoNgGygz8iSPYxAPoFQY6b0oEzFH/
 wECUBfCcQKmUjEbvv48RGeCWPnVg2nr+GyQ==
X-Gm-Gg: AZFdTZfqbzFjU5qbCBMi+3y+xqdvSykXwaWtGJBuw6jk43LIPXh9e1O0EHYA1tQuXgn
 4TSdUtRQmjC2UMEdmXCUQyez6ufnNAnL8zCd0RDrLe/9oXRfE+w0ppnOdLFvB9/EB872HXaoLXs
 GVjntxU9lxwsfxJIsDZIhqLiq85z4VN7D6GOL9SJ1Vn3OnD6k+LkqZVjuO3dyKH2RrhkhV5eTNx
 VKwyR5AqBwwQb8aEhr5h4MZ+ZODLu12d4KV+Juv6Qjks+6e/i+bLofLwy6ppWgwndIw+zZt2eRZ
 mfij99ohxOueOiERrg7D0TSq24oatNG8Rla/stzxmDwwapVSvxSyLEnvLa9e+jeDDD6Oui2Heuc
 /AsJ0vnCfyewGb75Y//qQAzSkJiwk9b0ACVkv+g==
X-Received: by 2002:a05:6402:3223:b0:6b6:e74d:407e with SMTP id
 4fb4d7f45d1cf-6ba37eb9c1emr7279413a12.36.1795379268466; Sun, 22 Nov 2026
 12:27:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261122143450.2973760-1-yegorslists@googlemail.com>
In-Reply-To: <20261122143450.2973760-1-yegorslists@googlemail.com>
Date: Sun, 22 Nov 2026 21:28:17 +0100
X-Gm-Features: Aa3M54qmP6EcSpspqZoYXgHqtsVjBDrbMmeEghnxej9v7IMF_lY73V7TCpbyFnc
Message-ID: <CAGm1_kt6Q3AQU=+rNN=K090KBzUYj5_W7i5n225cwExMT7cioA@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [Buildroot] [RFC] Xenomai users: which core and C library?
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBOb3YgMjIsIDIwMjYgYXQgMzozNOKAr1BNIFllZ29yIFllZnJlbW92Cjx5ZWdvcnNs
aXN0c0Bnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBhbGwsCj4KPiBJJ20gd29ya2luZyBv
biBidW1waW5nIFhlbm9tYWkgdG8gMy4zLnggYW5kIGhhdmUgc2VudCB0aGUgTWVyY3VyeQo+IGJ1
aWxkIGZpeGVzIGZvdW5kIGJ5IHRoZSBhdXRvYnVpbGRlcnMgdXBzdHJlYW0uIFRoZSBYZW5vbWFp
Cj4gbWFpbnRhaW5lcnMgYXNrZWQgd2hldGhlciBhbnlib2R5IGFjdHVhbGx5IG5lZWRzIHNvbWUg
b2YgdGhlCj4gY29tYmluYXRpb25zIEJ1aWxkcm9vdCBvZmZlcnMgWzFdLCBzbyBJJ2QgbGlrZSB0
byBhc2sgaGVyZToKPgo+IElmIHlvdSB1c2UgWGVub21haSB3aXRoIEJ1aWxkcm9vdCwgY291bGQg
eW91IHJlcGx5IHdpdGg6Cj4KPiAtIHRoZSBjb3JlOiBDb2JhbHQgKERvdmV0YWlsL0ktcGlwZSBr
ZXJuZWwpIG9yIE1lcmN1cnkgKHBsYWluIExpbnV4KQo+IC0gdGhlIEMgbGlicmFyeTogZ2xpYmMg
b3IgdUNsaWJjLW5nCj4gLSB0aGUgYXJjaGl0ZWN0dXJlCj4KPiBCYWNrZ3JvdW5kOiBDb2JhbHQg
aGFzIG5vdCBidWlsdCB3aXRoIHVDbGliYy1uZyBzaW5jZSBYZW5vbWFpIDMuMS4xCj4gKGxpYi9j
b2JhbHQvcnRkbS5jIHVzZXMgZ2xpYmMncyBfX09QRU5fTkVFRFNfTU9ERSgpKSwgYW5kIHRoYXQg
aW5jbHVkZXMKPiB0aGUgMy4yLjUgdmVyc2lvbiB3ZSBzaGlwLiBFdmVuIHdpdGggdGhhdCBmaXhl
ZCwgb24gMzItYml0IHRhcmdldHMKPiBsaWJjb2JhbHQgY2FsbHMgdGhlIDMyLWJpdCB2RFNPIGNs
b2NrX2dldHRpbWUgd2l0aCB1Q2xpYmMtbmcncyA2NC1iaXQKPiBzdHJ1Y3QgdGltZXNwZWMsIHNv
IHRoZSB0aW1lIGl0IHJlYWRzIGlzIHdyb25nLiBVcHN0cmVhbSBvbmx5IHRlc3RzCj4gZ2xpYmMg
YW5kIGlzIG5vdCBzdXJlIHdoZXRoZXIgc3VwcG9ydGluZyB1Q2xpYmMtbmcgaXMgd29ydGggaXQu
Cj4KPiBNZXJjdXJ5IGJ1aWxkcyB3aXRoIHVDbGliYy1uZyBvbmNlIHRoZSBwZW5kaW5nIGluY2x1
ZGUgZml4ZXMgYXJlIGluLgo+Cj4gVW5sZXNzIHNvbWVvbmUgbmVlZHMgQ29iYWx0IHdpdGggdUNs
aWJjLW5nLCBJJ2xsIG1ha2UKPiBCUjJfUEFDS0FHRV9YRU5PTUFJX0NPQkFMVCBkZXBlbmQgb24g
Z2xpYmMgYXMgcGFydCBvZiB0aGUgMy4zLnggYnVtcC4KPiBNZXJjdXJ5IHdvdWxkIGtlZXAgc3Vw
cG9ydGluZyBib3RoIEMgbGlicmFyaWVzLgo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3hlbm9tYWkvOWNlNTBiNmVkZWU4YmY3OWJkYjliY2NiMzdkZWNjOTQxODg1NzYyOC5jYW1lbEBz
aWVtZW5zLmNvbS8KClJlbW92aW5nIFBpZXJyZSdzIGUtbWFpbCBhZGRyZXNzIGFzIGl0IGlzIG5v
dCB2YWxpZCBhbnltb3JlLgoKWWVnb3IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
