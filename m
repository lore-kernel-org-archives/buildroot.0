Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EC9C47DDC
	for <buildroot@archiver.kernel.org>; Mon, 22 Jan 2024 22:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 356E040133;
	Mon, 22 Jan 2024 22:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 356E040133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uinmiDKkz9HZ; Mon, 22 Jan 2024 22:45:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01C6840279;
	Mon, 22 Jan 2024 22:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01C6840279
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 567E81BF853
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 22:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F29D60C15
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 22:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F29D60C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1pMBPV-2PVdG for <buildroot@lists.busybox.net>;
 Mon, 22 Jan 2024 22:45:21 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8463360BC6
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 22:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8463360BC6
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a308e6824ccso90903866b.0
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 14:45:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705963519; x=1706568319;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hAiRCbKfAs8/z6RNpXLtVnLF0aKd28BCWKHUeOf44J8=;
 b=ZfZNqfEFQLYS0uKxu4GzcK+Sz2PyBbrBJltPJTu97XP1jqyJdAVhNuMeK/CwnhZszB
 BNYiinmfF1qd8j9cX7QJJTKDMIQeNq72qGNZeh+IR6+OHeYXZGnKhe95uHfAuOl8/H8K
 hC+kKy0HvjGA7R6bmMz+ORWgfXYckhg7CbJF/qWG/nGgxsANxCczBXhMJwhzXFn6NWCt
 J5VjAxBhBIFbsCU15Ogm/qzqa7jePn4RtF9uuc0Fnpt8pEgung+9sf6FqSdNhZIjQNnJ
 xl4WqOGzKDyGaeMtixJylY5LU3remzwNCIHZNGY1daxFttKfLjdjMFUM4nDQ3+Ykl2gL
 5VwA==
X-Gm-Message-State: AOJu0YyvhpN8zPCUQY/xbAbHB3qkNEgPfc/s4M0RwlTHiGtwmbwdX+/n
 WYRxcMnT/ghWWd3xV6PEr59QTOHS98KAlhVeGHqUThWAPJZc4B+y76QKrHw2KlC8aJsp+Rfw5Tp
 Eb4oe+5lzeXKWUIFV+UBxra8Oufn9ujGqcCS7/OyVGhgom0Ii7RE=
X-Google-Smtp-Source: AGHT+IFkYYP1mOaSCyyfdpZighNL6OnAJQ5ewcsQiHpTFC0q+9lN9OGQnnJU4vNZseytZGlvT5+eMIOg1WEzf50XJZM=
X-Received: by 2002:a17:906:5acc:b0:a2e:adb7:7bf8 with SMTP id
 x12-20020a1709065acc00b00a2eadb77bf8mr2105312ejs.147.1705963518963; Mon, 22
 Jan 2024 14:45:18 -0800 (PST)
MIME-Version: 1.0
References: <20240122223047.736966-1-adam.duskett@amarulasolutions.com>
In-Reply-To: <20240122223047.736966-1-adam.duskett@amarulasolutions.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Mon, 22 Jan 2024 15:45:07 -0700
Message-ID: <CAHDQB6NF7Jd4otufE9bDY5FUCvyHXq+t-NqTd+uZUjYucfVFww@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705963519; x=1706568319;
 darn=buildroot.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hAiRCbKfAs8/z6RNpXLtVnLF0aKd28BCWKHUeOf44J8=;
 b=nL1mdZ2bFM+U9OUZsUV5TjSxsluvb6MJ6OpHlvbCTPHOKIp4EvOZC/AfU4PczA+H+H
 CA1Hb/gyQrrFS27dz5OdHPSehQJadgFGBj5kESgl1fInwffDfTliR2PbPh5iDPK5ntyl
 R9QQrVe3o9HQWFIBfWK2BckIo/FOb8q7JmCls=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=nL1mdZ2b
