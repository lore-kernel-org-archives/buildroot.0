Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA72DC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 09:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 554B44014E;
	Mon,  6 Nov 2023 09:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 554B44014E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FLLrVfX9Ouzy; Mon,  6 Nov 2023 09:32:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CD2540C88;
	Mon,  6 Nov 2023 09:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CD2540C88
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF91C1BF488
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 09:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97D268238D
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 09:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97D268238D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OyYOnxjhsbiH for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 09:32:14 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AA6E8238C
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 09:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AA6E8238C
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5094cb3a036so5106703e87.2
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 01:32:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699263132; x=1699867932;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oOxl/n9b2/F/Rf1iKkR3htVA7R09EB1artb3FegAVh8=;
 b=azRoHRUBm73kiAIGvskSz8wQ0ssWJngkOYv41YvjlsE9LaLHSDpiX6hAK7OZTbi1ql
 PcZZTclnbWC8vIU9XRm8NGGVplUtzxLzIagm7Nk0iHbrPwBF3brCFEkyX3pqaQ3Nn+TY
 fenVu70NcZYDihXl138VAgtgLm1k9dydBZNrdeHSFz5dQakFj7wrNxIpFTgQ1v1YBQgk
 D0vAkmTrIMoocqv4pZ0oDN9s46tGAWQX/SZH+XrGV5y1xA/EWb19t6p1xZ36jLAVG+DM
 pC0EtdT1KZXhKRoR4mA4vUeJphg2o4Vt/Ad1t1PCA2LnOuF0z70fxdAPjLZ7pPHfPuun
 D/8Q==
X-Gm-Message-State: AOJu0YxUcclCNGMdP2xat03KwLCN9FQT8KCuJpYQ9x01jU4mVOFKNTNy
 cgJYm8w8g1UU0mDsDkP3bF944KTtSM3Ee+RCIqilA7mzNVk=
X-Google-Smtp-Source: AGHT+IGCZ1Xzklw4xZQjIo2S16m6P61QssPUY95m7YBokTLyR4mj+O3EBLZGCgvnBLPxdNcFrjnBK7Nrv7DixHFrJ5c=
X-Received: by 2002:ac2:5e84:0:b0:507:9777:7a7 with SMTP id
 b4-20020ac25e84000000b00507977707a7mr20766132lfq.17.1699263132060; Mon, 06
 Nov 2023 01:32:12 -0800 (PST)
MIME-Version: 1.0
References: <20231105142405.71631-1-giulio.benetti@benettiengineering.com>
 <885f9f4f-780a-4221-be62-f261be398d21@benettiengineering.com>
In-Reply-To: <885f9f4f-780a-4221-be62-f261be398d21@benettiengineering.com>
Date: Mon, 6 Nov 2023 10:32:00 +0100
Message-ID: <CAGm1_kvh9jeVyw1hSzSOqi9Sh08wt803QQR+s-Ma5an2FZwoZw@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1699263132; x=1699867932; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oOxl/n9b2/F/Rf1iKkR3htVA7R09EB1artb3FegAVh8=;
 b=JSz+lnCzv22AUnlaxOmzBTGFHEDO5K0B8wH4cpLAmYkiQ0lwHuMVggfnDPeLGtUzmU
 iS1fdqWMAyP8ce1Hg5FJxCPF9WHXnDvkbnKIGRjikcttna+aAl2lHJNIp9q4Qirh9US5
 GpQH9fq+ol1+xOTLcySrH0IIY4wluaaCb9nbk5KCeYzpHp+gVMQ64VY/C+OLBdSZBubX
 BGloOSorn5riz/TZKqgCgifZurUjl4mr1TVnN6UTdjeAiBbvmvs5ttHXIrsK26zs7zAo
 38xBUn84u0LDSmybTYjZpdMR1u6PdHgFkqzLIQqi+pdSd+xXClVhBYPQ0UItl57r0ze4
 GxSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JSz+lnCz
Subject: Re: [Buildroot] [PATCH] package/nodejs/nodejs-src: fix arch check
 on additional modules
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBOb3YgNSwgMjAyMyBhdCAzOjI44oCvUE0gR2l1bGlvIEJlbmV0dGkKPGdpdWxpby5i
ZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+Cj4gT24gMDUvMTEvMjMgMTU6
MjQsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+ID4gQXQgdGhlIG1vbWVudCBjaGVjay1iaW4tYXJj
aCBzY3JpcHQgZmluZHMgTm9kZUpTIG1vZHVsZXMgY29udGFpbmluZwo+ID4gcHJlYnVpbHQgYmlu
YXJpZXMgZm9yIGRpZmZlcmVudCBhcmNoaXRlY3R1cmVzIGFuZCBidWlsZCBmYWlscy4KPiA+IFNv
IGxldCBjaGVjay1iaW4tYXJjaCB0byBpZ25vcmUgZm9sZGVyIC91c3IvbGliL25vZGVfbW9kdWxl
cyBieSBzZXR0aW5nCj4gPiBOT0RFSlNfU1JDX0JJTl9BUkNIX0VYQ0xVREUgdG8gaXQuCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGll
bmdpbmVlcmluZy5jb20+Cj4KPiBTdWdnZXN0ZWQtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPgoKUmV2aWV3ZWQtYnk6IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0
c0Bnb29nbGVtYWlsLmNvbT4KCj4gLS0KPiBHaXVsaW8gQmVuZXR0aQo+IENFTyZDVE9AQmVuZXR0
aSBFbmdpbmVlcmluZyBzYXMKPgo+ID4gLS0tCj4gPiAgIHBhY2thZ2Uvbm9kZWpzL25vZGVqcy1z
cmMvbm9kZWpzLXNyYy5tayB8IDMgKysrCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ub2RlanMvbm9kZWpzLXNyYy9ub2Rl
anMtc3JjLm1rIGIvcGFja2FnZS9ub2RlanMvbm9kZWpzLXNyYy9ub2RlanMtc3JjLm1rCj4gPiBp
bmRleCA2ZmI1NTBmMTU4Li44ZjkzNDIwMmIwIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9ub2Rl
anMvbm9kZWpzLXNyYy9ub2RlanMtc3JjLm1rCj4gPiArKysgYi9wYWNrYWdlL25vZGVqcy9ub2Rl
anMtc3JjL25vZGVqcy1zcmMubWsKPiA+IEBAIC0yNDQsNiArMjQ0LDkgQEAgZGVmaW5lIE5PREVK
U19TUkNfSU5TVEFMTF9NT0RVTEVTCj4gPiAgICAgICAjIGhlbHAgaW4gZGlhZ25vc2luZyB0aGUg
cHJvYmxlbS4KPiA+ICAgICAgICQoTlBNKSBpbnN0YWxsIC1nICQoTk9ERUpTX1NSQ19NT0RVTEVT
X0xJU1QpCj4gPiAgIGVuZGVmCj4gPiArCj4gPiArIyBFeGNsdWRlIHByZWJ1aWx0IGJpbmFyaWVz
IHdpdGggZGlmZmVyZW50IGFyY2hpdGVjdHVyZXMgYW5kIE9TIGZyb20gY2hlY2sKPiA+ICtOT0RF
SlNfU1JDX0JJTl9BUkNIX0VYQ0xVREUgPSAvdXNyL2xpYi9ub2RlX21vZHVsZXMvCj4gPiAgIGVu
ZGlmCj4gPgo+ID4gICBkZWZpbmUgTk9ERUpTX1NSQ19JTlNUQUxMX1NUQUdJTkdfQ01EUwo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJv
b3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