Subject: Re: [Buildroot] [PATCH 1/1] package/vulkan-loader: xcb support
 requires xlib_libX11 and xlib_libXrandr
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSBqdXN0IG5vdGljZWQgdGhhdCBGYWJyaWNlIGZpeGVkIHRoaXMgaXNzdWUgZm91ciBtb250aHMg
YWdvIHdpdGggdGhpcwpwYXRjaCBoZXJlOgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjMwOTIxMTY0ODA5LjEwMjc0MS0xLWZvbnRhaW5lLmZh
YnJpY2VAZ21haWwuY29tLwoKQ29uc2lkZXIgdGhhdCB0ZXN0ZWQuCkFkYW0gRHVza2V0dAoKCk9u
IE1vbiwgSmFuIDIyLCAyMDI0IGF0IDM6MzDigK9QTSBBZGFtIER1c2tldHQKPGFkYW0uZHVza2V0
dEBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBUaGUgVnVsa2FuLWxvYWRlciBwYWNr
YWdlIHNlcmNoZXMgZm9yIHgxMS5wYyB3aGVuIHhjYiBzdXBwb3J0IGlzIGVuYWJsZWQsCj4gd2hp
Y2ggaXMgcHJvdmlkZWQgYnkgdGhlIHhsaWJfbGliWDExIHBhY2thZ2UuIFRoZSB2dWxrYW4tbG9h
ZGVyIHBhY2thZ2UKPiBkb2Vzbid0IHNlYXJjaCBmb3IgdGhlIGxpYlhyYW5kciBwYWNrYWdlLCBi
dXQgZG9lcyB1c2UgdGhlIFhyYW5kci5oIGhlYWRlcgo+IGZvdW5kIGluIHRoZSBYMTEvZXh0ZW5z
aW9ucy8gZGlyZWN0b3J5LCBzbyB0aGlzIGlzIGFsc28gYSByZXF1aXJlbWVudC4KPgo+IEZpeGVz
Ogo+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8yOWNhZWVkMzhhNjEz
OWViMzI4ZDNiMWRmMzA3Nzc2ZTgzN2JmYWQ2Cj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm5ldC9yZXN1bHRzLzU1ZGRmZDQ0MzkzZTNiY2MyZjI1YmFkMmY5ZWNiN2UxYjE0MmE5ODUKPiBT
aWduZWQtb2ZmLWJ5OiBBZGFtIER1c2tldHQgPGFkYW0uZHVza2V0dEBhbWFydWxhc29sdXRpb25z
LmNvbT4KPiAtLS0KPiAgcGFja2FnZS92dWxrYW4tbG9hZGVyL3Z1bGthbi1sb2FkZXIubWsgfCAy
ICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvdnVsa2FuLWxvYWRlci92dWxrYW4tbG9hZGVyLm1rIGIvcGFj
a2FnZS92dWxrYW4tbG9hZGVyL3Z1bGthbi1sb2FkZXIubWsKPiBpbmRleCBmNmRkOWQwYWMzLi5j
ZjNhZWRjZTE1IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvdnVsa2FuLWxvYWRlci92dWxrYW4tbG9h
ZGVyLm1rCj4gKysrIGIvcGFja2FnZS92dWxrYW4tbG9hZGVyL3Z1bGthbi1sb2FkZXIubWsKPiBA
QCAtMjUsNyArMjUsNyBAQCBWVUxLQU5fTE9BREVSX0NPTkZfT1BUUyArPSAtREJVSUxEX1dTSV9E
SVJFQ1RGQl9TVVBQT1JUPU9GRgo+ICBlbmRpZgo+Cj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElC
WENCKSx5KQo+IC1WVUxLQU5fTE9BREVSX0RFUEVOREVOQ0lFUyArPSBsaWJ4Y2IKPiArVlVMS0FO
X0xPQURFUl9ERVBFTkRFTkNJRVMgKz0gbGlieGNiIHhsaWJfbGliWDExIHhsaWJfbGliWHJhbmRy
Cj4gIFZVTEtBTl9MT0FERVJfQ09ORl9PUFRTICs9IFwKPiAgICAgICAgIC1EQlVJTERfV1NJX1hD
Ql9TVVBQT1JUPU9OIFwKPiAgICAgICAgIC1EQlVJTERfV1NJX1hMSUJfU1VQUE9SVD1PTgo+IC0t
Cj4gMi40My4wCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
